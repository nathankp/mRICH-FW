-- name: Kevin Oshiro
-- date: 8/11
-- description:
-- On the tx side, this module takes the ip packets from the ip_udp_tx_block and sends the ethernet header (mac dest, mac src, eth type)
-- followed by the data to the trimac fifo. On the rx side, the ethernet header is removed and the destination address and eth type are 
-- checked. Then the ip packet is passed to the ip_udp_rx_block.
--
-- modifications to be made:
-- -everything on the receive side
-- -tx_eth_ready and tx_temac_ready
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity eth_head is
	generic(
		mac_addr : std_logic_vector(47 downto 0);
		dst_mac_addr : std_logic_vector(47 downto 0)
		);
	port(
	axi_tclk : in std_logic;
	axi_tresetn : in std_logic;

	-- user side transmit
	tx_eth_data : in std_logic_vector(7 downto 0);
	tx_eth_valid : in std_logic;
	tx_eth_last : in std_logic;
--	tx_eth_ready : out std_logic;

	-- MAC side transmit
	tx_temac_data : out std_logic_vector(7 downto 0);
	tx_temac_valid : out std_logic;
	tx_temac_last : out std_logic;
--	tx_temac_ready : in std_logic;

	-- user side receive
	rx_eth_data : out std_logic_vector(7 downto 0);
	rx_eth_valid : out std_logic;
	rx_eth_last : out std_logic;
--	rx_eth_ready : in std_logic;

	-- MAC side receive
	rx_temac_data : in std_logic_vector(7 downto 0);
	rx_temac_valid : in std_logic;
	rx_temac_last : in std_logic
--	rx_temac_ready : out std_logic
	);
end eth_head;

architecture Behavioral of eth_head is



type tx_state_type is (tx_idle, tx_eth_head, tx_eth_output_data);
signal tx_state : tx_state_type := tx_idle;
type rx_state_type is (rx_idle, rx_eth_head, rx_eth_output_data);
signal rx_state : rx_state_type := rx_idle;

-- make these generics or something else?
--signal dst_mac_addr : std_logic_vector(47 downto 0) := x"aabbccddeeff"; --:= x"0023564c1962";
--signal mac_addr : std_logic_vector(47 downto 0) := x"aabbccddeeff";
signal eth_type : std_logic_vector(15 downto 0) := x"0800";
signal broadcast_mac_addr : std_logic_vector(47 downto 0) := x"ffffffffffff";

-- stick signals together
signal tx_eth_header : std_logic_vector(111 downto 0) := 
dst_mac_addr & mac_addr & eth_type;
-- hold incoming eth header
signal rx_eth_header : std_logic_vector(111 downto 0);

-- counter
signal tx_count : std_logic_vector(3 downto 0):= "0000";
signal rx_count : std_logic_vector(3 downto 0):= "0000";

--signals for fifo
signal tx_temac_rd_en : std_logic:= '0';
signal tx_temac_dout : std_logic_vector(7 downto 0);
signal full : std_logic;
signal empty : std_logic;
signal fifo_data_count : std_logic_vector(3 downto 0);

signal rx_temac_data_1 : std_logic_vector(7 downto 0);
signal rx_temac_valid_1 : std_logic;
signal rx_temac_last_1 : std_logic;

signal debug : std_logic;

COMPONENT eth_head_fifo
  PORT (
    clk : IN STD_LOGIC;
    rst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC;
	 data_count : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END COMPONENT;

begin

eth_head_tx_fifo_1 : eth_head_fifo
  PORT MAP (
    clk => axi_tclk,
    rst => not axi_tresetn,
    din => tx_eth_data,
    wr_en => tx_eth_valid,
    rd_en => tx_temac_rd_en,
    dout => tx_temac_dout,
    full => full,
    empty => empty,
	 data_count => fifo_data_count
  );

-- tx process
process(axi_tclk, axi_tresetn)--, tx_temac_ready)
begin
	if(axi_tresetn = '0') then
	tx_temac_data <= (others => '0');
	tx_temac_valid <= '0';
	tx_temac_last <= '0';
	tx_temac_rd_en <= '0';
	tx_count <= (others => '0');
