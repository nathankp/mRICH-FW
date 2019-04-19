--------------------------------------------------------------------------------
-- File       : tri_mode_eth_mac_v5_5_block.vhd
-- Author     : Xilinx Inc.
-- -----------------------------------------------------------------------------
-- (c) Copyright 2004-2009 Xilinx, Inc. All rights reserved.
--
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
--
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
--
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
--
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES. 
-- -----------------------------------------------------------------------------
-- Description: This is the block level VHDL design for the Tri-Mode
--              Ethernet MAC Example Design.
--
--              This block level:
--
--              * instantiates all clock enable logic required to operate the
--                TEMAC and its example design;
--
--              * instantiates the statistics counter decode logic for all user definable
--                counters
--
--              * instantiates the axi4_lite_ipif module to convert to the core IPIC
--                interface
--
--              * instantiates appropriate PHY interface module (GMII/MII/RGMII)
--                as required based on the user configuration;
--
--              Please refer to the Datasheet, Getting Started Guide, and
--              the Tri-Mode Ethernet MAC User Gude for further information.
--
--
--              -----------------------------------------|
--              | BLOCK LEVEL WRAPPER                    |
--              |                                        |
--              |      --------------                    |
--              |      |  STATS     |                    |
--              |      |    DECODE  |                    |
--              |      |            |                    |
--              |      --------------                    |
--              |        |        |                      |
--              |    ---------------------               |
--              |    | ETHERNET MAC      |               |
--              |    | CORE              |               |
--              |    |                   |               |
--            --|--->| Tx            Tx  |-------------->|
--              |    | AXI           PHY |               |
--              |    | I/F           I/F |               |
--              |    |                   |               |
--              |    |                   |               |
--              |    |                   |               |
--              |    | Rx            Rx  |               |
--              |    | AXI           PHY |               |
--            <-|----| I/F           I/F |<--------------|
--              |    |                   |               |
--              |    ---------------------               |
--              |                                        |
--              |     clock enable logic                 |
--              |                                        |
--              -----------------------------------------|
--


library unisim;
use unisim.vcomponents.all;

library ieee;
use ieee.std_logic_1164.all;


--------------------------------------------------------------------------------
-- The entity declaration for the block level example design.
--------------------------------------------------------------------------------

entity tri_mode_eth_mac_v5_5_block is
   generic (
      C_BASE_ADDRESS             : std_logic_vector(31 downto 0) := X"00000000"
   );
   port(
      gtx_clk                    : in  std_logic;
      -- asynchronous reset
      glbl_rstn                  : in  std_logic;
      rx_axi_rstn                : in  std_logic;
      tx_axi_rstn                : in  std_logic;

      -- Receiver Interface
      ----------------------------
      rx_statistics_vector       : out std_logic_vector(27 downto 0);
      rx_statistics_valid        : out std_logic;

      rx_reset                   : out std_logic;
      rx_axis_mac_tdata          : out std_logic_vector(7 downto 0);
      rx_axis_mac_tvalid         : out std_logic;
      rx_axis_mac_tlast          : out std_logic;
      rx_axis_mac_tuser          : out std_logic;

      -- Transmitter Interface
      -------------------------------
      tx_ifg_delay               : in  std_logic_vector(7 downto 0);
      tx_statistics_vector       : out std_logic_vector(31 downto 0);
      tx_statistics_valid        : out std_logic;

      tx_reset                   : out std_logic;
      tx_axis_mac_tdata          : in  std_logic_vector(7 downto 0);
      tx_axis_mac_tvalid         : in  std_logic;
      tx_axis_mac_tlast          : in  std_logic;
      tx_axis_mac_tuser          : in  std_logic;
      tx_axis_mac_tready         : out std_logic;
      -- MAC Control Interface
      ------------------------
      pause_req                  : in  std_logic;
      pause_val                  : in  std_logic_vector(15 downto 0);

      clk_enable                 : in  std_logic;
      speedis100                 : out std_logic;
      speedis10100               : out std_logic;
      -- GMII Interface
      -----------------
      gmii_txd                   : out std_logic_vector(7 downto 0);
      gmii_tx_en                 : out std_logic;
      gmii_tx_er                 : out std_logic;
      gmii_rxd                   : in  std_logic_vector(7 downto 0);
      gmii_rx_dv                 : in  std_logic;
      gmii_rx_er                 : in  std_logic;

      -- MDIO Interface
      -----------------
      mdio_i                     : in  std_logic;
      mdio_o                     : out std_logic;
      mdio_t                     : out std_logic;
      mdc                        : out std_logic;

      -- AXI-Lite Interface
      -----------------
      s_axi_aclk                 : in  std_logic;
      s_axi_resetn               : in  std_logic;

      s_axi_awaddr               : in  std_logic_vector(31 downto 0);
      s_axi_awvalid              : in  std_logic;
      s_axi_awready              : out std_logic;

      s_axi_wdata                : in  std_logic_vector(31 downto 0);
      s_axi_wvalid               : in  std_logic;
      s_axi_wready               : out std_logic;

      s_axi_bresp                : out std_logic_vector(1 downto 0);
      s_axi_bvalid               : out std_logic;
      s_axi_bready               : in  std_logic;

      s_axi_araddr               : in  std_logic_vector(31 downto 0);
      s_axi_arvalid              : in  std_logic;
      s_axi_arready              : out std_logic;

      s_axi_rdata                : out std_logic_vector(31 downto 0);
      s_axi_rresp                : out std_logic_vector(1 downto 0);
      s_axi_rvalid               : out std_logic;
      s_axi_rready               : in  std_logic
   );
