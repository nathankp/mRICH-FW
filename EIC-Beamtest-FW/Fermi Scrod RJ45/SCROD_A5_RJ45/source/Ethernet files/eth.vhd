----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:48:15 06/19/2015 
-- Design Name: 
-- Module Name:    eth - Behavioral 
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
library UNISIM;
use UNISIM.VComponents.all;

----------------------------------------
-- Connects TEMAC and PCS_PMA/Transceiver blocks and some other stuff
-- -pg047 page 340- diagram for internally connecting TEMAC v5.5 and PCS_PMA with SP6 transceiver
-- -connect block level, pg051 page 213 and pg047 page 165

----------------------------------------



entity eth is
port(
--		board_clkp : in std_logic;
--		board_clkn : in std_logic;
      -- asynchronous reset
--      glbl_rst                  : in  std_logic;

      -- Receiver Statistics Interface
      -----------------------------------------
--		  rx_reset							: out std_logic;
--      rx_statistics_vector       : out std_logic_vector(27 downto 0);
--      rx_statistics_valid        : out std_logic;

      -- Receiver (AXI-S) Interface
      ------------------------------------------
--      rx_fifo_clock              : in  std_logic;
--      rx_fifo_resetn             : in  std_logic;
--      rx_axis_fifo_tdata         : out std_logic_vector(7 downto 0);
--      rx_axis_fifo_tvalid        : out std_logic;
--      rx_axis_fifo_tready        : in  std_logic;
--      rx_axis_fifo_tlast         : out std_logic;

      -- Transmitter Statistics Interface
      --------------------------------------------
--      tx_reset                   : out std_logic;
--      tx_ifg_delay               : in  std_logic_vector(7 downto 0);
--      tx_statistics_vector       : out std_logic_vector(31 downto 0);
--      tx_statistics_valid        : out std_logic;

      -- Transmitter (AXI-S) Interface
      ---------------------------------------------
--      tx_fifo_clock              : in  std_logic;
--      tx_fifo_resetn             : in  std_logic;
--      tx_axis_fifo_tdata         : in  std_logic_vector(7 downto 0);
--      tx_axis_fifo_tvalid        : in  std_logic;
--      tx_axis_fifo_tready        : out std_logic;
--      tx_axis_fifo_tlast         : in  std_logic;

      -- MAC Control Interface
      --------------------------
--      pause_req                  : in  std_logic;
--      pause_val                  : in  std_logic_vector(15 downto 0);

      -- GMII Interface
      -------------------
      ext_user_clk					:in std_logic;
		clk_enable                : in  std_logic;
      speedis100                : out std_logic;
      speedis10100              : out std_logic;
		
		-- Stuff from Axi-Lite Interface not connected to TEMAC or stuff used in user logic
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
		
--      -- AXI-Lite Interface
--      -----------------
--      s_axi_aclk                : in  std_logic;
--      s_axi_resetn              : in  std_logic;
--
--      s_axi_awaddr              : in  std_logic_vector(31 downto 0);
--      s_axi_awvalid             : in  std_logic;
--      s_axi_awready             : out std_logic;
--
--      s_axi_wdata               : in  std_logic_vector(31 downto 0);
--      s_axi_wvalid              : in  std_logic;
--      s_axi_wready              : out std_logic;
--
--      s_axi_bresp               : out std_logic_vector(1 downto 0);
--      s_axi_bvalid              : out std_logic;
--      s_axi_bready              : in  std_logic;
--
--      s_axi_araddr              : in  std_logic_vector(31 downto 0);
--      s_axi_arvalid             : in  std_logic;
--      s_axi_arready             : out std_logic;
--
--      s_axi_rdata               : out std_logic_vector(31 downto 0);
--      s_axi_rresp               : out std_logic_vector(1 downto 0);
--      s_axi_rvalid              : out std_logic;
--      s_axi_rready              : in  std_logic;

      -- GMII Interface
      -----------------
--      gmii_isolate0        : out std_logic;                    -- Tristate control to electrically isolate GMII.

      -- Management: MDIO Interface
      -----------------------------
      phyad0               : in std_logic_vector(4 downto 0);  -- Port address for MDIO.
      configuration_vector0: in std_logic_vector(4 downto 0);  -- Alternative to MDIO interface.
      configuration_valid0 : in std_logic;                     -- Validation signal for Config vector.

      -- General IO's
      ---------------
      link_timer_value0    : in std_logic_vector(8 downto 0);  -- Programmable Auto-Negotiation Link Timer Control
      an_interrupt0        : out std_logic;                    -- Interrupt to processor to signal that Auto-Negotiation has completed
      an_adv_config_vector0: in std_logic_vector(15 downto 0); -- Alternate interface to program REG4 (AN ADV)
      an_adv_config_val0   : in std_logic;                     -- Validation signal for AN ADV
      an_restart_config0   : in std_logic;                     -- Alternate signal to modify AN restart bit in REG0
      status_vector0       : out std_logic_vector(15 downto 0); -- Core status.
--      reset0               : in std_logic;                     -- Asynchronous reset for entire core.
      signal_detect0       : in std_logic;                     -- Input from PMD to indicate presence of optical input.


      --------------------------------------------------------------------------
      -- Tranceiver interfaces
      --------------------------------------------------------------------------
      brefclk_p            : in std_logic;                     -- input clk
		brefclk_n				: in std_logic;							-- input clk

      txp0                 : out std_logic;                    -- Differential +ve of serial transmission from PMA to PMD.
      txn0                 : out std_logic;                    -- Differential -ve of serial transmission from PMA to PMD.
      rxp0                 : in std_logic;                     -- Differential +ve for serial reception from PMD to PMA.
      rxn0                 : in std_logic;                     -- Differential -ve for serial reception from PMD to PMA.

      txp1                 : out std_logic;                    -- Differential +ve of serial transmission from PMA to PMD.
      txn1                 : out std_logic;                    -- Differential -ve of serial transmission from PMA to PMD.
      rxp1                 : in std_logic;                     -- Differential +ve for serial reception from PMD to PMA.
      rxn1                 : in std_logic;                      -- Differential -ve for serial reception from PMD to PMA.
		
		----------------------
		-- user side data
		-------------------------------
		tx_axis_fifo_tdata : in std_logic_vector(7 downto 0);
		tx_axis_fifo_tvalid : in std_logic;
		tx_axis_fifo_tlast : in std_logic;
		tx_axis_fifo_tready : out std_logic;
		
		rx_axis_fifo_tdata : out std_logic_vector(7 downto 0);
		rx_axis_fifo_tvalid : out std_logic;
		rx_axis_fifo_tlast : out std_logic;
		rx_axis_fifo_tready : in std_logic;
		
		an_done : out std_logic; -- wait until autoneg complete to start sending data
		axi_tclk : out std_logic;
		axi_tresetn : out std_logic
);
end eth;

