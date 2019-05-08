--------------------------------------------------------------------------------
--    This file is owned and controlled by Xilinx and must be used solely     --
--    for design, simulation, implementation and creation of design files     --
--    limited to Xilinx devices or technologies. Use with non-Xilinx          --
--    devices or technologies is expressly prohibited and immediately         --
--    terminates your license.                                                --
--                                                                            --
--    XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY    --
--    FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY    --
--    PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE             --
--    IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS      --
--    MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY      --
--    CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY       --
--    RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY       --
--    DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE   --
--    IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR          --
--    REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF         --
--    INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A   --
--    PARTICULAR PURPOSE.                                                     --
--                                                                            --
--    Xilinx products are not intended for use in life support appliances,    --
--    devices, or systems.  Use in such applications are expressly            --
--    prohibited.                                                             --
--                                                                            --
--    (c) Copyright 1995-2018 Xilinx, Inc.                                    --
--    All rights reserved.                                                    --
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--    Generated from core with identifier:                                    --
--    xilinx.com:ip:tri_mode_eth_mac:5.5                                      --
--                                                                            --
--    Rev 1. The TEMAC LogiCORE(TM) is designed to the IEEE 802.3-2008        --
--    standard specification and supports full and half duplex operation at   --
--    10Mbps, 100Mbps and 1Gbps speeds. In addition, it provides support      --
--    for VLAN and JUMBO frames, as well as network management options such   --
--    as statistics gathering and flow control. The core can be configured    --
--    and monitored through an AXI interface, providing users with the        --
--    flexibility to select the processor best suited to their specific       --
--    application.  The standalone core provides either a Gigabit Media       --
--    Independent Interface (GMII) or a Reduced Gigabit Media Independent     --
--    Interface (RGMII), both of which can carry ethernet traffic at all      --
--    three speeds and are suitable for connection to all industry standard   --
--    PHYs of all media types.  In addition, the core seemlessly interfaces   --
--    to the Ethernet 1000BASE-X PCS/PMA or SGMII LogiCORE which can          --
--    provide a Serial-GMII (SGMII) or can alternatively extend the           --
--    functionality of the core to provide a 1000BASE-X PCS/PMA (1Gb/s        --
--    Optical PHY Standard) creating a complete GigE MAC core solution.       --
--------------------------------------------------------------------------------

-- Interfaces:
--    AXI4Stream_MASTER_rx_axis_filter
--        RX filter control
--    AXI4Stream_MASTER_tx_axis_mac
--        TX data output
--    AXI4Stream_MASTER_rx_axis_mac
--        RX data output
--    axi4stream_slave_tx_axis_av
--        AVB AV data input
--    axi4stream_master_rx_axis_ts
--        Rx Timestamp data output
--    axi4stream_master_tx_axis_ts
--        Tx Timestamp data output
--    axi4stream_master_rx_axis_av
--        AVB AV data output

