--------------------------------------------
-- name: Kevin Oshiro
-- date: 8/3/15
-- description:
-- This module receives ip packets, checks ip addr/ip length/ip checksum,
-- checks the port addr/udp length/udp checksum, and outputs the data.
--
-- States that deal with fragmentation are commented out, as only small packets are begin received.
-- If fragment flag is high in ip header, sm ignore packet, since frag states commented
--
-- modifications to be made for fragmentation: deal with fragments that come out of order, as entire udp packet is
-- dropped if fragments are not in order
--
-- also check id and offset of fragments?

---------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ip_udp_rx_block is
	generic(
		ip_addr : std_logic_vector(31 downto 0);
		port_num : std_logic_vector(15 downto 0)
		);
	port(
		axi_tclk : in std_logic;
		axi_tresetn : in std_logic;
		-- rx, eth side
		rx_eth_data : in std_logic_vector(7 downto 0);
		rx_eth_valid : in std_logic;
		rx_eth_last : in std_logic;
--		rx_eth_ready : out std_logic;
		-- rx, user side
		rx_udp_data : out std_logic_vector(7 downto 0);
		rx_udp_valid : out std_logic
--		rx_udp_ready : in std_logic
	);
end ip_udp_rx_block;

architecture rtl of ip_udp_rx_block is

COMPONENT ip_rx_bram
  PORT (
    clka : IN STD_LOGIC;
    ena : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    clkb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;


--function checksum(data, len : in std_logic_vector)
--return std_logic_vector is
--	variable sum : std_logic_vector(16 downto 0) := (others => '0');
--	begin
--		for i in 0 to to_integer(unsigned(len)-1)/2 loop
--			sum := std_logic_vector(unsigned(sum) + unsigned(data(15+16*i downto 16*i)));
--			if sum(16) = '1' then
--				sum := '0' & std_logic_vector(unsigned(sum(15 downto 0)) + 1);
--			end if;
--		end loop;
--	
--	return not sum(15 downto 0);
--end checksum;


-- state machine stuff
type state_type is (idle, ip_head, udp_head, data, ip_checksum, udp_checksum, output, frag_wait, frag_ip_head, frag_data, frag_ip_checksum, not_ready);
signal state: state_type := idle;
signal hold_state : state_type;

-- counters and RAM signals 
signal rx_count : std_logic_vector(4 downto 0) := (others => '0');
signal ip_count : std_logic_vector(15 downto 0) := (others => '0');
signal udp_count : std_logic_vector(15 downto 0) := (others => '0');
signal data_count : std_logic_vector(15 downto 0) := (others => '0');
signal rx_data_wr_en : std_logic_vector(0 downto 0) := "0";
signal wait_count : std_logic_vector(15 downto 0) := (others => '0');

-- header, address, and checksum stuff
signal ip_header : std_logic_vector(159 downto 0);
signal udp_header : std_logic_vector(63 downto 0);
--signal ip_addr : std_logic_vector(31 downto 0) := x"c0a81405";
signal broadcast_ip_addr : std_logic_vector(31 downto 0) := x"c0a814ff";
--signal port_addr : std_logic_vector(15 downto 0):= x"6000";
signal chksm_temp : std_logic_vector(16 downto 0) := (others => '0');
signal chksm_temp2 : std_logic_vector(16 downto 0) := (others => '0'); -- fix timing?
signal udp_head_temp : std_logic_vector(175 downto 0) := (others => '0');
signal chksm_data : std_logic_vector(16 downto 0) := (others => '0');

signal rx_ready_one : std_logic := '0'; -- used to make count wait so a byte of data doesn't get doubled when ready goes back high

signal rx_eth_ready_1 : std_logic; -- delay ready signal one clock cycle
-- debug checksum
signal ip_checksum_debug : std_logic_vector(15 downto 0);
signal udp_checksum_debug : std_logic_vector(15 downto 0);
signal ip_length_debug : std_logic_vector(15 downto 0);



attribute keep : string;
attribute keep of rx_udp_valid : signal is "true";

--attribute keep : string;
attribute keep of ip_checksum_debug : signal is "true";

--attribute keep : string;
attribute keep of udp_checksum_debug : signal is "true";

begin

u_ip_rx_bram : ip_rx_bram
  PORT MAP (
    clka => axi_tclk,
    ena => '1',
    wea => rx_data_wr_en,
    addra => udp_count(9 downto 0), -- RAM is only 1024 deep
    dina => rx_eth_data,
    clkb => axi_tclk,
    addrb => data_count(9 downto 0), -- RAM is only 1024 deep
    doutb => rx_udp_data
  );


process(axi_tclk, axi_tresetn)--, rx_udp_ready)
begin
--rx_eth_ready <= rx_eth_ready_1;
	if axi_tresetn = '0' then
		rx_udp_valid <= '0';