architecture Behavioral of eth is


  ------------------------------------------------------------------------------
  -- Component Declaration for the Tri-Mode EMAC core FIFO Block wrapper
  ------------------------------------------------------------------------------

   component tri_mode_eth_mac_v5_5_fifo_block
   generic (
      C_BASE_ADDRESS             : std_logic_vector(31 downto 0) := X"00000000"
   );
   port(
      gtx_clk                    : in  std_logic;
      -- asynchronous reset
      glbl_rstn                  : in  std_logic;
      rx_axi_rstn                : in  std_logic;
      tx_axi_rstn                : in  std_logic;

      -- Receiver Statistics Interface
      -----------------------------------------
      rx_reset                   : out std_logic;
      rx_statistics_vector       : out std_logic_vector(27 downto 0);
      rx_statistics_valid        : out std_logic;

      -- Receiver (AXI-S) Interface
      ------------------------------------------
      rx_fifo_clock              : in  std_logic;
      rx_fifo_resetn             : in  std_logic;
      rx_axis_fifo_tdata         : out std_logic_vector(7 downto 0);
      rx_axis_fifo_tvalid        : out std_logic;
      rx_axis_fifo_tready        : in  std_logic;
      rx_axis_fifo_tlast         : out std_logic;

      -- Transmitter Statistics Interface
      --------------------------------------------
      tx_reset                   : out std_logic;
      tx_ifg_delay               : in  std_logic_vector(7 downto 0);
      tx_statistics_vector       : out std_logic_vector(31 downto 0);
      tx_statistics_valid        : out std_logic;

      -- Transmitter (AXI-S) Interface
      ---------------------------------------------
      tx_fifo_clock              : in  std_logic;
      tx_fifo_resetn             : in  std_logic;
      tx_axis_fifo_tdata         : in  std_logic_vector(7 downto 0);
      tx_axis_fifo_tvalid        : in  std_logic;
      tx_axis_fifo_tready        : out std_logic;
      tx_axis_fifo_tlast         : in  std_logic;

      -- MAC Control Interface
      --------------------------
      pause_req                  : in  std_logic;
      pause_val                  : in  std_logic_vector(15 downto 0);

      -- GMII Interface
      -------------------
      gmii_txd                  : out std_logic_vector(7 downto 0);
      gmii_tx_en                : out std_logic;
      gmii_tx_er                : out std_logic;
      gmii_rxd                  : in  std_logic_vector(7 downto 0);
      gmii_rx_dv                : in  std_logic;
      gmii_rx_er                : in  std_logic;
      clk_enable                : in  std_logic;
      speedis100                : out std_logic;
      speedis10100              : out std_logic;
      -- MDIO Interface
      -------------------
      mdio_i                    : in  std_logic;
      mdio_o                    : out std_logic;
      mdio_t                    : out std_logic;
      mdc                       : out std_logic;

      -- AXI-Lite Interface
      -----------------
      s_axi_aclk                : in  std_logic;
      s_axi_resetn              : in  std_logic;

      s_axi_awaddr              : in  std_logic_vector(31 downto 0);
      s_axi_awvalid             : in  std_logic;
      s_axi_awready             : out std_logic;

      s_axi_wdata               : in  std_logic_vector(31 downto 0);
      s_axi_wvalid              : in  std_logic;
      s_axi_wready              : out std_logic;

      s_axi_bresp               : out std_logic_vector(1 downto 0);
      s_axi_bvalid              : out std_logic;
      s_axi_bready              : in  std_logic;

      s_axi_araddr              : in  std_logic_vector(31 downto 0);
      s_axi_arvalid             : in  std_logic;
      s_axi_arready             : out std_logic;

      s_axi_rdata               : out std_logic_vector(31 downto 0);
      s_axi_rresp               : out std_logic_vector(1 downto 0);
      s_axi_rvalid              : out std_logic;
      s_axi_rready              : in  std_logic

   );
   end component;
	
	  ------------------------------------------------------------------------------
  -- Component Declaration for the Core Block (core wrapper).
  ------------------------------------------------------------------------------
   component pcs_pma_block
      generic (
      -- Set to 1 to Speed up the GTP simulation
      SIM_GTPRESET_SPEEDUP : integer   := 0
      );
      port(

      gtpclkout            : out std_logic;                    -- tranceiver output clock made available to the FPGA fabric.

      --------------------------------------------------------------------------
      -- Core connected to GTP0
      --------------------------------------------------------------------------

      gtpreset0            : in  std_logic;                    -- Full System GTP Reset

      -- GMII Interface
      -----------------
      gmii_txd0            : in std_logic_vector(7 downto 0);  -- Transmit data from client MAC.
      gmii_tx_en0          : in std_logic;                     -- Transmit control signal from client MAC.
      gmii_tx_er0          : in std_logic;                     -- Transmit control signal from client MAC.
      gmii_rxd0            : out std_logic_vector(7 downto 0); -- Received Data to client MAC.
      gmii_rx_dv0          : out std_logic;                    -- Received control signal to client MAC.
      gmii_rx_er0          : out std_logic;                    -- Received control signal to client MAC.
      gmii_isolate0        : out std_logic;                    -- Tristate control to electrically isolate GMII.

      -- Management: MDIO Interface
      -----------------------------
      mdc0                 : in    std_logic;                  -- Management Data Clock
      mdio0_i              : in    std_logic;                  -- Management Data In
      mdio0_o              : out   std_logic;                  -- Management Data Out
      mdio0_t              : out   std_logic;                  -- Management Data Tristate
      phyad0               : in std_logic_vector(4 downto 0);  -- Port address for MDIO.
      configuration_vector0: in std_logic_vector(4 downto 0);  -- Alternative to MDIO interface.
      configuration_valid0 : in std_logic;                     -- Validation signal for Config vector.

      -- General IO's
      ---------------
      link_timer_value0    : in std_logic_vector(8 downto 0);  -- Programmable Auto-Negotiation Link Timer Control
      an_interrupt0        : out std_logic;                    -- Interrupt to processor to signal that Auto-Negotiation has completed
      an_adv_config_vector0: in std_logic_vector(15 downto 0); -- Alternate interface to program REG4 (AN ADV)
      an_adv_config_val0   : in std_logic;                     -- Validation signal for AN ADV
      an_restart_config0   : in std_logic;                     -- Alternate signal to modify AN restart bit in REG0
      status_vector0       : out std_logic_vector(15 downto 0); -- Core status.
      reset0               : in std_logic;                     -- Asynchronous reset for entire core.
      signal_detect0       : in std_logic;                     -- Input from PMD to indicate presence of optical input.

      --------------------------------------------------------------------------
      -- Tranceiver interfaces
      --------------------------------------------------------------------------
      clkin                : in std_logic;                     -- tranceiver 125MHz clock, very high quality.
      userclk2             : in std_logic;                     -- 125MHz reference clock for all core logic..

      txp0                 : out std_logic;                    -- Differential +ve of serial transmission from PMA to PMD.
      txn0                 : out std_logic;                    -- Differential -ve of serial transmission from PMA to PMD.
      rxp0                 : in std_logic;                     -- Differential +ve for serial reception from PMD to PMA.
      rxn0                 : in std_logic;                     -- Differential -ve for serial reception from PMD to PMA.

      txp1                 : out std_logic;                    -- Differential +ve of serial transmission from PMA to PMD.
      txn1                 : out std_logic;                    -- Differential -ve of serial transmission from PMA to PMD.
      rxp1                 : in std_logic;                     -- Differential +ve for serial reception from PMD to PMA.
      rxn1                 : in std_logic                      -- Differential -ve for serial reception from PMD to PMA.
      );

   end component;
	
   -----------------------------------------------------------------------------
   -- Component declaration for the reset synchroniser
   -----------------------------------------------------------------------------
   component pcs_pma_reset_sync
   port (
      reset_in             : in  std_logic;                    -- Active high asynchronous reset
      clk                  : in  std_logic;                    -- clock to be sync'ed to
      reset_out            : out std_logic                     -- "Synchronised" reset signal
   );
   end component;
	
	
	-----------------------------------------------
	-- AXI-lite SM stuff that I have no idea about
	-----------------------------------------------
	
   component tri_mode_eth_mac_v5_5_axi_lite_sm
   generic (
      MAC_BASE_ADDR             : std_logic_vector(31 downto 0) := X"00000000"
   );
   port (
      s_axi_aclk                : in  std_logic;
      s_axi_resetn              : in  std_logic;

      mac_speed                 : in  std_logic_vector(1 downto 0);
      update_speed              : in  std_logic;
      serial_command            : in  std_logic;
      serial_response           : out std_logic;
      phy_loopback              : in  std_logic;

      s_axi_awaddr              : out std_logic_vector(31  downto 0);
      s_axi_awvalid             : out std_logic;
      s_axi_awready             : in  std_logic;

      s_axi_wdata               : out std_logic_vector(31 downto 0);
      s_axi_wvalid              : out std_logic;
      s_axi_wready              : in  std_logic;

      s_axi_bresp               : in  std_logic_vector(1 downto 0);
      s_axi_bvalid              : in  std_logic;
      s_axi_bready              : out std_logic;

      s_axi_araddr              : out std_logic_vector(31 downto 0);
      s_axi_arvalid             : out std_logic;
      s_axi_arready             : in  std_logic;

      s_axi_rdata               : in  std_logic_vector(31 downto 0);
      s_axi_rresp               : in  std_logic_vector(1 downto 0);
      s_axi_rvalid              : in  std_logic;
      s_axi_rready              : out std_logic
   );
   end component;

  ------------------------------------------------------------------------------
  -- Component declaration for the reset synchroniser
  ------------------------------------------------------------------------------
  component tri_mode_eth_mac_v5_5_reset_sync
  port (
     reset_in                   : in  std_logic;    -- Active high asynchronous reset
     enable                     : in  std_logic;
     clk                        : in  std_logic;    -- clock to be sync'ed to
     reset_out                  : out std_logic     -- "Synchronised" reset signal
  );
  end component;
	
  
	
   constant MAC_BASE_ADDR                   :std_logic_vector(31 downto 0) := X"00000000";
	
	-------------------
	--for phy management, mdio stuff between temac and pcs_pma not connected
	------------------
	  type frame_of_mdio is array (natural range 0 to 63) of std_logic;

  constant mdio_data : frame_of_mdio := (
         '1','1','1','1','1','1','1','1', -- preamble field
         '1','1','1','1','1','1','1','1',
             '1','1','1','1','1','1','1','1',
             '1','1','1','1','1','1','1','1',
             '0','1',              -- start opcode
             '0','1',              -- write opcode
             '0','0','1','1','1',  -- phyad (the PHY "broadcast" address: write to any connected device)
             '0','0','0','0','0',  -- regad (write to Configuration Register)
             '1','0',              -- Turn-around cycles
                    -- DATA FIELD

             '0',   -- Do not assert Reset
             '0',   -- No loopback
             '0',   -- Speed selection
             '1',   -- Disable Auto-Negotiation
             '0',   -- Disable Power Down
             '0',   -- Disable Isolate GMII
             '0',   -- Disable Auto-Negotiation Restart
             '1',   -- Full Duplex Mode
             '0',   -- Disable Collision Test
             '0',   -- Speed selection
             '0',   -- Reserved
             '0',
             '0',
             '0',
             '0',
             '0'
           );
	constant mdio_test_data : frame_of_mdio := (
	         '1','1','1','1','1','1','1','1', -- preamble field
         '1','1','1','1','1','1','1','1',
             '1','1','1','1','1','1','1','1',
             '1','1','1','1','1','1','1','1',
             '0','1',              -- start opcode
             '1','0',              -- read opcode
             '0','0','1','1','1',  -- phyad (the PHY "broadcast" address: read)
             '0','0','0','0','1',  -- regad (read from Configuration Register)
             '1','0',              -- Turn-around cycles

             '0','0','0','0','0','0','0','0', -- reading
				 '0','0','0','0','0','0','0','0'
           );
	