-- The following code must appear in the VHDL architecture header:

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT tri_mode_eth_mac_v5_5
  PORT (
    glbl_rstn : IN STD_LOGIC;
    rx_axi_rstn : IN STD_LOGIC;
    tx_axi_rstn : IN STD_LOGIC;
    rx_axi_clk : IN STD_LOGIC;
    rx_reset_out : OUT STD_LOGIC;
    rx_axis_mac_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    rx_axis_mac_tvalid : OUT STD_LOGIC;
    rx_axis_mac_tlast : OUT STD_LOGIC;
    rx_axis_mac_tuser : OUT STD_LOGIC;
    rx_statistics_vector : OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
    rx_statistics_valid : OUT STD_LOGIC;
    rx_enable : IN STD_LOGIC;
    rx_axis_filter_tuser : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    tx_axi_clk : IN STD_LOGIC;
    tx_reset_out : OUT STD_LOGIC;
    tx_axis_mac_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    tx_axis_mac_tvalid : IN STD_LOGIC;
    tx_axis_mac_tlast : IN STD_LOGIC;
    tx_axis_mac_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    tx_axis_mac_tready : OUT STD_LOGIC;
    tx_enable : IN STD_LOGIC;
    tx_ifg_delay : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    tx_statistics_vector : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    tx_statistics_valid : OUT STD_LOGIC;
    stats_ref_clk : IN STD_LOGIC;
    increment_vector : IN STD_LOGIC_VECTOR(4 TO 33);
    pause_req : IN STD_LOGIC;
    pause_val : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    speed_is_100 : OUT STD_LOGIC;
    speed_is_10_100 : OUT STD_LOGIC;
    gmii_txd : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    gmii_tx_en : OUT STD_LOGIC;
    gmii_tx_er : OUT STD_LOGIC;
    gmii_rxd : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    gmii_rx_dv : IN STD_LOGIC;
    gmii_rx_er : IN STD_LOGIC;
    mdc_out : OUT STD_LOGIC;
    mdio_in : IN STD_LOGIC;
    mdio_out : OUT STD_LOGIC;
    mdio_tri : OUT STD_LOGIC;
    bus2ip_clk : IN STD_LOGIC;
    bus2ip_reset : IN STD_LOGIC;
    bus2ip_addr : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    bus2ip_cs : IN STD_LOGIC;
    bus2ip_rdce : IN STD_LOGIC;
    bus2ip_wrce : IN STD_LOGIC;
    bus2ip_data : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ip2bus_data : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    ip2bus_wrack : OUT STD_LOGIC;
    ip2bus_rdack : OUT STD_LOGIC;
    ip2bus_error : OUT STD_LOGIC;
    mac_irq : OUT STD_LOGIC
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : tri_mode_eth_mac_v5_5
  PORT MAP (
    glbl_rstn => glbl_rstn,
    rx_axi_rstn => rx_axi_rstn,
    tx_axi_rstn => tx_axi_rstn,
    rx_axi_clk => rx_axi_clk,
    rx_reset_out => rx_reset_out,
    rx_axis_mac_tdata => rx_axis_mac_tdata,
    rx_axis_mac_tvalid => rx_axis_mac_tvalid,
    rx_axis_mac_tlast => rx_axis_mac_tlast,
    rx_axis_mac_tuser => rx_axis_mac_tuser,
    rx_statistics_vector => rx_statistics_vector,
    rx_statistics_valid => rx_statistics_valid,
    rx_enable => rx_enable,
    rx_axis_filter_tuser => rx_axis_filter_tuser,
    tx_axi_clk => tx_axi_clk,
    tx_reset_out => tx_reset_out,
    tx_axis_mac_tdata => tx_axis_mac_tdata,
    tx_axis_mac_tvalid => tx_axis_mac_tvalid,
    tx_axis_mac_tlast => tx_axis_mac_tlast,
    tx_axis_mac_tuser => tx_axis_mac_tuser,
    tx_axis_mac_tready => tx_axis_mac_tready,
    tx_enable => tx_enable,
    tx_ifg_delay => tx_ifg_delay,
    tx_statistics_vector => tx_statistics_vector,
    tx_statistics_valid => tx_statistics_valid,
    stats_ref_clk => stats_ref_clk,
    increment_vector => increment_vector,
    pause_req => pause_req,
    pause_val => pause_val,
    speed_is_100 => speed_is_100,
    speed_is_10_100 => speed_is_10_100,
    gmii_txd => gmii_txd,
    gmii_tx_en => gmii_tx_en,
    gmii_tx_er => gmii_tx_er,
    gmii_rxd => gmii_rxd,
    gmii_rx_dv => gmii_rx_dv,
    gmii_rx_er => gmii_rx_er,
    mdc_out => mdc_out,
    mdio_in => mdio_in,
    mdio_out => mdio_out,
    mdio_tri => mdio_tri,
    bus2ip_clk => bus2ip_clk,
    bus2ip_reset => bus2ip_reset,
    bus2ip_addr => bus2ip_addr,
    bus2ip_cs => bus2ip_cs,
    bus2ip_rdce => bus2ip_rdce,
    bus2ip_wrce => bus2ip_wrce,
    bus2ip_data => bus2ip_data,
    ip2bus_data => ip2bus_data,
    ip2bus_wrack => ip2bus_wrack,
    ip2bus_rdack => ip2bus_rdack,
    ip2bus_error => ip2bus_error,
    mac_irq => mac_irq
  );
-- INST_TAG_END ------ End INSTANTIATION Template ------------

-- You must compile the wrapper file tri_mode_eth_mac_v5_5.vhd when simulating
-- the core, tri_mode_eth_mac_v5_5. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

