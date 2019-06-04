--------------------------------------------------------------------------------
-- File       : pcs_pma_block.vhd
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
-- Description: This Core Block Level wrapper connects the core to a
--              Spartan-6 tranceiver.
--
--              All of the clock circuitry required for a single
--              instance of the core is included.
--
--
--   ------------------------------------------------------------
--   |                                                          |
--   |        ------------------          -----------------     |
--   |        |      Core      |          |   tranceiver  |     |
--   |        |                |          |               |     |
--   |        |                |          |               |     |
--   |        |                |          |               |     |
-- ---------->| GMII           |--------->|           TXP |-------->
--   |        | Tx          Tx |          |           TXN |     |
--   |        |                |          |               |     |
--   |        |                |tranceiver|               |     |
--   |        |                |    I/F   |               |     |
--   |        |                |          |               |     |
--   |        |                |          |               |     |
--   |        | GMII           |          |           RXP |     |
-- <----------| Rx          Rx |<---------|           RXN |<--------
--   |        |                |          |               |     |
--   |        ------------------          -----------------     |
--   |                                                          |
--   ------------------------------------------------------------
--
--


library unisim;
use unisim.vcomponents.all;

library ieee;
use ieee.std_logic_1164.all;


--------------------------------------------------------------------------------
-- The entity declaration for the Core Block Level wrapper.
--------------------------------------------------------------------------------

entity pcs_pma_block is
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
end pcs_pma_block;