TYPE state IS (A, B, C, D);
SIGNAL present_state: state:= A;
SIGNAL count : std_logic_vector(6 downto 0) := "0000000";

signal count0 : std_logic_vector(30 downto 0) := (others => '0');
type state0 is (idle, start, done);
signal current_state0: state0:= idle;


-- Reset
signal glbl_rst_1 : std_logic;
signal glbl_rst_intn : std_logic;
signal gtpreset0_1 : std_logic;
-- CLK
signal gtpclkout_bufio2 : std_logic;
signal gtpclkout_1 : std_logic;
signal clkin : std_logic;
signal userclk2_1 : std_logic;

-- GMII Interface
signal gmii_txd_int : std_logic_vector(7 downto 0);
signal gmii_tx_en_int : std_logic;
signal gmii_tx_er_int : std_logic;
signal gmii_rxd_int : std_logic_vector(7 downto 0);
signal gmii_rx_er_int : std_logic;
signal gmii_rx_dv_int : std_logic;
-- MDIO Interface
signal mdc : std_logic;
signal mdio_i_int : std_logic; -- in of temac to out of pcs_pma
signal mdio_o_int : std_logic; -- out of temac to in of pcs_pma
signal mdio_t_open : std_logic; -- unconnected
signal mdio0_t_open : std_logic; -- unconnected

   -- AXI-Lite interface
	signal s_axi_aclk								  : std_logic;
   signal s_axi_awaddr                      : std_logic_vector(31 downto 0);
   signal s_axi_awvalid                     : std_logic;
   signal s_axi_awready                     : std_logic;
   signal s_axi_wdata                       : std_logic_vector(31 downto 0);
   signal s_axi_wvalid                      : std_logic;
   signal s_axi_wready                      : std_logic;
   signal s_axi_bresp                       : std_logic_vector(1 downto 0);
   signal s_axi_bvalid                      : std_logic;
   signal s_axi_bready                      : std_logic;
   signal s_axi_araddr                      : std_logic_vector(31 downto 0);
   signal s_axi_arvalid                     : std_logic;
   signal s_axi_arready                     : std_logic;
   signal s_axi_rdata                       : std_logic_vector(31 downto 0);
   signal s_axi_rresp                       : std_logic_vector(1 downto 0);
   signal s_axi_rvalid                      : std_logic;
   signal s_axi_rready                      : std_logic;
	
	signal s_axi_resetn							  : std_logic:= '0';
	signal s_axi_pre_resetn						  : std_logic:= '0';
	signal s_axi_reset_int						  : std_logic;
	-- other signals added for axi-lite interface and other logic
	signal enable_phy_loopback					  : std_logic:= '0';
	signal enable_address_swap					  : std_logic:= '1';
	signal gtx_clk_bufg							  : std_logic;
	signal s_axi_aclk_bufio						  : std_logic;
	signal local_chk_reset                   : std_logic;
   signal chk_reset_int                     : std_logic;
   signal chk_pre_resetn                    : std_logic := '0';
   signal chk_resetn                        : std_logic := '0';
   signal local_gtx_reset                   : std_logic;
   signal gtx_clk_reset_int                 : std_logic;
	signal gtx_pre_resetn						  : std_logic;
	signal gtx_resetn								  : std_logic;
	signal rx_reset								  : std_logic;
	signal rx_fifo_clock							  : std_logic;
	signal rx_fifo_resetn						  : std_logic;
