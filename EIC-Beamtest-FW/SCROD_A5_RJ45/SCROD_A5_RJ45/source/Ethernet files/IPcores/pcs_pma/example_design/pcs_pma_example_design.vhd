--------------------------------------------------------------------------------
-- File       : pcs_pma_example_design.vhd
-- Author     : Xilinx Inc.
--------------------------------------------------------------------------------
-- (c) Copyright 2009 Xilinx, Inc. All rights reserved.
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
-- 
-- 
--------------------------------------------------------------------------------
-- Description: This is the top level vhdl example design for the
--              Ethernet 1000BASE-X PCS/PMA core.
--
--              This design example instantiates IOB flip-flops
--              on the GMII.
--
--              A Transmitter Elastic Buffer is instantiated on the Tx
--              GMII path to perform clock compenstation between the
--              core and the external MAC driving the Tx GMII.
--
--              This design example can be synthesised.
--
--
--
--    ----------------------------------------------------------------
--    |                             Example Design                   |
--    |                                                              |
--    |             ----------------------------------------------   |
--    |             |           Core Block (wrapper)             |   |
--    |             |                                            |   |
--    |             |   --------------          --------------   |   |
--    |             |   |    Core    |          | tranceiver |   |   |
--    |             |   |            |          |            |   |   |
--    |  ---------  |   |            |          |            |   |   |
--    |  |       |  |   |            |          |            |   |   |
--    |  |  Tx   |  |   |            |          |            |   |   |
--  ---->|Elastic|----->| GMII       |--------->|        TXP |--------->
--    |  |Buffer |  |   | Tx         |          |        TXN |   |   |
--    |  |       |  |   |            |          |            |   |   |
--    |  ---------  |   |            |tranceiver|            |   |   |
--    | GMII        |   |            |    I/F   |            |   |   |
--    | IOBs        |   |            |          |            |   |   |
--    |             |   |            |          |            |   |   |
--    |             |   | GMII       |          |        RXP |   |   |
--  <-------------------| Rx         |<---------|        RXN |<---------
--    |             |   |            |          |            |   |   |
--    |             |   --------------          --------------   |   |
--    |             |                                            |   |
--    |             ----------------------------------------------   |
--    |                                                              |
--    ----------------------------------------------------------------
--
--


library unisim;
use unisim.vcomponents.all;

library ieee;
use ieee.std_logic_1164.all;


--------------------------------------------------------------------------------
-- The entity declaration for the example design
--------------------------------------------------------------------------------

entity pcs_pma_example_design is
      port(

      --------------------------------------------------------------------------
      -- Core connected to GTP0
      --------------------------------------------------------------------------

      -- GMII Interface
      -----------------
      gmii_tx_clk0         : in std_logic;                     -- Transmit clock from client MAC.
      gmii_rx_clk0         : out std_logic;                    -- Receive clock to client MAC.
      gmii_txd0            : in std_logic_vector(7 downto 0);  -- Transmit data from client MAC.
      gmii_tx_en0          : in std_logic;                     -- Transmit control signal from client MAC.
      gmii_tx_er0          : in std_logic;                     -- Transmit control signal from client MAC.
      gmii_rxd0            : out std_logic_vector(7 downto 0); -- Received Data to client MAC.
      gmii_rx_dv0          : out std_logic;                    -- Received control signal to client MAC.
      gmii_rx_er0          : out std_logic;                    -- Received control signal to client MAC.

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

      brefclk_p            : in std_logic;                     -- Differential +ve of reference clock for tranceiver: 125MHz, very high quality
      brefclk_n            : in std_logic;                     -- Differential -ve of reference clock for tranceiver: 125MHz, very high quality

      txp0                 : out std_logic;                    -- Differential +ve of serial transmission from PMA to PMD.
      txn0                 : out std_logic;                    -- Differential -ve of serial transmission from PMA to PMD.
      rxp0                 : in std_logic;                     -- Differential +ve for serial reception from PMD to PMA.
      rxn0                 : in std_logic;                     -- Differential -ve for serial reception from PMD to PMA.

      txp1                 : out std_logic;                    -- Differential +ve of serial transmission from PMA to PMD.
      txn1                 : out std_logic;                    -- Differential -ve of serial transmission from PMA to PMD.
      rxp1                 : in std_logic;                     -- Differential +ve for serial reception from PMD to PMA.
      rxn1                 : in std_logic                      -- Differential -ve for serial reception from PMD to PMA.

   );