architecture block_level of pcs_pma_block is



   -----------------------------------------------------------------------------
   -- Component Declaration for the Transceiver wrapper
   -----------------------------------------------------------------------------

   component pcs_pma_transceiver_A
   generic (
      -- Set to 1 to Speed up the GTP simulation
      SIM_GTPRESET_SPEEDUP : integer   := 0
   );
   port (
      gtpclkout            : out std_logic;
      gtpclkin             : in  std_logic;

      gtpreset0            : in  std_logic;
      plllkdet0            : out std_logic;
      resetdone0           : out std_logic;
      enablealign0         : in  std_logic;
      powerdown0           : in  std_logic;
      loopback0            : in  std_logic;
      rxchariscomma0       : out std_logic;
      rxcharisk0           : out std_logic;
      rxclkcorcnt0         : out std_logic_vector (2 downto 0);
      rxdata0              : out std_logic_vector (7 downto 0);
      rxdisperr0           : out std_logic;
      rxnotintable0        : out std_logic;
      rxrundisp0           : out std_logic;
      rxbuferr0            : out std_logic;
      rxusrclk0            : in  std_logic;
      rxusrclk20           : in  std_logic;
      rxreset0             : in  std_logic;
      txchardispmode0      : in  std_logic;
      txchardispval0       : in  std_logic;
      txcharisk0           : in  std_logic;
      txdata0              : in  std_logic_vector (7 downto 0);
      txbuferr0            : out std_logic;
      txusrclk0            : in  std_logic;
      txusrclk20           : in  std_logic;
      txreset0             : in  std_logic;

      txn0                 : out std_logic;
      txp0                 : out std_logic;
      rxn0                 : in  std_logic;
      rxp0                 : in  std_logic;

      txn1                 : out std_logic;
      txp1                 : out std_logic;
      rxn1                 : in  std_logic;
      rxp1                 : in  std_logic;

      clkin                : in  std_logic
          );
   end component;



   -----------------------------------------------------------------------------
   -- Component Declaration for the 1000BASE-X PCS/PMA sublayer core.
   -----------------------------------------------------------------------------
   component pcs_pma
      port(

      -- Core <=> Tranceiver Interface
      --------------------------------

      mgt_rx_reset         : out std_logic;                    -- tranceiver connection: reset for the receiver half of the tranceiver
      mgt_tx_reset         : out std_logic;                    -- tranceiver connection: reset for the transmitter half of the tranceiver
      userclk              : in std_logic;                     -- Routed to TXUSERCLK and RXUSERCLK of Transceiver.
      userclk2             : in std_logic;                     -- Routed to TXUSERCLK2 and RXUSERCLK2 of Transceiver.
      dcm_locked           : in std_logic;                     -- LOCKED signal from DCM.

      rxbufstatus          : in std_logic_vector (1 downto 0); -- Transceiver connection: Elastic Buffer Status.
      rxchariscomma        : in std_logic_vector (0 downto 0); -- Transceiver connection: Comma detected in RXDATA.
      rxcharisk            : in std_logic_vector (0 downto 0); -- Transceiver connection: K character received (or extra data bit) in RXDATA.
      rxclkcorcnt          : in std_logic_vector (2 downto 0); -- Transceiver connection: Indicates clock correction.
      rxdata               : in std_logic_vector (7 downto 0); -- Transceiver connection: Data after 8B/10B decoding.
      rxdisperr            : in std_logic_vector (0 downto 0); -- Transceiver connection: Disparity-error in RXDATA.
      rxnotintable         : in std_logic_vector (0 downto 0); -- Transceiver connection: Non-existent 8B/10 code indicated.
      rxrundisp            : in std_logic_vector (0 downto 0); -- Transceiver connection: Running Disparity of RXDATA (or extra data bit).
      txbuferr             : in std_logic;                     -- Transceiver connection: TX Buffer error (overflow or underflow).

      powerdown            : out std_logic;                    -- tranceiver connection: Powerdown the tranceiver
      txchardispmode       : out std_logic;                    -- tranceiver connection: Set running disparity for current byte.
      txchardispval        : out std_logic;                    -- tranceiver connection: Set running disparity value.
      txcharisk            : out std_logic;                    -- tranceiver connection: K character transmitted in TXDATA.
      txdata               : out std_logic_vector(7 downto 0); -- tranceiver connection: Data for 8B/10B encoding.
      enablealign          : out std_logic;                    -- Allow the transceivers to serially realign to a comma character.

      -- GMII Interface
      -----------------

      gmii_txd             : in std_logic_vector(7 downto 0);  -- Transmit data from client MAC.
      gmii_tx_en           : in std_logic;                     -- Transmit control signal from client MAC.
      gmii_tx_er           : in std_logic;                     -- Transmit control signal from client MAC.
      gmii_rxd             : out std_logic_vector(7 downto 0); -- Received Data to client MAC.
      gmii_rx_dv           : out std_logic;                    -- Received control signal to client MAC.
      gmii_rx_er           : out std_logic;                    -- Received control signal to client MAC.
      gmii_isolate         : out std_logic;                    -- Tristate control to electrically isolate GMII.

      -- Management: MDIO Interface
      -----------------------------

      mdc                  : in    std_logic;                  -- Management Data Clock
      mdio_in              : in    std_logic;                  -- Management Data In
      mdio_out             : out   std_logic;                  -- Management Data Out
      mdio_tri             : out   std_logic;                  -- Management Data Tristate
      phyad                : in std_logic_vector(4 downto 0);  -- Port address to for MDIO to recognise.
      configuration_vector : in std_logic_vector(4 downto 0);  -- Alternative to MDIO interface.
      configuration_valid  : in std_logic;                     -- Validation signal for Config vector.

      -- General IO's
      ----------------

      link_timer_value     : in std_logic_vector(8 downto 0);  -- Programmable Auto-Negotiation Link Timer Control
      an_interrupt         : out std_logic;                    -- Interrupt to processor to signal that Auto-Negotiation has completed
      an_adv_config_vector : in std_logic_vector(15 downto 0); -- Alternate interface to program REG4 (AN ADV)
      an_adv_config_val    : in std_logic;                     -- Validation signal for AN ADV
      an_restart_config    : in std_logic;                     -- Alternate signal to modify AN restart bit in REG0
      status_vector        : out std_logic_vector(15 downto 0); -- Core status.
      reset                : in std_logic;                     -- Asynchronous reset for entire core.
      signal_detect        : in std_logic                      -- Input from PMD to indicate presence of optical input.
      );

   end component;



  ------------------------------------------------------------------------------
  -- internal signals used in this Block level wrapper.
  ------------------------------------------------------------------------------

  -- Core <=> tranceiver (GTP0) interconnect
  signal plllkdet0         : std_logic;                        -- GTP0 PLL Lock indication
  signal mgt_rx_reset0     : std_logic;                        -- Reset for the receiver half of the tranceiver
  signal mgt_tx_reset0     : std_logic;                        -- Reset for the transmitter half of the tranceiver
  signal rxbufstatus0      : std_logic_vector (1 downto 0);    -- Elastic Buffer Status (bit 1 asserted indicates overflow or underflow).
  signal rxchariscomma0    : std_logic_vector (0 downto 0);    -- Comma detected in RXDATA.
  signal rxcharisk0        : std_logic_vector (0 downto 0);    -- K character received (or extra data bit) in RXDATA.
  signal rxclkcorcnt0      : std_logic_vector (2 downto 0);    -- Indicates clock correction.
  signal rxdata0           : std_logic_vector (7 downto 0);    -- Data after 8B/10B decoding.
  signal rxdisperr0        : std_logic_vector (0 downto 0);    -- Disparity-error in RXDATA.
  signal rxnotintable0     : std_logic_vector (0 downto 0);    -- Non-existent 8B/10 code indicated.
  signal rxrundisp0        : std_logic_vector (0 downto 0);    -- Running Disparity after current byte, becomes 9th data bit when RXNOTINTABLE='1'.
  signal txbuferr0         : std_logic;                        -- TX Buffer error (overflow or underflow).
  signal powerdown0        : std_logic;                        -- Powerdown the tranceiver
  signal txchardispmode0   : std_logic;                        -- Set running disparity for current byte.
  signal txchardispval0    : std_logic;                        -- Set running disparity value.
  signal txcharisk0        : std_logic;                        -- K character transmitted in TXDATA.
  signal txdata0           : std_logic_vector(7 downto 0);     -- Data for 8B/10B encoding.
  signal enablealign0      : std_logic;                        -- Allow the transceivers to serially realign to a comma character.

  signal loopback          : std_logic;                        -- Set the tranceiver for loopback.