--	signal rx_axis_fifo_tdata					  : std_logic_vector(7 downto 0);
--	signal rx_axis_fifo_tvalid					  : std_logic;
--	signal rx_axis_fifo_tlast					  : std_logic;
--	signal rx_axis_fifo_tready					  : std_logic;
	signal tx_reset								  : std_logic;
	signal tx_fifo_clock							  : std_logic;
	signal tx_fifo_resetn                    : std_logic;
--   signal tx_axis_fifo_tdata                : std_logic_vector(7 downto 0);
--   signal tx_axis_fifo_tvalid               : std_logic;
--   signal tx_axis_fifo_tlast                : std_logic;
--   signal tx_axis_fifo_tready               : std_logic;
	signal rx_statistics_valid					  : std_logic;
	signal rx_stats_shift						  : std_logic_vector(29 downto 0);
	signal rx_statistics_valid_reg			  : std_logic;
	signal rx_statistics_vector				  : std_logic_vector(27 downto 0);
	signal tx_statistics_valid					  : std_logic;
	signal tx_stats_shift						  : std_logic_vector(33 downto 0);
	signal tx_statistics_valid_reg			  : std_logic;
	signal tx_statistics_vector				  : std_logic_vector(31 downto 0);
	signal pause_shift							  : std_logic_vector(17 downto 0);
	signal pause_req								  : std_logic;
	signal pause_val								  : std_logic_vector(15 downto 0);
	signal tx_ifg_delay							  : std_logic_vector(7 downto 0):= (others => '0');
	signal gmii_isolate0							  : std_logic;
	
	--hopefully to get rid of PAR error
	signal rxp0_1 : std_logic;
	signal rxn0_1 : std_logic;
	
	-- from other design to try to reset phy
	signal phy_reset_count : std_logic_vector(5 downto 0):= (others => '0');
	signal phy_resetn : std_logic;
	signal phy_reset: std_logic;
	
	signal locked: std_logic;
	signal status_vector0_1: std_logic_vector(15 downto 0);