--		rx_eth_ready <= '0';
		rx_data_wr_en <= "0";		
		udp_count <= (others => '0');
		ip_count <= (others => '0');
		chksm_temp <= (others => '0');
		chksm_temp <= (others => '0');
	else
		if rising_edge(axi_tclk) then
		
--			if rx_udp_ready = '0' then
--				hold_state <= state;
--				state <= not_ready;
--			else
		
			case(state) is
				-- wait until valid data
				when idle =>
--		rx_eth_ready_1 <= '1';
					rx_udp_valid <= '0';
					rx_data_wr_en <= "0";
					udp_count <= (others => '0');
					ip_count <= (others => '0');
					chksm_temp <= (others => '0');
					chksm_temp2 <= (others => '0');
					chksm_data <= (others => '0');
					if rx_eth_valid = '1' then
						ip_header(159 downto 152) <= rx_eth_data;
						state <= ip_head;
					else
						state <= idle;
					end if;
				-- store ip header
				when ip_head =>
--		rx_eth_ready_1 <= '1';
					rx_udp_valid <= '0';
					rx_data_wr_en <= "0";
					if rx_count = std_logic_vector(to_unsigned(18, 5)) then
						rx_count <= (others => '0');
						state <= udp_head;
					else
						rx_count <= std_logic_vector(unsigned(rx_count)+1);
						state <= ip_head;
					end if;
					ip_header(151-8*to_integer(unsigned(rx_count)) downto 144-8*to_integer(unsigned(rx_count))) <= rx_eth_data;
				-- store udp header
				when udp_head =>
--		rx_eth_ready_1 <= '1';
					rx_udp_valid <= '0';
					if rx_count = std_logic_vector(to_unsigned(7, 5)) then
						rx_count <= (others => '0');
						rx_data_wr_en <= "1";
						-- count first byte
						state <= data;
					else
						rx_count <= std_logic_vector(unsigned(rx_count)+1);
						rx_data_wr_en <= "0";
						state <= udp_head;
					end if;
					udp_header(63-8*to_integer(unsigned(rx_count)) downto 56-8*to_integer(unsigned(rx_count))) <= rx_eth_data;
				-- write data to RAM, keep track of udp checksum
				when data =>
--		rx_eth_ready_1 <= '1';
					rx_udp_valid <= '0';
					-- end of packet(/fragment)
					if rx_eth_valid = '0' then
						rx_data_wr_en <= "0";
						state <= ip_checksum;
					else
						-- write data, except on last byte, because one clk cycle delay
						if rx_eth_last = '1' then
							rx_data_wr_en <= "0";
						else
							rx_data_wr_en <= "1";
						end if;
						-- keep track of checksum of data and account for carry
						if ip_count(0) = '0' then
							if unsigned(chksm_data) + unsigned(rx_eth_data & X"00") > 65535 then	
								chksm_data <= std_logic_vector(unsigned(chksm_data)+unsigned(rx_eth_data & X"00")-65535);
							else
								chksm_data <= std_logic_vector(unsigned(chksm_data)+unsigned(rx_eth_data & X"00"));
							end if;
						else
							if unsigned(chksm_data) + unsigned(rx_eth_data) > 65535 then
								chksm_data <= std_logic_vector(unsigned(chksm_data)+unsigned(rx_eth_data)-65535);
							else
								chksm_data <= std_logic_vector(unsigned(chksm_data)+unsigned(rx_eth_data));
							end if;
						end if;
						-- count ip and udp length
						ip_count <= std_logic_vector(unsigned(ip_count)+1);
						udp_count <= std_logic_vector(unsigned(udp_count)+1);
						state <= data;
					end if;
					
					-- calculate and check checksum
				when ip_checksum =>
