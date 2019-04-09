----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:54:18 06/25/2015 
-- Design Name: 
-- Module Name:    eth_top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity eth_top is
PORT(
--		board_clkp : in std_logic;
--		board_clkn : in std_logic;
--		status_fake                 : out std_logic;
--		control_fake                : out std_logic;
--		mgtclk0p   						 : in std_logic; 
--		mgtclk0n  					    : in std_logic
      ext_user_clk					: in std_logic;
	   tx_udp_data                : in   std_logic_vector(7 downto 0);
		tx_udp_valid               : in   std_logic;
		rx_udp_ready               : in  std_logic;
		trx_udp_clock					: out std_logic;
		tx_udp_ready               : out  std_logic;
	   rx_udp_data                : out   std_logic_vector(7 downto 0);
		rx_udp_valid               : out   std_logic;
		--Fiber optic signals
		mgtclk1p                    : in std_logic;
		mgtclk1n                    : in std_logic;
	   mgttxfault                  : in std_logic;
		mgtmod0                     : in std_logic;
		mgtlos                      : in std_logic;
		mgtrxp                      : in std_logic;
		mgtrxn                      : in std_logic;
		mgttxdis                    : out std_logic;
		mgtmod2                     : out std_logic;
		mgtmod1                     : out std_logic;
		mgttxp                      : out std_logic;
		mgttxn                      : out std_logic
		);
end eth_top;

architecture Behavioral of eth_top is

component udp
generic(
	ip_addr : std_logic_vector(31 downto 0):= x"c0a81405";
	dst_ip_addr : std_logic_vector(31 downto 0) := x"c0a81401";
	port_num : std_logic_vector(15 downto 0):= x"6000";
	dst_port_num : std_logic_vector(15 downto 0):= x"7000";
	mac_addr : std_logic_vector(47 downto 0):= x"aabbccddeeff";
-----	dst_mac_addr : std_logic_vector(47 downto 0) := x"0023564c1962"--Bronson's PC
dst_mac_addr : std_logic_vector(47 downto 0):=x"be11e25CB0D5"--Belle II SCROD A5!-- x"0050B67C6C0F" --Isar's VM PC
	);
port(
--		board_clkp : in std_logic;
--		board_clkn : in std_logic;
      ext_user_clk					:in std_logic;
	   tx_udp_data                : in   std_logic_vector(7 downto 0);
		tx_udp_valid               : in   std_logic;
		tx_udp_ready               : out  std_logic;
	   rx_udp_data                : out   std_logic_vector(7 downto 0);
		rx_udp_valid               : out   std_logic;
		rx_udp_ready               : in  std_logic;
		trx_udp_clock					: out std_logic;

		
      clk_enable                : in  std_logic;
      speedis100                : out std_logic;
      speedis10100              : out std_logic;
		
		tx_statistics_s		: out std_logic;
		rx_statistics_s		: out std_logic;
		
		pause_req_s				: in std_logic;
		
		mac_speed 				: in std_logic_vector(1 downto 0);
		update_speed			: in std_logic;
		config_board			: in std_logic;
		serial_response		: out std_logic;
		gen_tx_data				: in std_logic;
		chk_tx_data				: in std_logic;
		reset_error				: in std_logic;
		frame_error				: out std_logic;
		frame_errorn			: out std_logic;
		activity_flash			: out std_logic;
		activity_flashn		: out std_logic;
	
      phyad0               : in std_logic_vector(4 downto 0);
      configuration_vector0: in std_logic_vector(4 downto 0);
      configuration_valid0 : in std_logic;

      link_timer_value0    : in std_logic_vector(8 downto 0);
      an_interrupt0        : out std_logic;
      an_adv_config_vector0: in std_logic_vector(15 downto 0);
      an_adv_config_val0   : in std_logic;
      an_restart_config0   : in std_logic; 
      status_vector0       : out std_logic_vector(15 downto 0);
--      reset0               : in std_logic;
      signal_detect0       : in std_logic;
		
		brefclk_p            : in std_logic;
		brefclk_n				: in std_logic;

      txp0                 : out std_logic;
      txn0                 : out std_logic;
      rxp0                 : in std_logic;
      rxn0                 : in std_logic;

      txp1                 : out std_logic;
      txn1                 : out std_logic;
      rxp1                 : in std_logic;
      rxn1                 : in std_logic
);
end component;



	signal clk_enable_1	: std_logic;
	signal speedis100_1	: std_logic;
	signal speedis10100_1	: std_logic;
	signal tx_statistics_s_1	: std_logic;
	signal rx_statistics_s_1	: std_logic;
	signal pause_req_s_1	: std_logic;
	signal mac_speed_1	: std_logic_vector(1 downto 0);
	signal update_speed_1	: std_logic;
	signal config_board_1	: std_logic;
	signal serial_response_1	: std_logic;
	signal gen_tx_data_1	: std_logic;
	signal chk_tx_data_1	: std_logic;
	signal reset_error_1	: std_logic;
	signal frame_error_1	: std_logic;
	signal frame_errorn_1	: std_logic;
	signal activity_flash_1	: std_logic;
	signal activity_flashn_1	: std_logic;
	signal phyad0_1	: std_logic_vector(4 downto 0);
	signal configuration_vector0_1	: std_logic_vector(4 downto 0);
	signal configuration_valid0_1	: std_logic;
	signal link_timer_value0_1	: std_logic_vector(8 downto 0);
	signal an_interrupt0_1	: std_logic;
	signal an_adv_config_vector0_1	: std_logic_vector(15 downto 0);
	signal an_adv_config_val0_1	: std_logic;
	signal an_restart_config0_1	: std_logic;
	signal status_vector0_1	: std_logic_vector(15 downto 0);
	signal reset0_1	: std_logic := '0';
	signal signal_detect0_1	: std_logic;
	signal mgtclk1p_1 : std_logic;
	signal mgtclk1n_1 : std_logic;
	signal mgtrxp_1 : std_logic;
	signal mgtrxn_1 : std_logic;
	signal mgttxp_1 : std_logic;
	signal mgttxn_1 : std_logic;
	signal txp1_1	: std_logic;
	signal txn1_1	: std_logic;
	signal rxp1_1	: std_logic;
	signal rxn1_1	: std_logic;
	
	signal board_clkp_1 : std_logic;
	signal board_clkn_1 : std_logic;
	
	