begin

	---------------------------------
	-- Clock stuff
	---------------------------------
	
	-- input clock to transceiver
	clkingen : IBUFDS
   port map (
      I  => brefclk_p,
      IB => brefclk_n,
      O  => clkin
   );
	
	-- clock from trasceiver for everything else
   bufio2_clk125m : BUFIO2
   generic map (
      DIVIDE        => 1,
      DIVIDE_BYPASS => TRUE
   )
   port map (
      DIVCLK        => gtpclkout_bufio2,
      I             => gtpclkout_1,
      IOCLK         => open,
      SERDESSTROBE  => open
   );


   -- Route through a BUFG
   bufg_clk125m : BUFG
   port map (
      I => gtpclkout_bufio2,
      O => userclk2_1
   );
--
--u_dcm_eth_user_clock : clksrc_onboard
--  port map
--   (-- Clock in ports
--    CLK_IN1_P => board_clkp,
--    CLK_IN1_N => board_clkn,
--    -- Clock out ports
--    CLK_OUT1 => userclk2_1,
--    -- Status and control signals
--    RESET  => '0',
--    LOCKED => LOCKED
--	 );
--userclk2_1<=ext_user_clk;

   ------------------------------------------------------------------------------
   -- Instantiate the TRIMAC core FIFO Block wrapper
   ------------------------------------------------------------------------------
   trimac_fifo_block : tri_mode_eth_mac_v5_5_fifo_block
    generic map(
        C_BASE_ADDRESS              => MAC_BASE_ADDR
    )
    port map (
       gtx_clk                      => userclk2_1,
       -- asynchronous reset
        glbl_rstn                   => glbl_rst_intn,
        rx_axi_rstn                 => '1',
        tx_axi_rstn                 => '1',

       -- Receiver Statistics Interface
       -----------------------------------------
       rx_reset                     => rx_reset,
       rx_statistics_vector         => rx_statistics_vector,
       rx_statistics_valid          => rx_statistics_valid,

       -- Receiver => AXI-S Interface
       ------------------------------------------
       rx_fifo_clock                => rx_fifo_clock,
       rx_fifo_resetn               => rx_fifo_resetn,
       rx_axis_fifo_tdata           => rx_axis_fifo_tdata,
       rx_axis_fifo_tvalid          => rx_axis_fifo_tvalid,
       rx_axis_fifo_tready          => rx_axis_fifo_tready,
       rx_axis_fifo_tlast           => rx_axis_fifo_tlast,
       -- Transmitter Statistics Interface
       --------------------------------------------
       tx_reset                     => tx_reset,
       tx_ifg_delay                 => tx_ifg_delay,
       tx_statistics_vector         => tx_statistics_vector,
       tx_statistics_valid          => tx_statistics_valid,

       -- Transmitter => AXI-S Interface
       ---------------------------------------------
       tx_fifo_clock                => tx_fifo_clock,
       tx_fifo_resetn               => tx_fifo_resetn,
       tx_axis_fifo_tdata           => tx_axis_fifo_tdata,
       tx_axis_fifo_tvalid          => tx_axis_fifo_tvalid,
       tx_axis_fifo_tready          => tx_axis_fifo_tready,
       tx_axis_fifo_tlast           => tx_axis_fifo_tlast,

       -- MAC Control Interface
       --------------------------
       pause_req                    => pause_req,
       pause_val                    => pause_val,

       -- GMII Interface
       -------------------
       gmii_txd                     => gmii_txd_int,
       gmii_tx_en                   => gmii_tx_en_int,
       gmii_tx_er                   => gmii_tx_er_int,
       gmii_rxd                     => gmii_rxd_int,
       gmii_rx_dv                   => gmii_rx_dv_int,
       gmii_rx_er                   => gmii_rx_er_int,
       clk_enable                   => clk_enable,
       speedis100                   => speedis100,
       speedis10100                 => speedis10100,
       -- MDIO Interface
       -------------------
       mdc                          => mdc,
       mdio_i                       => '0', --mdio_o_int, --conneted to mdio_o of pcs_pma (change to '0' if connecting mdio straight to phy)
       mdio_o                       => open, --mdio_i_int, --connected to mdio_i of pcs_pma (change to open if connecting mdio straight to phy)
       mdio_t                       => mdio_t_open, --unconnected

       -- AXI-Lite Interface
       -----------------
       s_axi_aclk                   => s_axi_aclk,
       s_axi_resetn                 => s_axi_resetn,

       s_axi_awaddr                 => s_axi_awaddr,
       s_axi_awvalid                => s_axi_awvalid,
       s_axi_awready                => s_axi_awready,

       s_axi_wdata                  => s_axi_wdata,
       s_axi_wvalid                 => s_axi_wvalid,
       s_axi_wready                 => s_axi_wready,

       s_axi_bresp                  => s_axi_bresp,
       s_axi_bvalid                 => s_axi_bvalid,
       s_axi_bready                 => s_axi_bready,

       s_axi_araddr                 => s_axi_araddr,
       s_axi_arvalid                => s_axi_arvalid,
       s_axi_arready                => s_axi_arready,

       s_axi_rdata                  => s_axi_rdata,
       s_axi_rresp                  => s_axi_rresp,
       s_axi_rvalid                 => s_axi_rvalid,
       s_axi_rready                 => s_axi_rready
   );
	
	  ------------------------------------------------------------------------------
  -- Instantiate the Core Block (core wrapper).
  ------------------------------------------------------------------------------

  core_wrapper : pcs_pma_block
    generic map
    (
      -- Simulation attribute: this setting does not affect the hardware
      -- It is a Smartmodel setting only.  Setting it to 1 reduces the
      -- simulation time required for the GTP to intialise.
      SIM_GTPRESET_SPEEDUP => 1
    )
    port map (

      gtpclkout            => gtpclkout_1,

      gtpreset0            => gtpreset0_1,
      gmii_txd0            => gmii_txd_int,
      gmii_tx_en0          => gmii_tx_en_int,
      gmii_tx_er0          => gmii_tx_er_int,
      gmii_rxd0            => gmii_rxd_int,
      gmii_rx_dv0          => gmii_rx_dv_int,
      gmii_rx_er0          => gmii_rx_er_int,
      gmii_isolate0        => gmii_isolate0,
      mdc0                 => mdc,
      mdio0_i              => mdio_i_int, --connected to mdio_o of temac 
      mdio0_o              => mdio_o_int, --connected to mdio_i of temac
      mdio0_t              => mdio0_t_open, --unconnected
      phyad0               => phyad0,
      configuration_vector0=> configuration_vector0,
      configuration_valid0 => configuration_valid0,
      link_timer_value0    => link_timer_value0,
      an_interrupt0        => an_interrupt0,
      an_adv_config_vector0=> an_adv_config_vector0,
      an_adv_config_val0   => an_adv_config_val0,
      an_restart_config0   => an_restart_config0,
      status_vector0       => status_vector0_1,
      reset0               => phy_reset, --reset0,
      signal_detect0       => signal_detect0,

      clkin                => clkin,
      userclk2             => userclk2_1,

      txp0                 => txp0,
      txn0                 => txn0,
      rxp0                 => rxp0_1,
      rxn0                 => rxn0_1,
      txp1                 => txp1,
      txn1                 => txn1,
      rxp1                 => rxp1,
      rxn1                 => rxn1
      );

	-- added to hopefully fix error
		rxp0_1 <= rxp0;
		rxn0_1 <= rxn0;

   -- tranceiver 0
   gtpreset_gen0 : pcs_pma_reset_sync
   port map(
      clk       => userclk2_1,
      reset_in  => phy_reset, --reset0,
      reset_out => gtpreset0_1
   );

	-- AXI-lite SM stuff
    axi_lite_controller : tri_mode_eth_mac_v5_5_axi_lite_sm
    generic map (
       MAC_BASE_ADDR                => MAC_BASE_ADDR
    )
    port map (
       s_axi_aclk                   => s_axi_aclk,
       s_axi_resetn                 => s_axi_resetn,

       mac_speed                    => mac_speed,
       update_speed                 => update_speed,
       serial_command               => pause_req_s,
       serial_response              => serial_response,
       phy_loopback                 => enable_phy_loopback,

       s_axi_awaddr                 => s_axi_awaddr,
       s_axi_awvalid                => s_axi_awvalid,
       s_axi_awready                => s_axi_awready,

       s_axi_wdata                  => s_axi_wdata,
       s_axi_wvalid                 => s_axi_wvalid,
       s_axi_wready                 => s_axi_wready,

       s_axi_bresp                  => s_axi_bresp,
       s_axi_bvalid                 => s_axi_bvalid,
       s_axi_bready                 => s_axi_bready,

       s_axi_araddr                 => s_axi_araddr,
       s_axi_arvalid                => s_axi_arvalid,
       s_axi_arready                => s_axi_arready,

       s_axi_rdata                  => s_axi_rdata,
       s_axi_rresp                  => s_axi_rresp,
       s_axi_rvalid                 => s_axi_rvalid,
       s_axi_rready                 => s_axi_rready
    );
	