end tri_mode_eth_mac_v5_5_block;


architecture wrapper of tri_mode_eth_mac_v5_5_block is


   -----------------------------------------------------------------------------
   -- Component Declaration for TEMAC (the Tri-Mode EMAC core).
   -----------------------------------------------------------------------------
   component tri_mode_eth_mac_v5_5
    port(
      glbl_rstn                   : in  std_logic;
      rx_axi_rstn                 : in  std_logic;
      tx_axi_rstn                 : in  std_logic;

      -- Receiver Interface
      ----------------------------
      rx_axi_clk                  : in std_logic;
      rx_reset_out                : out std_logic;
      rx_axis_mac_tdata           : out std_logic_vector(7 downto 0);
      rx_axis_mac_tvalid          : out std_logic;
      rx_axis_mac_tlast           : out std_logic;
      rx_axis_mac_tuser           : out std_logic;

      rx_enable                   : in  std_logic;
      rx_axis_filter_tuser        : out std_logic_vector(4 downto 0);
      rx_statistics_vector        : out std_logic_vector(27 downto 0);
      rx_statistics_valid         : out std_logic;

      -- Transmitter Interface
      -------------------------------
      tx_axi_clk                  : in std_logic;
      tx_reset_out                : out std_logic;
      tx_axis_mac_tdata           : in  std_logic_vector(7 downto 0);
      tx_axis_mac_tvalid          : in  std_logic;
      tx_axis_mac_tlast           : in  std_logic;
      tx_axis_mac_tuser           : in  std_logic_vector(0 downto 0);
      tx_axis_mac_tready          : out std_logic;

      tx_ifg_delay                : in  std_logic_vector(7 downto 0);
      tx_enable                   : in  std_logic;
      tx_statistics_vector        : out std_logic_vector(31 downto 0);
      tx_statistics_valid         : out std_logic;

      --  Statistics
      --------------------------------
      stats_ref_clk               : in  std_logic;
      increment_vector            : in  std_logic_vector(4 to 33);

      -- MAC Control Interface
      ------------------------
      pause_req                   : in  std_logic;
      pause_val                   : in  std_logic_vector(15 downto 0);

      -- Current Speed Indication
      ---------------------------
      speed_is_100                : out std_logic;
      speed_is_10_100             : out std_logic;

      -- Physical Interface of the core
      --------------------------------
      gmii_txd                    : out std_logic_vector(7 downto 0);
      gmii_tx_en                  : out std_logic;
      gmii_tx_er                  : out std_logic;
      gmii_rxd                    : in  std_logic_vector(7 downto 0);
      gmii_rx_dv                  : in  std_logic;
      gmii_rx_er                  : in  std_logic;

      -- MDIO Interface
      -----------------
      mdc_out                     : out   std_logic;
      mdio_in                     : in    std_logic;
      mdio_out                    : out   std_logic;
      mdio_tri                    : out   std_logic;

      -- IPIC Interface
      -----------------
      bus2ip_clk                  : in    std_logic;
      bus2ip_reset                : in    std_logic;
      bus2ip_addr                 : in    std_logic_vector(31 downto 0);
      bus2ip_cs                   : in    std_logic;
      bus2ip_rdce                 : in    std_logic;
      bus2ip_wrce                 : in    std_logic;
      bus2ip_data                 : in    std_logic_vector(31 downto 0);
      ip2bus_data                 : out   std_logic_vector(31 downto 0);
      ip2bus_wrack                : out   std_logic;
      ip2bus_rdack                : out   std_logic;
      ip2bus_error                : out   std_logic;

      mac_irq                     : out std_logic
   );
   end component;


   -----------------------------------------------------------------------------
   -- Component declaration for the AXI-Lite to IPIF conversion module
   -----------------------------------------------------------------------------
   component tri_mode_eth_mac_v5_5_axi4_lite_ipif_wrapper is
    generic (
      C_BASE_ADDRESS        : std_logic_vector(31 downto 0) := X"00000000";
      C_ADDR_RANGE_SIZE     : std_logic_vector(31 downto 0) := X"000007FF"
      );
    port (

        --System signals
      S_AXI_ACLK            : in  std_logic;
      S_AXI_ARESETN         : in  std_logic;
      S_AXI_AWADDR          : in  std_logic_vector(31 downto 0);
      S_AXI_AWVALID         : in  std_logic;
      S_AXI_AWREADY         : out std_logic;
      S_AXI_WDATA           : in  std_logic_vector(31 downto 0);
      S_AXI_WVALID          : in  std_logic;
      S_AXI_WREADY          : out std_logic;
      S_AXI_BRESP           : out std_logic_vector(1 downto 0);
      S_AXI_BVALID          : out std_logic;
      S_AXI_BREADY          : in  std_logic;
      S_AXI_ARADDR          : in  std_logic_vector(31 downto 0);
      S_AXI_ARVALID         : in  std_logic;
      S_AXI_ARREADY         : out std_logic;
      S_AXI_RDATA           : out std_logic_vector(31 downto 0);
      S_AXI_RRESP           : out std_logic_vector(1 downto 0);
      S_AXI_RVALID          : out std_logic;
      S_AXI_RREADY          : in  std_logic;
      -- Controls to the IP/IPIF modules
      Bus2IP_Clk            : out std_logic;
      Bus2IP_Reset          : out std_logic;
      Bus2IP_Addr           : out std_logic_vector(31 downto 0);
      Bus2IP_CS             : out std_logic;
      Bus2IP_RdCE           : out std_logic;
      Bus2IP_WrCE           : out std_logic;
      Bus2IP_Data           : out std_logic_vector(31 downto 0);
      IP2Bus_Data           : in  std_logic_vector(31 downto 0);
      IP2Bus_WrAck          : in  std_logic;
      IP2Bus_RdAck          : in  std_logic;
      IP2Bus_Error          : in  std_logic

       );
  end component;

   -----------------------------------------------------------------------------
   -- Component declaration for statistics vector decode module
   -----------------------------------------------------------------------------
  component tri_mode_eth_mac_v5_5_vector_decode is
   port (

      -- Transmitter Statistic Vector inputs from ethernet MAC
      tx_clk                           : in std_logic;
      tx_reset                         : in std_logic;
      tx_statistics_vector             : in std_logic_vector(31 downto 0);
      tx_statistics_valid              : in std_logic;

      -- Receiver Statistic Vector inputs from ethernet MAC
      rx_clk                           : in std_logic;
      rx_reset                         : in std_logic;
      rx_statistics_vector             : in std_logic_vector(27 downto 0);
      rx_statistics_valid              : in std_logic;

      -- Increment update signals for Statistic Counters 4 upwards
      increment_vector                 : out std_logic_vector(4 to 33)

   );
  end component;

  ------------------------------------------------------------------------------
  -- Component declaration for the synchronisation flip-flop pair
  ------------------------------------------------------------------------------
  component tri_mode_eth_mac_v5_5_sync_block
  port (
    clk                    : in  std_logic;    -- clock to be sync'ed to
    data_in                : in  std_logic;    -- Data to be 'synced'
    data_out               : out std_logic     -- synced data
    );
  end component;


  ------------------------------------------------------------------------------
  -- Component declaration for the reset synchroniser
  ------------------------------------------------------------------------------
  component tri_mode_eth_mac_v5_5_reset_sync
  port (
    reset_in               : in  std_logic;    -- Active high asynchronous reset
    enable                 : in  std_logic;
    clk                    : in  std_logic;    -- clock to be sync'ed to
    reset_out              : out std_logic     -- "Synchronised" reset signal
    );
  end component;


  ------------------------------------------------------------------------------
  -- internal signals used in this block level wrapper.
  ------------------------------------------------------------------------------

  attribute keep : string;

  signal glbl_rst                : std_logic;
  signal gmii_tx_en_int          : std_logic;                     -- Internal gmii_tx_en signal.
  signal gmii_tx_er_int          : std_logic;                     -- Internal gmii_tx_er signal.
  signal gmii_txd_int            : std_logic_vector(7 downto 0);  -- Internal gmii_txd signal.
  signal gmii_rx_dv_int          : std_logic;                     -- gmii_rx_dv registered in IOBs.
  signal gmii_rx_er_int          : std_logic;                     -- gmii_rx_er registered in IOBs.
  signal gmii_rxd_int            : std_logic_vector(7 downto 0);  -- gmii_rxd registered in IOBs.


  signal txspeedis10100          : std_logic;                     -- MAC speed setting resampled on the transmitter clock
  signal rxspeedis10100          : std_logic;                     -- MAC speed setting resampled on the receiver clock


  signal tx_reset_int            : std_logic;                     -- Synchronous reset in the MAC and rgmii Tx domain
  signal rx_reset_int            : std_logic;                     -- Synchronous reset in the MAC and rgmii Rx domain


  signal rx_statistics_vector_int : std_logic_vector(27 downto 0);
  signal rx_statistics_valid_int  : std_logic;
  signal tx_statistics_vector_int : std_logic_vector(31 downto 0);
  signal tx_statistics_valid_int  : std_logic;
  signal increment_vector         : std_logic_vector(4 to 33);

  signal bus2ip_clk                 : std_logic;
  signal bus2ip_reset               : std_logic;

  signal bus2ip_addr                : std_logic_vector(31 downto 0);
  signal bus2ip_cs                  : std_logic;
  signal bus2ip_rdce                : std_logic;
  signal bus2ip_wrce                : std_logic;
  signal bus2ip_data                : std_logic_vector(31 downto 0);
  signal ip2bus_data                : std_logic_vector(31 downto 0);
  signal ip2bus_wrack               : std_logic;
  signal ip2bus_rdack               : std_logic;
  signal ip2bus_error               : std_logic;
  signal tx_axis_mac_tuser_int      : std_logic_vector(0 downto 0);