--	elsif tx_temac_ready = '0' then
	else
		if rising_edge(axi_tclk) then
			case(tx_state) is
				-- wait for valid
				when tx_idle =>
					tx_count <= "0001";
					tx_temac_last <= '0';
					if tx_eth_valid = '1' then
						tx_temac_data <= tx_eth_header(111 downto 104);
						tx_temac_valid <= '1';
						tx_temac_rd_en <= '0';
						tx_state <= tx_eth_head;
					else
						tx_temac_data <= (others => '0');
						tx_temac_valid <= '0';
						tx_state <= tx_idle;
					end if;
				-- send eth header store some eth data
				when tx_eth_head =>
					tx_temac_data <= tx_eth_header(111-8*to_integer(unsigned(tx_count)) downto 104-8*to_integer(unsigned(tx_count)));
					tx_temac_valid <= '1';
					tx_temac_last <= '0';
					if tx_count > std_logic_vector(to_unsigned(11, 4)) then
						tx_temac_rd_en <= '1';
					else
						tx_temac_rd_en <= '0';
					end if;
					if tx_count = std_logic_vector(to_unsigned(13, 4)) then
						tx_count <= (others => '0');
						tx_state <= tx_eth_output_data;
					else
						tx_count <= std_logic_vector(unsigned(tx_count)+1);
						tx_state <= tx_eth_head;
					end if;
				-- send eth data
				when tx_eth_output_data =>
					tx_temac_data <= tx_temac_dout;
					if fifo_data_count = "0000" then
						tx_temac_last <= '1';
						tx_temac_valid <= '1';
						tx_state <= tx_idle;
					else
						tx_temac_last <= '0';
						tx_temac_valid <= '1';
						tx_state <= tx_eth_output_data;
					end if;
			end case;
		end if;
	end if;
end process;
--
-- rx process
process(axi_tclk, axi_tresetn)--, rx_eth_ready)
begin
	if(axi_tresetn = '0') then
	--	rx_temac_ready <= '0';
		rx_eth_data <= (others => '0');
		rx_eth_valid <= '0';
		rx_eth_last <= '0';
		rx_count <= (others => '0');
--	elsif rx_eth_ready = '0' then
--		rx_temac_ready <= '0';
--		rx_eth_valid <= '0';
--		rx_eth_last <= '0';
	else
--		rx_temac_ready <= '1';
		if rising_edge(axi_tclk) then
			case(rx_state) is
				-- wait until valid
				when rx_idle =>
					rx_eth_data <= (others => '0');
					rx_eth_valid <= '0';
					rx_eth_last <= '0';
					rx_count <= (others => '0');
					if rx_temac_valid_1 = '1' then
						-- make sure to take first byte
						rx_eth_header(111 downto 104) <= rx_temac_data_1;
						rx_state <= rx_eth_head;
					else
						rx_eth_header <= (others => '0');
						rx_state <= rx_idle;
					end if;
				-- store header
				when rx_eth_head =>
					-- last byte
					if rx_count = std_logic_vector(to_unsigned(12, 4)) then
						rx_count <= (others => '0');
						rx_eth_header(7 downto 0) <= rx_temac_data_1;
						rx_state <= rx_eth_output_data;
					else
						rx_eth_data <= (others => '0');
						rx_eth_valid <= '0';
						rx_eth_last <= '0';
						rx_eth_header(103-8*to_integer(unsigned(rx_count)) downto 96-8*to_integer(unsigned(rx_count))) <= rx_temac_data_1;
						rx_count <= std_logic_vector(unsigned(rx_count)+1);
						rx_state <= rx_eth_head;
					end if;
				-- output valid data
				when rx_eth_output_data =>
					if (rx_eth_header(111 downto 64) = mac_addr or rx_eth_header(111 downto 64) = broadcast_mac_addr) and rx_eth_header(15 downto 0) = eth_type then
						rx_eth_data <= rx_temac_data_1;
						rx_eth_valid <= rx_temac_valid_1;
						rx_eth_last <= rx_temac_last_1;
						if rx_temac_last_1 = '1' then
							rx_state <= rx_idle;
						else
							rx_state <= rx_eth_output_data;
						end if;
					else
						rx_eth_data <= (others => '0');
						rx_eth_valid <= '0';
						rx_eth_last <= '0';
						rx_state <= rx_idle;
					end if;
					
			end case;
		end if;
	end if;
end process;

rx_temac_data_1 <= rx_temac_data;
rx_temac_valid_1 <= rx_temac_valid;
rx_temac_last_1 <= rx_temac_last;


end Behavioral;