status_vector0 <= status_vector0_1;
an_done <= status_vector0_1(0);

---------------------------------------------------------------------
-- Stuff from TEMAC example design to deal with some of the signals


   capture_board_modea : process (userclk2_1) --(gtx_clk_bufg)
   begin
      if userclk2_1'event and userclk2_1 = '1' then --if gtx_clk_bufg'event and gtx_clk_bufg = '1' then
         if config_board = '1' then
            enable_address_swap  <= gen_tx_data;
         end if;
      end if;
   end process capture_board_modea;

   capture_board_modeb : process (s_axi_aclk)
   begin
      if s_axi_aclk'event and s_axi_aclk = '1' then
         if config_board = '1' then
            enable_phy_loopback  <= chk_tx_data;
         end if;
      end if;
   end process capture_board_modeb;
	

	glbl_rst_intn <= not glbl_rst_1;
	
	------------------------------------------------------------------------------
   -- Transmitter Clock logic for gtx_clk
   ------------------------------------------------------------------------------
--Map error for something here
   -- route gtx_clk through a BUFG and onto global clock routing
--   bufg_gtx_clk : BUFG port map (I => userclk2_1, O => gtx_clk_bufg);

   ------------------------------------------------------------------------------
   -- Generate the s_axi_aclk - we only have one clock source (gtx_clk)
   -- so  it will be derived from that