begin

   -- assign outputs
   rx_reset <= rx_reset_int;
   tx_reset <= tx_reset_int;

   glbl_rst <= not glbl_rstn;


   -----------------------------------------------------------------------------
   -- Instantiate the axi_ipif block
   -----------------------------------------------------------------------------
   axi4_lite_ipif : tri_mode_eth_mac_v5_5_axi4_lite_ipif_wrapper
   generic map (
      C_BASE_ADDRESS    => C_BASE_ADDRESS
   )
   port map (
      -- System signals
      S_AXI_ACLK        => s_axi_aclk,
      S_AXI_ARESETN     => s_axi_resetn,
      S_AXI_AWADDR      => s_axi_awaddr,
      S_AXI_AWVALID     => s_axi_awvalid,
      S_AXI_AWREADY     => s_axi_awready,
      S_AXI_WDATA       => s_axi_wdata,
      S_AXI_WVALID      => s_axi_wvalid,
      S_AXI_WREADY      => s_axi_wready,
      S_AXI_BRESP       => s_axi_bresp,
      S_AXI_BVALID      => s_axi_bvalid,
      S_AXI_BREADY      => s_axi_bready,
      S_AXI_ARADDR      => s_axi_araddr,
      S_AXI_ARVALID     => s_axi_arvalid,
      S_AXI_ARREADY     => s_axi_arready,
      S_AXI_RDATA       => s_axi_rdata,
      S_AXI_RRESP       => s_axi_rresp,
      S_AXI_RVALID      => s_axi_rvalid,
      S_AXI_RREADY      => s_axi_rready,
      -- Controls to the IPIf
      Bus2IP_Clk        => bus2ip_clk,
      Bus2IP_Reset      => bus2ip_reset,
      Bus2IP_Addr       => bus2ip_addr,
      Bus2IP_CS         => bus2ip_cs,
      Bus2IP_RdCE       => bus2ip_rdce,
      Bus2IP_WrCE       => bus2ip_wrce,
      Bus2IP_Data       => bus2ip_data,
      IP2Bus_Data       => ip2bus_data,
      IP2Bus_WrAck      => ip2bus_wrack,
      IP2Bus_RdAck      => ip2bus_rdack,
      IP2Bus_Error      => ip2bus_error
   );


   -----------------------------------------------------------------------------
   -- Instantiate the vector decode block to define the statistic counters
   -----------------------------------------------------------------------------
   vector_decode_inst : tri_mode_eth_mac_v5_5_vector_decode
   port map (
      -- Transmitter Statistic Vector inputs from ethernet MAC
      tx_clk               => gtx_clk,
      tx_reset             => tx_reset_int,
      tx_statistics_vector => tx_statistics_vector_int,
      tx_statistics_valid  => tx_statistics_valid_int,

      -- Receiver Statistic Vector inputs from ethernet MAC
      rx_clk               => gtx_clk,
      rx_reset             => rx_reset_int,
      rx_statistics_vector => rx_statistics_vector_int,
      rx_statistics_valid  => rx_statistics_valid_int,

      -- Increment update signals for Statistic Counters 4 upwards
      increment_vector     => increment_vector
   );


   rx_statistics_vector <= rx_statistics_vector_int;
   rx_statistics_valid  <= rx_statistics_valid_int;
   tx_statistics_vector <= tx_statistics_vector_int;
   tx_statistics_valid  <= tx_statistics_valid_int;

   gmii_tx_en           <= gmii_tx_en_int;
   gmii_tx_er           <= gmii_tx_er_int;
   gmii_txd             <= gmii_txd_int;
   gmii_rx_dv_int       <= gmii_rx_dv;
   gmii_rx_er_int       <= gmii_rx_er;
   gmii_rxd_int         <= gmii_rxd;



   -----------------------------------------------------------------------------
   -- Instantiate the TEMAC core
   -----------------------------------------------------------------------------
   trimac_core : tri_mode_eth_mac_v5_5
   port map (
      -- asynchronous reset
      glbl_rstn               => glbl_rstn,
      rx_axi_rstn             => rx_axi_rstn,
      tx_axi_rstn             => tx_axi_rstn,

      -- Receiver Interface
      rx_axi_clk              => gtx_clk,
      rx_reset_out            => rx_reset_int,
      rx_axis_mac_tdata       => rx_axis_mac_tdata,
      rx_axis_mac_tvalid      => rx_axis_mac_tvalid,
      rx_axis_mac_tlast       => rx_axis_mac_tlast,
      rx_axis_mac_tuser       => rx_axis_mac_tuser,
      rx_enable               => clk_enable,
      rx_axis_filter_tuser    => open,
      -- Receiver Statistics
      rx_statistics_vector    => rx_statistics_vector_int,
      rx_statistics_valid     => rx_statistics_valid_int,

      -- Transmitter Interface
      tx_axi_clk              => gtx_clk,
      tx_reset_out            => tx_reset_int,
      tx_axis_mac_tdata       => tx_axis_mac_tdata,
      tx_axis_mac_tvalid      => tx_axis_mac_tvalid,
      tx_axis_mac_tlast       => tx_axis_mac_tlast,
      tx_axis_mac_tuser       => tx_axis_mac_tuser_int,
      tx_axis_mac_tready      => tx_axis_mac_tready,

      tx_ifg_delay            => tx_ifg_delay,
      tx_enable               => clk_enable,
      -- Transmitter Statistics
      tx_statistics_vector    => tx_statistics_vector_int,
      tx_statistics_valid     => tx_statistics_valid_int,

      -- Statistics Interface
      stats_ref_clk           => gtx_clk,
      increment_vector        => increment_vector,

      -- MAC Control Interface
      pause_req               => pause_req,
      pause_val               => pause_val,

      -- Current Speed Indication
      speed_is_100              => speedis100,
      speed_is_10_100           => speedis10100,

      -- Physical Interface of the core
      gmii_txd                => gmii_txd_int,
      gmii_tx_en              => gmii_tx_en_int,
      gmii_tx_er              => gmii_tx_er_int,
      gmii_rxd                => gmii_rxd_int,
      gmii_rx_dv              => gmii_rx_dv_int,
      gmii_rx_er              => gmii_rx_er_int,

      -- MDIO Interface
      mdc_out                 => mdc,
      mdio_in                 => mdio_i,
      mdio_out                => mdio_o,
      mdio_tri                => mdio_t,

      -- IPIC Interface
      bus2ip_clk              => bus2ip_clk,
      bus2ip_reset            => bus2ip_reset,
      bus2ip_addr             => bus2ip_addr,
      bus2ip_cs               => bus2ip_cs,
      bus2ip_rdce             => bus2ip_rdce,
      bus2ip_wrce             => bus2ip_wrce,
      bus2ip_data             => bus2ip_data,
      ip2bus_data             => ip2bus_data,
      ip2bus_wrack            => ip2bus_wrack,
      ip2bus_rdack            => ip2bus_rdack,
      ip2bus_error            => ip2bus_error,

      mac_irq                 => open

      );

	
   tx_axis_mac_tuser_int(0) <= tx_axis_mac_tuser;
  
  
end wrapper;