-- rx_eth_ready_1 <= '1';
					rx_udp_valid <= '0';
					rx_data_wr_en <= "0";
					-- count half length of ip header, calculate checksum
					if rx_count < std_logic_vector(to_unsigned(10, 5)) then
						rx_count <= std_logic_vector(unsigned(rx_count)+1);
						-- account for carry
						if (unsigned(chksm_temp) + unsigned(ip_header(159 -16*to_integer(unsigned(rx_count)) downto 144-16*to_integer(unsigned(rx_count))))) > 65535 then
							chksm_temp <= std_logic_vector(unsigned(chksm_temp) + unsigned(ip_header(159 -16*to_integer(unsigned(rx_count)) downto 144-16*to_integer(unsigned(rx_count)))) - 65535);
						else
							chksm_temp <= std_logic_vector(unsigned(chksm_temp) + unsigned(ip_header(159 -16*to_integer(unsigned(rx_count)) downto 144-16*to_integer(unsigned(rx_count)))));
						end if;
						state <= ip_checksum;
					-- now check checksum and ip address
					else
						chksm_temp <= (others => '0');
						rx_count <= (others => '0');
						if (not chksm_temp(15 downto 0)) = X"0000" and (ip_addr = ip_header(31 downto 0) or broadcast_ip_addr = ip_header(31 downto 0)) then
							-- insert state assignment here if planning on receiving fragments
							-- also assign vector for udp checksum calculation
							udp_head_temp <= ip_header(63 downto 0) & X"00" & ip_header(87 downto 80) & udp_header(31 downto 16) & udp_header & chksm_data(15 downto 0);
							state <= udp_checksum;
						else
							state <= idle;
						end if;
					end if;
						
				when udp_checksum =>
					rx_udp_valid <= '0';
					rx_data_wr_en <= "0";
					-- calculate checksum, count length, while adding and accounting or carry
					if rx_count < std_logic_vector(to_unsigned(11, 5)) then
						rx_count <= std_logic_vector(unsigned(rx_count)+1);
						if (unsigned(chksm_temp2) + unsigned(udp_head_temp(175 -16*to_integer(unsigned(rx_count)) downto 160-16*to_integer(unsigned(rx_count))))) > 65535 then
							chksm_temp2 <= std_logic_vector(unsigned(chksm_temp2) + unsigned(udp_head_temp(175 -16*to_integer(unsigned(rx_count)) downto 160-16*to_integer(unsigned(rx_count)))) - 65535);
						else
							chksm_temp2 <= std_logic_vector(unsigned(chksm_temp2) + unsigned(udp_head_temp(175 -16*to_integer(unsigned(rx_count)) downto 160-16*to_integer(unsigned(rx_count)))));
						end if;
						state <= udp_checksum;
					-- check checksum and port number
					else
						chksm_temp2 <= (others => '0');
						rx_count <= (others => '0');
						if (not chksm_temp2(15 downto 0)) = X"0000" and port_num = udp_header(47 downto 32) then
							state <= output;
						else
							state <= idle;
						end if;
					end if;
			
					
				-- output data
				when output =>
--		rx_eth_ready_1 <= '1';
					rx_data_wr_en <= "0";
					-- use length given in ip header to count out data to deal with case of < 18 byte data
					if data_count = std_logic_vector(unsigned(udp_header(31 downto 16))-8) then
						data_count <= (others => '0');
						rx_udp_valid <= '0';
						state <= idle;
					else
						data_count <= std_logic_vector(unsigned(data_count)+1);
						rx_udp_valid <= '1';
						state <= output;
					end if;
					
--				when not_ready =>
--					rx_eth_ready <= '0';
--					if rx_udp_ready = '1' then
--						state <= hold_state;
--					else
--						state <= not_ready;
--					end if;
					
		-- commented states are used to deal with fragmented ip packets
		-- still need to implement some other things like checking for same id in all fragments and checking fragment offset
		-- need to fix padded fragments (if that happens, 1473 = 1472 + 1 or 1455 + 18???)
