------------------
-- name: Kevin Oshiro
-- date: 8/6/15
-- description:
-- The data (up to 65528 bytes) is taken in while tx_udp_valid is high and is stored in a fifo (also, tx_udp_ready is high when it is okay to send in 
-- data and it is low when it is not okay to send in data, which is while data is being read out of the fifo). When tx_udp_valid goes low, 
-- signifying the end of the data, the necessary fields of the IP and UDP header are calculated and sent out along with up to 1472 bytes of 
-- data. There is also a valid signal and a last signal to signify when the data is valid and when the last byte is, respectively. Ifthe 
-- data originally sent in was longer than 1472 bytes, more (up to 1480 bytes, because there's only 1 UDP header) data is sent out, preceded  
-- by an IP header. This is repeated until there is no data left (max ethernet frame data is 1500 bytes). Once all of the data is sent tx_udp_ready
-- goes low and a new packet can be sent.
--
-- added states after collecting data in fifo and before sending data out to calculate checksum, instead of trying to calculate checksum all in one
-- clk cycle.
--
--	 ________________________________________________     _______________________________________     _____________________________________
--	|  ip        |  udp    |                         |	  |  ip        |                          |   |  ip        |                        |
--	|  header    | header  |    data pt 1            |   |  header    |       data pt 2          |   | header     |      data pt 3         | ...
-- | (20 bytes) |(8 bytes)|  (up to 1472 bytes)     |   | (20 bytes) |  (up to 1480 bytes)      |   | (20 bytes) | (up to 1480 bytes)     |
--	|____________|_________|_________________________|   |____________|__________________________|   |____________|________________________|
--
--

--------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

entity ip_udp_tx_block is
generic(
	ip_addr : std_logic_vector(31 downto 0);
	dst_ip_addr : std_logic_vector(31 downto 0);
	port_num : std_logic_vector(15 downto 0);
	dst_port_num : std_logic_vector(15 downto 0)
	);
port(
	axi_tclk : in std_logic;
	axi_tresetn : in std_logic;
	
	tx_eth_data : out std_logic_vector(7 downto 0);
	tx_eth_valid : out std_logic;
	tx_eth_last : out std_logic;
--	tx_eth_ready : in std_logic;
	
	tx_udp_data : in std_logic_vector(7 downto 0);
	tx_udp_valid : in std_logic;
	tx_udp_ready : out std_logic
	);
end ip_udp_tx_block;

architecture Behavioral of ip_udp_tx_block is

COMPONENT tx_fifo
  PORT (
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
    data_count : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;

-- state machine stuff
type tx_state_type is (tx_pre_idle, tx_idle, tx_collect_data, tx_ip_checksum, tx_udp_checksum, tx_ip_header, tx_udp_header, tx_output_data, tx_int_pckt, tx_wait, tx_frag_ip_checksum, tx_frag_ip_header, tx_frag_output_data);
signal tx_state : tx_state_type := tx_idle;
signal tx_count : std_logic_vector(10 downto 0) := (others => '0');
signal offset_count : std_logic_vector(15 downto 0) := (others => '0');

signal chksm_temp : std_logic_vector(16 downto 0) := (others => '0');
signal chksm_temp_2 : std_logic_vector(16 downto 0) := (others => '0');
signal frag_chksm_temp : std_logic_vector(16 downto 0) := (others => '0');
signal tx_chksm : std_logic_vector(16 downto 0):= (others => '0');
signal tx_temp : std_logic_vector(22*8-1 downto 0);

-- change these to generics
--signal ip_addr : std_logic_vector(31 downto 0) := X"c0a81405"; 
--signal ip_dest_addr : std_logic_vector(31 downto 0) := X"c0a814ff"; --:= X"c0a81401";


signal ip_id : std_logic_vector(15 downto 0) := X"0000";

-- headers
signal ip_header : std_logic_vector(159 downto 0) := 
X"45" & --version(4), header length(4)
X"00" & --type of service(8)
X"00" & X"00" & --total length in bytes(16), determined in code
ip_id & --id(16)
X"00" & X"00" & --flags(3), frag offset(13), determined in code
X"20" & --time to live(8)
X"11" & --protocol(8)
X"00" & X"00" & --header checksum(16), determined in code
ip_addr & --source ip address(32) 192 168 20 5
dst_ip_addr; --destination ip address(32) 192 168 20 1

-- used for calculating udp checksum
signal udp_pseudo_header : std_logic_vector(95 downto 0) :=
ip_addr & -- source ip address(32)
dst_ip_addr & -- destination ip address(32)
X"00" & -- zeros (8)
X"11" & -- protocol (8)
X"0000"; -- udp length (16)

signal udp_header : std_logic_vector(63 downto 0) :=
port_num & --X"6000" & -- source port
dst_port_num & --X"6000" & --X"7000" & -- destination port
X"0000" & -- length, determined in code
X"0000"; -- checksum, determined in code

-- wait time between fragments (ns)
signal frag_wait_time : integer:= 800;

-- fifo signals
signal fifo_rd_en : std_logic := '0';
signal fifo_dout : std_logic_vector(7 downto 0);
signal fifo_full : std_logic;
signal fifo_empty : std_logic;
signal fifo_data_count : std_logic_vector(15 downto 0);

signal pre_idle_count : std_logic_vector(4 downto 0) := (others => '0');
-- debug stuff
signal debug_ip_chksm : std_logic_vector(15 downto 0);
signal debug_udp_chksm : std_logic_vector(15 downto 0);
signal debug2 : std_logic_vector(15 downto 0);
signal debug1 : std_logic_vector(16 downto 0);
signal debug : std_logic;
signal debug4 : std_logic;


begin


u_tx_fifo : tx_fifo
  PORT MAP (
    clk => axi_tclk,
    rst => not axi_tresetn,
    din => tx_udp_data,
    wr_en => tx_udp_valid,
    rd_en => fifo_rd_en,
    dout => fifo_dout,
    full => fifo_full,
    empty => fifo_empty,
    data_count => fifo_data_count
  );


process(axi_tclk, axi_tresetn)--, tx_eth_ready)


begin
	if axi_tresetn = '0' then
		tx_eth_data <= (others => '0');
		tx_eth_valid <= '0';
		tx_eth_last <= '0';
		tx_count <= (others => '0');
		offset_count <= (others => '0');
		ip_id <= (others => '0');
		chksm_temp <= (others => '0');
		chksm_temp_2 <= (others => '0');
		frag_chksm_temp <= (others => '0');
		fifo_rd_en <= '0';
		tx_udp_ready <= '0';
		tx_state <= tx_pre_idle;
--	elsif tx_eth_tready = '0' then
		
	else
		if rising_edge(axi_tclk) then
			case(tx_state) is
				-- give fifo some time after resetting before doing anything
				when tx_pre_idle =>
					tx_eth_data <= (others => '0');
					tx_eth_valid <= '0';
					tx_eth_last <= '0';
					tx_count <= (others => '0');
					offset_count <= (others => '0');
					chksm_temp <= (others => '0');
					chksm_temp_2 <= (others => '0');
					frag_chksm_temp <= (others => '0');
					fifo_rd_en <= '0';
					tx_udp_ready <= '0';
					if pre_idle_count = "11111" then
						pre_idle_count <= (others => '0');
						tx_state <= tx_idle;
					else
						pre_idle_count <= std_logic_vector(unsigned(pre_idle_count)+1);
						tx_state <= tx_pre_idle;
					end if;
				-- wait for valid signal
				when tx_idle =>
					tx_eth_data <= (others => '0');
					tx_eth_valid <= '0';
					tx_eth_last <= '0';
					tx_count <= (others => '0');
					offset_count <= (others => '0');
					fifo_rd_en <= '0';
					tx_udp_ready <= '1';
					-- reset checksum to 0s before next calc
					ip_header(79 downto 64) <= (others => '0');
					udp_header(15 downto 0) <= (others => '0');
					tx_chksm <= (others => '0');
					chksm_temp <= (others => '0');
					chksm_temp_2 <= (others => '0');
					frag_chksm_temp <= (others => '0');
					-- get first byte for checksum
					if tx_udp_valid = '1' then
						tx_chksm <= '0' & tx_udp_data & X"00";
						tx_state <= tx_collect_data;
					else
						tx_state <= tx_idle;
					end if;
				-- store data in FIFO, keep track of checksum of data
				-- also calculate and save various header fields
				when tx_collect_data =>
					tx_eth_data <= (others => '0');
					tx_eth_valid <= '0';
					tx_eth_last <= '0';
					fifo_rd_en <= '0';
					-- calculate checksum
					if fifo_data_count(0) = '0' then
						if unsigned(tx_chksm) + unsigned(tx_udp_data & X"00") > 65535 then						
							tx_chksm <= std_logic_vector(unsigned(tx_chksm)+unsigned(tx_udp_data & X"00")-65535);
							debug4 <= '1';
						else
							tx_chksm <= std_logic_vector(unsigned(tx_chksm)+unsigned(tx_udp_data & X"00"));
							debug4 <= '0';
						end if;
					else
						tx_chksm <= std_logic_vector(unsigned(tx_chksm)+unsigned(tx_udp_data));
					end if;
					-- end of data
					if tx_udp_valid = '0' then
						-- set udp length
						udp_header(31 downto 16) <= std_logic_vector(unsigned(fifo_data_count)+8);
						udp_pseudo_header(15 downto 0) <= std_logic_vector(unsigned(fifo_data_count)+8);
						-- packet needs to be broken into fragments
						if to_integer(unsigned(fifo_data_count)) > 1472 then
							-- length
							ip_header(143 downto 128) <= std_logic_vector(to_unsigned(1500, 16));
							-- frag flag
							ip_header(109) <= '1';
						-- no fragments
						else
							ip_header(143 downto 128) <= std_logic_vector(unsigned(fifo_data_count)+28);
						end if;
						-- set frag offset to 0
						ip_header(108 downto 96) <= (others => '0');
						-- set packet id
						ip_header(127 downto 112) <= ip_id;
						tx_udp_ready <= '0';
						tx_state <= tx_ip_checksum;
					else
						tx_udp_ready <= '1';
						tx_state <= tx_collect_data;
					end if;
					
					
					
				-- calculate ip checksum
				when tx_ip_checksum =>
					tx_eth_valid <= '0';
					tx_eth_last <= '0';
					fifo_rd_en <= '0';
					tx_udp_ready <= '0';
					-- count (length of ip header)/2, then change states
					if tx_count < std_logic_vector(to_unsigned(10, 11)) then
						tx_count <= std_logic_vector(unsigned(tx_count)+1);
						-- add 2 bytes, add carry if necessary
						if unsigned(chksm_temp) + unsigned(ip_header(159-16*to_integer(unsigned(tx_count)) downto 144-16*to_integer(unsigned(tx_count)))) > 65535 then
							chksm_temp <= std_logic_vector(unsigned(chksm_temp) + unsigned(ip_header(159-16*to_integer(unsigned(tx_count)) downto 144-16*to_integer(unsigned(tx_count)))) - 65535);
						else
							chksm_temp <= std_logic_vector(unsigned(chksm_temp) + unsigned(ip_header(159-16*to_integer(unsigned(tx_count)) downto 144-16*to_integer(unsigned(tx_count)))));
						end if;
						tx_state <= tx_ip_checksum;
					else
						ip_header(79 downto 64) <= not chksm_temp(15 downto 0);
						chksm_temp <= (others => '0');
						tx_count <= (others => '0');
						tx_temp <= udp_pseudo_header & udp_header & tx_chksm(15 downto 0);
						tx_state <= tx_udp_checksum;
					end if;
					
				-- calculate udp checksum
				when tx_udp_checksum =>
					tx_eth_valid <= '0';
					tx_eth_last <= '0';
					fifo_rd_en <= '0';
					tx_udp_ready <= '0';
					-- count (length of pseudo header + udp header + 1)
					if tx_count < std_logic_vector(to_unsigned(11, 11)) then
						tx_count <= std_logic_vector(unsigned(tx_count)+1);
						-- add 2 bytes, add carry if necessary
						if unsigned(chksm_temp_2) + unsigned(tx_temp(175-16*to_integer(unsigned(tx_count)) downto 160-16*to_integer(unsigned(tx_count)))) > 65535 then
							chksm_temp_2 <= std_logic_vector(unsigned(chksm_temp_2) + unsigned(tx_temp(175-16*to_integer(unsigned(tx_count)) downto 160-16*to_integer(unsigned(tx_count)))) - 65535);
						else
							chksm_temp_2 <= std_logic_vector(unsigned(chksm_temp_2) + unsigned(tx_temp(175-16*to_integer(unsigned(tx_count)) downto 160-16*to_integer(unsigned(tx_count)))));
						end if;
						tx_state <= tx_udp_checksum;
					else
						udp_header(15 downto 0) <= not chksm_temp_2(15 downto 0);
						chksm_temp_2 <= (others => '0');
						tx_count <= (others => '0');
						tx_state <= tx_ip_header;
					end if;
					
					
				-- send (first or only) ip header
				when tx_ip_header =>
					tx_eth_valid <= '1';
					tx_eth_last <= '0';
					fifo_rd_en <= '0';
					tx_udp_ready <= '0';
					-- change states after sending ip header
					if tx_count /= std_logic_vector(to_unsigned(19, 11)) then
--						tx_temp <= udp_pseudo_header & udp_header & tx_chksm(15 downto 0);
						tx_count <= std_logic_vector(unsigned(tx_count)+1);
						tx_state <= tx_ip_header;
					else
						tx_count <= (others => '0');
						tx_state <= tx_udp_header;
					end if;
					-- calculate ip checksum
					if tx_count = "00000000000" then
--						ip_header(79 downto 64) <= checksum(ip_header, std_logic_vector(to_unsigned(19, 16)));
					end if;
					-- send ip header
					tx_eth_data <= ip_header(159-8*to_integer(unsigned(tx_count)) downto 152-8*to_integer(unsigned(tx_count)));
				-- send udp header, only once
				when tx_udp_header =>
					tx_eth_valid <= '1';
					tx_eth_last <= '0';
					tx_udp_ready <= '0';
					-- count length of header, then change states
					if tx_count /= std_logic_vector(to_unsigned(7, 11)) then
						tx_count <= std_logic_vector(unsigned(tx_count)+1);
						tx_state <= tx_udp_header;
					else
						tx_count <= (others => '0');
						tx_state <= tx_output_data;
					end if;
					-- start reading from fifo, 2 clk cycles?
					if tx_count < std_logic_vector(to_unsigned(6, 11)) then
						fifo_rd_en <= '0';
					else
						fifo_rd_en <= '1';
					end if;
					-- calculate udp checksum
--					if tx_count = "00000000000" then
--						udp_header(15 downto 0) <= checksum(tx_temp, std_logic_vector(to_unsigned(21, 5)));
--					end if;
					-- output udp header and count offset
					tx_eth_data <= udp_header(63-8*to_integer(unsigned(tx_count)) downto 56-8*to_integer(unsigned(tx_count)));
					offset_count <= std_logic_vector(unsigned(offset_count)+1);
				-- output (first fragment of) data
				when tx_output_data =>
					tx_eth_valid <= '1';
					tx_eth_data <= fifo_dout;
					tx_udp_ready <= '0';
					-- keep track of total data offset for next ip packet
					offset_count <= std_logic_vector(unsigned(offset_count)+1);
					-- still more data to send
					if to_integer(unsigned(tx_count)) = 1471 then
						tx_eth_last <= '1';
						fifo_rd_en <= '0';
						tx_count <= (others => '0');
						tx_state <= tx_wait;
					-- sent all data
					elsif fifo_data_count = X"0000" then
						tx_eth_last <= '1';
						tx_eth_valid <= '1';
						-- keep track of packets sent (not fragments)
						ip_id <= std_logic_vector(unsigned(ip_id)+1);
						tx_state <= tx_int_pckt;
					-- keep sending data
					else
						tx_count <= std_logic_vector(unsigned(tx_count)+1);
						tx_state <= tx_output_data;
					end if;
				-- wait between packets so no fifos overflow
				when tx_int_pckt => 
					tx_eth_data <= (others => '0');
					tx_eth_valid <= '0';
					tx_eth_last <= '0';
					fifo_rd_en <= '0';
					tx_udp_ready <= '0';
					if tx_count = std_logic_vector(to_unsigned(40, 11)) then
						tx_count <= (others => '0');
						tx_state <= tx_idle;
					else
						tx_count <= std_logic_vector(unsigned(tx_count)+1);
						tx_state <= tx_int_pckt;
					end if;
				-- wait ?? clk cycles before sending next fragment
				when tx_wait =>
					tx_eth_data <= (others => '0');
					tx_eth_valid <= '0';
					tx_eth_last <= '0';
					fifo_rd_en <= '0';
					tx_udp_ready <= '0';
					-- reset checksum to 0s before next calc
					ip_header(79 downto 64) <= (others => '0');
					-- done waiting
					if tx_count = std_logic_vector(to_unsigned(frag_wait_time/8, 11)) then -- waiting 50 clock cycles
						tx_count <= (others => '0');
						-- set new ip header fields here
						if to_integer(unsigned(fifo_data_count)) > 1480 then
							-- length
							ip_header(143 downto 128) <= std_logic_vector(to_unsigned(1500, 16));
							-- frag flag
							ip_header(109) <= '1';
						else
							-- length, count 1 extra + 20 more for ip header
							ip_header(143 downto 128) <= std_logic_vector(unsigned(fifo_data_count)+21);
							ip_header(109) <= '0';
						end if;
						-- offset
						ip_header(108 downto 96) <= std_logic_vector(to_unsigned(to_integer(unsigned(offset_count))/8, 13));
						tx_state <= tx_frag_ip_checksum;
					else
						tx_count <= std_logic_vector(unsigned(tx_count)+1);
						tx_state <= tx_wait;
					end if;
					
				-- calculate ip checksum
				when tx_frag_ip_checksum =>
					tx_eth_valid <= '0';
					tx_eth_last <= '0';
					fifo_rd_en <= '0';
					tx_udp_ready <= '0';
					-- count (length of ip header)/2, then change states
					if tx_count < std_logic_vector(to_unsigned(10, 11)) then
						tx_count <= std_logic_vector(unsigned(tx_count)+1);
						-- add 2 bytes, add carry if necessary
						if (unsigned(frag_chksm_temp) + unsigned(ip_header(159-16*to_integer(unsigned(tx_count)) downto 144-16*to_integer(unsigned(tx_count))))) > 65535 then
							frag_chksm_temp <= std_logic_vector(unsigned(frag_chksm_temp) + unsigned(ip_header(159-16*to_integer(unsigned(tx_count)) downto 144-16*to_integer(unsigned(tx_count)))) - 65535);
						else
							frag_chksm_temp <= std_logic_vector(unsigned(frag_chksm_temp) + unsigned(ip_header(159-16*to_integer(unsigned(tx_count)) downto 144-16*to_integer(unsigned(tx_count)))));
						end if;
						tx_state <= tx_frag_ip_checksum;
					else
						ip_header(79 downto 64) <= not frag_chksm_temp(15 downto 0);
						frag_chksm_temp <= (others => '0');
						tx_count <= (others => '0');
						tx_temp <= udp_pseudo_header & udp_header & tx_chksm(15 downto 0);
						tx_state <= tx_frag_ip_header;
					end if;
					
					
				-- send subsequent ip headers, if fragments
				when tx_frag_ip_header =>
					tx_eth_valid <= '1';
					tx_eth_last <= '0';
					tx_udp_ready <= '0';
					-- changes states after header
					if tx_count /= std_logic_vector(to_unsigned(19, 11)) then
						fifo_rd_en <= '0';
						tx_count <= std_logic_vector(unsigned(tx_count)+1);
						tx_state <= tx_frag_ip_header;
					else
						tx_count <= (others => '0');
						fifo_rd_en <= '1';
						tx_state <= tx_frag_output_data;
					end if;
					-- calculate checksum
--					if tx_count = "00000000000" then
--						ip_header(79 downto 64) <= checksum(ip_header, std_logic_vector(to_unsigned(19, 5)));
--					end if;
					-- send ip header
					tx_eth_data <= ip_header(159-8*to_integer(unsigned(tx_count)) downto 152-8*to_integer(unsigned(tx_count)));
				-- send subsequent data fragments
				when tx_frag_output_data =>
					tx_eth_valid <= '1';
					fifo_rd_en <= '1';
					tx_eth_data <= fifo_dout;
					tx_udp_ready <= '0';
					-- keep track of total data offset for next ip packet
					offset_count <= std_logic_vector(unsigned(offset_count)+1);
					-- still more to send after
					if to_integer(unsigned(tx_count)) = 1479 then
						tx_eth_last <= '1';
						fifo_rd_en <= '0';
						tx_count <= (others => '0');
						tx_state <= tx_wait;
					-- sent all data
					elsif fifo_data_count = X"0000" then
						tx_eth_last <= '1';
						tx_eth_valid <= '1';
						-- keep count of packets sent (not fragments)
						ip_id <= std_logic_vector(unsigned(ip_id)+1);
						tx_state <= tx_idle;
					-- keep sending data
					else
						tx_count <= std_logic_vector(unsigned(tx_count)+1);
						tx_state <= tx_frag_output_data;
					end if;
			end case;
		end if;
		
		
	end if;
end process;


end Behavioral;