begin

-- just giving these outputs a value
mgttxdis <= '0';
mgtmod1 <= '1';
mgtmod2 <= '1';

udp_1 : udp
port map(
--	board_clkp => board_clkp_1,
--	board_clkn => board_clkn_1,
      ext_user_clk=>ext_user_clk,
	   tx_udp_data =>tx_udp_data,
		tx_udp_valid  =>   tx_udp_valid ,  
		tx_udp_ready   =>  tx_udp_ready ,   
	   rx_udp_data    =>  rx_udp_data ,        
		rx_udp_valid   =>  rx_udp_valid  ,      
		rx_udp_ready    => rx_udp_ready ,        
		trx_udp_clock	=>		trx_udp_clock,		

	clk_enable => clk_enable_1,
	speedis100 => speedis100_1,
	speedis10100 => speedis10100_1,
	tx_statistics_s => tx_statistics_s_1,
	rx_statistics_s => rx_statistics_s_1,
	pause_req_s => pause_req_s_1,
	mac_speed => mac_speed_1,
	update_speed => update_speed_1,
	config_board => config_board_1,
	serial_response => serial_response_1,
	gen_tx_data => gen_tx_data_1,
	chk_tx_data => chk_tx_data_1,
	reset_error => reset_error_1,
	frame_error => frame_error_1,
	frame_errorn => frame_errorn_1,
	activity_flash => activity_flash_1,
	activity_flashn => activity_flashn_1,
	phyad0 => phyad0_1,
	configuration_vector0 => configuration_vector0_1,
	configuration_valid0 => configuration_valid0_1,
	link_timer_value0 => link_timer_value0_1,
	an_interrupt0 => an_interrupt0_1,
	an_adv_config_vector0 => an_adv_config_vector0_1,
	an_adv_config_val0 => an_adv_config_val0_1,
	an_restart_config0 => an_restart_config0_1,
	status_vector0 => status_vector0_1,
--	reset0 => reset0_1,
	signal_detect0 => signal_detect0_1,
	brefclk_p => mgtclk1p_1,
	brefclk_n => mgtclk1n_1,
	txp0 => mgttxp_1,
	txn0 => mgttxn_1,
	rxp0 => mgtrxp_1,
	rxn0 => mgtrxn_1,
	txp1 => txp1_1,
	txn1 => txn1_1,
	rxp1 => rxp1_1,
	rxn1 => rxn1_1
);

--
--mgtrxp_1 <= '0';
--mgtrxn_1 <= '1';

-- connecting the rest of whatever needs to be connected
-- temac
clk_enable_1 <= '1';
pause_req_s_1 <= '0';
mac_speed_1 <= "10";
update_speed_1 <= '0';
config_board_1 <= '0';
gen_tx_data_1 <= '1';
chk_tx_data_1 <= '0';
reset_error_1 <= '0';
-- pcs_pma
phyad0_1 <= "00111";
configuration_vector0_1 <= "00000";
configuration_valid0_1 <= '0';
link_timer_value0_1 <= "100111101";
an_adv_config_vector0_1 <= "0000000000100001";
an_adv_config_val0_1 <= '0';
an_restart_config0_1 <= '0';
signal_detect0_1 <= '1';
rxp1_1 <= '0';
rxn1_1 <= '1';

--connecting to top
--board_clkp_1 <= board_clkp;
--board_clkn_1 <= board_clkn;
mgtclk1p_1 <= mgtclk1p;
mgtclk1n_1 <= mgtclk1n;
mgtrxp_1 <= mgtrxp;
mgtrxn_1 <= mgtrxn;
mgttxp <= mgttxp_1;
mgttxn <= mgttxn_1;


end Behavioral;