--				-- wait for next fragment, go idle if takes too long (currently, 1 ms)
--				when frag_wait =>
--					rx_udp_valid <= '0';
--					rx_eth_ready <= '1';
--					rx_data_wr_en <= "0";
--					ip_count <= (others => '0');
--					if rx_eth_valid = '1' then
--						ip_header(159 downto 152) <= rx_eth_data;
--						state <= frag_ip_head;
--					elsif wait_count = std_logic_vector(to_unsigned(125000, 16)) then
--						state <= idle;
--					else
--						wait_count <= std_logic_vector(unsigned(wait_count)+1);
--						state <= frag_wait;
--					end if;
--				when frag_ip_head =>
--					rx_udp_valid <= '0';
--					rx_eth_ready <= '0';
--					if rx_count = std_logic_vector(to_unsigned(18, 5)) then
--						rx_count <= (others => '0');
--						-- enable write here because one clock cycle delay
--						rx_data_wr_en <= "1";
--						state <= frag_data;
--					else
--						ip_header(151-8*to_integer(unsigned(rx_count)) downto 144-8*to_integer(unsigned(rx_count))) <= rx_eth_data;
--						rx_count <= std_logic_vector(unsigned(rx_count)+1);
--						rx_data_wr_en <= "0";
--						state <= frag_ip_head;
--					end if;
--				when frag_data =>
--					rx_udp_valid <= '0';
--					rx_eth_ready <= '0';
--					-- end of packet(/fragment)
--					if rx_eth_valid = '0' then
--						rx_data_wr_en <= "0";
--						state <= frag_ip_checksum;
--					else
--						-- write data, except on last byte, because one clk cycle delay
--						if rx_eth_last = '1' then
--							rx_data_wr_en <= "0";
--						else
--							rx_data_wr_en <= "1";
--						end if;
--						-- keep track of checksum of data
--						if ip_count(0) = '0' then
--							if unsigned(chksm_temp) + unsigned(rx_eth_data & X"00") > 65535 then	
--								chksm_temp <= std_logic_vector(unsigned(chksm_temp)+unsigned(rx_eth_data & X"00")-65535);
--							else
--								chksm_temp <= std_logic_vector(unsigned(chksm_temp)+unsigned(rx_eth_data & X"00"));
--							end if;
--						else
--							if unsigned(chksm_temp) + unsigned(rx_eth_data) > 65535 then
--								chksm_temp <= std_logic_vector(unsigned(chksm_temp)+unsigned(rx_eth_data)-65535);
--							else
--								chksm_temp <= std_logic_vector(unsigned(chksm_temp)+unsigned(rx_eth_data));
--							end if;
--						end if;
--						-- count ip and udp length
--						ip_count <= std_logic_vector(unsigned(ip_count)+1);
--						udp_count <= std_logic_vector(unsigned(udp_count)+1);
--						state <= frag_data;
--					end if;
--				when frag_ip_checksum =>
--					rx_udp_valid <= '0';
--					rx_eth_ready <= '0';
--					rx_data_wr_en <= "0";
--					ip_checksum_debug <= checksum(ip_header, std_logic_vector(to_unsigned(19, 5)));
--					-- verify some header fields
--					if checksum(ip_header, std_logic_vector(to_unsigned(19, 5))) /= X"0000" or std_logic_vector(unsigned(ip_count)+20) /= ip_header(143 downto 128) or ip_addr /= ip_header(31 downto 0) then
--						state <= idle;
--					-- fragments
--					elsif ip_header(109) = '1' then
--						state <= frag_wait;
--					-- no fragments
--					else
--						-- pseudo header, udp header, and data for udp checksum calculation
--						udp_head_temp <= ip_header(63 downto 0) & X"00" & ip_header(87 downto 80) & udp_header(31 downto 16) & udp_header & chksm_temp(15 downto 0);
--						state <= udp_checksum;
--					end if;
				when others =>
					rx_udp_valid <= '0';
--					rx_eth_ready <= '0';
					rx_data_wr_en <= "0";
					state <= idle;
			end case;
			
	--		end if;
			
		end if;
	end if;

end process;


end rtl;