end pcs_pma_example_design;



architecture top_level of pcs_pma_example_design is



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
   -- Component Declaration for the Transmitter Elastic Buffer
   -----------------------------------------------------------------------------
   component pcs_pma_tx_elastic_buffer
   port (

      reset                : in std_logic;                     -- Asynchronous Reset.

      -- Signals received from the input gmii_tx_clk_wr domain.
      ---------------------------------------------------------

      gmii_tx_clk_wr       : in std_logic;                     -- Write clock domain.
      gmii_txd_wr          : in std_logic_vector(7 downto 0);  -- gmii_txd synchronous to gmii_tx_clk_wr.
      gmii_tx_en_wr        : in std_logic;                     -- gmii_tx_en synchronous to gmii_tx_clk_wr.
      gmii_tx_er_wr        : in std_logic;                     -- gmii_tx_er synchronous to gmii_tx_clk_wr.

      -- Signals transfered onto the new gmii_tx_clk_rd domain.
      ---------------------------------------------------------

      gmii_tx_clk_rd       : in std_logic;                     -- Read clock domain.
      gmii_txd_rd          : out std_logic_vector(7 downto 0); -- gmii_txd synchronous to gmii_tx_clk_rd.
      gmii_tx_en_rd        : out std_logic;                    -- gmii_tx_en synchronous to gmii_tx_clk_rd.
      gmii_tx_er_rd        : out std_logic                     -- gmii_tx_er synchronous to gmii_tx_clk_rd.
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


  ------------------------------------------------------------------------------
  -- internal signals used in this top level example design.
  ------------------------------------------------------------------------------

  -- clock/reset generation signals
  signal clkin             : std_logic;                        -- tranceiver 125MHz clock, very high quality.
  signal userclk2          : std_logic;                        -- Routed to TXUSERCLK2 and RXUSERCLK2 of tranceiver.
  signal not_userclk2      : std_logic;                        -- Inverted form of userclk2.
  signal gtpclkout         : std_logic;                        -- tranceiver output clock made available to the FPGA fabric.
  signal gtpclkout_bufio2  : std_logic;                        -- gtpclkout is routed through a BUFIO2 clock buffer

  -- GMII signals for the core connected to GTP0
  signal gtpreset0         : std_logic;                        -- System reset for tranceiver.
  signal gmii_tx_clk_bufio0: std_logic;                        -- gmii_tx_clk routed through an BUFIO.
  signal gmii_tx_clk_bufg0 : std_logic;                        -- gmii_tx_clk_ibuf routed through a BUFR
  signal gmii_txd_delay0   : std_logic_vector(7 downto 0);     -- Internal gmii_txd signal after IDELAY.
  signal gmii_tx_en_delay0 : std_logic;                        -- Internal gmii_tx_en signal after IDELAY.
  signal gmii_tx_er_delay0 : std_logic;                        -- Internal gmii_tx_er signal after IDELAY.
  signal gmii_isolate0     : std_logic;                        -- Internal gmii_isolate signal.
  signal gmii_txd_iff0     : std_logic_vector(7 downto 0);     -- gmii_txd signal for input IOB flip-flop.
  signal gmii_tx_en_iff0   : std_logic;                        -- gmii_tx_en signal for input IOB flip-flop.
  signal gmii_tx_er_iff0   : std_logic;                        -- gmii_tx_er signal for input IOB flip-flop.
  signal gmii_txd_reg0     : std_logic_vector(7 downto 0);     -- gmii_txd signal reclocked onto regional routing.
  signal gmii_tx_en_reg0   : std_logic;                        -- gmii_tx_en signal reclocked onto regional routing.
  signal gmii_tx_er_reg0   : std_logic;                        -- gmii_tx_er signal reclocked onto regional routing.
  signal gmii_txd_fifo0    : std_logic_vector(7 downto 0);     -- gmii_txd signal after Tx Elastic Buffer.
  signal gmii_tx_en_fifo0  : std_logic;                        -- gmii_tx_en signal after Tx Elastic Buffer.
  signal gmii_tx_er_fifo0  : std_logic;                        -- gmii_tx_er signal after Tx Elastic Buffer.
  signal gmii_rxd_int0     : std_logic_vector(7 downto 0);     -- Internal gmii_rxd signal.
  signal gmii_rx_dv_int0   : std_logic;                        -- Internal gmii_rx_dv signal.
  signal gmii_rx_er_int0   : std_logic;                        -- Internal gmii_rx_er signal.
  signal gmii_rx_clk_obuf0 : std_logic;                        -- gmii_rx_clk registered in IOBs prior to an OBUF.
  signal gmii_rxd_obuf0    : std_logic_vector(7 downto 0);     -- gmii_rxd registered in IOBs prior to an OBUF.
  signal gmii_rx_dv_obuf0  : std_logic;                        -- gmii_rx_dv registered in IOBs prior to an OBUF.
  signal gmii_rx_er_obuf0  : std_logic;                        -- gmii_rx_er registered in IOBs prior to an OBUF.



begin


   -----------------------------------------------------------------------------
   -- Spartan-6 Transceiver Clock Management
   -----------------------------------------------------------------------------

   -- NOTE: BREFCLK circuitry for the Transceiver requires the use of a
   -- 125MHz differential input clock.  clkin is routed to the tranceiver
   -- pair.

   clkingen : IBUFDS
   port map (
      I  => brefclk_p,
      IB => brefclk_n,
      O  => clkin
   );


   -- gtpclkout (125MHz) is made avaiable by the tranceiver to the FPGA
   -- fabric. This is routed to a BUFIO2 before being placed onto global clock
   -- routing where it is then used for tranceiver TXUSRCLK2/RXUSRCLK2 and used
   -- to clock all Ethernet core logic.

   bufio2_clk125m : BUFIO2
   generic map (
      DIVIDE        => 1,
      DIVIDE_BYPASS => TRUE
   )
   port map (
      DIVCLK        => gtpclkout_bufio2,
      I             => gtpclkout,
      IOCLK         => open,
      SERDESSTROBE  => open
   );


   -- Route through a BUFG
   bufg_clk125m : BUFG
   port map (
      I => gtpclkout_bufio2,
      O => userclk2
   );


   -- An inverted version of userclk2 is created.
   invert_userclk2 : INV 
   port map (
      I  => userclk2,
      O  => not_userclk2
   );


   -----------------------------------------------------------------------------
   -- Spartan-6 Transceiver System Reset
   -----------------------------------------------------------------------------

   -- tranceiver 0
   gtpreset_gen0 : pcs_pma_reset_sync
   port map(
      clk       => userclk2,
      reset_in  => reset0,
      reset_out => gtpreset0
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

      gtpclkout            => gtpclkout,

      gtpreset0            => gtpreset0,
      gmii_txd0            => gmii_txd_fifo0,
      gmii_tx_en0          => gmii_tx_en_fifo0,
      gmii_tx_er0          => gmii_tx_er_fifo0,
      gmii_rxd0            => gmii_rxd_int0,
      gmii_rx_dv0          => gmii_rx_dv_int0,
      gmii_rx_er0          => gmii_rx_er_int0,
      gmii_isolate0        => gmii_isolate0,
      mdc0                 => mdc0,
      mdio0_i              => mdio0_i,
      mdio0_o              => mdio0_o,
      mdio0_t              => mdio0_t,
      phyad0               => phyad0,
      configuration_vector0=> configuration_vector0,
      configuration_valid0 => configuration_valid0,
      link_timer_value0    => link_timer_value0,
      an_interrupt0        => an_interrupt0,
      an_adv_config_vector0=> an_adv_config_vector0,
      an_adv_config_val0   => an_adv_config_val0,
      an_restart_config0   => an_restart_config0,
      status_vector0       => status_vector0,
      reset0               => reset0,
      signal_detect0       => signal_detect0,

      clkin                => clkin,
      userclk2             => userclk2,

      txp0                 => txp0,
      txn0                 => txn0,
      rxp0                 => rxp0,
      rxn0                 => rxn0,
      txp1                 => txp1,
      txn1                 => txn1,
      rxp1                 => rxp1,
      rxn1                 => rxn1

      );



   -----------------------------------------------------------------------------
   -- GMII logic for the core connected to GTP0
   -----------------------------------------------------------------------------


   -- GMII transmitter clock logic
   -------------------------------

   -- Route gmii_tx_clk from PAD through a BUFIO2 Buffer
   receive_gmii_tx_clk0 : BUFIO2
   port map (
      DIVCLK       => open,
      I            => gmii_tx_clk0,
      IOCLK        => gmii_tx_clk_bufio0,
      SERDESSTROBE => open
   );


   -- Route gmii_tx_clk through a BUFG onto global clock routing
   drive_tx_clk0 : BUFG
   port map (
      I   => gmii_tx_clk0,
      O   => gmii_tx_clk_bufg0
   );



   -- GMII transmitter data logic
   ------------------------------

   -- An IODELAY2 is used with Spartan-6 devices to meet the GMII input
   -- setup and hold specifications. The data is delayed so to compensate for
   -- the clock routing delay so that the GMII input data will be correctly
   -- sampled at the IOB flip-flops

   -- Please modify the value of the IODELAY2 according to your design.
   -- The value in this file will be overridden with the value in the
   -- UCF.  For more information, please refer to the User Guide.

   -- The tap delay values can also be adjusted to compensate for PCB routing
   -- deskew.

   -- IODELAY2 for GMII_TXD
   gmii_data_bus0: for I in 7 downto 0 generate
   begin
     delay_gmii_txd0 : IODELAY2
     generic map (
        IDELAY_TYPE  => "FIXED",
        DATA_RATE    => "SDR",
        DELAY_SRC    => "IDATAIN"
     )
     port map (
        BUSY         => open,
        DATAOUT      => gmii_txd_delay0(I),
        DATAOUT2     => open,
        DOUT         => open,
        TOUT         => open,
        CAL          => '0',
        CE           => '0',
        CLK          => '0',
        IDATAIN      => gmii_txd0(I),
        INC          => '0',
        IOCLK0       => '0',
        IOCLK1       => '0',
        ODATAIN      => '0',
        RST          => '0',
        T            => '1'
     );
   end generate;


   -- IODELAY2 for GMII_TX_EN
   delay_gmii_tx_en0 : IODELAY2
   generic map (
      IDELAY_TYPE  => "FIXED",
      DATA_RATE    => "SDR",
      DELAY_SRC    => "IDATAIN"
   )
   port map (
      BUSY         => open,
      DATAOUT      => gmii_tx_en_delay0,
      DATAOUT2     => open,
      DOUT         => open,
      TOUT         => open,
      CAL          => '0',
      CE           => '0',
      CLK          => '0',
      IDATAIN      => gmii_tx_en0,
      INC          => '0',
      IOCLK0       => '0',
      IOCLK1       => '0',
      ODATAIN      => '0',
      RST          => '0',
      T            => '1'
   );


   -- IODELAY2 for GMII_TX_ER
   delay_gmii_tx_er0 : IODELAY2
   generic map (
      IDELAY_TYPE  => "FIXED",
      DATA_RATE    => "SDR",
      DELAY_SRC    => "IDATAIN"
   )
   port map (
      BUSY         => open,
      DATAOUT      => gmii_tx_er_delay0,
      DATAOUT2     => open,
      DOUT         => open,
      TOUT         => open,
      CAL          => '0',
      CE           => '0',
      CLK          => '0',
      IDATAIN      => gmii_tx_er0,
      INC          => '0',
      IOCLK0       => '0',
      IOCLK1       => '0',
      ODATAIN      => '0',
      RST          => '0',
      T            => '1'
   );


   -- Drive input GMII signals through IOB input flip-flops (inferred).
   process (gmii_tx_clk_bufio0)
   begin
      if gmii_tx_clk_bufio0'event and gmii_tx_clk_bufio0 = '1' then
         gmii_txd_iff0    <= gmii_txd_delay0;
         gmii_tx_en_iff0  <= gmii_tx_en_delay0;
         gmii_tx_er_iff0  <= gmii_tx_er_delay0;

      end if;
   end process;


   -- Reclock onto regional clock routing.
   process (gmii_tx_clk_bufg0)
   begin
      if gmii_tx_clk_bufg0'event and gmii_tx_clk_bufg0 = '1' then
         gmii_txd_reg0    <= gmii_txd_iff0;
         gmii_tx_en_reg0  <= gmii_tx_en_iff0;
         gmii_tx_er_reg0  <= gmii_tx_er_iff0;

      end if;
   end process;


   -- Component Instantiation for the Transmitter Elastic Buffer
   tx_elastic_buffer_inst0 : pcs_pma_tx_elastic_buffer
   port map (
      reset            => reset0,
      gmii_tx_clk_wr   => gmii_tx_clk_bufg0,
      gmii_txd_wr      => gmii_txd_reg0,
      gmii_tx_en_wr    => gmii_tx_en_reg0,
      gmii_tx_er_wr    => gmii_tx_er_reg0,
      gmii_tx_clk_rd   => userclk2,
      gmii_txd_rd      => gmii_txd_fifo0,
      gmii_tx_en_rd    => gmii_tx_en_fifo0,
      gmii_tx_er_rd    => gmii_tx_er_fifo0
   );



   -- GMII receiver clock logic
   ----------------------------

   -- This instantiates a DDR output register.  This is a nice way to
   -- drive the GMII output clock since the clock-to-PAD delay will the
   -- same as that of data driven from an IOB Ouput flip-flop.  This is
   -- set to produce an inverted clock w.r.t. userclk2 so that clock
   -- rising edge appears in the centre of GMII data.
   rx_clk_ddr_iob0 : ODDR2
   port map(
      Q  => gmii_rx_clk0,
      C0 => userclk2,
      C1 => not_userclk2,
      CE => '1',
      D0 => '0',
      D1 => '1',
      R  => '0',
      S  => '0'
   );



   -- GMII receiver data logic
   ---------------------------

   -- Drive Rx GMII signals through IOB output flip-flops (inferred).
   process (userclk2)
   begin
      if userclk2'event and userclk2 = '1' then
         gmii_rxd_obuf0    <= gmii_rxd_int0;
         gmii_rx_dv_obuf0  <= gmii_rx_dv_int0;
         gmii_rx_er_obuf0  <= gmii_rx_er_int0;

      end if;
   end process;


   --  drive GMII Rx signals through output PADS.
   rx_data_valid0 : OBUFT
   port map (
      I => gmii_rx_dv_obuf0,
      O => gmii_rx_dv0,
      T => gmii_isolate0
   );

   rx_data_error0 : OBUFT
   port map (
      I => gmii_rx_er_obuf0,
      O => gmii_rx_er0,
      T => gmii_isolate0
   );

   rx_data_bus0 : for I in 7 downto 0 generate
      rx_data_bits : OBUFT
      port map (
         I => gmii_rxd_obuf0(I),
         O => gmii_rxd0(I),
         T => gmii_isolate0
      );
   end generate;



end top_level;
