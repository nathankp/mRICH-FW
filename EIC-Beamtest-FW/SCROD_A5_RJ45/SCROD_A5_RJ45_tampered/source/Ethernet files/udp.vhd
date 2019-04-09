-- name: Kevin Oshiro
-- date: 8/12/15
-- description: connects ip/udp block, eth_head and eth, currently transmit side only
--
-- modifications to be made: receive stuff
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity udp is
generic(
	ip_addr : std_logic_vector(31 downto 0);
	dst_ip_addr : std_logic_vector(31 downto 0);
	port_num : std_logic_vector(15 downto 0);
	dst_port_num : std_logic_vector(15 downto 0);
	mac_addr : std_logic_vector(47 downto 0);
	dst_mac_addr : std_logic_vector(47 downto 0)
	);
	port
(
		ext_user_clk:in std_logic;
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
end udp;

architecture Behavioral of udp is

signal axi_tclk_1 : std_logic;
signal axi_tresetn_1 : std_logic;

signal an_done_1 : std_logic;

signal tx_udp_data_1 : std_logic_vector(7 downto 0);
signal tx_udp_valid_1 : std_logic;
signal tx_udp_ready_1 : std_logic;


signal rx_udp_data_1 : std_logic_vector(7 downto 0);
signal rx_udp_valid_1 : std_logic;
signal rx_udp_ready_1 : std_logic;
signal tx_eth_data_1 : std_logic_vector(7 downto 0);
signal tx_eth_valid_1 : std_logic;
signal tx_eth_last_1 : std_logic;
signal tx_eth_ready_1 : std_logic;

signal rx_eth_data_1 : std_logic_vector(7 downto 0);
signal rx_eth_valid_1 : std_logic;
signal rx_eth_last_1 : std_logic;
signal rx_eth_ready_1 : std_logic;
signal tx_temac_data_1 : std_logic_vector(7 downto 0);
signal tx_temac_valid_1 : std_logic;
signal tx_temac_last_1 : std_logic;
signal tx_temac_ready_1 : std_logic;

signal rx_temac_data_1 : std_logic_vector(7 downto 0);
signal rx_temac_valid_1 : std_logic;
signal rx_temac_last_1 : std_logic;
signal rx_temac_ready_1 : std_logic;

begin

eth_inst : entity work.eth
port map(
		ext_user_clk			=>ext_user_clk,
      clk_enable              => clk_enable,
      speedis100               => speedis100,
      speedis10100             => speedis10100,
		
		tx_statistics_s		=> tx_statistics_s,
		rx_statistics_s		=> rx_statistics_s,
		
		pause_req_s			=> pause_req_s,
		
		mac_speed 			=> mac_speed,
		update_speed			=> update_speed,
		config_board		=> config_board,
		serial_response	=> serial_response,
		gen_tx_data			=> gen_tx_data,
		chk_tx_data			=> chk_tx_data,
		reset_error			=> reset_error,
		
      phyad0              => phyad0,
      configuration_vector0 => configuration_vector0,
      configuration_valid0              => configuration_valid0,       

      link_timer_value0   => link_timer_value0,
      an_interrupt0              => an_interrupt0,     
      an_adv_config_vector0 => an_adv_config_vector0,
      an_adv_config_val0          => an_adv_config_val0,      
      an_restart_config0            => an_restart_config0,
      status_vector0      => status_vector0,
      signal_detect0      => signal_detect0,

      brefclk_p          => brefclk_p,
		brefclk_n			=> brefclk_n,

      txp0                => txp0,
      txn0               => txn0,
      rxp0               => rxp0,
      rxn0                => rxn0,

      txp1                 => txp1, 
      txn1                => txn1,
      rxp1                => rxp1,
      rxn1                 => rxn1,

		tx_axis_fifo_tdata => tx_temac_data_1,
		tx_axis_fifo_tvalid => tx_temac_valid_1,
		tx_axis_fifo_tlast => tx_temac_last_1,
--		tx_axis_fifo_tready => tx_temac_ready_1,
		
		rx_axis_fifo_tdata => rx_temac_data_1,
		rx_axis_fifo_tvalid => rx_temac_valid_1,
		rx_axis_fifo_tlast => rx_temac_last_1,
		rx_axis_fifo_tready => '1',--rx_temac_ready_1,
		
		an_done => an_done_1,
		axi_tclk => axi_tclk_1,
		axi_tresetn => axi_tresetn_1
);




--   basic_pat_gen_inst : basic_pat_gen
--   port map (
--		an_done => an_done_1, -- added to delay simple packet generator until autonegotiation done
--       axi_tclk                     => axi_tclk_1,
--       axi_tresetn                  => axi_tresetn_1,
--
--       rx_udp_data                => rx_udp_data_1,
--       rx_udp_valid               => rx_udp_valid_1,
-- --      rx_udp_ready               => rx_udp_ready_1,
--
--       tx_udp_data                => tx_udp_data_1,
--       tx_udp_valid               => tx_udp_valid_1,
--       tx_udp_ready               => tx_udp_ready_1
--
--
--   );
	
trx_udp_clock<= axi_tclk_1;

  ip_udp_tx_block_inst: entity work.ip_udp_tx_block 
	GENERIC MAP (
			ip_addr => ip_addr,
			dst_ip_addr => dst_ip_addr,
			port_num => port_num,
			dst_port_num => dst_port_num
			)
	PORT MAP (
          axi_tclk => axi_tclk_1,
          axi_tresetn => axi_tresetn_1,
          tx_eth_data => tx_eth_data_1,
          tx_eth_valid => tx_eth_valid_1,
          tx_eth_last => tx_eth_last_1,
--          tx_eth_ready => tx_eth_ready_1,
          tx_udp_data => tx_udp_data,-- goes to top module instead of patgem
          tx_udp_valid => tx_udp_valid,
			 tx_udp_ready => tx_udp_ready
        );
		  
ip_udp_rx_block_inst: entity work.ip_udp_rx_block
	GENERIC MAP (
			ip_addr => ip_addr,
			port_num => port_num
			)
	PORT MAP (
			axi_tclk => axi_tclk_1,
			axi_tresetn => axi_tresetn_1,
			rx_eth_data => rx_eth_data_1,
			rx_eth_valid => rx_eth_valid_1,
			rx_eth_last => rx_eth_last_1,
--			rx_eth_ready => rx_eth_ready_1,
			rx_udp_data => rx_udp_data,
			rx_udp_valid => rx_udp_valid
--			rx_udp_ready => rx_udp_ready_1
			);
	
		
 eth_head_inst: entity work.eth_head 
	GENERIC MAP (
			mac_addr => mac_addr,
			dst_mac_addr => dst_mac_addr
			)
	PORT MAP (
          axi_tclk => axi_tclk_1,
          axi_tresetn => axi_tresetn_1,
          tx_eth_data => tx_eth_data_1,
          tx_eth_valid => tx_eth_valid_1,
          tx_eth_last => tx_eth_last_1,
 --       tx_eth_ready => tx_eth_ready_1,
          tx_temac_data => tx_temac_data_1,
          tx_temac_valid => tx_temac_valid_1,
          tx_temac_last => tx_temac_last_1,
 --       tx_temac_ready => tx_temac_ready_1
          rx_eth_data => rx_eth_data_1,
          rx_eth_valid => rx_eth_valid_1,
         rx_eth_last => rx_eth_last_1,
--          rx_eth_ready => rx_eth_ready,
          rx_temac_data => rx_temac_data_1,
          rx_temac_valid => rx_temac_valid_1,
          rx_temac_last => rx_temac_last_1
--          rx_temac_ready => rx_temac_ready
        );
end Behavioral;