--   bufio2_axi_clk : BUFIO2 port map(I => userclk2_1, DIVCLK => s_axi_aclk_bufio);
--   bufg_axi_clk : BUFG port map (I => s_axi_aclk_bufio, O => s_axi_aclk);
s_axi_aclk <= userclk2_1;
   -- generate the user side clocks for the axi fifos
   tx_fifo_clock <= userclk2_1; --gtx_clk_bufg;
   rx_fifo_clock <= userclk2_1; --gtx_clk_bufg;
	
	------------------------------------------------------------------------------
   -- Generate resets required for the fifo side signals plus axi_lite logic
   ------------------------------------------------------------------------------
   -- in each case the async reset is first captured and then synchronised

   -----------------
   -- AXI-Lite reset
   axi_lite_reset_gen : tri_mode_eth_mac_v5_5_reset_sync
   port map (
       clk              => s_axi_aclk,
       enable           => '1',
       reset_in         => glbl_rst_1,
       reset_out        => s_axi_reset_int
   );

   -- Create fully synchronous reset in the s_axi clock domain.
   gen_axi_reset : process (s_axi_aclk)
   begin
     if s_axi_aclk'event and s_axi_aclk = '1' then
       if s_axi_reset_int = '1' then
          s_axi_pre_resetn  <= '0';
          s_axi_resetn      <= '0';
       else
          s_axi_pre_resetn  <= '1';
          s_axi_resetn      <= s_axi_pre_resetn;
       end if;
     end if;
   end process gen_axi_reset;

  local_chk_reset <= glbl_rst_1 or reset_error;
  
  -----------------
  -- data check reset
   chk_reset_gen : tri_mode_eth_mac_v5_5_reset_sync
   port map (
       clk              => userclk2_1, --gtx_clk_bufg,
       enable           => '1',
       reset_in         => local_chk_reset,
       reset_out        => chk_reset_int
   );

   -- Create fully synchronous reset in the gtx clock domain.
   gen_chk_reset : process (userclk2_1)--(gtx_clk_bufg)
   begin
     if userclk2_1'event and userclk2_1 = '1' then --if gtx_clk_bufg'event and gtx_clk_bufg = '1' then
       if chk_reset_int = '1' then
         chk_pre_resetn   <= '0';
         chk_resetn       <= '0';
       else
         chk_pre_resetn   <= '1';
         chk_resetn       <= chk_pre_resetn;
       end if;
     end if;
   end process gen_chk_reset;
  local_gtx_reset <= glbl_rst_1 or rx_reset or tx_reset;

  -----------------
  -- gtx_clk reset
   gtx_reset_gen : tri_mode_eth_mac_v5_5_reset_sync
   port map (
       clk              => userclk2_1, --gtx_clk_bufg,
       enable           => '1',
       reset_in         => local_gtx_reset,
       reset_out        => gtx_clk_reset_int
   );
	
	 -- Create fully synchronous reset in the gtx clock domain.
   gen_gtx_reset : process (userclk2_1) --(gtx_clk_bufg)
   begin
     if userclk2_1'event and userclk2_1 = '1' then --if gtx_clk_bufg'event and gtx_clk_bufg = '1' then
       if gtx_clk_reset_int = '1' then
         gtx_pre_resetn   <= '0';
         gtx_resetn       <= '0';
       else
         gtx_pre_resetn   <= '1';
         gtx_resetn       <= gtx_pre_resetn;
       end if;
     end if;
   end process gen_gtx_reset;


   -- generate the user side resets for the axi fifos
   tx_fifo_resetn <= gtx_resetn;
   rx_fifo_resetn <= gtx_resetn;
	
  ------------------------------------------------------------------------------
  -- Serialize the stats vectors
  -- This is a single bit approach, retimed onto gtx_clk
  -- this code is only present to prevent code being stripped..
  ------------------------------------------------------------------------------

  -- RX STATS

   -- when an update is txd load shifter (plus start/stop bit)
   -- shifter always runs (no power concerns as this is an example design)
   gen_shift_rx : process (userclk2_1) --(gtx_clk_bufg)
   begin
      if userclk2_1'event and userclk2_1  = '1' then --if gtx_clk_bufg'event and gtx_clk_bufg = '1' then
         rx_statistics_valid_reg <= rx_statistics_valid;
         if rx_statistics_valid_reg = '0' and rx_statistics_valid = '1' then
            rx_stats_shift <= '1' & rx_statistics_vector & '1';
         else
            rx_stats_shift <= rx_stats_shift(28 downto 0) & '0';
         end if;
      end if;
   end process gen_shift_rx;

   rx_statistics_s <= rx_stats_shift(29);

  -- TX STATS

   -- when an update is txd load shifter (plus start/stop bit)
   -- shifter always runs (no power concerns as this is an example design)
   gen_shift_tx : process (userclk2_1) --(gtx_clk_bufg)
   begin
      if userclk2_1'event and userclk2_1 = '1' then --if gtx_clk_bufg'event and gtx_clk_bufg = '1' then
         tx_statistics_valid_reg <= tx_statistics_valid;
         if tx_statistics_valid_reg = '0' and tx_statistics_valid = '1' then
            tx_stats_shift <= '1' & tx_statistics_vector & '1';
         else
            tx_stats_shift <= tx_stats_shift(32 downto 0) & '0';
         end if;
		end if;
   end process gen_shift_tx;

   tx_statistics_s <= tx_stats_shift(33);


  ------------------------------------------------------------------------------
  -- DESerialize the Pause interface
  -- This is a single bit approachtimed on gtx_clk
  -- this code is only present to prevent code being stripped..
  ------------------------------------------------------------------------------
  -- the serialised pause info has a start bit followed by the quanta and a stop bit
  -- capture the quanta when the start bit hits the msb and the stop bit is in the lsb
   gen_shift_pause : process (userclk2_1) --(gtx_clk_bufg)
   begin
      if userclk2_1'event and userclk2_1 = '1' then --if gtx_clk_bufg'event and gtx_clk_bufg = '1' then
         pause_shift <= pause_shift(16 downto 0) & pause_req_s;
      end if;
   end process gen_shift_pause;

   grab_pause : process (userclk2_1) --(gtx_clk_bufg)
   begin
      if userclk2_1'event and userclk2_1  = '1' then --if gtx_clk_bufg'event and gtx_clk_bufg = '1' then
         if (pause_shift(17) = '1' and pause_shift(0) = '1') then
            pause_req <= '1';
            pause_val <= pause_shift(16 downto 1);
         else
            pause_req <= '0';
            pause_val <= (others => '0');
         end if;
      end if;
   end process grab_pause;
	