begin



  ------------------------------------------------------------------------------
  -- Instantiate the core connected to GTP0
  ------------------------------------------------------------------------------

  gig_eth_pcs_pma_core_0 : pcs_pma
    port map (
      mgt_rx_reset         => mgt_rx_reset0,
      mgt_tx_reset         => mgt_tx_reset0,
      userclk              => userclk2,
      userclk2             => userclk2,
      dcm_locked           => plllkdet0,
      rxbufstatus          => rxbufstatus0,
      rxchariscomma        => rxchariscomma0,
      rxcharisk            => rxcharisk0,
      rxclkcorcnt          => rxclkcorcnt0,
      rxdata               => rxdata0,
      rxdisperr            => rxdisperr0,
      rxnotintable         => rxnotintable0,
      rxrundisp            => rxrundisp0,
      txbuferr             => txbuferr0,
      powerdown            => powerdown0,
      txchardispmode       => txchardispmode0,
      txchardispval        => txchardispval0,
      txcharisk            => txcharisk0,
      txdata               => txdata0,
      enablealign          => enablealign0,
      gmii_txd             => gmii_txd0,
      gmii_tx_en           => gmii_tx_en0,
      gmii_tx_er           => gmii_tx_er0,
      gmii_rxd             => gmii_rxd0,
      gmii_rx_dv           => gmii_rx_dv0,
      gmii_rx_er           => gmii_rx_er0,
      gmii_isolate         => gmii_isolate0,
      mdc                  => mdc0,
      mdio_in              => mdio0_i,
      mdio_out             => mdio0_o,
      mdio_tri             => mdio0_t,
      phyad                => phyad0,
      configuration_vector => configuration_vector0,
      configuration_valid  => configuration_valid0,
      link_timer_value     => link_timer_value0,
      an_interrupt         => an_interrupt0,
      an_adv_config_vector => an_adv_config_vector0,
      an_adv_config_val    => an_adv_config_val0,
      an_restart_config    => an_restart_config0,
      status_vector        => status_vector0,
      reset                => reset0,
      signal_detect        => signal_detect0

      );

   rxbufstatus0(0) <= '0';



   -----------------------------------------------------------------------------
   -- Component Instantiation for the Spartan-6 Transceiver wrapper
   -----------------------------------------------------------------------------


   transceiver_inst : pcs_pma_transceiver_A
   generic map
   (
      -- Simulation attribute
      SIM_GTPRESET_SPEEDUP => SIM_GTPRESET_SPEEDUP
   )
   port map (
      gtpclkout            => gtpclkout,
      gtpclkin             => userclk2,

      -- tranceiver 0
      gtpreset0            => gtpreset0,
      plllkdet0            => plllkdet0,
      resetdone0           => open,
      enablealign0         => enablealign0,
      powerdown0           => powerdown0,
      loopback0            => loopback,
      rxchariscomma0       => rxchariscomma0(0),
      rxcharisk0           => rxcharisk0(0),
      rxclkcorcnt0         => rxclkcorcnt0,
      rxdata0              => rxdata0,
      rxdisperr0           => rxdisperr0(0),
      rxnotintable0        => rxnotintable0(0),
      rxrundisp0           => rxrundisp0(0),
      rxbuferr0            => rxbufstatus0(1),
      rxusrclk0            => userclk2,
      rxusrclk20           => userclk2,
      rxreset0             => mgt_rx_reset0,
      txchardispmode0      => txchardispmode0,
      txchardispval0       => txchardispval0,
      txcharisk0           => txcharisk0,
      txdata0              => txdata0,
      txbuferr0            => txbuferr0,
      txusrclk0            => userclk2,
      txusrclk20           => userclk2,
      txreset0             => mgt_tx_reset0,


      txn0                 => txn0,
      txp0                 => txp0,
      rxn0                 => rxn0,
      rxp0                 => rxp0,

      txn1                 => txn1,
      txp1                 => txp1,
      rxn1                 => rxn1,
      rxp1                 => rxp1,

      clkin                => clkin
   );


   -- Loopback is performed in the core itself.  To alternatively use
   -- tranceiver loopback, please drive this port appropriately.
   loopback <= '0';



end block_level;