--------------------------------------------------------------------------------
-- Stuff added from PCS_PMA example design to deal with some of other signals

-- most/all? GMII register stuff from pcs_pma example design not needed since GMII connected internally


-----------------------------------
-- added from old design to try to reset phy
-----------------------------------

   -----------------
   -- PHY reset
   -- the phy reset output (active low) needs to be held for at least 10x25MHZ cycles
   -- this is derived using the 125MHz available and a 6 bit counter
   gen_phy_reset : process (userclk2_1)
   begin
     if userclk2_1'event and userclk2_1 = '1' then
       if glbl_rst_intn = '0' then
         phy_resetn       <= '0';
         phy_reset_count      <= (others => '0');
       else
          if phy_reset_count /= "111111" then
             phy_reset_count <= std_logic_vector(unsigned(phy_reset_count)+1);
          else
             phy_resetn   <= '1';
          end if;
       end if;
     end if;
   end process gen_phy_reset;
	phy_reset <= not phy_resetn;



---- management data, write to reg0
-- process(mdc, gtpreset0_1)
-- begin
--	if gtpreset0_1 = '1' then
--		present_state <= A;
--		count <= "0000000";
--		mdio_i_int <= '0';
--	else
--		if(falling_edge(mdc)) then
--			case present_state is
--				when A =>
--					mdio_i_int <= '1';
--					if count = "0000101" then
--						present_state <= B;
--					else
--						count <= std_logic_vector(unsigned(count)+1);
--						present_state <= A;
--					end if;
--				when B =>
--					mdio_i_int <= mdio_data(to_integer(unsigned(count)));
--					if count = "0111111" then
--						present_state <= C;
--						count <= "0111111";
--					else
--						count <= std_logic_vector(unsigned(count)+1);
--						present_state <= B;
--					end if;
--				when C =>
--					mdio_i_int <= '1';
--					count <= "0000000";
--					present_state <= C;
--				when others =>
--					mdio_i_int <= '0';
--					count <= "0000000";
--					present_state <= A;
--			end case;
--		end if;
--	end if;
--end process;
 
---- write to reg0 then read from reg1, check if autonegotiation complete
 process(mdc, gtpreset0_1)
 begin
	if gtpreset0_1 = '1' then
		present_state <= A;
		count <= "0000000";
		mdio_i_int <= '0';
	else
		if(falling_edge(mdc)) then
			case present_state is
				when A =>
					mdio_i_int <= '1';
					if count = "0000101" then
						present_state <= B;
					else
						count <= std_logic_vector(unsigned(count)+1);
						present_state <= A;
					end if;
				when B =>
					mdio_i_int <= mdio_data(to_integer(unsigned(count)));
					if count = "0111111" then
						present_state <= C;
						count <= "0000000";
					else
						count <= std_logic_vector(unsigned(count)+1);
						present_state <= B;
					end if;
				when C =>
					mdio_i_int <= '1';
					if count = "0111111" then
						present_state <= D;
						count <= "0000000";
					else
						count <= std_logic_vector(unsigned(count)+1);
						present_state <= C;
					end if;
				when D =>
					mdio_i_int <= mdio_test_data(to_integer(unsigned(count)));
					if count = "0111111" then
						present_state <= C;
						count <= "0000000";
					else
						count <= std_logic_vector(unsigned(count)+1);
						present_state <= D;
					end if;
			end case;
		end if;
	end if;
end process;

 
-- 
--
--
-- reset every so often
--process(userclk2_1)
--begin
--	if(rising_edge(userclk2_1)) then
--	case(current_state0) is
--		when start =>
--			glbl_rst_1 <= '1';
--			if count0 = "0000000000000000000000100000000" then
--				current_state0 <= done;
--			else
--				current_state0 <= start;
--			end if;
--		when done =>
--			glbl_rst_1 <= '0';
--			if count0 = "0000011111111111111111111111111" then
--				current_state0 <= start;
--			else
--				current_state0 <= done;
--			end if;
--	end case;
--		count0 <= std_logic_vector(unsigned(count0)+1);
--	end if;
--end process;
--
-- just reset once
process(userclk2_1)
begin
	if(rising_edge(userclk2_1)) then
	case(current_state0) is
		when idle =>
			glbl_rst_1 <= '0';
			if count0 = "1111111111111111111111011111111" then
				current_state0 <= start;
			else
				current_state0 <= idle;
			end if;
		when start =>
			glbl_rst_1 <= '1';
			if count0 = "1111111111111111111111111111111" then -- "100000000"
				current_state0 <= done;
			else
				current_state0 <= start;
			end if;
		when done =>
				glbl_rst_1 <= '0';
	end case;
	count0 <= std_logic_vector(unsigned(count0)+1);
	end if;
end process;

axi_tclk <= s_axi_aclk;
axi_tresetn <= s_axi_resetn;

end Behavioral;

