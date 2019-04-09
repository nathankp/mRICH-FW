--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: pcs_pma.vhd
-- /___/   /\     Timestamp: Thu Mar 07 11:17:41 2019
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -w -sim -ofmt vhdl "C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_A5_RJ45/source/Ethernet files/IPcores/tmp/_cg/pcs_pma.ngc" "C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_A5_RJ45/source/Ethernet files/IPcores/tmp/_cg/pcs_pma.vhd" 
-- Device	: 6slx150tfgg676-3
-- Input file	: C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_A5_RJ45/source/Ethernet files/IPcores/tmp/_cg/pcs_pma.ngc
-- Output file	: C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_A5_RJ45/source/Ethernet files/IPcores/tmp/_cg/pcs_pma.vhd
-- # of Entities	: 1
-- Design Name	: pcs_pma
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------


-- synthesis translate_off
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity pcs_pma is
  port (
    reset : in STD_LOGIC := 'X'; 
    signal_detect : in STD_LOGIC := 'X'; 
    userclk : in STD_LOGIC := 'X'; 
    userclk2 : in STD_LOGIC := 'X'; 
    dcm_locked : in STD_LOGIC := 'X'; 
    txbuferr : in STD_LOGIC := 'X'; 
    gmii_tx_en : in STD_LOGIC := 'X'; 
    gmii_tx_er : in STD_LOGIC := 'X'; 
    an_adv_config_val : in STD_LOGIC := 'X'; 
    an_restart_config : in STD_LOGIC := 'X'; 
    mdc : in STD_LOGIC := 'X'; 
    mdio_in : in STD_LOGIC := 'X'; 
    configuration_valid : in STD_LOGIC := 'X'; 
    mgt_rx_reset : out STD_LOGIC; 
    mgt_tx_reset : out STD_LOGIC; 
    powerdown : out STD_LOGIC; 
    txchardispmode : out STD_LOGIC; 
    txchardispval : out STD_LOGIC; 
    txcharisk : out STD_LOGIC; 
    enablealign : out STD_LOGIC; 
    gmii_rx_dv : out STD_LOGIC; 
    gmii_rx_er : out STD_LOGIC; 
    gmii_isolate : out STD_LOGIC; 
    an_interrupt : out STD_LOGIC; 
    mdio_out : out STD_LOGIC; 
    mdio_tri : out STD_LOGIC; 
    link_timer_value : in STD_LOGIC_VECTOR ( 8 downto 0 ); 
    rxbufstatus : in STD_LOGIC_VECTOR ( 1 downto 0 ); 
    rxchariscomma : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    rxcharisk : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    rxclkcorcnt : in STD_LOGIC_VECTOR ( 2 downto 0 ); 
    rxdata : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
    rxdisperr : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    rxnotintable : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    rxrundisp : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    gmii_txd : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
    an_adv_config_vector : in STD_LOGIC_VECTOR ( 15 downto 0 ); 
    phyad : in STD_LOGIC_VECTOR ( 4 downto 0 ); 
    configuration_vector : in STD_LOGIC_VECTOR ( 4 downto 0 ); 
    txdata : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    gmii_rxd : out STD_LOGIC_VECTOR ( 7 downto 0 ); 
    status_vector : out STD_LOGIC_VECTOR ( 15 downto 0 ) 
  );
end pcs_pma;

architecture STRUCTURE of pcs_pma is
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_9 : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_8 : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT : STD_LOGIC; 
  signal U0_gpcs_pma_inst_STATUS_VECTOR_12_81 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXNOTINTABLE_REG_82 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDISPERR_REG_83 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RUDI_INVALID_84 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RUDI_I_85 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RUDI_C_86 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_STATUS_VECTOR_1_87 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_STATUS_VECTOR_0_88 : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_POWERDOWN_REG : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXCHARDISPMODE_92 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXCHARDISPVAL_93 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXCHARISK_94 : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_RECEIVER_RX_DV : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_ER_97 : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_INT : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_OUT_100 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_TRI_101 : STD_LOGIC; 
  signal NlwRenamedSig_OI_N0 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_103 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_104 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_105 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_106 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_110 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_111 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_112 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_113 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNC_SIGNAL_DETECT_data_sync1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SRESET_PIPE_PWR_15_o_MUX_1_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_211_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_210_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXCHARDISPVAL_INT_GND_15_o_MUX_573_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXCHARDISPMODE_INT_TXEVEN_MUX_572_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXCHARISK_INT_TXEVEN_MUX_571_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_3_GND_15_o_Mux_8_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_3_GND_15_o_Mux_4_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXBUFERR_INT_134 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXNOTINTABLE_INT_139 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDISPERR_INT_140 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCHARISK_INT_149 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCHARISCOMMA_INT_150 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SRESET_151 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SRESET_PIPE_152 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RUDI_INVALID : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_I_REG_155 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_173 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXNOTINTABLE_SRL : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDISPERR_SRL : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RESET_INT_PIPE_176 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RESET_INT_177 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SIGNAL_DETECT_REG : STD_LOGIC; 
  signal U0_gpcs_pma_inst_DCM_LOCKED_SOFT_RESET_OR_2_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CLEAR_STATUS_REG_180 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_REG_181 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_182 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESET_REG_184 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_NP_TX_REG_13_185 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_5_186 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_7_187 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_8_188 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_12_189 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_13_190 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_15_191 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_192 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPMODE_193 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TXCHARISK_194 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXNOTINTABLE_0_GND_15_o_MUX_561_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDISPERR_0_GND_15_o_MUX_562_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_13_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_13_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_13_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCHARISK_0_TXCHARISK_INT_MUX_564_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXCHARISCOMMA_0_TXCHARISK_INT_MUX_565_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RXBUFSTATUS_1_GND_15_o_mux_12_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LINK_STATUS_220 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE_221 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_IDLE_222 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_XMIT_CONFIG : STD_LOGIC; 
  signal U0_gpcs_pma_inst_XMIT_DATA : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_7_225 : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_14 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_15_227 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_16_228 : STD_LOGIC; 
  signal NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_13 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_6_230 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_8_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_12_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_13_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_14_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_15_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ACKNOWLEDGE_MATCH_3_GND_26_o_MUX_268_o11_239 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER121 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_67_o1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_242 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER12 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_4_Q_265 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_3_Q_266 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_3_Q_267 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_2_Q_268 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_2_Q_269 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_1_Q_270 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_1_Q_271 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_0_Q_272 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_0_Q_273 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_4_Q_274 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_3_Q_275 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_3_Q_276 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_2_Q_277 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_2_Q_278 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_1_Q_279 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_1_Q_280 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_0_Q_281 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_0_Q_282 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_In2_287 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER8 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER7 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER6 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER5 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER4 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER3 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_LINK_TIMER_SATURATED_OR_54_o_inv : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0588_inv : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_8_1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_7_1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_6_1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_5_1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_4_1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_3_1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_2_1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_1_1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_0_1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0562_inv : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG1_MR_AN_ENABLE_REG2_XOR_56_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_PHY_MODE_TX_CONFIG_REG_INT_15_OR_72_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_PREVIOUS_STATE_3_equal_63_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_RX_CONFIG_REG_15_equal_17_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3_GND_26_o_MUX_268_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_2_GND_26_o_MUX_260_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0676 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_MR_AN_ENABLE_OR_82_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_PWR_22_o_OR_78_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0597_11_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0597_9_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0597_8_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0597_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0597_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0597_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_67_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_RXCLKCORCNT_0_AND_99_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_RXCLKCORCNT_0_AND_102_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_SYNC_STATUS_OR_99_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_IDLE_INSERTED_REG2_AND_49_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_IDLE_INSERTED_REG4_AND_47_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG2_376 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG1_377 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_378 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_379 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT_389 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_390 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SYNC_STATUS_HELD_391 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_392 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_393 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_394 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_404 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_MATCH_405 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_MATCH_2_406 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3_407 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_2_408 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_409 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_2_410 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_3_GND_26_o_Mux_70_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PWR_22_o_STATE_3_equal_58_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG4_416 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG3_417 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG2_418 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG1_419 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_REG2_420 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_REG1_421 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_422 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_423 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_REG_424 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CLEAR_STATUS_REG2_425 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CLEAR_STATUS_REG1_426 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GENERATE_REMOTE_FAULT_427 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_SET_REG2_428 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_SET_REG1_429 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_430 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_DATA_INT_431 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG2_438 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_439 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_440 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_MSB_REG_441 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_442 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG2_444 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG1_445 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_446 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_8_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_9_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_10_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_11_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_12_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_15_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT511 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_28_o_Mux_5_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_S_OR_110_o_0 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_DISP5 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_T_OR_112_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_EN_EVEN_AND_109_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_CODE_GRP_CNT_1_MUX_471_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_GND_28_o_MUX_477_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_DISP3_K28p5_OR_122_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_EVEN_AND_143_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_PWR_23_o_MUX_464_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_515 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_V_516 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_R_517 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_518 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_519 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_XMIT_DATA_INT_520 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_521 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_523 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_K28p5_524 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_525 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_526 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_T_527 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_S_528 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_S_529 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_538 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1_547 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_548 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_8_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_12_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_13_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_14_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_15_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0456_inv11 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_Mmux_DATA_RD1211 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_SYNC_MDC_data_sync1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_SYNC_MDIO_IN_data_sync1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0386_inv_568 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0379_inv : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0368_inv : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_GND_22_o_AN_ADV_REG_12_MUX_170_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_GND_22_o_AN_ADV_REG_13_MUX_169_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_UNIDIRECTIONAL_ENABLE_REG_DATA_WR_5_MUX_130_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG_DATA_WR_10_MUX_128_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_DATA_WR_12_MUX_122_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_DATA_WR_14_MUX_120_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_GND_22_o_MDIO_WE_AND_16_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_DUPLEX_MODE_REG_578 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_IDLE_DETECT_REG1_579 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_IN_REG2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_REG2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_ENABLE_582 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_COMPLETE_REG1_583 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_UNIDIRECTIONAL_ENABLE_REG_584 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_IN_REG4_585 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_IN_REG3_586 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_REG3_587 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_EN_588 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_REG_589 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CONFIGURATION_VALID_EN_REG_590 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CONFIGURATION_VALID_EN_591 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_EN_REG_592 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_EN_593 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_594 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_RD_595 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_WE_596 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG3_597 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT_xor_3_14 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mmux_STATE_3_PWR_20_o_Mux_36_o11_620 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB2_621 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_In1_622 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1011 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT3 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0141_inv : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In_631 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_In : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0147_inv_633 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0155_inv : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_3_PWR_20_o_Mux_37_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_3_PWR_20_o_Mux_36_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_GND_24_o_PWR_20_o_MUX_63_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_GND_24_o_GND_24_o_MUX_62_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG1_PWR_20_o_AND_3_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_LAST_DATA_SHIFT_650 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_653 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_654 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_655 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG2_656 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG1_657 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_8_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_9_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_10_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_11_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_12_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_13_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_14_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_15_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_0 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_675 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_676 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_677 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_678 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In2_679 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_In2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In3 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_n0103_inv : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_PWR_24_o_equal_19_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_GND_29_o_mux_30_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_GND_29_o_mux_30_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_GND_29_o_CGBAD_OR_129_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD_GND_29_o_AND_153_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_SIGNAL_DETECT_REG_692 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_226_o2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_212_o1_694 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K28p51_695 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_REG2_696 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_D21p5_AND_217_o_norst : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_IDLE_REG_1_IDLE_REG_2_OR_209_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_0_RX_CONFIG_VALID_REG_3_OR_208_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_REG1_C_REG3_OR_154_o_700 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_159_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_D0p0_702 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_219_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_EXT_ILLEGAL_K_REG2_OR_178_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EOP_REG1_SYNC_STATUS_OR_182_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EOP_EXTEND_OR_160_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_0_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_1_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_2_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_3_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_4_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_5_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_6_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_7_Q : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_K28p5_REG1_AND_268_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_LINK_OK_WAIT_FOR_K_AND_237_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_I_REG_LINK_OK_AND_232_o_718 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_LINK_OK_K28p5_REG2_AND_239_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_S_WAIT_FOR_K_AND_245_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_11_RXDATA_3_MUX_501_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_3_RXDATA_3_MUX_493_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_12_RXDATA_4_MUX_500_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_4_RXDATA_4_MUX_492_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_13_RXDATA_5_MUX_499_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_5_RXDATA_5_MUX_491_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_14_RXDATA_6_MUX_498_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_6_RXDATA_6_MUX_490_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_15_RXDATA_7_MUX_497_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_7_RXDATA_7_MUX_489_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_8_RXDATA_0_MUX_504_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_0_RXDATA_0_MUX_496_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_9_RXDATA_1_MUX_503_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_1_RXDATA_1_MUX_495_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_10_RXDATA_2_MUX_502_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_2_RXDATA_2_MUX_494_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_ISOLATE_AND_283_o_737 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_226_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_LINK_OK : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EVEN_RXCHARISK_AND_216_o_740 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_EVEN_AND_228_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K28p5 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_7_RXNOTINTABLE_AND_312_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K23p7 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_212_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K29p7 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXFIFO_ERR_RXDISPERR_OR_131_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_749 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RECEIVE_750 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_INVALID_751 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_752 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_753 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_761 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_K_762 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_763 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG2_764 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG1_765 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_766 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_ERR_767 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG2_768 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG1_769 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_770 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_771 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EOP_REG1_772 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EOP_773 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_SOP_774 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FROM_RX_CX_775 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FROM_RX_K_776 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FROM_IDLE_D_777 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_778 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_REG_779 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_CGBAD_REG3_780 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_CGBAD_781 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_R_782 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_791 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_792 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_SOP_REG3_793 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_SOP_REG2_794 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_796 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_CGBAD_REG2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_798 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_REG3_799 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_REG1_800 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_R_REG1_801 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_T_REG2_802 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_T_REG1_803 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_D0p0_REG_804 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K28p5_REG2_805 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_806 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_807 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_I_808 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_T_809 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_S_810 : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In21_813 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In22_814 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB9 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB91_816 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB92_817 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In1_818 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER2 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER21_820 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_RX_CONFIG_REG_15_equal_17_o1_822 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_RX_CONFIG_REG_15_equal_17_o2_823 : STD_LOGIC; 
  signal N10 : STD_LOGIC; 
  signal N12 : STD_LOGIC; 
  signal N14 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_121_o1_827 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_121_o2_828 : STD_LOGIC; 
  signal N16 : STD_LOGIC; 
  signal N18 : STD_LOGIC; 
  signal N20 : STD_LOGIC; 
  signal N24 : STD_LOGIC; 
  signal N26 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB1_834 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB3_835 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB4_836 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB5_837 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB6_838 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB7_839 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB8_840 : STD_LOGIC; 
  signal N28 : STD_LOGIC; 
  signal N30 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_In2 : STD_LOGIC; 
  signal N32 : STD_LOGIC; 
  signal N34 : STD_LOGIC; 
  signal N36 : STD_LOGIC; 
  signal N38 : STD_LOGIC; 
  signal N40 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1111 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux11111_850 : STD_LOGIC; 
  signal N42 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux61 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux611_853 : STD_LOGIC; 
  signal N44 : STD_LOGIC; 
  signal N48 : STD_LOGIC; 
  signal N50 : STD_LOGIC; 
  signal N52 : STD_LOGIC; 
  signal N54 : STD_LOGIC; 
  signal N56 : STD_LOGIC; 
  signal N58 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In31_861 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In21_862 : STD_LOGIC; 
  signal N64 : STD_LOGIC; 
  signal N66 : STD_LOGIC; 
  signal N68 : STD_LOGIC; 
  signal N70 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_133_o : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_133_o1_868 : STD_LOGIC; 
  signal N72 : STD_LOGIC; 
  signal N74 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o1_871 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o2_872 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o3_873 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o4_874 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_203_o1 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_203_o12_876 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_203_o13_877 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_159_o1_878 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_T_REG2_R_REG1_OR_174_o2_879 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_8_glue_rst_880 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_7_glue_rst_881 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_6_glue_rst_882 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_5_glue_rst_883 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_4_glue_rst_884 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_3_glue_rst_885 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_2_glue_rst_886 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_1_glue_rst_887 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_0_glue_rst_888 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_glue_set_889 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_glue_set_890 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_glue_set_891 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE_glue_set_892 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT_glue_set_893 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT_glue_set_894 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_glue_rst_895 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SYNC_STATUS_HELD_glue_set_896 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_IDLE_glue_set_897 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_glue_set_898 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_glue_set_899 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_V_glue_set_900 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_glue_set_901 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_R_glue_set_902 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_glue_rst_903 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_DUPLEX_MODE_REG_glue_set_904 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_5_glue_set_905 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_7_glue_set_906 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_8_glue_set_907 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_glue_set_908 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_INT_glue_set_909 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_REG_glue_set_910 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESET_REG_glue_set_911 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_POWERDOWN_REG_glue_set_912 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_NP_TX_REG_13_glue_set_913 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_glue_set_914 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_glue_set_915 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RECEIVE_glue_set_916 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_INVALID_glue_set_917 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_DV_glue_set_918 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXTEND_glue_set_919 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_glue_set_920 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_glue_set_921 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_10_rt_922 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_9_rt_923 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_8_rt_924 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_7_rt_925 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_6_rt_926 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_5_rt_927 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_4_rt_928 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_3_rt_929 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_2_rt_930 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_1_rt_931 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_7_rt_932 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_6_rt_933 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_5_rt_934 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_4_rt_935 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_3_rt_936 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_2_rt_937 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_1_rt_938 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_11_rt_939 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_8_rt_940 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LINK_STATUS_rstpot_941 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_rstpot_942 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_rstpot_943 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_15_rstpot_944 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_ENABLE_rstpot_945 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_rstpot_946 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_rstpot_947 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_rstpot_948 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG3_rstpot_949 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GENERATE_REMOTE_FAULT_rstpot_950 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_rstpot_951 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_rstpot : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_rstpot_953 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_rstpot_954 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_K28p5_rstpot_955 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_rstpot_956 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_rstpot_957 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TRANSMITTER_S_rstpot_958 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_IDLE_DETECT_REG1_rstpot_959 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_EN_rstpot_960 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CONFIGURATION_VALID_EN_rstpot_961 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_rstpot_962 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_EN_rstpot_963 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_rstpot_964 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_C_rstpot_965 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_rstpot_966 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_rstpot_967 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_rstpot_968 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN_rstpot_969 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_rstpot_970 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CLEAR_STATUS_REG_rstpot1_971 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv2_rstpot_972 : STD_LOGIC; 
  signal N76 : STD_LOGIC; 
  signal N77 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_rstpot_975 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_0_dpot1_976 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_1_dpot1_977 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_2_dpot1_978 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_3_dpot1_979 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_4_dpot1_980 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_5_dpot1_981 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_6_dpot1_982 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_7_dpot1_983 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_8_dpot1_984 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_9_dpot1_985 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_10_dpot1_986 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_11_dpot1_987 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_12_dpot1_988 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_dpot1_989 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_15_dpot1_990 : STD_LOGIC; 
  signal N79 : STD_LOGIC; 
  signal N88 : STD_LOGIC; 
  signal N89 : STD_LOGIC; 
  signal N91 : STD_LOGIC; 
  signal N92 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_rstpot_lut_996 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ABILITY_MATCH_2_GND_26_o_MUX_260_o11_lut_997 : STD_LOGIC; 
  signal N96 : STD_LOGIC; 
  signal N102 : STD_LOGIC; 
  signal N104 : STD_LOGIC; 
  signal N106 : STD_LOGIC; 
  signal N108 : STD_LOGIC; 
  signal N110 : STD_LOGIC; 
  signal N112 : STD_LOGIC; 
  signal N114 : STD_LOGIC; 
  signal N116 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_1_1007 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_1_1008 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_1_1009 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_2_1_1010 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_1_1_1011 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_rstpot_1012 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_rstpot_1013 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_1_rstpot_1014 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_1_rstpot_1015 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_2_2_1016 : STD_LOGIC; 
  signal N118 : STD_LOGIC; 
  signal N119 : STD_LOGIC; 
  signal N120 : STD_LOGIC; 
  signal N121 : STD_LOGIC; 
  signal N122 : STD_LOGIC; 
  signal N123 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_0_1023 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_1_1024 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_12_1025 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_7_1026 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_6_1027 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_5_1028 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_4_1029 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_3_1030 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_2_1031 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_1_1032 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_0_1033 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_EXTEND_REG3_1034 : STD_LOGIC; 
  signal U0_gpcs_pma_inst_RECEIVER_Mshreg_SOP_REG2_1035 : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_0_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_1_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_12_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_7_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_6_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_5_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_4_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_3_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_2_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_1_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_0_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_EXTEND_REG3_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_CGBAD_REG2_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_SOP_REG2_Q15_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_FALSE_CARRIER_REG2_Q15_UNCONNECTED : STD_LOGIC; 
  signal U0_gpcs_pma_inst_TXDATA : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_RECEIVER_RXD : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_RXCLKCORCNT_INT : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal U0_gpcs_pma_inst_RXBUFSTATUS_INT : STD_LOGIC_VECTOR ( 1 downto 1 ); 
  signal U0_gpcs_pma_inst_RXDATA_INT : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal U0_gpcs_pma_inst_TRANSMITTER_TXDATA : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal NlwRenamedSig_OI_status_vector : STD_LOGIC_VECTOR ( 7 downto 7 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy : STD_LOGIC_VECTOR ( 10 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096 : STD_LOGIC_VECTOR ( 11 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result : STD_LOGIC_VECTOR ( 11 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_DELAY : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal U0_gpcs_pma_inst_TRANSMITTER_Result : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG : STD_LOGIC_VECTOR ( 15 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR : STD_LOGIC_VECTOR ( 4 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_OPCODE : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal U0_gpcs_pma_inst_RECEIVER_IDLE_REG : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG : STD_LOGIC_VECTOR ( 3 downto 0 ); 
  signal U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5 : STD_LOGIC_VECTOR ( 7 downto 0 ); 
begin
  txdata(7) <= U0_gpcs_pma_inst_TXDATA(7);
  txdata(6) <= U0_gpcs_pma_inst_TXDATA(6);
  txdata(5) <= U0_gpcs_pma_inst_TXDATA(5);
  txdata(4) <= U0_gpcs_pma_inst_TXDATA(4);
  txdata(3) <= U0_gpcs_pma_inst_TXDATA(3);
  txdata(2) <= U0_gpcs_pma_inst_TXDATA(2);
  txdata(1) <= U0_gpcs_pma_inst_TXDATA(1);
  txdata(0) <= U0_gpcs_pma_inst_TXDATA(0);
  gmii_rxd(7) <= U0_gpcs_pma_inst_RECEIVER_RXD(7);
  gmii_rxd(6) <= U0_gpcs_pma_inst_RECEIVER_RXD(6);
  gmii_rxd(5) <= U0_gpcs_pma_inst_RECEIVER_RXD(5);
  gmii_rxd(4) <= U0_gpcs_pma_inst_RECEIVER_RXD(4);
  gmii_rxd(3) <= U0_gpcs_pma_inst_RECEIVER_RXD(3);
  gmii_rxd(2) <= U0_gpcs_pma_inst_RECEIVER_RXD(2);
  gmii_rxd(1) <= U0_gpcs_pma_inst_RECEIVER_RXD(1);
  gmii_rxd(0) <= U0_gpcs_pma_inst_RECEIVER_RXD(0);
  status_vector(15) <= NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_9;
  status_vector(14) <= NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_8;
  status_vector(13) <= NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT;
  status_vector(12) <= U0_gpcs_pma_inst_STATUS_VECTOR_12_81;
  status_vector(11) <= NlwRenamedSig_OI_N0;
  status_vector(10) <= NlwRenamedSig_OI_status_vector(7);
  status_vector(9) <= NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_14;
  status_vector(8) <= NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_13;
  status_vector(7) <= NlwRenamedSig_OI_status_vector(7);
  status_vector(6) <= U0_gpcs_pma_inst_RXNOTINTABLE_REG_82;
  status_vector(5) <= U0_gpcs_pma_inst_RXDISPERR_REG_83;
  status_vector(4) <= U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RUDI_INVALID_84;
  status_vector(3) <= U0_gpcs_pma_inst_RECEIVER_RUDI_I_85;
  status_vector(2) <= U0_gpcs_pma_inst_RECEIVER_RUDI_C_86;
  status_vector(1) <= U0_gpcs_pma_inst_STATUS_VECTOR_1_87;
  status_vector(0) <= U0_gpcs_pma_inst_STATUS_VECTOR_0_88;
  mgt_rx_reset <= NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT;
  mgt_tx_reset <= NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT;
  powerdown <= NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_POWERDOWN_REG;
  txchardispmode <= U0_gpcs_pma_inst_TXCHARDISPMODE_92;
  txchardispval <= U0_gpcs_pma_inst_TXCHARDISPVAL_93;
  txcharisk <= U0_gpcs_pma_inst_TXCHARISK_94;
  enablealign <= NlwRenamedSig_OI_U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN;
  gmii_rx_dv <= NlwRenamedSig_OI_U0_gpcs_pma_inst_RECEIVER_RX_DV;
  gmii_rx_er <= U0_gpcs_pma_inst_RECEIVER_RX_ER_97;
  gmii_isolate <= NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG;
  an_interrupt <= NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_INT;
  mdio_out <= U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_OUT_100;
  mdio_tri <= U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_TRI_101;
  XST_VCC : VCC
    port map (
      P => NlwRenamedSig_OI_N0
    );
  XST_GND : GND
    port map (
      G => NlwRenamedSig_OI_status_vector(7)
    );
  U0_gpcs_pma_inst_DELAY_RXNOTINTABLE : SRL16
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(7),
      A1 => NlwRenamedSig_OI_status_vector(7),
      A2 => NlwRenamedSig_OI_N0,
      A3 => NlwRenamedSig_OI_status_vector(7),
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXNOTINTABLE_INT_139,
      Q => U0_gpcs_pma_inst_RXNOTINTABLE_SRL
    );
  U0_gpcs_pma_inst_DELAY_RXDISPERR : SRL16
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(7),
      A1 => NlwRenamedSig_OI_status_vector(7),
      A2 => NlwRenamedSig_OI_N0,
      A3 => NlwRenamedSig_OI_status_vector(7),
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDISPERR_INT_140,
      Q => U0_gpcs_pma_inst_RXDISPERR_SRL
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_In,
      R => U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_210_o,
      Q => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_104
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_In,
      R => U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_210_o,
      Q => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_105
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_In,
      R => U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_210_o,
      Q => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_103
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_In,
      R => U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_211_o,
      Q => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_110
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_In,
      R => U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_211_o,
      Q => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_111
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_In,
      R => U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_211_o,
      Q => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_112
    );
  U0_gpcs_pma_inst_SYNC_SIGNAL_DETECT_data_sync : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => signal_detect,
      Q => U0_gpcs_pma_inst_SYNC_SIGNAL_DETECT_data_sync1
    );
  U0_gpcs_pma_inst_SYNC_SIGNAL_DETECT_data_sync_reg : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNC_SIGNAL_DETECT_data_sync1,
      Q => U0_gpcs_pma_inst_SIGNAL_DETECT_REG
    );
  U0_gpcs_pma_inst_RXNOTINTABLE_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXNOTINTABLE_SRL,
      Q => U0_gpcs_pma_inst_RXNOTINTABLE_REG_82
    );
  U0_gpcs_pma_inst_RXDISPERR_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDISPERR_SRL,
      Q => U0_gpcs_pma_inst_RXDISPERR_REG_83
    );
  U0_gpcs_pma_inst_TXCHARDISPVAL : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXCHARDISPVAL_INT_GND_15_o_MUX_573_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXCHARDISPVAL_93
    );
  U0_gpcs_pma_inst_TXCHARISK : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXCHARISK_INT_TXEVEN_MUX_571_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXCHARISK_94
    );
  U0_gpcs_pma_inst_TXDATA_7 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_7_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(7)
    );
  U0_gpcs_pma_inst_TXDATA_6 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_6_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(6)
    );
  U0_gpcs_pma_inst_TXDATA_5 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_5_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(5)
    );
  U0_gpcs_pma_inst_TXDATA_4 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_4_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(4)
    );
  U0_gpcs_pma_inst_TXDATA_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_3_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(3)
    );
  U0_gpcs_pma_inst_TXDATA_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_2_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(2)
    );
  U0_gpcs_pma_inst_TXDATA_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(1)
    );
  U0_gpcs_pma_inst_TXDATA_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXDATA(0)
    );
  U0_gpcs_pma_inst_TXCHARDISPMODE : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TXCHARDISPMODE_INT_TXEVEN_MUX_572_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXCHARDISPMODE_92
    );
  U0_gpcs_pma_inst_RXDATA_INT_7 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_7_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(7)
    );
  U0_gpcs_pma_inst_RXDATA_INT_6 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_6_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(6)
    );
  U0_gpcs_pma_inst_RXDATA_INT_5 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_5_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(5)
    );
  U0_gpcs_pma_inst_RXDATA_INT_4 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_4_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(4)
    );
  U0_gpcs_pma_inst_RXDATA_INT_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_3_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(3)
    );
  U0_gpcs_pma_inst_RXDATA_INT_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_2_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(2)
    );
  U0_gpcs_pma_inst_RXDATA_INT_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(1)
    );
  U0_gpcs_pma_inst_RXDATA_INT_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDATA_INT(0)
    );
  U0_gpcs_pma_inst_RXCHARISK_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXCHARISK_0_TXCHARISK_INT_MUX_564_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXCHARISK_INT_149
    );
  U0_gpcs_pma_inst_RXCHARISCOMMA_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXCHARISCOMMA_0_TXCHARISK_INT_MUX_565_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXCHARISCOMMA_INT_150
    );
  U0_gpcs_pma_inst_RXBUFSTATUS_INT_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXBUFSTATUS_1_GND_15_o_mux_12_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1)
    );
  U0_gpcs_pma_inst_RXCLKCORCNT_INT_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_13_OUT_2_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXCLKCORCNT_INT(2)
    );
  U0_gpcs_pma_inst_RXCLKCORCNT_INT_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_13_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXCLKCORCNT_INT(1)
    );
  U0_gpcs_pma_inst_RXCLKCORCNT_INT_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_13_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXCLKCORCNT_INT(0)
    );
  U0_gpcs_pma_inst_RXDISPERR_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXDISPERR_0_GND_15_o_MUX_562_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXDISPERR_INT_140
    );
  U0_gpcs_pma_inst_RXNOTINTABLE_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXNOTINTABLE_0_GND_15_o_MUX_561_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RXNOTINTABLE_INT_139
    );
  U0_gpcs_pma_inst_SRESET : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SRESET_PIPE_PWR_15_o_MUX_1_o,
      Q => U0_gpcs_pma_inst_SRESET_151
    );
  U0_gpcs_pma_inst_TXBUFERR_INT : FDR
    port map (
      C => userclk2,
      D => txbuferr,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TXBUFERR_INT_134
    );
  U0_gpcs_pma_inst_SRESET_PIPE : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RESET_INT_177,
      Q => U0_gpcs_pma_inst_SRESET_PIPE_152
    );
  U0_gpcs_pma_inst_MGT_RX_RESET_INT : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RX_RST_SM_3_GND_15_o_Mux_8_o,
      S => U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_211_o,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT
    );
  U0_gpcs_pma_inst_MGT_TX_RESET_INT : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TX_RST_SM_3_GND_15_o_Mux_4_o,
      S => U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_210_o,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT
    );
  U0_gpcs_pma_inst_RESET_INT : FDP
    port map (
      C => userclk,
      D => U0_gpcs_pma_inst_RESET_INT_PIPE_176,
      PRE => U0_gpcs_pma_inst_DCM_LOCKED_SOFT_RESET_OR_2_o,
      Q => U0_gpcs_pma_inst_RESET_INT_177
    );
  U0_gpcs_pma_inst_RESET_INT_PIPE : FDP
    port map (
      C => userclk,
      D => NlwRenamedSig_OI_status_vector(7),
      PRE => U0_gpcs_pma_inst_DCM_LOCKED_SOFT_RESET_OR_2_o,
      Q => U0_gpcs_pma_inst_RESET_INT_PIPE_176
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_11_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(10),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_11_rt_939,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(11)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_10_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(9),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_10_rt_922,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(10)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_10_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(9),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_10_rt_922,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(10)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_9_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(8),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_9_rt_923,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(9)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_9_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(8),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_9_rt_923,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(9)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_8_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(7),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_8_rt_924,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(8)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_8_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(7),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_8_rt_924,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(8)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_7_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(6),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_7_rt_925,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(7)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_7_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(6),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_7_rt_925,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(7)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_6_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(5),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_6_rt_926,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(6)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_6_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(5),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_6_rt_926,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(6)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_5_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(4),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_5_rt_927,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(5)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_5_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(4),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_5_rt_927,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(5)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_4_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(3),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_4_rt_928,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(4)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_4_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(3),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_4_rt_928,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(4)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_3_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(2),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_3_rt_929,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_3_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(2),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_3_rt_929,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_2_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(1),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_2_rt_930,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_2_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(1),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_2_rt_930,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_1_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(0),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_1_rt_931,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_1_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(0),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_1_rt_931,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_0_Q : XORCY
    port map (
      CI => NlwRenamedSig_OI_status_vector(7),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_lut(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_0_Q : MUXCY
    port map (
      CI => NlwRenamedSig_OI_status_vector(7),
      DI => NlwRenamedSig_OI_N0,
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_lut(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_8_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(7),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_8_rt_940,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_8_1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_7_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(6),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_7_rt_932,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_7_1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_7_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(6),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_7_rt_932,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(7)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_6_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(5),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_6_rt_933,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_6_1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_6_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(5),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_6_rt_933,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(6)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_5_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(4),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_5_rt_934,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_5_1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_5_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(4),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_5_rt_934,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(5)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_4_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(3),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_4_rt_935,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_4_1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_4_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(3),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_4_rt_935,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(4)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_3_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(2),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_3_rt_936,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_3_1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_3_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(2),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_3_rt_936,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_2_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(1),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_2_rt_937,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_2_1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_2_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(1),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_2_rt_937,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_1_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(0),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_1_rt_938,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_1_1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_1_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(0),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_1_rt_938,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_0_Q : XORCY
    port map (
      CI => NlwRenamedSig_OI_status_vector(7),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_lut(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_0_1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_0_Q : MUXCY
    port map (
      CI => NlwRenamedSig_OI_status_vector(7),
      DI => NlwRenamedSig_OI_N0,
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_lut(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_4_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_3_Q_266,
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_4_Q_265,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_4_Q : LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_12_Q,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(12),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_Q,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(13),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_4_Q_265
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_3_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_2_Q_268,
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_3_Q_267,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_3_Q_266
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_3_Q : LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_9_Q,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(9),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_10_Q,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(10),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_11_Q,
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(11),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_3_Q_267
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_2_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_1_Q_270,
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_2_Q_269,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_2_Q_268
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_2_Q : LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_6_Q,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(6),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_7_Q,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(7),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_8_Q,
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(8),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_2_Q_269
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_1_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_0_Q_272,
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_1_Q_271,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_1_Q_270
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_1_Q : LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_3_Q,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(3),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_4_Q,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(4),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_5_Q,
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(5),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_1_Q_271
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_0_Q : MUXCY
    port map (
      CI => NlwRenamedSig_OI_N0,
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_0_Q_273,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_cy_0_Q_272
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_0_Q : LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_0_Q,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(0),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_1_Q,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(1),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_2_Q,
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(2),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o_lut_0_Q_273
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_4_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_3_Q_275,
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_4_Q_274,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_4_Q : LUT4
    generic map(
      INIT => X"9009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(12),
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(12),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(13),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(13),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_4_Q_274
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_3_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_2_Q_277,
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_3_Q_276,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_3_Q_275
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_3_Q : LUT6
    generic map(
      INIT => X"8040201008040201"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(11),
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(10),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(9),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(11),
      I4 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(10),
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(9),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_3_Q_276
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_2_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_1_Q_279,
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_2_Q_278,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_2_Q_277
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_2_Q : LUT6
    generic map(
      INIT => X"8040201008040201"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(8),
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(7),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(6),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(8),
      I4 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(7),
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(6),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_2_Q_278
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_1_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_0_Q_281,
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_1_Q_280,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_1_Q_279
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_1_Q : LUT6
    generic map(
      INIT => X"8020080240100401"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(5),
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(4),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(3),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(4),
      I4 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(3),
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(5),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_1_Q_280
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_0_Q : MUXCY
    port map (
      CI => NlwRenamedSig_OI_N0,
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_0_Q_282,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_cy_0_Q_281
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_0_Q : LUT6
    generic map(
      INIT => X"8040201008040201"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(2),
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(1),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(0),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(2),
      I4 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(1),
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcompar_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o_lut_0_Q_282
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_8 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0588_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER8,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(8)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_7 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0588_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER7,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(7)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_6 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0588_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER6,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(6)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_5 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0588_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER5,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(5)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_4 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0588_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER4,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(4)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_3 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0588_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER3,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_2 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0588_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER2,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_1 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0588_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER1,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_0 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0588_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_11 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(11),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(11)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_10 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(10),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(10)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_9 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(9),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(9)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_8 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(8),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(8)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_7 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(7),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(7)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_6 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(6),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(6)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_5 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(5),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(5)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_4 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(4),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(4)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(3),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(2),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(1),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result(0),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_xor_8_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(7),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(8),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER8
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_xor_7_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(6),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(7),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER7
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy_7_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(6),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(7),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(7)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_xor_6_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(5),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(6),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER6
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy_6_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(5),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(6),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(6)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_xor_5_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(4),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(5),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER5
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy_5_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(4),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(5),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(5)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_xor_4_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(3),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(4),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER4
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy_4_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(3),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(4),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(4)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_xor_3_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(2),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(3),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER3
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy_3_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(2),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(3),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_xor_2_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(1),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(2),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER2
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy_2_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(1),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(2),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_xor_1_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(0),
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(1),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy_1_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(0),
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(1),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_xor_0_Q : XORCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_LINK_TIMER_SATURATED_OR_54_o_inv,
      LI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy_0_Q : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_LINK_TIMER_SATURATED_OR_54_o_inv,
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_cy(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_439,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG2_438
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_439
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_15 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_3_GND_26_o_Mux_70_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0597_1_Q,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_15_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_14 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_3_GND_26_o_Mux_70_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER121,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_14_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_13 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_3_GND_26_o_Mux_70_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0597_3_Q,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_13_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_12 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_3_GND_26_o_Mux_70_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0597_4_Q,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_12_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_8 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_3_GND_26_o_Mux_70_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0597_8_Q,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_8_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_7 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_3_GND_26_o_Mux_70_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0597_9_Q,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_7_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_5 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_3_GND_26_o_Mux_70_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0597_11_Q,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_5_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE_3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PWR_22_o_STATE_3_equal_58_o,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE_2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE(2),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE(1),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE_0 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE(0),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0562_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_242,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_409
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_MATCH_2 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG2_444,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_IDLE_INSERTED_REG4_AND_47_o,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_MATCH_2_406
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_MATCH : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG2_444,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_IDLE_INSERTED_REG2_AND_49_o,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_MATCH_405
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG1_419,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG2_418
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_REG1_421,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_REG2_420
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG1_MR_AN_ENABLE_REG2_XOR_56_o,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_430
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_440
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0562_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3_GND_26_o_MUX_268_o,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3_407
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_2 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0562_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_2_GND_26_o_MUX_260_o,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_2_410
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_2 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0562_inv,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ACKNOWLEDGE_MATCH_3_GND_26_o_MUX_268_o11_239,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_2_408
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG4 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG3_417,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG4_416
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_422,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG1_419
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_423,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_REG1_421
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CLEAR_STATUS_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CLEAR_STATUS_REG1_426,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CLEAR_STATUS_REG2_425
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_SET_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_SET_REG1_429,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_SET_REG2_428
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RUDI_INVALID : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_DELAY(1),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RUDI_INVALID_84
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_MSB_REG : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(11),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_MSB_REG_441
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG1_445,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG2_444
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_182,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG1_377
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG1_377,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG2_376
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_7 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0676,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(6),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_7_225
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_8 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0676,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(7),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_8
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_6 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0676,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(5),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_6_230
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_13 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0676,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(12),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_13
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_14 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0676,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(13),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_14
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_9 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0676,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(8),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_9
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_16 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0676,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_16_228
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_15 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0676,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(14),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_15_227
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_RXCLKCORCNT_0_AND_102_o,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_422
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_REG : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RX_RUDI_INVALID,
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_SYNC_STATUS_OR_99_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_REG_424
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_RXCLKCORCNT_0_AND_99_o,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_423
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CLEAR_STATUS_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CLEAR_STATUS_REG_180,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CLEAR_STATUS_REG1_426
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_SET_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_REG_181,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_SET_REG1_429
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_DATA_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_PWR_22_o_OR_78_o,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_DATA_INT_431
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_DELAY_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_DELAY(0),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_DELAY(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_DELAY_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_67_o1,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_DELAY(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_I_REG_155,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG1_445
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_15 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(15)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_14 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(14),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(14)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(13),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(13)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_12 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(12),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(12)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_11 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(11),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(11)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_10 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(10),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(10)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_9 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(9),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(9)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_8 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(8),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(8)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_7 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(7),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(7)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_6 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(6),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(6)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_5 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(5),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(5)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_4 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(4),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(4)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_3 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(3),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_2 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(2),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_1 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(1),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_0 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(0),
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_15 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_15_dpot1_990,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_15_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_dpot1_989,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_12 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_12_dpot1_988,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_12_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_11 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_11_dpot1_987,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_11_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_10 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_10_dpot1_986,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_10_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_9 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_9_dpot1_985,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_9_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_8 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_8_dpot1_984,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_8_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_7 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_7_dpot1_983,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_7_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_6 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_6_dpot1_982,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_6_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_5 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_5_dpot1_981,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_5_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_4 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_4_dpot1_980,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_4_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_3 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_3_dpot1_979,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_3_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_2 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_2_dpot1_978,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_2_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_1 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_1_dpot1_977,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_1_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_0 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_0_dpot1_976,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_0_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_Result(1),
      S => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_0 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_Result(0),
      S => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_7 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_7_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(7)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_6 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_6_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(6)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_5 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_5_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(5)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_4 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_4_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(4)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_3_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(3)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_2_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(2)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(1)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXDATA_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(0)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXCHARISK : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_GND_28_o_MUX_477_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXCHARISK_194
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_7_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(7)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_6 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_6_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(6)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_5 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_5_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(5)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_4 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_4_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(4)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_3 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_3_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(3)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_2 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_2_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(2)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_1_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(1)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_0 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_0_Q,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(0)
    );
  U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_CODE_GRP_CNT_1_MUX_471_o,
      Q => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_538
    );
  U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_7 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_7_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(7)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_6 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_6_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(6)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_5 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_5_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(5)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_4 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_4_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(4)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_28_o_Mux_5_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(3)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_2_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(2)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(1)
    );
  U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(0)
    );
  U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT : FDSE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_28_o_Mux_5_o,
      D => U0_gpcs_pma_inst_XMIT_CONFIG,
      S => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_519
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPMODE : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_EVEN_AND_143_o,
      S => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPMODE_193
    );
  U0_gpcs_pma_inst_TRANSMITTER_XMIT_DATA_INT : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_28_o_Mux_5_o,
      D => U0_gpcs_pma_inst_XMIT_DATA,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_XMIT_DATA_INT_520
    );
  U0_gpcs_pma_inst_TRANSMITTER_T : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_T_OR_112_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_T_527
    );
  U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_S : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_EVEN_AND_109_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_S_528
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1 : FD
    port map (
      C => userclk2,
      D => gmii_tx_er,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1_547
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1 : FD
    port map (
      C => userclk2,
      D => gmii_tx_en,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_548
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_15 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_28_o_Mux_5_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_15_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_15_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_14 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_28_o_Mux_5_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_14_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_14_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_13 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_28_o_Mux_5_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_13_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_13_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_12 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_28_o_Mux_5_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_12_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_12_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_8 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_28_o_Mux_5_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_8_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_8_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_7 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_28_o_Mux_5_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_7_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_7_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_5 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_28_o_Mux_5_o,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_5_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_5_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_7 : FD
    port map (
      C => userclk2,
      D => gmii_txd(7),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(7)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_6 : FD
    port map (
      C => userclk2,
      D => gmii_txd(6),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(6)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_5 : FD
    port map (
      C => userclk2,
      D => gmii_txd(5),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(5)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_4 : FD
    port map (
      C => userclk2,
      D => gmii_txd(4),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(4)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_3 : FD
    port map (
      C => userclk2,
      D => gmii_txd(3),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(3)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_2 : FD
    port map (
      C => userclk2,
      D => gmii_txd(2),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(2)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_1 : FD
    port map (
      C => userclk2,
      D => gmii_txd(1),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(1)
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1_0 : FD
    port map (
      C => userclk2,
      D => gmii_txd(0),
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(0)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_SYNC_MDC_data_sync : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => mdc,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_SYNC_MDC_data_sync1
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_SYNC_MDC_data_sync_reg : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_SYNC_MDC_data_sync1,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_REG2
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_SYNC_MDIO_IN_data_sync : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => mdio_in,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_SYNC_MDIO_IN_data_sync1
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_SYNC_MDIO_IN_data_sync_reg : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_SYNC_MDIO_IN_data_sync1,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_IN_REG2
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_COMPLETE_REG1 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG3_597,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE_221,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_COMPLETE_REG1_583
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_12 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0386_inv_568,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_GND_22_o_AN_ADV_REG_12_MUX_170_o,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_12_189
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_13 : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0386_inv_568,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_GND_22_o_AN_ADV_REG_13_MUX_169_o,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_13_190
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_IN_REG4 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_IN_REG3_586,
      S => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_IN_REG4_585
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG : FDSE
    generic map(
      INIT => '1'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0368_inv,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG_DATA_WR_10_MUX_128_o,
      S => U0_gpcs_pma_inst_SRESET_151,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_UNIDIRECTIONAL_ENABLE_REG : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0368_inv,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_UNIDIRECTIONAL_ENABLE_REG_DATA_WR_5_MUX_130_o,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_UNIDIRECTIONAL_ENABLE_REG_584
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0368_inv,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_DATA_WR_14_MUX_120_o,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_IN_REG3 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_IN_REG2,
      S => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_IN_REG3_586
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_REG3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_REG2,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_REG3_587
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_REG : FDR
    port map (
      C => userclk2,
      D => an_adv_config_val,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_REG_589
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_EN_REG : FDR
    port map (
      C => userclk2,
      D => an_restart_config,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_EN_REG_592
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CONFIGURATION_VALID_EN_REG : FDR
    port map (
      C => userclk2,
      D => configuration_valid,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CONFIGURATION_VALID_EN_REG_590
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0141_inv,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT3,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(3)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0141_inv,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT2,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(2)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0141_inv,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT1,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(1)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0141_inv,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(0)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_In,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_654
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_In,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_653
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In_631,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_In,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_TRI : FDSE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_594,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_3_PWR_20_o_Mux_37_o,
      S => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_TRI_101
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_OUT : FDSE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_594,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_3_PWR_20_o_Mux_36_o,
      S => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_OUT_100
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_RD : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG2_656,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_GND_24_o_PWR_20_o_MUX_63_o,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_RD_595
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_WE : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG2_656,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_GND_24_o_GND_24_o_MUX_62_o,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_WE_596
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG2_656,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG3_597
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_OPCODE_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0147_inv_633,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_OPCODE(1)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_OPCODE_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0147_inv_633,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_OPCODE(0)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR_4 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0155_inv,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(4)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR_3 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0155_inv,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(3)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR_2 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0155_inv,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(2)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR_1 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0155_inv,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(1)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR_0 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0155_inv,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(0)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG1_657,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG2_656
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_LAST_DATA_SHIFT : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG1_PWR_20_o_AND_3_o,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_LAST_DATA_SHIFT_650
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_15 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_15_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(15)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_14_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(14)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_13 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_13_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(13)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_12 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_12_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(12)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_11 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_11_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(11)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_10 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_10_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(10)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_9 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_9_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(9)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_8 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_8_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(8)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_7 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_7_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(7)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_6 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_6_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(6)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_5 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_5_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(5)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_4 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_4_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(4)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_3 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_3_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_2_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_1_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_0 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_0_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0)
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_594,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG1_657
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_In2,
      R => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_0,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_675
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In2,
      R => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_0,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_676
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In2_679,
      R => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_0,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_678
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In3,
      R => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_0,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_677
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_SYNCHRONISATION_n0103_inv,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_GND_29_o_mux_30_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(1)
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_0 : FDRE
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_SYNCHRONISATION_n0103_inv,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_GND_29_o_mux_30_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(0)
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_SIGNAL_DETECT_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_SIGNAL_DETECT_REG_692
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_7 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_7_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(7)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_6 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_6_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(6)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_5 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_5_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(5)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_4 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_4_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(4)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_3_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(3)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_2_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(2)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_1_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(1)
    );
  U0_gpcs_pma_inst_RECEIVER_RXD_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_0_Q,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      Q => U0_gpcs_pma_inst_RECEIVER_RXD(0)
    );
  U0_gpcs_pma_inst_RECEIVER_C_REG3 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_C_REG2_696,
      Q => U0_gpcs_pma_inst_RECEIVER_C_REG3_799
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG2,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o,
      Q => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_778
    );
  U0_gpcs_pma_inst_RECEIVER_CGBAD_REG3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_CGBAD_REG2,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_CGBAD_REG3_780
    );
  U0_gpcs_pma_inst_RECEIVER_SOP_REG3 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_SOP_REG2_794,
      Q => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_793
    );
  U0_gpcs_pma_inst_RECEIVER_C_REG2 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_C_REG1_800,
      Q => U0_gpcs_pma_inst_RECEIVER_C_REG2_696
    );
  U0_gpcs_pma_inst_RECEIVER_IDLE_REG_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(1),
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(2)
    );
  U0_gpcs_pma_inst_RECEIVER_IDLE_REG_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(0),
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(1)
    );
  U0_gpcs_pma_inst_RECEIVER_IDLE_REG_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_I_REG_155,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(0)
    );
  U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG1_765,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o,
      Q => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG2_764
    );
  U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG1_769,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o,
      Q => U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG2_768
    );
  U0_gpcs_pma_inst_RECEIVER_C_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_C_807,
      Q => U0_gpcs_pma_inst_RECEIVER_C_REG1_800
    );
  U0_gpcs_pma_inst_RECEIVER_T_REG2 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_T_REG1_803,
      Q => U0_gpcs_pma_inst_RECEIVER_T_REG2_802
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_3 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(2),
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(3)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(1),
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(2)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(0),
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(1)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_0 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(0)
    );
  U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_766,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o,
      Q => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG1_765
    );
  U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_770,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o,
      Q => U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG1_769
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXTEND_749,
      Q => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_792
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_15 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_15_RXDATA_7_MUX_497_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_14 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_14_RXDATA_6_MUX_498_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(14)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_13 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_13_RXDATA_5_MUX_499_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(13)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_12 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_12_RXDATA_4_MUX_500_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(12)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_11 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_11_RXDATA_3_MUX_501_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(11)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_10 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_10_RXDATA_2_MUX_502_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(10)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_9 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_9_RXDATA_1_MUX_503_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(9)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_8 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_8_RXDATA_0_MUX_504_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(8)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_7 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_7_RXDATA_7_MUX_489_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(7)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_6 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_6_RXDATA_6_MUX_490_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(6)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_5 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_5_RXDATA_5_MUX_491_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(5)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_4 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_4_RXDATA_4_MUX_492_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(4)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_3 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_3_RXDATA_3_MUX_493_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(3)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_2 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_2_RXDATA_2_MUX_494_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(2)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_1_RXDATA_1_MUX_495_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(1)
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_0 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_0_RXDATA_0_MUX_496_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(0)
    );
  U0_gpcs_pma_inst_RECEIVER_I_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_I_808,
      Q => U0_gpcs_pma_inst_RECEIVER_I_REG_155
    );
  U0_gpcs_pma_inst_RECEIVER_R_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_R_782,
      Q => U0_gpcs_pma_inst_RECEIVER_R_REG1_801
    );
  U0_gpcs_pma_inst_RECEIVER_T_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_T_809,
      Q => U0_gpcs_pma_inst_RECEIVER_T_REG1_803
    );
  U0_gpcs_pma_inst_RECEIVER_K28p5_REG2 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_806,
      Q => U0_gpcs_pma_inst_RECEIVER_K28p5_REG2_805
    );
  U0_gpcs_pma_inst_RECEIVER_RUDI_I : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_IDLE_REG_1_IDLE_REG_2_OR_209_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RUDI_I_85
    );
  U0_gpcs_pma_inst_RECEIVER_RUDI_C : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_0_RX_CONFIG_VALID_REG_3_OR_208_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RUDI_C_86
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_K : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXDATA_7_RXNOTINTABLE_AND_312_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_FALSE_K_762
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_DATA : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_763
    );
  U0_gpcs_pma_inst_RECEIVER_RX_ER : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_ISOLATE_AND_283_o_737,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_ER_97
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_ERR : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_EXT_ILLEGAL_K_REG2_OR_178_o,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o,
      Q => U0_gpcs_pma_inst_RECEIVER_EXTEND_ERR_767
    );
  U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_K28p5_REG1_AND_268_o,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o,
      Q => U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_770
    );
  U0_gpcs_pma_inst_RECEIVER_EOP : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_159_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_EOP_773
    );
  U0_gpcs_pma_inst_RECEIVER_SOP : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_S_WAIT_FOR_K_AND_245_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_SOP_774
    );
  U0_gpcs_pma_inst_RECEIVER_EOP_REG1 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EOP_EXTEND_OR_160_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_EOP_REG1_772
    );
  U0_gpcs_pma_inst_RECEIVER_FROM_RX_K : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_LINK_OK_K28p5_REG2_AND_239_o,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o,
      Q => U0_gpcs_pma_inst_RECEIVER_FROM_RX_K_776
    );
  U0_gpcs_pma_inst_RECEIVER_FROM_IDLE_D : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_LINK_OK_WAIT_FOR_K_AND_237_o,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o,
      Q => U0_gpcs_pma_inst_RECEIVER_FROM_IDLE_D_777
    );
  U0_gpcs_pma_inst_RECEIVER_FROM_RX_CX : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_C_REG1_C_REG3_OR_154_o_700,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o,
      Q => U0_gpcs_pma_inst_RECEIVER_FROM_RX_CX_775
    );
  U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_REG : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o,
      Q => U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_REG_779
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_226_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154
    );
  U0_gpcs_pma_inst_RECEIVER_R : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_K23p7,
      Q => U0_gpcs_pma_inst_RECEIVER_R_782
    );
  U0_gpcs_pma_inst_RECEIVER_CGBAD : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RXFIFO_ERR_RXDISPERR_OR_131_o,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_RECEIVER_CGBAD_781
    );
  U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      Q => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_798
    );
  U0_gpcs_pma_inst_RECEIVER_D0p0_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_D0p0_702,
      Q => U0_gpcs_pma_inst_RECEIVER_D0p0_REG_804
    );
  U0_gpcs_pma_inst_RECEIVER_K28p5_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_K28p5,
      Q => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_806
    );
  U0_gpcs_pma_inst_RECEIVER_I : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EVEN_RXCHARISK_AND_216_o_740,
      Q => U0_gpcs_pma_inst_RECEIVER_I_808
    );
  U0_gpcs_pma_inst_RECEIVER_S : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_212_o,
      Q => U0_gpcs_pma_inst_RECEIVER_S_810
    );
  U0_gpcs_pma_inst_RECEIVER_T : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_K29p7,
      Q => U0_gpcs_pma_inst_RECEIVER_T_809
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_In1 : LUT4
    generic map(
      INIT => X"EA6A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_104,
      I1 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_106,
      I2 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_105,
      I3 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_103,
      O => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_In
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_In1 : LUT4
    generic map(
      INIT => X"EA6A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_111,
      I1 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_113,
      I2 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_112,
      I3 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_110,
      O => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_In
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_In1 : LUT4
    generic map(
      INIT => X"E666"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_105,
      I1 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_106,
      I2 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_103,
      I3 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_104,
      O => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_In
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_In1 : LUT4
    generic map(
      INIT => X"E666"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_112,
      I1 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_113,
      I2 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_110,
      I3 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_111,
      O => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_In
    );
  U0_gpcs_pma_inst_Mmux_TXCHARDISPVAL_INT_GND_15_o_MUX_573_o11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_192,
      O => U0_gpcs_pma_inst_TXCHARDISPVAL_INT_GND_15_o_MUX_573_o
    );
  U0_gpcs_pma_inst_Mmux_TXCHARISK_INT_TXEVEN_MUX_571_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXCHARISK_194,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXCHARISK_INT_TXEVEN_MUX_571_o
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_21_OUT11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(0),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_0_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_21_OUT21 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(1),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_1_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_21_OUT31 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(2),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_2_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_21_OUT41 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(3),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_3_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_21_OUT51 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(4),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_4_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_21_OUT61 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(5),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_5_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_21_OUT71 : LUT3
    generic map(
      INIT => X"4E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(6),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_6_Q
    );
  U0_gpcs_pma_inst_Mmux_TXDATA_INT_7_GND_15_o_mux_21_OUT81 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(7),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXDATA_INT_7_GND_15_o_mux_21_OUT_7_Q
    );
  U0_gpcs_pma_inst_Mmux_TXCHARDISPMODE_INT_TXEVEN_MUX_572_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPMODE_193,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TXCHARDISPMODE_INT_TXEVEN_MUX_572_o
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_11_OUT11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => rxdata(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(0),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_0_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_11_OUT21 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => rxdata(1),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(1),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_1_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_11_OUT31 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => rxdata(2),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(2),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_2_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_11_OUT41 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => rxdata(3),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(3),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_3_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_11_OUT51 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => rxdata(4),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(4),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_4_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_11_OUT61 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => rxdata(5),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(5),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_5_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_11_OUT71 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => rxdata(6),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(6),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_6_Q
    );
  U0_gpcs_pma_inst_Mmux_RXDATA_7_TXDATA_INT_7_mux_11_OUT81 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => rxdata(7),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXDATA(7),
      O => U0_gpcs_pma_inst_RXDATA_7_TXDATA_INT_7_mux_11_OUT_7_Q
    );
  U0_gpcs_pma_inst_Mmux_RXCHARISK_0_TXCHARISK_INT_MUX_564_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => rxcharisk(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXCHARISK_194,
      O => U0_gpcs_pma_inst_RXCHARISK_0_TXCHARISK_INT_MUX_564_o
    );
  U0_gpcs_pma_inst_Mmux_RXCHARISCOMMA_0_TXCHARISK_INT_MUX_565_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => rxchariscomma(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXCHARISK_194,
      O => U0_gpcs_pma_inst_RXCHARISCOMMA_0_TXCHARISK_INT_MUX_565_o
    );
  U0_gpcs_pma_inst_Mmux_RXDISPERR_0_GND_15_o_MUX_562_o11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => rxdisperr(0),
      O => U0_gpcs_pma_inst_RXDISPERR_0_GND_15_o_MUX_562_o
    );
  U0_gpcs_pma_inst_Mmux_RXNOTINTABLE_0_GND_15_o_MUX_561_o11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => rxnotintable(0),
      O => U0_gpcs_pma_inst_RXNOTINTABLE_0_GND_15_o_MUX_561_o
    );
  U0_gpcs_pma_inst_Mmux_RXCLKCORCNT_2_GND_15_o_mux_13_OUT11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => rxclkcorcnt(0),
      O => U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_13_OUT_0_Q
    );
  U0_gpcs_pma_inst_Mmux_RXCLKCORCNT_2_GND_15_o_mux_13_OUT21 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => rxclkcorcnt(1),
      O => U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_13_OUT_1_Q
    );
  U0_gpcs_pma_inst_Mmux_RXCLKCORCNT_2_GND_15_o_mux_13_OUT31 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => rxclkcorcnt(2),
      O => U0_gpcs_pma_inst_RXCLKCORCNT_2_GND_15_o_mux_13_OUT_2_Q
    );
  U0_gpcs_pma_inst_Mmux_RXBUFSTATUS_1_GND_15_o_mux_12_OUT21 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I1 => rxbufstatus(1),
      O => U0_gpcs_pma_inst_RXBUFSTATUS_1_GND_15_o_mux_12_OUT_1_Q
    );
  U0_gpcs_pma_inst_Mmux_SRESET_PIPE_PWR_15_o_MUX_1_o11 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RESET_INT_177,
      I1 => U0_gpcs_pma_inst_SRESET_PIPE_152,
      O => U0_gpcs_pma_inst_SRESET_PIPE_PWR_15_o_MUX_1_o
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_In1 : LUT4
    generic map(
      INIT => X"FF80"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_106,
      I1 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_105,
      I2 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_104,
      I3 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_103,
      O => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_In
    );
  U0_gpcs_pma_inst_TX_RST_SM_TX_RST_SM_3_GND_15_o_Mux_4_o1 : LUT4
    generic map(
      INIT => X"DFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_105,
      I1 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_106,
      I2 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_103,
      I3 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_104,
      O => U0_gpcs_pma_inst_TX_RST_SM_3_GND_15_o_Mux_4_o
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_In1 : LUT4
    generic map(
      INIT => X"FF80"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_113,
      I1 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_112,
      I2 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_111,
      I3 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_110,
      O => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_In
    );
  U0_gpcs_pma_inst_RX_RST_SM_RX_RST_SM_3_GND_15_o_Mux_8_o1 : LUT4
    generic map(
      INIT => X"DFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_112,
      I1 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_113,
      I2 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_110,
      I3 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_111,
      O => U0_gpcs_pma_inst_RX_RST_SM_3_GND_15_o_Mux_8_o
    );
  U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_211_o1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RESET_INT_177,
      I1 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      O => U0_gpcs_pma_inst_RESET_INT_RXBUFSTATUS_INT_1_OR_211_o
    );
  U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_210_o1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RESET_INT_177,
      I1 => U0_gpcs_pma_inst_TXBUFERR_INT_134,
      O => U0_gpcs_pma_inst_RESET_INT_TXBUFERR_INT_OR_210_o
    );
  U0_gpcs_pma_inst_DCM_LOCKED_SOFT_RESET_OR_2_o1 : LUT3
    generic map(
      INIT => X"FB"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESET_REG_184,
      I1 => dcm_locked,
      I2 => reset,
      O => U0_gpcs_pma_inst_DCM_LOCKED_SOFT_RESET_OR_2_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ACKNOWLEDGE_MATCH_3_GND_26_o_MUX_268_o111 : LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(14),
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(14),
      I2 => U0_gpcs_pma_inst_RECEIVER_I_REG_155,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_379,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ACKNOWLEDGE_MATCH_3_GND_26_o_MUX_268_o11_239
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0562_inv1 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_I_REG_155,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_379,
      I2 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0562_inv
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n06761 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_PREVIOUS_STATE_3_equal_63_o,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0676
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_MR_AN_ENABLE_OR_82_o1 : LUT4
    generic map(
      INIT => X"01FF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_182,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_MR_AN_ENABLE_OR_82_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_STATE_2_1 : LUT3
    generic map(
      INIT => X"A2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_mux331 : LUT5
    generic map(
      INIT => X"22022000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_5_Q,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_5_186,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0597_11_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_mux1131 : LUT5
    generic map(
      INIT => X"22022000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_12_Q,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_12_189,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0597_4_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_mux1121 : LUT6
    generic map(
      INIT => X"8F8885888A888088"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_NP_TX_REG_13_185,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_13_Q,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_13_190,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0597_3_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_mux11031 : LUT5
    generic map(
      INIT => X"22022000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_7_Q,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_7_187,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0597_9_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_mux11021 : LUT5
    generic map(
      INIT => X"22022000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_8_Q,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_8_188,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0597_8_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_mux1101 : LUT5
    generic map(
      INIT => X"22022000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_15_Q,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_15_191,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0597_1_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER122 : LUT5
    generic map(
      INIT => X"00800000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_409,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3_407,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_446,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_404,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER121,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER12
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER1211 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_1_1009,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_1_1008,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_1_1007,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER121
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_STATE_1_1 : LUT3
    generic map(
      INIT => X"54"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_STATE_0_1 : LUT3
    generic map(
      INIT => X"6A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_3_GND_26_o_Mux_70_o1 : LUT3
    generic map(
      INIT => X"51"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_3_GND_26_o_Mux_70_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_PWR_22_o_OR_78_o1 : LUT3
    generic map(
      INIT => X"14"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_PWR_22_o_OR_78_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_IDLE_INSERTED_REG2_AND_49_o1 : LUT4
    generic map(
      INIT => X"4440"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG2_418,
      I1 => U0_gpcs_pma_inst_RECEIVER_I_REG_155,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_MATCH_2_406,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_REMOVED_REG2_420,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_IDLE_INSERTED_REG2_AND_49_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mxor_MR_AN_ENABLE_REG1_MR_AN_ENABLE_REG2_XOR_56_o_xo_0_1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG1_377,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG2_376,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_REG1_MR_AN_ENABLE_REG2_XOR_56_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PWR_22_o_STATE_3_equal_58_o1 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PWR_22_o_STATE_3_equal_58_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0588_inv1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_442,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_439,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0588_inv
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_PHY_MODE_TX_CONFIG_REG_INT_15_OR_72_o1 : LUT3
    generic map(
      INIT => X"7F"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_16_228,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TX_CONFIG_REG_INT_15_Q,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_15_191,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_PHY_MODE_TX_CONFIG_REG_INT_15_OR_72_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_PREVIOUS_STATE_3_equal_63_o_3_1 : LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE(1),
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE(0),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE(3),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PREVIOUS_STATE(2),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_PREVIOUS_STATE_3_equal_63_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_RXCLKCORCNT_0_AND_99_o_0_1 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(0),
      I1 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(1),
      I2 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(2),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_390,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_RXCLKCORCNT_0_AND_99_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_RXCLKCORCNT_0_AND_102_o_0_1 : LUT4
    generic map(
      INIT => X"0080"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(0),
      I1 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(1),
      I2 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(2),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_390,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_RXCLKCORCNT_0_AND_102_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_SYNC_STATUS_OR_99_o1 : LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172,
      I1 => U0_gpcs_pma_inst_SRESET_151,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_SYNC_STATUS_OR_99_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_IDLE_INSERTED_REG4_AND_47_o1 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_I_REG_155,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG2_418,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG4_416,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_IDLE_INSERTED_REG4_AND_47_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_I_REG_155,
      I1 => U0_gpcs_pma_inst_SRESET_151,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_RX_IDLE_OR_22_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT51 : LUT4
    generic map(
      INIT => X"9D15"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_521,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_12_Q,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_4_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT61 : LUT5
    generic map(
      INIT => X"BF379D15"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_521,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_13_Q,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_5_Q,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_5_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT81 : LUT5
    generic map(
      INIT => X"BF379D15"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_521,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_15_Q,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_7_Q,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_7_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT31 : LUT3
    generic map(
      INIT => X"15"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_521,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_2_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT5111 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFEFFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_T_527,
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_V_516,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_S_529,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_518,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_R_517,
      O => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT511
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_TX_PACKET_CODE_GRP_CNT_1_MUX_471_o11 : LUT4
    generic map(
      INIT => X"44E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_519,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_PWR_23_o_MUX_464_o,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_CODE_GRP_CNT_1_MUX_471_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_DISP3_K28p5_OR_122_o1 : LUT5
    generic map(
      INIT => X"BFFAEAAF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_K28p5_524,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(7),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(6),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(5),
      I4 => U0_gpcs_pma_inst_TRANSMITTER_DISP5,
      O => U0_gpcs_pma_inst_TRANSMITTER_DISP3_K28p5_OR_122_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_DISP51 : LUT5
    generic map(
      INIT => X"E881811F"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(3),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(4),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(1),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(2),
      I4 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_DISP5
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT41 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      O => U0_gpcs_pma_inst_TRANSMITTER_Mram_CODE_GRP_CNT_1_GND_28_o_Mux_5_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT51 : LUT4
    generic map(
      INIT => X"FE54"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_519,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT511,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(4),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(4),
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_4_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT61 : LUT4
    generic map(
      INIT => X"FE54"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_519,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT511,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(5),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(5),
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_5_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT81 : LUT4
    generic map(
      INIT => X"FE54"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_519,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT511,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(7),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(7),
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_7_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT11 : LUT4
    generic map(
      INIT => X"8A02"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_521,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_8_Q,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_0_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT21 : LUT3
    generic map(
      INIT => X"08"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_521,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_1_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT71 : LUT4
    generic map(
      INIT => X"A280"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_CONFIG_14_Q,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_521,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT_1_TX_CONFIG_15_wide_mux_4_OUT_6_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_T_OR_112_o1 : LUT6
    generic map(
      INIT => X"FFFF444044404440"
    )
    port map (
      I0 => gmii_tx_en,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_548,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_S_529,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_518,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_526,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_V_516,
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_T_OR_112_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_S_OR_110_o11 : LUT6
    generic map(
      INIT => X"FFFFFFFF45455545"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_S_528,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_548,
      I2 => gmii_tx_en,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I4 => U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1_547,
      I5 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_S_OR_110_o_0
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mcount_CODE_GRP_CNT_xor_1_11 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_Result(1)
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_TX_PACKET_PWR_23_o_MUX_464_o11 : LUT6
    generic map(
      INIT => X"FFFFFFFF00000001"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_S_529,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_V_516,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_T_527,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_R_517,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_518,
      I5 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_PWR_23_o_MUX_464_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_EN_EVEN_AND_109_o1 : LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => gmii_tx_en,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1_547,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_548,
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_EVEN_AND_109_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_EVEN_AND_143_o1 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_538,
      O => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_EVEN_AND_143_o
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0379_inv1 : LUT5
    generic map(
      INIT => X"BAAAAAAA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_EN_588,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(4),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(2),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG3_597,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0456_inv11,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0379_inv
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_Mmux_GND_22_o_AN_ADV_REG_12_MUX_170_o11 : LUT6
    generic map(
      INIT => X"88D8888888888888"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_EN_588,
      I1 => an_adv_config_vector(12),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(2),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(4),
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0456_inv11,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(12),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_GND_22_o_AN_ADV_REG_12_MUX_170_o
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_Mmux_GND_22_o_AN_ADV_REG_13_MUX_169_o11 : LUT6
    generic map(
      INIT => X"88D8888888888888"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_EN_588,
      I1 => an_adv_config_vector(13),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(2),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(4),
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0456_inv11,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(13),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_GND_22_o_AN_ADV_REG_13_MUX_169_o
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0456_inv111 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_WE_596,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(3),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(1),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(0),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0456_inv11
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_Mmux_DATA_RD12111 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_Mmux_DATA_RD1211
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_Mmux_UNIDIRECTIONAL_ENABLE_REG_DATA_WR_5_MUX_130_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_GND_22_o_MDIO_WE_AND_16_o,
      I1 => configuration_vector(0),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(5),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_UNIDIRECTIONAL_ENABLE_REG_DATA_WR_5_MUX_130_o
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_Mmux_ISOLATE_REG_DATA_WR_10_MUX_128_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_GND_22_o_MDIO_WE_AND_16_o,
      I1 => configuration_vector(3),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(10),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG_DATA_WR_10_MUX_128_o
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_Mmux_LOOPBACK_REG_DATA_WR_14_MUX_120_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_GND_22_o_MDIO_WE_AND_16_o,
      I1 => configuration_vector(1),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(14),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_DATA_WR_14_MUX_120_o
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT_xor_2_11 : LUT6
    generic map(
      INIT => X"A9A9A9A9FFA9A9A9"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(2),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(1),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(0),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_654,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT2
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT_xor_3_11 : LUT6
    generic map(
      INIT => X"99999999F9980999"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(3),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT_xor_3_14,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_653,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_654,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT3
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0141_inv1 : LUT6
    generic map(
      INIT => X"AAAAAAAA20022000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_594,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_654,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_653,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_In1_622,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0141_inv
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_In1 : LUT4
    generic map(
      INIT => X"6AAA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_653,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_594,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_In
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mmux_GND_24_o_GND_24_o_MUX_62_o11 : LUT5
    generic map(
      INIT => X"00800000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_654,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_OPCODE(0),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_OPCODE(1),
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_655,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_GND_24_o_GND_24_o_MUX_62_o
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mmux_GND_24_o_PWR_20_o_MUX_63_o11 : LUT5
    generic map(
      INIT => X"00800000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_654,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_OPCODE(1),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_OPCODE(0),
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_655,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_GND_24_o_PWR_20_o_MUX_63_o
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB21 : LUT6
    generic map(
      INIT => X"8008200240041000"
    )
    port map (
      I0 => phyad(3),
      I1 => phyad(4),
      I2 => phyad(2),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_1_1_1011,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3),
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB2_621
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mmux_STATE_3_PWR_20_o_Mux_36_o12 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFB4051"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_In1_622,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_654,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(15),
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mmux_STATE_3_PWR_20_o_Mux_36_o11_620,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_3_PWR_20_o_Mux_36_o
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mmux_STATE_3_PWR_20_o_Mux_37_o11 : LUT5
    generic map(
      INIT => X"FFFF1011"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_654,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_In1_622,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mmux_STATE_3_PWR_20_o_Mux_36_o11_620,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_3_PWR_20_o_Mux_37_o
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_In1 : LUT5
    generic map(
      INIT => X"CAAA8AAA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_654,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_594,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_653,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_In
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In11 : LUT5
    generic map(
      INIT => X"00000400"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(3),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_653,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT_xor_3_14,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT_xor_3_141 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(2),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(0),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(1),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT_xor_3_14
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux911 : LUT5
    generic map(
      INIT => X"EA40AA00"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_Mmux_DATA_RD1211,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1011,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_3_Q
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG1_PWR_20_o_AND_3_o1 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG1_657,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_654,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG1_PWR_20_o_AND_3_o
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_594,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_LAST_DATA_SHIFT_650,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_Mmux_GOOD_CGS_1_GND_29_o_mux_30_OUT21 : LUT6
    generic map(
      INIT => X"0000577757770000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_678,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_675,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_676,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_677,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(0),
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(1),
      O => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_GND_29_o_mux_30_OUT_1_Q
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_n0103_inv1 : LUT5
    generic map(
      INIT => X"A888FFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_678,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_675,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_677,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_676,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_n0103_inv
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_Mmux_GOOD_CGS_1_GND_29_o_mux_30_OUT11 : LUT5
    generic map(
      INIT => X"01115555"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(0),
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_675,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_677,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_676,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_678,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_GND_29_o_mux_30_OUT_0_Q
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_In21 : LUT6
    generic map(
      INIT => X"F2A8F2AAAA28AA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_675,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_676,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_678,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_PWR_24_o_equal_19_o,
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_677,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_In2
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_GND_29_o_CGBAD_OR_129_o1 : LUT5
    generic map(
      INIT => X"A8A10001"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_675,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_678,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_676,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_677,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_GND_29_o_CGBAD_OR_129_o
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_01 : LUT3
    generic map(
      INIT => X"AB"
    )
    port map (
      I0 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_SIGNAL_DETECT_REG_692,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In1_0
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_PWR_24_o_equal_19_o_1_1 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(0),
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(1),
      O => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_PWR_24_o_equal_19_o
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD_GND_29_o_AND_153_o1 : LUT5
    generic map(
      INIT => X"00000008"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_678,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_676,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_677,
      I3 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD_GND_29_o_AND_153_o
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD1 : LUT5
    generic map(
      INIT => X"FFFFFEFC"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCHARISCOMMA_INT_150,
      I1 => U0_gpcs_pma_inst_RXDISPERR_INT_140,
      I2 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_139,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_173,
      I4 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      O => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_30_o_mux_9_OUT21 : LUT4
    generic map(
      INIT => X"5554"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_793,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_792,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_778,
      I3 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(1),
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_1_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_30_o_mux_9_OUT41 : LUT4
    generic map(
      INIT => X"5554"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_793,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_792,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_778,
      I3 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(3),
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_3_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_30_o_mux_9_OUT31 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(2),
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_792,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_778,
      I3 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_793,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_2_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_30_o_mux_9_OUT61 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(5),
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_792,
      I2 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_793,
      I3 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_778,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_5_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_30_o_mux_9_OUT81 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(7),
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_792,
      I2 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_793,
      I3 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_778,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_7_Q
    );
  U0_gpcs_pma_inst_RECEIVER_K29p71 : LUT4
    generic map(
      INIT => X"0080"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I1 => U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_212_o1_694,
      I2 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(1),
      O => U0_gpcs_pma_inst_RECEIVER_K29p7
    );
  U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_219_o1 : LUT6
    generic map(
      INIT => X"5555555500000040"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I1 => U0_gpcs_pma_inst_RECEIVER_C_REG2_696,
      I2 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(0),
      I3 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(1),
      I4 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(2),
      I5 => U0_gpcs_pma_inst_RECEIVER_C_807,
      O => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_219_o
    );
  U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_212_o11 : LUT6
    generic map(
      INIT => X"8000000000000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I1 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I5 => U0_gpcs_pma_inst_RXDATA_INT(7),
      O => U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_212_o1_694
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_30_o_mux_9_OUT11 : LUT4
    generic map(
      INIT => X"FF54"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_778,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_792,
      I2 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(0),
      I3 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_793,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_0_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_30_o_mux_9_OUT51 : LUT5
    generic map(
      INIT => X"FFFF4540"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_778,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_ERR_767,
      I2 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_792,
      I3 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(4),
      I4 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_793,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_4_Q
    );
  U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_226_o21 : LUT4
    generic map(
      INIT => X"1110"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I1 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_798,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_796,
      I3 => U0_gpcs_pma_inst_RECEIVER_C_REG1_800,
      O => U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_226_o2
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_7_RXNOTINTABLE_AND_312_o1 : LUT4
    generic map(
      INIT => X"4100"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_139,
      I1 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I3 => U0_gpcs_pma_inst_RECEIVER_K28p51_695,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_7_RXNOTINTABLE_AND_312_o
    );
  U0_gpcs_pma_inst_RECEIVER_S_WAIT_FOR_K_AND_245_o1 : LUT5
    generic map(
      INIT => X"08080800"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_LINK_OK,
      I1 => U0_gpcs_pma_inst_RECEIVER_S_810,
      I2 => U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_753,
      I3 => U0_gpcs_pma_inst_RECEIVER_EXTEND_749,
      I4 => U0_gpcs_pma_inst_RECEIVER_I_REG_155,
      O => U0_gpcs_pma_inst_RECEIVER_S_WAIT_FOR_K_AND_245_o
    );
  U0_gpcs_pma_inst_RECEIVER_LINK_OK_K28p5_REG2_AND_239_o1 : LUT4
    generic map(
      INIT => X"4440"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_LINK_OK,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG2_805,
      I2 => U0_gpcs_pma_inst_RECEIVER_CGBAD_781,
      I3 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_798,
      O => U0_gpcs_pma_inst_RECEIVER_LINK_OK_K28p5_REG2_AND_239_o
    );
  U0_gpcs_pma_inst_RECEIVER_K23p71 : LUT4
    generic map(
      INIT => X"0080"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_212_o1_694,
      I1 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(3),
      O => U0_gpcs_pma_inst_RECEIVER_K23p7
    );
  U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_212_o1 : LUT5
    generic map(
      INIT => X"00200000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I3 => U0_gpcs_pma_inst_RECEIVER_RXFIFO_ERR_RXDISPERR_OR_131_o,
      I4 => U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_212_o1_694,
      O => U0_gpcs_pma_inst_RECEIVER_K27p7_RXFIFO_ERR_AND_212_o
    );
  U0_gpcs_pma_inst_RECEIVER_K28p52 : LUT3
    generic map(
      INIT => X"40"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I2 => U0_gpcs_pma_inst_RECEIVER_K28p51_695,
      O => U0_gpcs_pma_inst_RECEIVER_K28p5
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RXDATA_REG5_7_GND_30_o_mux_9_OUT71 : LUT4
    generic map(
      INIT => X"FF10"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_778,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_792,
      I2 => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(6),
      I3 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_793,
      O => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7_GND_30_o_mux_9_OUT_6_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_3_RXDATA_3_MUX_493_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_219_o,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(3),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(3),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_3_RXDATA_3_MUX_493_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_5_RXDATA_5_MUX_491_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_219_o,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(5),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(5),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_5_RXDATA_5_MUX_491_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_4_RXDATA_4_MUX_492_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_219_o,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(4),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(4),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_4_RXDATA_4_MUX_492_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_6_RXDATA_6_MUX_490_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_219_o,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(6),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(6),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_6_RXDATA_6_MUX_490_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_7_RXDATA_7_MUX_489_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_219_o,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(7),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(7),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_7_RXDATA_7_MUX_489_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_0_RXDATA_0_MUX_496_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_219_o,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(0),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(0),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_0_RXDATA_0_MUX_496_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_2_RXDATA_2_MUX_494_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_219_o,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(2),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(2),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_2_RXDATA_2_MUX_494_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_1_RXDATA_1_MUX_495_o11 : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_C_AND_219_o,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(1),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(1),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_1_RXDATA_1_MUX_495_o
    );
  U0_gpcs_pma_inst_RECEIVER_IDLE_REG_1_IDLE_REG_2_OR_209_o1 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(1),
      I1 => U0_gpcs_pma_inst_RECEIVER_IDLE_REG(2),
      O => U0_gpcs_pma_inst_RECEIVER_IDLE_REG_1_IDLE_REG_2_OR_209_o
    );
  U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_0_RX_CONFIG_VALID_REG_3_OR_208_o_0_1 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(0),
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(1),
      I2 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(2),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG(3),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_REG_0_RX_CONFIG_VALID_REG_3_OR_208_o
    );
  U0_gpcs_pma_inst_RECEIVER_RX_RUDI_INVALID1 : LUT3
    generic map(
      INIT => X"AB"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_INVALID_751,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172,
      I2 => U0_gpcs_pma_inst_XMIT_DATA,
      O => U0_gpcs_pma_inst_RX_RUDI_INVALID
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_EXT_ILLEGAL_K_REG2_OR_178_o1 : LUT3
    generic map(
      INIT => X"F8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_791,
      I1 => U0_gpcs_pma_inst_RECEIVER_CGBAD_REG3_780,
      I2 => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_REG2_764,
      O => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_EXT_ILLEGAL_K_REG2_OR_178_o
    );
  U0_gpcs_pma_inst_RECEIVER_EOP_REG1_SYNC_STATUS_OR_182_o1 : LUT4
    generic map(
      INIT => X"ABFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_EOP_REG1_772,
      I1 => U0_gpcs_pma_inst_RECEIVER_RECEIVE_750,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172,
      I3 => U0_gpcs_pma_inst_XMIT_DATA,
      O => U0_gpcs_pma_inst_RECEIVER_EOP_REG1_SYNC_STATUS_OR_182_o
    );
  U0_gpcs_pma_inst_RECEIVER_EOP_EXTEND_OR_160_o1 : LUT3
    generic map(
      INIT => X"F8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_EXTEND_749,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_792,
      I2 => U0_gpcs_pma_inst_RECEIVER_EOP_773,
      O => U0_gpcs_pma_inst_RECEIVER_EOP_EXTEND_OR_160_o
    );
  U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_K28p5_REG1_AND_268_o1 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_798,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_806,
      I2 => U0_gpcs_pma_inst_RECEIVER_R_782,
      I3 => U0_gpcs_pma_inst_RECEIVER_T_809,
      O => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_K28p5_REG1_AND_268_o
    );
  U0_gpcs_pma_inst_RECEIVER_LINK_OK_WAIT_FOR_K_AND_237_o1 : LUT4
    generic map(
      INIT => X"0002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_I_REG_155,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_806,
      I2 => U0_gpcs_pma_inst_RECEIVER_LINK_OK,
      I3 => U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_753,
      O => U0_gpcs_pma_inst_RECEIVER_LINK_OK_WAIT_FOR_K_AND_237_o
    );
  U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_EVEN_AND_228_o1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_806,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_173,
      O => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_EVEN_AND_228_o
    );
  U0_gpcs_pma_inst_RECEIVER_RXFIFO_ERR_RXDISPERR_OR_131_o1 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I1 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_139,
      I2 => U0_gpcs_pma_inst_RXDISPERR_INT_140,
      O => U0_gpcs_pma_inst_RECEIVER_RXFIFO_ERR_RXDISPERR_OR_131_o
    );
  U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o1 : LUT2
    generic map(
      INIT => X"D"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172,
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      O => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_SW0 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_I_REG_155,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_394,
      O => N2
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1 : LUT6
    generic map(
      INIT => X"0000008200000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_2_410,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(15),
      I2 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_379,
      I4 => N2,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_242
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_In2_SW0 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_446,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3_407,
      O => N4
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_In2 : LUT6
    generic map(
      INIT => X"22221030AAAAAAAA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_404,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I3 => N4,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_409,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_In2_287
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In21 : LUT6
    generic map(
      INIT => X"0000FFFF0FBFFFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_446,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3_407,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_409,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_404,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In21_813
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In22 : LUT5
    generic map(
      INIT => X"002F2F2F"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_404,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_409,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_393,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_PHY_MODE_TX_CONFIG_REG_INT_15_OR_72_o,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In22_814
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In23 : LUT6
    generic map(
      INIT => X"F0F2F0F2F0F20022"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_182,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In21_813,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In22_814,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In2
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB91 : LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(7),
      I1 => link_timer_value(7),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(6),
      I3 => link_timer_value(6),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(5),
      I5 => link_timer_value(5),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB9
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB92 : LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(2),
      I1 => link_timer_value(2),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(1),
      I3 => link_timer_value(1),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(8),
      I5 => link_timer_value(8),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB91_816
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB93 : LUT6
    generic map(
      INIT => X"9009000000009009"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(0),
      I1 => link_timer_value(0),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(4),
      I3 => link_timer_value(4),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(3),
      I5 => link_timer_value(3),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB92_817
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB94 : LUT3
    generic map(
      INIT => X"80"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB9,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB91_816,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB92_817,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_COMB
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In1 : LUT6
    generic map(
      INIT => X"0FFF333307773333"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_MATCH_405,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_393,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_404,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_409,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In1_818
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER21 : LUT6
    generic map(
      INIT => X"2A00000000000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_393,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_404,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_409,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SGMII_PHY_MODE_TX_CONFIG_REG_INT_15_OR_72_o,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER2
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER22 : LUT6
    generic map(
      INIT => X"FCFFFCFFCCCE0002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_182,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER2,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER12,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER21_820
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_8_SW0 : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(3),
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(2),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(0),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(1),
      O => N6
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_RX_CONFIG_REG_15_equal_17_o1 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(1),
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(0),
      I2 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(2),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(3),
      I4 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(4),
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(5),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_RX_CONFIG_REG_15_equal_17_o1_822
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_RX_CONFIG_REG_15_equal_17_o2 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(11),
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(10),
      I2 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(9),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(8),
      I4 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(6),
      I5 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(7),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_RX_CONFIG_REG_15_equal_17_o2_823
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_RX_CONFIG_REG_15_equal_17_o3 : LUT6
    generic map(
      INIT => X"0001000000000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(14),
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(12),
      I2 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(13),
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_RX_CONFIG_REG_15_equal_17_o1_822,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_RX_CONFIG_REG_15_equal_17_o2_823,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_RX_CONFIG_REG_15_equal_17_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT4_SW0 : LUT4
    generic map(
      INIT => X"FF51"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_R_517,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_518,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(3),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_S_529,
      O => N10
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT4 : LUT6
    generic map(
      INIT => X"FFFFFFFE55555554"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_519,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_V_516,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_T_527,
      I3 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      I4 => N10,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(3),
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_3_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT7_SW0 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_S_529,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_518,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(6),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_R_517,
      O => N12
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT7 : LUT6
    generic map(
      INIT => X"DDDDDDDC11111110"
    )
    port map (
      I0 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_519,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_V_516,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_T_527,
      I4 => N12,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(6),
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_6_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT3_SW0 : LUT4
    generic map(
      INIT => X"FFEF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_R_517,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_T_527,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_518,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(2),
      O => N14
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT3 : LUT6
    generic map(
      INIT => X"FFFFBBBA55551110"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_519,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_S_529,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_V_516,
      I3 => N14,
      I4 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(2),
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_2_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_121_o1 : LUT6
    generic map(
      INIT => X"FFFFFFFDFFFFFFFF"
    )
    port map (
      I0 => gmii_txd(3),
      I1 => gmii_txd(7),
      I2 => gmii_txd(4),
      I3 => gmii_txd(5),
      I4 => gmii_txd(6),
      I5 => gmii_txd(2),
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_121_o1_827
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_121_o2 : LUT6
    generic map(
      INIT => X"A8AAAAAA20222222"
    )
    port map (
      I0 => gmii_tx_er,
      I1 => gmii_tx_en,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_121_o1_827,
      I3 => gmii_txd(0),
      I4 => gmii_txd(1),
      I5 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_518,
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_121_o2_828
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT2_SW0 : LUT4
    generic map(
      INIT => X"5540"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_T_527,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_518,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(1),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_R_517,
      O => N16
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT2 : LUT6
    generic map(
      INIT => X"DDDDDDDC11111110"
    )
    port map (
      I0 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_519,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_V_516,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_S_529,
      I4 => N16,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(1),
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_1_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT1_SW0 : LUT4
    generic map(
      INIT => X"FFEA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_T_527,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_518,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TXD_REG1(0),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_R_517,
      O => N18
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_PWR_23_o_CONFIG_DATA_7_mux_21_OUT1 : LUT6
    generic map(
      INIT => X"DCDDDCDC10111010"
    )
    port map (
      I0 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_519,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_S_529,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_V_516,
      I4 => N18,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_PWR_23_o_CONFIG_DATA_7_mux_21_OUT_0_Q
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0386_inv_SW0 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_IDLE_DETECT_REG1_579,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_IDLE_222,
      O => N20
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0386_inv : LUT6
    generic map(
      INIT => X"FFAAAEAAFFAAAAAA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_EN_588,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(2),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(4),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG3_597,
      I4 => N20,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0456_inv11,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0386_inv_568
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT_xor_1_1_SW0 : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_653,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(3),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(2),
      O => N24
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT_xor_1_1 : LUT6
    generic map(
      INIT => X"9999999909099899"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(1),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(0),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I3 => N24,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_654,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT1
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0147_inv_SW0 : LUT3
    generic map(
      INIT => X"FB"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(1),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_594,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(0),
      O => N26
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0147_inv : LUT6
    generic map(
      INIT => X"0000000000000008"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(2),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_653,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(3),
      I5 => N26,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0147_inv_633
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB1 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_2_1_1010,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB1_834
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB2 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => phyad(3),
      I1 => phyad(4),
      I2 => phyad(2),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB3_835
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB3 : LUT6
    generic map(
      INIT => X"002008FF00000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB3_835,
      I1 => phyad(1),
      I2 => phyad(0),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB1_834,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB4_836
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB4 : LUT6
    generic map(
      INIT => X"8040201008040216"
    )
    port map (
      I0 => phyad(3),
      I1 => phyad(4),
      I2 => phyad(2),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_2_2_1016,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3),
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB5_837
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB5 : LUT4
    generic map(
      INIT => X"9810"
    )
    port map (
      I0 => phyad(1),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB5_837,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB2_621,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB6_838
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB6 : LUT6
    generic map(
      INIT => X"8008200200000000"
    )
    port map (
      I0 => phyad(1),
      I1 => phyad(2),
      I2 => phyad(3),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_2_1_1010,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB7_839
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB7 : LUT6
    generic map(
      INIT => X"C3D7C3C300550000"
    )
    port map (
      I0 => phyad(1),
      I1 => phyad(4),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB2_621,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB7_839,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB8_840
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB8 : LUT5
    generic map(
      INIT => X"F9F1F8F0"
    )
    port map (
      I0 => phyad(0),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB4_836,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB8_840,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB6_838,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT_xor_0_1_SW0 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(3),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(2),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(1),
      O => N28
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT_xor_0_1 : LUT6
    generic map(
      INIT => X"55555555D145D155"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(0),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_653,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651,
      I4 => N28,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_654,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In_SW0 : LUT5
    generic map(
      INIT => X"ABC4AAC4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_654,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_653,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      O => N30
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In : LUT4
    generic map(
      INIT => X"EEE4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_594,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I2 => N30,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In_631
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_In1 : LUT5
    generic map(
      INIT => X"A2A2A2F6"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_654,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_653,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(3),
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT_xor_3_14,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_In2
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mmux_STATE_3_PWR_20_o_Mux_36_o11_SW0 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_OPCODE(1),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_655,
      O => N32
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mmux_STATE_3_PWR_20_o_Mux_36_o11 : LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFAFAD"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_654,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_653,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_OPCODE(0),
      I5 => N32,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mmux_STATE_3_PWR_20_o_Mux_36_o11_620
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux131_SW0 : LUT5
    generic map(
      INIT => X"FFFF15B5"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_7_187,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      I3 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_8,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      O => N34
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux131 : LUT6
    generic map(
      INIT => X"AAAB0003AAAA0000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(6),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      I3 => N34,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1011,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_7_Q
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux141_SW0 : LUT5
    generic map(
      INIT => X"FFFF028A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_8_188,
      I3 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_9,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      O => N36
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux141 : LUT6
    generic map(
      INIT => X"AAAB0003AAAA0000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(7),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      I3 => N36,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1011,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_8_Q
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux151_SW0 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_REG_181,
      O => N38
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux151 : LUT6
    generic map(
      INIT => X"ABAA0300AAAA0000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(8),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      I2 => N38,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_Mmux_DATA_RD1211,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1011,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_9_Q
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux121_SW0 : LUT4
    generic map(
      INIT => X"FF2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_7_225,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      O => N40
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux121 : LUT6
    generic map(
      INIT => X"AAAB0003AAAA0000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(5),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      I3 => N40,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1011,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_6_Q
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux11111 : LUT6
    generic map(
      INIT => X"FD75B931EC64A820"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE_221,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_6_230,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_5_186,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_UNIDIRECTIONAL_ENABLE_REG_584,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1111
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux11112 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux11111_850
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux11113 : LUT5
    generic map(
      INIT => X"EAC0AA00"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(4),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux11111_850,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1111,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1011,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_5_Q
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux101_SW0 : LUT2
    generic map(
      INIT => X"7"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT,
      O => N42
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux101 : LUT6
    generic map(
      INIT => X"ABAA0300AAAA0000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      I2 => N42,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_Mmux_DATA_RD1211,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1011,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_4_Q
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux611 : LUT4
    generic map(
      INIT => X"00CA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESET_REG_184,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_15_191,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux61
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux612 : LUT6
    generic map(
      INIT => X"80805D5580800800"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_16_228,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux61,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux611_853
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux613 : LUT5
    generic map(
      INIT => X"BA30AA00"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(14),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux611_853,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1011,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_15_Q
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux71_SW0 : LUT3
    generic map(
      INIT => X"FB"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_INT,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      O => N44
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux71 : LUT6
    generic map(
      INIT => X"CCCE0002CCCC0000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      I3 => N44,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1011,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_1_Q
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux41_SW0 : LUT5
    generic map(
      INIT => X"ABEFFFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_13_190,
      I3 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_14,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      O => N48
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux41 : LUT6
    generic map(
      INIT => X"AAAB0003AAAA0000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(12),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      I3 => N48,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1011,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_13_Q
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux51_SW0 : LUT5
    generic map(
      INIT => X"FFFF6E7F"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_15_227,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_LOOPBACK_REG_183,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      O => N50
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux51 : LUT6
    generic map(
      INIT => X"AAAB0003AAAA0000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(13),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      I3 => N50,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1011,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_14_Q
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux31_SW0 : LUT6
    generic map(
      INIT => X"FFFFFFFF515BF1FB"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_182,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_12_189,
      I4 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_13,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      O => N52
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux31 : LUT6
    generic map(
      INIT => X"AAAB0003AAAA0000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(11),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      I3 => N52,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1011,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_12_Q
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux16_SW0 : LUT3
    generic map(
      INIT => X"AB"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_ENABLE_582,
      O => N54
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux16 : LUT6
    generic map(
      INIT => X"F0F20002F0F00000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I3 => N54,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1011,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_0_Q
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux21_SW0 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_POWERDOWN_REG,
      O => N56
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux21 : LUT6
    generic map(
      INIT => X"ABAA0300AAAA0000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(10),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      I2 => N56,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_Mmux_DATA_RD1211,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1011,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_11_Q
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux111_SW0 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      O => N58
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux111 : LUT6
    generic map(
      INIT => X"ABAA0300AAAA0000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(9),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      I2 => N58,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_Mmux_DATA_RD1211,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1011,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_10_Q
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In32 : LUT6
    generic map(
      INIT => X"7777555722220002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_678,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_677,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      I3 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_675,
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In31_861,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In3
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In21 : LUT6
    generic map(
      INIT => X"91C49BE4DD80DFA0"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_678,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_675,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_677,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_676,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_PWR_24_o_equal_19_o,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In21_862
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In22 : LUT5
    generic map(
      INIT => X"4040FF40"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_678,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_676,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_677,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In21_862,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_In2
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_ISOLATE_AND_283_o_SW0 : LUT3
    generic map(
      INIT => X"01"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_771,
      I1 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG3_778,
      I2 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_792,
      O => N64
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_ISOLATE_AND_283_o : LUT6
    generic map(
      INIT => X"0002020200000200"
    )
    port map (
      I0 => U0_gpcs_pma_inst_XMIT_DATA,
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_POWERDOWN_REG,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172,
      I4 => N64,
      I5 => U0_gpcs_pma_inst_RECEIVER_RECEIVE_750,
      O => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_ISOLATE_AND_283_o_737
    );
  U0_gpcs_pma_inst_RECEIVER_I_REG_LINK_OK_AND_232_o_SW0 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_806,
      I1 => U0_gpcs_pma_inst_RECEIVER_S_810,
      O => N66
    );
  U0_gpcs_pma_inst_RECEIVER_I_REG_LINK_OK_AND_232_o : LUT6
    generic map(
      INIT => X"0000010000000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_763,
      I1 => U0_gpcs_pma_inst_RECEIVER_FALSE_K_762,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_761,
      I3 => U0_gpcs_pma_inst_RECEIVER_I_REG_155,
      I4 => N66,
      I5 => U0_gpcs_pma_inst_RECEIVER_LINK_OK,
      O => U0_gpcs_pma_inst_RECEIVER_I_REG_LINK_OK_AND_232_o_718
    );
  U0_gpcs_pma_inst_RECEIVER_EVEN_RXCHARISK_AND_216_o_SW0 : LUT4
    generic map(
      INIT => X"AAA8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_I_REG_155,
      I1 => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_761,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_K_762,
      I3 => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_763,
      O => N68
    );
  U0_gpcs_pma_inst_RECEIVER_EVEN_RXCHARISK_AND_216_o : LUT6
    generic map(
      INIT => X"00000000AA880808"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_173,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_806,
      I2 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I3 => N68,
      I4 => U0_gpcs_pma_inst_RECEIVER_LINK_OK,
      I5 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_D21p5_AND_217_o_norst,
      O => U0_gpcs_pma_inst_RECEIVER_EVEN_RXCHARISK_AND_216_o_740
    );
  U0_gpcs_pma_inst_RECEIVER_K28p51_SW0 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I1 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      O => N70
    );
  U0_gpcs_pma_inst_RECEIVER_K28p51 : LUT6
    generic map(
      INIT => X"0000000000800000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I5 => N70,
      O => U0_gpcs_pma_inst_RECEIVER_K28p51_695
    );
  U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_133_o1 : LUT6
    generic map(
      INIT => X"0000800000000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I5 => U0_gpcs_pma_inst_RXDATA_INT(2),
      O => U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_133_o
    );
  U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_133_o2 : LUT6
    generic map(
      INIT => X"0000010000000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I5 => U0_gpcs_pma_inst_RXDATA_INT(1),
      O => U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_133_o1_868
    );
  U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_133_o3 : LUT6
    generic map(
      INIT => X"0013001100030000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I3 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I4 => U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_133_o,
      I5 => U0_gpcs_pma_inst_RECEIVER_D21p5_D2p2_OR_133_o1_868,
      O => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_D21p5_AND_217_o_norst
    );
  U0_gpcs_pma_inst_RECEIVER_D0p0_SW0 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I2 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I3 => U0_gpcs_pma_inst_RXDATA_INT(0),
      O => N72
    );
  U0_gpcs_pma_inst_RECEIVER_D0p0 : LUT6
    generic map(
      INIT => X"0000000000000001"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I5 => N72,
      O => U0_gpcs_pma_inst_RECEIVER_D0p0_702
    );
  U0_gpcs_pma_inst_RECEIVER_C_REG1_C_REG3_OR_154_o_SW0 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_C_REG2_696,
      I1 => U0_gpcs_pma_inst_RECEIVER_C_REG1_800,
      O => N74
    );
  U0_gpcs_pma_inst_RECEIVER_C_REG1_C_REG3_OR_154_o : LUT6
    generic map(
      INIT => X"FFFFAA2AFF2AAA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_C_REG3_799,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_173,
      I2 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_806,
      I3 => U0_gpcs_pma_inst_RECEIVER_CGBAD_781,
      I4 => N74,
      I5 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_798,
      O => U0_gpcs_pma_inst_RECEIVER_C_REG1_C_REG3_OR_154_o_700
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o1 : LUT5
    generic map(
      INIT => X"00200000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(1),
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o1_871
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o2 : LUT4
    generic map(
      INIT => X"0254"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(1),
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o2_872
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o3 : LUT4
    generic map(
      INIT => X"4000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(2),
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o3_873
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o4 : LUT6
    generic map(
      INIT => X"FF171717FF000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(3),
      I2 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I3 => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o2_872,
      I4 => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o3_873,
      I5 => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o1_871,
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o4_874
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o5 : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_139,
      I1 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o4_874,
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_DATA_POS_RXNOTINTABLE_AND_304_o
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_203_o11 : LUT6
    generic map(
      INIT => X"E8FFFFFFFFFFFFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I1 => U0_gpcs_pma_inst_RXDISPERR_INT_140,
      I2 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I3 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I5 => U0_gpcs_pma_inst_RXDATA_INT(3),
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_203_o1
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_203_o13 : LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(4),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(6),
      I2 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I3 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(3),
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_203_o13_877
    );
  U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_159_o1 : LUT5
    generic map(
      INIT => X"88888000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_T_REG2_802,
      I1 => U0_gpcs_pma_inst_RECEIVER_R_REG1_801,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_173,
      I3 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_806,
      I4 => U0_gpcs_pma_inst_RECEIVER_R_782,
      O => U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_159_o1_878
    );
  U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_159_o2 : LUT6
    generic map(
      INIT => X"FFFFFF80FF80FF80"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_C_REG1_800,
      I1 => U0_gpcs_pma_inst_RECEIVER_D0p0_REG_804,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_173,
      I3 => U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_159_o1_878,
      I4 => U0_gpcs_pma_inst_RECEIVER_I_REG_155,
      I5 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_806,
      O => U0_gpcs_pma_inst_RECEIVER_I_REG_T_REG2_OR_159_o
    );
  U0_gpcs_pma_inst_RECEIVER_T_REG2_R_REG1_OR_174_o2 : LUT5
    generic map(
      INIT => X"54545554"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_R_REG1_801,
      I1 => U0_gpcs_pma_inst_RECEIVER_T_REG2_802,
      I2 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_806,
      I3 => U0_gpcs_pma_inst_RECEIVER_R_782,
      I4 => U0_gpcs_pma_inst_RECEIVER_T_REG1_803,
      O => U0_gpcs_pma_inst_RECEIVER_T_REG2_R_REG1_OR_174_o2_879
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_8 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_8_glue_rst_880,
      S => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(8)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_7 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_7_glue_rst_881,
      S => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(7)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_6 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_6_glue_rst_882,
      S => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(6)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_5 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_5_glue_rst_883,
      S => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(5)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_4 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_4_glue_rst_884,
      S => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(4)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_3 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_3_glue_rst_885,
      S => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_2 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_2_glue_rst_886,
      S => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_1 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_1_glue_rst_887,
      S => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_0 : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_0_glue_rst_888,
      S => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_glue_set_889,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_392
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_glue_set_890,
      R => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RESET_SYNC_STATUS_OR_99_o,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_378
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_glue_set_891,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_379
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE_glue_set_892,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE_221
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT_glue_set_893,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT_389
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT_glue_set_894,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_glue_rst_895,
      S => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_390
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SYNC_STATUS_HELD : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SYNC_STATUS_HELD_glue_set_896,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SYNC_STATUS_HELD_391
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_IDLE : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_IDLE_glue_set_897,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_IDLE_222
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_glue_set_898,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_393
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_glue_set_899,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_394
    );
  U0_gpcs_pma_inst_TRANSMITTER_V : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_V_glue_set_900,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_V_516
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_glue_set_901,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_518
    );
  U0_gpcs_pma_inst_TRANSMITTER_R : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_R_glue_set_902,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_R_517
    );
  U0_gpcs_pma_inst_TRANSMITTER_DISPARITY : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_glue_rst_903,
      S => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_515
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_DUPLEX_MODE_REG : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_DUPLEX_MODE_REG_glue_set_904,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_DUPLEX_MODE_REG_578
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_5 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_5_glue_set_905,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_5_186
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_7 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_7_glue_set_906,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_7_187
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_8 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_8_glue_set_907,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_8_188
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_glue_set_908,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_182
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_INT : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_INT_glue_set_909,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_INT
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_REG : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_REG_glue_set_910,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_REG_181
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESET_REG : FDRE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG3_597,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESET_REG_glue_set_911,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESET_REG_184
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESET_REG_glue_set : LUT3
    generic map(
      INIT => X"F8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(15),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_GND_22_o_MDIO_WE_AND_16_o,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESET_REG_184,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESET_REG_glue_set_911
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_POWERDOWN_REG : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_POWERDOWN_REG_glue_set_912,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_POWERDOWN_REG
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_NP_TX_REG_13 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_NP_TX_REG_13_glue_set_913,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_NP_TX_REG_13_185
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_NP_TX_REG_13_glue_set : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_NP_TX_REG_13_185,
      I1 => U0_gpcs_pma_inst_SRESET_151,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_NP_TX_REG_13_glue_set_913
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_glue_set_914,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_EVEN : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_glue_set_915,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_173
    );
  U0_gpcs_pma_inst_RECEIVER_RECEIVE : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RECEIVE_glue_set_916,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RECEIVE_750
    );
  U0_gpcs_pma_inst_RECEIVER_RX_INVALID : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_INVALID_glue_set_917,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_INVALID_751
    );
  U0_gpcs_pma_inst_RECEIVER_RX_DV : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_DV_glue_set_918,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_RECEIVER_RX_DV
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXTEND_glue_set_919,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o,
      Q => U0_gpcs_pma_inst_RECEIVER_EXTEND_749
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_glue_set_920,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o,
      Q => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_752
    );
  U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_glue_set_921,
      R => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o,
      Q => U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_753
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(10),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_10_rt_922
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(9),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_9_rt_923
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(8),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_8_rt_924
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(7),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_7_rt_925
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(6),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_6_rt_926
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(5),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_5_rt_927
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(4),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_4_rt_928
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(3),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_3_rt_929
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(2),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_2_rt_930
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(1),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_cy_1_rt_931
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(7),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_7_rt_932
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(6),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_6_rt_933
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(5),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_5_rt_934
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(4),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_4_rt_935
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(3),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_3_rt_936
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(2),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_2_rt_937
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(1),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_cy_1_rt_938
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(11),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_xor_11_rt_939
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(8),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_xor_8_rt_940
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LINK_STATUS : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LINK_STATUS_rstpot_941,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LINK_STATUS_220
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_rstpot : LUT3
    generic map(
      INIT => X"E4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_404,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_RX_CONFIG_REG_15_equal_17_o,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_rstpot_942
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_rstpot_942,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_NULL_404
    );
  U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2 : FDR
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_rstpot_943,
      R => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      Q => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_521
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_15 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_15_rstpot_944,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_15_191
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_ENABLE : FDS
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_ENABLE_rstpot_945,
      S => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_ENABLE_582
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_rstpot_946,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_655
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_rstpot_947,
      Q => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_106
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_rstpot_948,
      Q => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_113
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG3 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG3_rstpot_949,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG3_417
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GENERATE_REMOTE_FAULT : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GENERATE_REMOTE_FAULT_rstpot_950,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GENERATE_REMOTE_FAULT_427
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_rstpot_951,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_442
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_rstpot,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_446
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_rstpot_953,
      Q => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_523
    );
  U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_rstpot : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_519,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_PWR_23_o_MUX_464_o,
      O => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_rstpot_954
    );
  U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_rstpot_954,
      Q => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_525
    );
  U0_gpcs_pma_inst_TRANSMITTER_K28p5 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_K28p5_rstpot_955,
      Q => U0_gpcs_pma_inst_TRANSMITTER_K28p5_524
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_rstpot_956,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_192
    );
  U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_rstpot_957,
      Q => U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_526
    );
  U0_gpcs_pma_inst_TRANSMITTER_S_rstpot : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_TRIGGER_S_OR_110_o_0,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_DATA_INT_520,
      O => U0_gpcs_pma_inst_TRANSMITTER_S_rstpot_958
    );
  U0_gpcs_pma_inst_TRANSMITTER_S : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_TRANSMITTER_S_rstpot_958,
      Q => U0_gpcs_pma_inst_TRANSMITTER_S_529
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_IDLE_DETECT_REG1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_IDLE_DETECT_REG1_rstpot_959,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_IDLE_DETECT_REG1_579
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_EN : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_EN_rstpot_960,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_EN_588
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CONFIGURATION_VALID_EN : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CONFIGURATION_VALID_EN_rstpot_961,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CONFIGURATION_VALID_EN_591
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1 : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_rstpot_962,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_594
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_EN : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_EN_rstpot_963,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_EN_593
    );
  U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_rstpot_964,
      Q => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_796
    );
  U0_gpcs_pma_inst_RECEIVER_C : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_C_rstpot_965,
      Q => U0_gpcs_pma_inst_RECEIVER_C_807
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_rstpot_966,
      Q => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_761
    );
  U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_rstpot_967,
      Q => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_766
    );
  U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_rstpot_968,
      Q => U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_771
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN_rstpot_969,
      Q => NlwRenamedSig_OI_U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_rstpot_970,
      Q => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CLEAR_STATUS_REG : FD
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CLEAR_STATUS_REG_rstpot1_971,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CLEAR_STATUS_REG_180
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_67_o11 : LUT5
    generic map(
      INIT => X"11110001"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_379,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_378,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172,
      I3 => U0_gpcs_pma_inst_XMIT_DATA,
      I4 => U0_gpcs_pma_inst_RECEIVER_RX_INVALID_751,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_67_o1
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_DATA1 : LUT5
    generic map(
      INIT => X"AA00EAEA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_DATA_INT_431,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_DUPLEX_MODE_REG_578,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_UNIDIRECTIONAL_ENABLE_REG_584,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_6_230,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_182,
      O => U0_gpcs_pma_inst_XMIT_DATA
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_glue_set : LUT4
    generic map(
      INIT => X"FCEE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_182,
      I1 => U0_gpcs_pma_inst_SRESET_151,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_DATA_WR_12_MUX_122_o,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0368_inv,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_glue_set_908
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_glue_set : LUT6
    generic map(
      INIT => X"0000000000000054"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG2_438,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_393,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_440,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_439,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_67_o,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER21_820,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_DONE_glue_set_898
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv1 : LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(7),
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(6),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(8),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(5),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(4),
      I5 => N6,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0368_inv1 : LUT5
    generic map(
      INIT => X"ABAAAAAA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CONFIGURATION_VALID_EN_591,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(4),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(2),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG3_597,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0456_inv11,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0368_inv
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_Mmux_AN_ENABLE_REG_DATA_WR_12_MUX_122_o11 : LUT5
    generic map(
      INIT => X"AAACAAAA"
    )
    port map (
      I0 => configuration_vector(4),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(12),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(2),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(4),
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0456_inv11,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_DATA_WR_12_MUX_122_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_67_o11_SW0 : LUT5
    generic map(
      INIT => X"EFEFFFEF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_430,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT_389,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_392,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_390,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_379,
      O => N76
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_67_o11_SW1 : LUT3
    generic map(
      INIT => X"FB"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_430,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_392,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT_389,
      O => N77
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_67_o2 : LUT6
    generic map(
      INIT => X"FF44BB00FF45BA00"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_378,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_INVALID_751,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172,
      I3 => N77,
      I4 => N76,
      I5 => U0_gpcs_pma_inst_XMIT_DATA,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_67_o
    );
  U0_gpcs_pma_inst_RECEIVER_RX_DV_glue_set : LUT6
    generic map(
      INIT => X"00300000AABAAAAA"
    )
    port map (
      I0 => NlwRenamedSig_OI_U0_gpcs_pma_inst_RECEIVER_RX_DV,
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_POWERDOWN_REG,
      I2 => U0_gpcs_pma_inst_RECEIVER_SOP_REG3_793,
      I3 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      I4 => U0_gpcs_pma_inst_RECEIVER_LINK_OK,
      I5 => U0_gpcs_pma_inst_RECEIVER_EOP_REG1_SYNC_STATUS_OR_182_o,
      O => U0_gpcs_pma_inst_RECEIVER_RX_DV_glue_set_918
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_rstpot : LUT3
    generic map(
      INIT => X"F2"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_GND_29_o_CGBAD_OR_129_o,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD_GND_29_o_AND_153_o,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_rstpot_970
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_DUPLEX_MODE_REG_glue_set : LUT6
    generic map(
      INIT => X"5554111055501150"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SRESET_151,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_GND_22_o_MDIO_WE_AND_16_o,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_DUPLEX_MODE_REG_578,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CONFIGURATION_VALID_EN_591,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(8),
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG3_597,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_DUPLEX_MODE_REG_glue_set_904
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN_rstpot : LUT3
    generic map(
      INIT => X"0E"
    )
    port map (
      I0 => NlwRenamedSig_OI_U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_GND_29_o_CGBAD_OR_129_o,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD_GND_29_o_AND_153_o,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_ENCOMMAALIGN_rstpot_969
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_203_o12 : LUT6
    generic map(
      INIT => X"FFFFFFFFA9999995"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(0),
      I1 => U0_gpcs_pma_inst_RXDATA_INT(5),
      I2 => U0_gpcs_pma_inst_RXDISPERR_INT_140,
      I3 => U0_gpcs_pma_inst_RXDATA_INT(7),
      I4 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I5 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_203_o12_876
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_rstpot : LUT6
    generic map(
      INIT => X"AAAEAAAAAAA2AAAA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_655,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_594,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_653,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_COMB,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDRESS_MATCH_rstpot_946
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In2_SW0 : LUT4
    generic map(
      INIT => X"0EEE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In1_818,
      O => N79
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In3 : LUT5
    generic map(
      INIT => X"2222F0FF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_392,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_182,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER12,
      I3 => N79,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_67_o,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux10111 : LUT5
    generic map(
      INIT => X"FFFFFFBF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(3),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_653,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT_xor_3_14,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1011
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_GND_22_o_MDIO_WE_AND_16_o1 : LUT6
    generic map(
      INIT => X"0000000000000010"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(3),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(1),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_WE_596,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(0),
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(2),
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(4),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_GND_22_o_MDIO_WE_AND_16_o
    );
  U0_gpcs_pma_inst_RECEIVER_LINK_OK1 : LUT6
    generic map(
      INIT => X"AA00EAEA00000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_DATA_INT_431,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_DUPLEX_MODE_REG_578,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_UNIDIRECTIONAL_ENABLE_REG_584,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_6_230,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_182,
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172,
      O => U0_gpcs_pma_inst_RECEIVER_LINK_OK
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_0_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_0_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_rstpot_975,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv2_rstpot_972,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_0_dpot1_976
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_1_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_1_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_rstpot_975,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv2_rstpot_972,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(1),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_1_dpot1_977
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_2_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_2_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_rstpot_975,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv2_rstpot_972,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(2),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_2_dpot1_978
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_3_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_3_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_rstpot_975,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv2_rstpot_972,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(3),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_3_dpot1_979
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_4_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_4_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_rstpot_975,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv2_rstpot_972,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(4),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_4_dpot1_980
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_5_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_5_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_rstpot_975,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv2_rstpot_972,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(5),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_5_dpot1_981
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_6_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_6_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_rstpot_975,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv2_rstpot_972,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(6),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_6_dpot1_982
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_7_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_7_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_rstpot_975,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv2_rstpot_972,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(7),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_7_dpot1_983
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_8_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_8_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_rstpot_975,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv2_rstpot_972,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(8),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_8_dpot1_984
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_9_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_9_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_rstpot_975,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv2_rstpot_972,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(9),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_9_dpot1_985
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_10_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_10_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_rstpot_975,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv2_rstpot_972,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(10),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_10_dpot1_986
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_11_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_11_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_rstpot_975,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv2_rstpot_972,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(11),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_11_dpot1_987
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_12_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_12_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_rstpot_975,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv2_rstpot_972,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(12),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_12_dpot1_988
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_rstpot_975,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv2_rstpot_972,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(13),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_dpot1_989
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_15_dpot1 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_15_Q,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_rstpot_975,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv2_rstpot_972,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_15_dpot1_990
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_In11 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(1),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(0),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(2),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(3),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_In1_622
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv2_rstpot : LUT5
    generic map(
      INIT => X"22022222"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_409,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv2_rstpot_972
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux81_SW0_SW0 : LUT4
    generic map(
      INIT => X"FDFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LINK_STATUS_220,
      O => N88
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux81_SW0_SW1 : LUT3
    generic map(
      INIT => X"FB"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(2),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      O => N89
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux81 : LUT6
    generic map(
      INIT => X"CCDD0415CCCC0000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(3),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      I2 => N89,
      I3 => N88,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_mux1011,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_In1,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_2_Q
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER22_SW0 : LUT3
    generic map(
      INIT => X"FB"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_182,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      O => N91
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER22_SW1 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      O => N92
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER23 : LUT6
    generic map(
      INIT => X"FFFFFFFFEEEEAF05"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I1 => N92,
      I2 => N91,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER2,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_START_LINK_TIMER12,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_67_o,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_rstpot_lut : LUT3
    generic map(
      INIT => X"41"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SRESET_151,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_15_Q,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_rstpot_lut_996
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_rstpot_cy : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_SNAPSHOT_13_RX_CONFIG_REG_13_equal_16_o,
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_rstpot_lut_996,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CONSISTENCY_MATCH_rstpot
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ABILITY_MATCH_2_GND_26_o_MUX_260_o11_lut : LUT5
    generic map(
      INIT => X"01000001"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_379,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_394,
      I2 => U0_gpcs_pma_inst_RECEIVER_I_REG_155,
      I3 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(15),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ABILITY_MATCH_2_GND_26_o_MUX_260_o11_lut_997
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ABILITY_MATCH_2_GND_26_o_MUX_260_o11_cy : MUXCY
    port map (
      CI => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG_13_RX_CONFIG_REG_13_equal_8_o,
      DI => NlwRenamedSig_OI_status_vector(7),
      S => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ABILITY_MATCH_2_GND_26_o_MUX_260_o11_lut_997,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_2_GND_26_o_MUX_260_o
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0155_inv1 : LUT6
    generic map(
      INIT => X"0000000000200000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_594,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_BIT_COUNT(3),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_653,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_Mcount_BIT_COUNT_xor_3_14,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_n0155_inv
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT_glue_set : LUT4
    generic map(
      INIT => X"44F4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_MR_AN_ENABLE_OR_82_o,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT_389,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_SET_REG1_429,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_SET_REG2_428,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_RESTART_AN_INT_glue_set_893
    );
  U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_rstpot : LUT4
    generic map(
      INIT => X"6A2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_521,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_519,
      O => U0_gpcs_pma_inst_TRANSMITTER_C1_OR_C2_rstpot_943
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_glue_set : LUT3
    generic map(
      INIT => X"4F"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172,
      I1 => U0_gpcs_pma_inst_RXCHARISCOMMA_INT_150,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_173,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_glue_set_915
    );
  U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_rstpot : LUT6
    generic map(
      INIT => X"0001010101010101"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RESET_INT_177,
      I1 => U0_gpcs_pma_inst_TXBUFERR_INT_134,
      I2 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_106,
      I3 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd2_104,
      I4 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd3_105,
      I5 => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd1_103,
      O => U0_gpcs_pma_inst_TX_RST_SM_FSM_FFd4_rstpot_947
    );
  U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_rstpot : LUT6
    generic map(
      INIT => X"0001010101010101"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RESET_INT_177,
      I1 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I2 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_113,
      I3 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd2_111,
      I4 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd3_112,
      I5 => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd1_110,
      O => U0_gpcs_pma_inst_RX_RST_SM_FSM_FFd4_rstpot_948
    );
  U0_gpcs_pma_inst_TRANSMITTER_V_glue_set_SW0 : LUT2
    generic map(
      INIT => X"B"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_518,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1_547,
      O => N96
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_glue_set_SW0 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(0),
      I1 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(1),
      I2 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(2),
      O => N102
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_glue_set : LUT6
    generic map(
      INIT => X"FFFFFFFF8A8A8AAA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_378,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_INVALID_751,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_RUDI_INVALID_REG_424,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172,
      I4 => U0_gpcs_pma_inst_XMIT_DATA,
      I5 => N102,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_CLKCOR_glue_set_890
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_glue_set_SW0 : LUT4
    generic map(
      INIT => X"7FFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(5),
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(6),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(7),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(8),
      O => N104
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_glue_set : LUT6
    generic map(
      INIT => X"FFFF8AAA8AAA8AAA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_379,
      I1 => N104,
      I2 => N6,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(4),
      I4 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I5 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_glue_set_891
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_ENABLE_rstpot : LUT6
    generic map(
      INIT => X"AAEAAAAAAA2AAAAA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_ENABLE_582,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0456_inv11,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(4),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(2),
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG3_597,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(0),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_ENABLE_rstpot_945
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_glue_set : LUT3
    generic map(
      INIT => X"BA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_I_REG_155,
      I1 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_VALID_INT_154,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_394,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_glue_set_899
    );
  U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_glue_set : LUT3
    generic map(
      INIT => X"BA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_S_529,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_T_527,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_518,
      O => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_glue_set_901
    );
  U0_gpcs_pma_inst_RECEIVER_RECEIVE_glue_set : LUT3
    generic map(
      INIT => X"BA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_SOP_REG2_794,
      I1 => U0_gpcs_pma_inst_RECEIVER_EOP_773,
      I2 => U0_gpcs_pma_inst_RECEIVER_RECEIVE_750,
      O => U0_gpcs_pma_inst_RECEIVER_RECEIVE_glue_set_916
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG1 : LUT4
    generic map(
      INIT => X"A2AA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_390,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_UNIDIRECTIONAL_ENABLE_REG_584,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_182,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_DUPLEX_MODE_REG_578,
      O => U0_gpcs_pma_inst_XMIT_CONFIG
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_glue_set : LUT4
    generic map(
      INIT => X"FFE4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_594,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_IN_REG4_585,
      I3 => U0_gpcs_pma_inst_SRESET_151,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_glue_set_914
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG3_rstpot : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG2_418,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_IDLE_REG2_444,
      I2 => U0_gpcs_pma_inst_SRESET_151,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_IDLE_INSERTED_REG3_rstpot_949
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_rstpot : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096_MSB_REG_441,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(11),
      I2 => U0_gpcs_pma_inst_SRESET_151,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_rstpot_951
    );
  U0_gpcs_pma_inst_TRANSMITTER_K28p5_rstpot : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_519,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CONFIG_DATA(3),
      O => U0_gpcs_pma_inst_TRANSMITTER_K28p5_rstpot_955
    );
  U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_rstpot : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_548,
      I1 => gmii_tx_en,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      O => U0_gpcs_pma_inst_TRANSMITTER_TRIGGER_T_rstpot_957
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_IDLE_DETECT_REG1_rstpot : LUT5
    generic map(
      INIT => X"EEEF4440"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SRESET_151,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_IDLE_222,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_EN_588,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG3_597,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_IDLE_DETECT_REG1_579,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_IDLE_DETECT_REG1_rstpot_959
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_EN_rstpot : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => an_adv_config_val,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_REG_589,
      I2 => U0_gpcs_pma_inst_SRESET_151,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_EN_rstpot_960
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CONFIGURATION_VALID_EN_rstpot : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => configuration_valid,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CONFIGURATION_VALID_EN_REG_590,
      I2 => U0_gpcs_pma_inst_SRESET_151,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CONFIGURATION_VALID_EN_rstpot_961
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_rstpot : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_REG2,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_REG3_587,
      I2 => U0_gpcs_pma_inst_SRESET_151,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_rstpot_962
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_EN_rstpot : LUT3
    generic map(
      INIT => X"02"
    )
    port map (
      I0 => an_restart_config,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_EN_REG_592,
      I2 => U0_gpcs_pma_inst_SRESET_151,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_EN_rstpot_963
    );
  U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_rstpot : LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(0),
      I1 => U0_gpcs_pma_inst_RECEIVER_C_REG2_696,
      I2 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(1),
      I3 => U0_gpcs_pma_inst_RXCLKCORCNT_INT(2),
      O => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_rstpot_964
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_INT_glue_set_SW0 : LUT4
    generic map(
      INIT => X"DFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(4),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(1),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG3_597,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0456_inv11,
      O => N106
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_INT_glue_set : LUT6
    generic map(
      INIT => X"D0C0D0C0D0C05000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_COMPLETE_REG1_583,
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_INT,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_ENABLE_582,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE_221,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(2),
      I5 => N106,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_INTERRUPT_INT_glue_set_909
    );
  U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_rstpot : LUT6
    generic map(
      INIT => X"0000CCCC00000008"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_T_REG2_802,
      I1 => U0_gpcs_pma_inst_RECEIVER_RECEIVE_750,
      I2 => U0_gpcs_pma_inst_RECEIVER_R_782,
      I3 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_EVEN_AND_228_o,
      I4 => U0_gpcs_pma_inst_RECEIVER_RESET_SYNC_STATUS_OR_146_o,
      I5 => N108,
      O => U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_rstpot_968
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_POWERDOWN_REG_glue_set_SW0 : LUT5
    generic map(
      INIT => X"AAACAAAA"
    )
    port map (
      I0 => configuration_vector(2),
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_POWERDOWN_REG,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(4),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(2),
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0456_inv11,
      O => N110
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_POWERDOWN_REG_glue_set : LUT6
    generic map(
      INIT => X"FEFCFCFCBAB83030"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(11),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CONFIGURATION_VALID_EN_591,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_POWERDOWN_REG,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG3_597,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_GND_22_o_MDIO_WE_AND_16_o,
      I5 => N110,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_POWERDOWN_REG_glue_set_912
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_glue_set_SW0 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RECEIVE_750,
      I1 => U0_gpcs_pma_inst_RECEIVER_R_REG1_801,
      O => N112
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_glue_set : LUT6
    generic map(
      INIT => X"FFFF022202220222"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_EXTEND_749,
      I1 => U0_gpcs_pma_inst_RECEIVER_S_810,
      I2 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_806,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_173,
      I4 => N112,
      I5 => U0_gpcs_pma_inst_RECEIVER_R_782,
      O => U0_gpcs_pma_inst_RECEIVER_EXTEND_glue_set_919
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_15_rstpot : LUT5
    generic map(
      INIT => X"AACCF0F0"
    )
    port map (
      I0 => an_adv_config_vector(15),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(15),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_15_191,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_EN_588,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0379_inv,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_15_rstpot_944
    );
  U0_gpcs_pma_inst_RECEIVER_C_rstpot : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_806,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_D21p5_AND_217_o_norst,
      O => U0_gpcs_pma_inst_RECEIVER_C_rstpot_965
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_5_glue_set : LUT6
    generic map(
      INIT => X"FFFFAAF0FFFFCCCC"
    )
    port map (
      I0 => an_adv_config_vector(5),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_5_186,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(5),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_EN_588,
      I4 => U0_gpcs_pma_inst_SRESET_151,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0379_inv,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_5_glue_set_905
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_7_glue_set : LUT6
    generic map(
      INIT => X"FFFFAACCFFFFF0F0"
    )
    port map (
      I0 => an_adv_config_vector(7),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(7),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_7_187,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_EN_588,
      I4 => U0_gpcs_pma_inst_SRESET_151,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0379_inv,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_7_glue_set_906
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_8_glue_set : LUT6
    generic map(
      INIT => X"FFFFAAF0FFFFCCCC"
    )
    port map (
      I0 => an_adv_config_vector(8),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_8_188,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(8),
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_CONFIG_VAL_EN_588,
      I4 => U0_gpcs_pma_inst_SRESET_151,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_n0379_inv,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ADV_REG_8_glue_set_907
    );
  U0_gpcs_pma_inst_RECEIVER_RX_INVALID_glue_set : LUT6
    generic map(
      INIT => X"FFFFFFFF54FF5454"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_LINK_OK,
      I1 => U0_gpcs_pma_inst_RECEIVER_FROM_IDLE_D_777,
      I2 => U0_gpcs_pma_inst_RECEIVER_FROM_RX_K_776,
      I3 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_806,
      I4 => U0_gpcs_pma_inst_RECEIVER_RX_INVALID_751,
      I5 => U0_gpcs_pma_inst_RECEIVER_FROM_RX_CX_775,
      O => U0_gpcs_pma_inst_RECEIVER_RX_INVALID_glue_set_917
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GENERATE_REMOTE_FAULT_rstpot : LUT5
    generic map(
      INIT => X"00800000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I3 => U0_gpcs_pma_inst_SRESET_151,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GND_26_o_PREVIOUS_STATE_3_equal_63_o,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GENERATE_REMOTE_FAULT_rstpot_950
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut_0_Q : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_439,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(0),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_442,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_440,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut_1_Q : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_439,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(1),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_442,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_440,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(1)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut_2_Q : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_439,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(2),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_442,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_440,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(2)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut_3_Q : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_439,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(3),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_442,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_440,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(3)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut_4_Q : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_439,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(4),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_442,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_440,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(4)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut_5_Q : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_439,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(5),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_442,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_440,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(5)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut_6_Q : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_439,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(6),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_442,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_440,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(6)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut_7_Q : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_439,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(7),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_442,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_440,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(7)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut_8_Q : LUT4
    generic map(
      INIT => X"0444"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_439,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER(8),
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_442,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_440,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_LINK_TIMER_lut(8)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_rstpot : LUT6
    generic map(
      INIT => X"0010000000000010"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_379,
      I1 => U0_gpcs_pma_inst_RECEIVER_I_REG_155,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ABILITY_MATCH_2_410,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RECEIVED_IDLE_394,
      I4 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(15),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0576_inv1_rstpot_975
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_LINK_TIMER_SATURATED_OR_54_o_inv1 : LUT3
    generic map(
      INIT => X"15"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_439,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_442,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_440,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_START_LINK_TIMER_REG_LINK_TIMER_SATURATED_OR_54_o_inv
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mmux_ACKNOWLEDGE_MATCH_3_GND_26_o_MUX_268_o11 : LUT5
    generic map(
      INIT => X"00200000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_2_408,
      I1 => U0_gpcs_pma_inst_RECEIVER_I_REG_155,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_RX_CONFIG_REG_REG(14),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_379,
      I4 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(14),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_ACKNOWLEDGE_MATCH_3_GND_26_o_MUX_268_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRPISK_GND_28_o_MUX_477_o11 : LUT3
    generic map(
      INIT => X"2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_523,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_525,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_GND_28_o_MUX_477_o
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_28_o_mux_24_OUT11 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(0),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_525,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_515,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_0_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_28_o_mux_24_OUT21 : LUT3
    generic map(
      INIT => X"2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(1),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_525,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_1_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_28_o_mux_24_OUT31 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(2),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_525,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_515,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_2_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_28_o_mux_24_OUT41 : LUT3
    generic map(
      INIT => X"2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(3),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_525,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_3_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_28_o_mux_24_OUT51 : LUT4
    generic map(
      INIT => X"2AEA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(4),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_525,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_515,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_4_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_28_o_mux_24_OUT61 : LUT3
    generic map(
      INIT => X"2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(5),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_525,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_5_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_28_o_mux_24_OUT71 : LUT3
    generic map(
      INIT => X"F8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_525,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(6),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_6_Q
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mmux_CODE_GRP_7_GND_28_o_mux_24_OUT81 : LUT4
    generic map(
      INIT => X"EA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP(7),
      I1 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_525,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_515,
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_7_GND_28_o_mux_24_OUT_7_Q
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_11_RXDATA_3_MUX_501_o11 : LUT6
    generic map(
      INIT => X"AAAABBBAAAAA888A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(11),
      I1 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_798,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_800,
      I3 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_796,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I5 => U0_gpcs_pma_inst_RXDATA_INT(3),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_11_RXDATA_3_MUX_501_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_12_RXDATA_4_MUX_500_o11 : LUT6
    generic map(
      INIT => X"AAAABBBAAAAA888A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(12),
      I1 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_798,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_800,
      I3 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_796,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I5 => U0_gpcs_pma_inst_RXDATA_INT(4),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_12_RXDATA_4_MUX_500_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_13_RXDATA_5_MUX_499_o11 : LUT6
    generic map(
      INIT => X"AAAABBBAAAAA888A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(13),
      I1 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_798,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_800,
      I3 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_796,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I5 => U0_gpcs_pma_inst_RXDATA_INT(5),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_13_RXDATA_5_MUX_499_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_14_RXDATA_6_MUX_498_o11 : LUT6
    generic map(
      INIT => X"AAAABBBAAAAA888A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(14),
      I1 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_798,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_800,
      I3 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_796,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I5 => U0_gpcs_pma_inst_RXDATA_INT(6),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_14_RXDATA_6_MUX_498_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_8_RXDATA_0_MUX_504_o11 : LUT6
    generic map(
      INIT => X"AAAABBBAAAAA888A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(8),
      I1 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_798,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_800,
      I3 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_796,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I5 => U0_gpcs_pma_inst_RXDATA_INT(0),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_8_RXDATA_0_MUX_504_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_15_RXDATA_7_MUX_497_o11 : LUT6
    generic map(
      INIT => X"AAAABBBAAAAA888A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(15),
      I1 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_798,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_800,
      I3 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_796,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I5 => U0_gpcs_pma_inst_RXDATA_INT(7),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_15_RXDATA_7_MUX_497_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_9_RXDATA_1_MUX_503_o11 : LUT6
    generic map(
      INIT => X"AAAABBBAAAAA888A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(9),
      I1 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_798,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_800,
      I3 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_796,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I5 => U0_gpcs_pma_inst_RXDATA_INT(1),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_9_RXDATA_1_MUX_503_o
    );
  U0_gpcs_pma_inst_RECEIVER_Mmux_RX_CONFIG_REG_10_RXDATA_2_MUX_502_o11 : LUT6
    generic map(
      INIT => X"AAAABBBAAAAA888A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG(10),
      I1 => U0_gpcs_pma_inst_RECEIVER_RXCHARISK_REG1_798,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_800,
      I3 => U0_gpcs_pma_inst_RECEIVER_C_HDR_REMOVED_REG_796,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      I5 => U0_gpcs_pma_inst_RXDATA_INT(2),
      O => U0_gpcs_pma_inst_RECEIVER_RX_CONFIG_REG_10_RXDATA_2_MUX_502_o
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In31 : LUT6
    generic map(
      INIT => X"FFF00000FFFF0020"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(1),
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS(0),
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_675,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_676,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_677,
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_In31_861
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_8_glue_rst : LUT6
    generic map(
      INIT => X"FF003F00AAAA2A2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(8),
      I1 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I2 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_8_1,
      I4 => U0_gpcs_pma_inst_SRESET_151,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_8_glue_rst_880
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_7_glue_rst : LUT6
    generic map(
      INIT => X"FF003F00AAAA2A2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(7),
      I1 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I2 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_7_1,
      I4 => U0_gpcs_pma_inst_SRESET_151,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_7_glue_rst_881
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_6_glue_rst : LUT6
    generic map(
      INIT => X"FF003F00AAAA2A2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(6),
      I1 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I2 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_6_1,
      I4 => U0_gpcs_pma_inst_SRESET_151,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_6_glue_rst_882
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_5_glue_rst : LUT6
    generic map(
      INIT => X"FF003F00AAAA2A2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(5),
      I1 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I2 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_5_1,
      I4 => U0_gpcs_pma_inst_SRESET_151,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_5_glue_rst_883
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_4_glue_rst : LUT6
    generic map(
      INIT => X"FF003F00AAAA2A2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(4),
      I1 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I2 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_4_1,
      I4 => U0_gpcs_pma_inst_SRESET_151,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_4_glue_rst_884
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_3_glue_rst : LUT6
    generic map(
      INIT => X"FF003F00AAAA2A2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(3),
      I1 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I2 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_3_1,
      I4 => U0_gpcs_pma_inst_SRESET_151,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_3_glue_rst_885
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_2_glue_rst : LUT6
    generic map(
      INIT => X"FF003F00AAAA2A2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(2),
      I1 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I2 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_2_1,
      I4 => U0_gpcs_pma_inst_SRESET_151,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_2_glue_rst_886
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_1_glue_rst : LUT6
    generic map(
      INIT => X"FF003F00AAAA2A2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(1),
      I1 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I2 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_1_1,
      I4 => U0_gpcs_pma_inst_SRESET_151,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_1_glue_rst_887
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_0_glue_rst : LUT6
    generic map(
      INIT => X"FF003F00AAAA2A2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(0),
      I1 => U0_gpcs_pma_inst_SIGNAL_DETECT_REG,
      I2 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Result_0_1,
      I4 => U0_gpcs_pma_inst_SRESET_151,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_n0385_inv,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER_0_glue_rst_888
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_glue_set : LUT4
    generic map(
      INIT => X"FF2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_752,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_806,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_173,
      I3 => U0_gpcs_pma_inst_RECEIVER_I_REG_LINK_OK_AND_232_o_718,
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_glue_set_920
    );
  U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_226_o1 : LUT6
    generic map(
      INIT => X"0000000000000008"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172,
      I1 => U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_226_o2,
      I2 => U0_gpcs_pma_inst_RECEIVER_CGBAD_781,
      I3 => U0_gpcs_pma_inst_RXBUFSTATUS_INT(1),
      I4 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_139,
      I5 => U0_gpcs_pma_inst_RXDISPERR_INT_140,
      O => U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_C_REG1_AND_226_o
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_glue_rst : LUT6
    generic map(
      INIT => X"AAAA88AFAAAA88A8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_390,
      I1 => U0_gpcs_pma_inst_SRESET_151,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_182,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_CONFIG_INT_glue_rst_895
    );
  U0_gpcs_pma_inst_TRANSMITTER_R_glue_set : LUT5
    generic map(
      INIT => X"FFFF4440"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_S_529,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_R_517,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => U0_gpcs_pma_inst_TRANSMITTER_TX_ER_REG1_547,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_T_527,
      O => U0_gpcs_pma_inst_TRANSMITTER_R_glue_set_902
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_REG_glue_set : LUT5
    generic map(
      INIT => X"FEF4F4F4"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG3_597,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_REG_181,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_EN_593,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_GND_22_o_MDIO_WE_AND_16_o,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG(9),
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_RESTART_AN_REG_glue_set_910
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_IDLE_glue_set : LUT5
    generic map(
      INIT => X"EAEB4041"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_182,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_IDLE_222,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_IDLE_glue_set_897
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE_glue_set : LUT4
    generic map(
      INIT => X"C8CA"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE_221,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_285,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_COMPLETE_glue_set_892
    );
  U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_glue_rst : LUT5
    generic map(
      INIT => X"5515AA2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_515,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_INSERT_IDLE_525,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_DISP3_K28p5_OR_122_o,
      O => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_glue_rst_903
    );
  U0_gpcs_pma_inst_TRANSMITTER_V_glue_set : LUT6
    generic map(
      INIT => X"FFFF88A888A888A8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_DATA_INT_520,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_XMIT_DATA_INT_AND_121_o2_828,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_EN_REG1_548,
      I3 => N96,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_S_529,
      I5 => U0_gpcs_pma_inst_TRANSMITTER_V_516,
      O => U0_gpcs_pma_inst_TRANSMITTER_V_glue_set_900
    );
  U0_gpcs_pma_inst_RECEIVER_RX_DATA_ERROR_rstpot_SW0 : LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_I_REG_155,
      I1 => U0_gpcs_pma_inst_RECEIVER_ILLEGAL_K_REG2_768,
      I2 => U0_gpcs_pma_inst_RECEIVER_C_REG1_800,
      I3 => U0_gpcs_pma_inst_RECEIVER_CGBAD_REG3_780,
      I4 => U0_gpcs_pma_inst_RECEIVER_T_REG2_R_REG1_OR_174_o2_879,
      O => N108
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_rstpot_SW1 : LUT4
    generic map(
      INIT => X"FFEF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_S_529,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_T_527,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_TX_PACKET_518,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_V_516,
      O => N114
    );
  U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_rstpot : LUT6
    generic map(
      INIT => X"55545554FFFE5554"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_XMIT_CONFIG_INT_519,
      I1 => N114,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_ISOLATE_REG,
      I3 => U0_gpcs_pma_inst_TRANSMITTER_R_517,
      I4 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I5 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(1),
      O => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRPISK_rstpot_953
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CLEAR_STATUS_REG_rstpot1_SW1 : LUT4
    generic map(
      INIT => X"FFEF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(4),
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(3),
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_RD_595,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(2),
      O => N116
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CLEAR_STATUS_REG_rstpot1 : LUT6
    generic map(
      INIT => X"1010101010105410"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SRESET_151,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_REG3_597,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CLEAR_STATUS_REG_180,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(0),
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_ADDR_WR(1),
      I5 => N116,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_CLEAR_STATUS_REG_rstpot1_971
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SYNC_STATUS_HELD_glue_set : LUT4
    generic map(
      INIT => X"FF2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SYNC_STATUS_HELD_391,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_440,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_442,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SYNC_STATUS_HELD_glue_set_896
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_glue_set : LUT5
    generic map(
      INIT => X"FFEAFF2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_392,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_LINK_TIMER_SATURATED_440,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_PULSE4096_442,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_SYNC_STATUS_HELD_391,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_AN_SYNC_STATUS_glue_set_889
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT_glue_set : LUT6
    generic map(
      INIT => X"FFA8A8A8FFA8FFA8"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_GENERATE_REMOTE_FAULT_427,
      I1 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_14,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_13,
      I3 => NlwRenamedSig_OI_U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT,
      I4 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CLEAR_STATUS_REG2_425,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CLEAR_STATUS_REG1_426,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_REMOTE_FAULT_glue_set_894
    );
  U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_glue_set : LUT5
    generic map(
      INIT => X"2A2AFF2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_753,
      I1 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_806,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_EVEN_173,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172,
      I4 => U0_gpcs_pma_inst_RECEIVER_SYNC_STATUS_REG_779,
      O => U0_gpcs_pma_inst_RECEIVER_WAIT_FOR_K_glue_set_921
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LINK_STATUS_rstpot : LUT6
    generic map(
      INIT => X"AA8AAAAA20002020"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_XMIT_DATA_INT_431,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CLEAR_STATUS_REG2_425,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_CLEAR_STATUS_REG1_426,
      I3 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_6_230,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_AN_ENABLE_REG_182,
      I5 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LINK_STATUS_220,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LINK_STATUS_rstpot_941
    );
  U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_rstpot : LUT4
    generic map(
      INIT => X"0008"
    )
    port map (
      I0 => U0_gpcs_pma_inst_TRANSMITTER_SYNC_DISPARITY_538,
      I1 => U0_gpcs_pma_inst_TRANSMITTER_DISPARITY_515,
      I2 => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      I3 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_TX_RESET_INT,
      O => U0_gpcs_pma_inst_TRANSMITTER_TXCHARDISPVAL_rstpot_956
    );
  U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_rstpot : LUT6
    generic map(
      INIT => X"0000000000000008"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172,
      I1 => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_792,
      I2 => NlwRenamedSig_OI_U0_gpcs_pma_inst_MGT_RX_RESET_INT,
      I3 => U0_gpcs_pma_inst_RECEIVER_K28p5_REG1_EVEN_AND_228_o,
      I4 => U0_gpcs_pma_inst_RECEIVER_R_782,
      I5 => U0_gpcs_pma_inst_RECEIVER_S_810,
      O => U0_gpcs_pma_inst_RECEIVER_EXT_ILLEGAL_K_rstpot_967
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_In,
      R => U0_gpcs_pma_inst_SRESET_151,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd3_1_1007
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_2_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_2_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_2_1_1010
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_1_1 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_1_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_1_1_1011
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_rstpot_1012,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_283
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_rstpot_1013,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_284
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_1_rstpot_1014,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_1_1008
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_1_rstpot_1015,
      Q => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_1_1009
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_2_2 : FDE
    generic map(
      INIT => '0'
    )
    port map (
      C => userclk2,
      CE => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDC_RISING_IN_LAST_DATA_SHIFT_OR_9_o,
      D => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_14_DATA_IN_15_mux_25_OUT_2_Q,
      Q => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_SHIFT_REG_2_2_1016
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_rstpot : LUT3
    generic map(
      INIT => X"04"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SRESET_151,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_In2_287,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_67_o,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_rstpot_1012
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_1_rstpot : LUT3
    generic map(
      INIT => X"04"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SRESET_151,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_In2_287,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_67_o,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd1_1_rstpot_1015
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_rstpot : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SRESET_151,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_67_o,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In2,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_rstpot_1013
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_1_rstpot : LUT3
    generic map(
      INIT => X"10"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SRESET_151,
      I1 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_AN_ENABLE_CHANGE_RX_RUDI_INVALID_INT_OR_67_o,
      I2 => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_In2,
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_STATE_FSM_FFd2_1_rstpot_1014
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In2 : MUXF7
    port map (
      I0 => N118,
      I1 => N119,
      S => U0_gpcs_pma_inst_SYNCHRONISATION_CGBAD,
      O => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In2_679
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In2_F : LUT6
    generic map(
      INIT => X"F0F4540400040404"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_678,
      I1 => U0_gpcs_pma_inst_RXCHARISCOMMA_INT_150,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_675,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_677,
      I4 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_676,
      I5 => U0_gpcs_pma_inst_SYNCHRONISATION_GOOD_CGS_1_PWR_24_o_equal_19_o,
      O => N118
    );
  U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_In2_G : LUT5
    generic map(
      INIT => X"EC2BEC2A"
    )
    port map (
      I0 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd1_675,
      I1 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd3_677,
      I2 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd4_678,
      I3 => U0_gpcs_pma_inst_SYNCHRONISATION_STATE_FSM_FFd2_676,
      I4 => U0_gpcs_pma_inst_RXCHARISCOMMA_INT_150,
      O => N119
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_rstpot : MUXF7
    port map (
      I0 => N120,
      I1 => N121,
      S => U0_gpcs_pma_inst_RXDATA_INT(5),
      O => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_rstpot_966
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_rstpot_F : LUT6
    generic map(
      INIT => X"0404040004000000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_203_o12_876,
      I1 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_139,
      I2 => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_203_o13_877,
      I3 => U0_gpcs_pma_inst_RXDISPERR_INT_140,
      I4 => U0_gpcs_pma_inst_RXDATA_INT(1),
      I5 => U0_gpcs_pma_inst_RXDATA_INT(7),
      O => N120
    );
  U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_rstpot_G : LUT5
    generic map(
      INIT => X"00200000"
    )
    port map (
      I0 => U0_gpcs_pma_inst_RXDATA_INT(2),
      I1 => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_203_o12_876,
      I2 => U0_gpcs_pma_inst_RXNOTINTABLE_INT_139,
      I3 => U0_gpcs_pma_inst_RECEIVER_FALSE_NIT_POS_FALSE_NIT_NEG_OR_203_o1,
      I4 => U0_gpcs_pma_inst_RXCHARISK_INT_149,
      O => N121
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_In3 : MUXF7
    port map (
      I0 => N122,
      I1 => N123,
      S => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_651,
      O => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_In
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_In3_F : LUT6
    generic map(
      INIT => X"AAAAAAAA00000002"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_594,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_653,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_654,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_In2,
      O => N122
    );
  U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_In3_G : LUT6
    generic map(
      INIT => X"44450001FFFFFFFF"
    )
    port map (
      I0 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd3_652,
      I1 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd2_653,
      I2 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd1_654,
      I3 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_MDIO_IN_REG_608,
      I4 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDIO_INTERFACE_1_STATE_FSM_FFd4_In1_622,
      I5 => U0_gpcs_pma_inst_HAS_MANAGEMENT_MDIO_MDC_RISING_REG1_594,
      O => N123
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_lut_0_INV_0 : INV
    port map (
      I => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_TIMER4096(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_TIMER4096_lut(0)
    );
  U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_lut_0_INV_0 : INV
    port map (
      I => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MASK_RUDI_BUFERR_TIMER(0),
      O => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_Mcount_MASK_RUDI_BUFERR_TIMER_lut(0)
    );
  U0_gpcs_pma_inst_TRANSMITTER_Mcount_CODE_GRP_CNT_xor_0_11_INV_0 : INV
    port map (
      I => U0_gpcs_pma_inst_TRANSMITTER_CODE_GRP_CNT(0),
      O => U0_gpcs_pma_inst_TRANSMITTER_Result(0)
    );
  U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_0 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(7),
      A1 => NlwRenamedSig_OI_status_vector(7),
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => NlwRenamedSig_OI_N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_LINK_OK,
      Q => U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_0_1023,
      Q15 => NLW_U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_0_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_STATUS_VECTOR_0 : FDE
    port map (
      C => userclk2,
      CE => NlwRenamedSig_OI_N0,
      D => U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_0_1023,
      Q => U0_gpcs_pma_inst_STATUS_VECTOR_0_88
    );
  U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_1 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(7),
      A1 => NlwRenamedSig_OI_status_vector(7),
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => NlwRenamedSig_OI_N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_SYNCHRONISATION_SYNC_STATUS_172,
      Q => U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_1_1024,
      Q15 => NLW_U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_1_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_STATUS_VECTOR_1 : FDE
    port map (
      C => userclk2,
      CE => NlwRenamedSig_OI_N0,
      D => U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_1_1024,
      Q => U0_gpcs_pma_inst_STATUS_VECTOR_1_87
    );
  U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_12 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(7),
      A1 => NlwRenamedSig_OI_status_vector(7),
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => NlwRenamedSig_OI_N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_HAS_AUTO_NEG_AUTO_NEGOTIATION_MR_LP_ADV_ABILITY_INT_6_230,
      Q => U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_12_1025,
      Q15 => NLW_U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_12_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_STATUS_VECTOR_12 : FDE
    port map (
      C => userclk2,
      CE => NlwRenamedSig_OI_N0,
      D => U0_gpcs_pma_inst_Mshreg_STATUS_VECTOR_12_1025,
      Q => U0_gpcs_pma_inst_STATUS_VECTOR_12_81
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_7 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_N0,
      A1 => NlwRenamedSig_OI_N0,
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => NlwRenamedSig_OI_N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(7),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_7_1026,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_7_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_7 : FDE
    port map (
      C => userclk2,
      CE => NlwRenamedSig_OI_N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_7_1026,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(7)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_6 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_N0,
      A1 => NlwRenamedSig_OI_N0,
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => NlwRenamedSig_OI_N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(6),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_6_1027,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_6_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_6 : FDE
    port map (
      C => userclk2,
      CE => NlwRenamedSig_OI_N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_6_1027,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(6)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_5 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_N0,
      A1 => NlwRenamedSig_OI_N0,
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => NlwRenamedSig_OI_N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(5),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_5_1028,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_5_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_5 : FDE
    port map (
      C => userclk2,
      CE => NlwRenamedSig_OI_N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_5_1028,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(5)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_4 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_N0,
      A1 => NlwRenamedSig_OI_N0,
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => NlwRenamedSig_OI_N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(4),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_4_1029,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_4_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_4 : FDE
    port map (
      C => userclk2,
      CE => NlwRenamedSig_OI_N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_4_1029,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(4)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_3 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_N0,
      A1 => NlwRenamedSig_OI_N0,
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => NlwRenamedSig_OI_N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(3),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_3_1030,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_3_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_3 : FDE
    port map (
      C => userclk2,
      CE => NlwRenamedSig_OI_N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_3_1030,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(3)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_2 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_N0,
      A1 => NlwRenamedSig_OI_N0,
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => NlwRenamedSig_OI_N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(2),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_2_1031,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_2_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_2 : FDE
    port map (
      C => userclk2,
      CE => NlwRenamedSig_OI_N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_2_1031,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(2)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_1 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_N0,
      A1 => NlwRenamedSig_OI_N0,
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => NlwRenamedSig_OI_N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(1),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_1_1032,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_1_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_1 : FDE
    port map (
      C => userclk2,
      CE => NlwRenamedSig_OI_N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_1_1032,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(1)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_0 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_N0,
      A1 => NlwRenamedSig_OI_N0,
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => NlwRenamedSig_OI_N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RXDATA_INT(0),
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_0_1033,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_0_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5_0 : FDE
    port map (
      C => userclk2,
      CE => NlwRenamedSig_OI_N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_RXDATA_REG5_0_1033,
      Q => U0_gpcs_pma_inst_RECEIVER_RXDATA_REG5(0)
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_EXTEND_REG3 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(7),
      A1 => NlwRenamedSig_OI_status_vector(7),
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => NlwRenamedSig_OI_N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG1_792,
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_EXTEND_REG3_1034,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_EXTEND_REG3_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3 : FDE
    port map (
      C => userclk2,
      CE => NlwRenamedSig_OI_N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_EXTEND_REG3_1034,
      Q => U0_gpcs_pma_inst_RECEIVER_EXTEND_REG3_791
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_CGBAD_REG2 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_N0,
      A1 => NlwRenamedSig_OI_status_vector(7),
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => NlwRenamedSig_OI_N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_CGBAD_781,
      Q => U0_gpcs_pma_inst_RECEIVER_CGBAD_REG2,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_CGBAD_REG2_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_SOP_REG2 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_status_vector(7),
      A1 => NlwRenamedSig_OI_status_vector(7),
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => NlwRenamedSig_OI_N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_SOP_774,
      Q => U0_gpcs_pma_inst_RECEIVER_Mshreg_SOP_REG2_1035,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_SOP_REG2_Q15_UNCONNECTED
    );
  U0_gpcs_pma_inst_RECEIVER_SOP_REG2 : FDE
    port map (
      C => userclk2,
      CE => NlwRenamedSig_OI_N0,
      D => U0_gpcs_pma_inst_RECEIVER_Mshreg_SOP_REG2_1035,
      Q => U0_gpcs_pma_inst_RECEIVER_SOP_REG2_794
    );
  U0_gpcs_pma_inst_RECEIVER_Mshreg_FALSE_CARRIER_REG2 : SRLC16E
    generic map(
      INIT => X"0000"
    )
    port map (
      A0 => NlwRenamedSig_OI_N0,
      A1 => NlwRenamedSig_OI_status_vector(7),
      A2 => NlwRenamedSig_OI_status_vector(7),
      A3 => NlwRenamedSig_OI_status_vector(7),
      CE => NlwRenamedSig_OI_N0,
      CLK => userclk2,
      D => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_752,
      Q => U0_gpcs_pma_inst_RECEIVER_FALSE_CARRIER_REG2,
      Q15 => NLW_U0_gpcs_pma_inst_RECEIVER_Mshreg_FALSE_CARRIER_REG2_Q15_UNCONNECTED
    );

end STRUCTURE;

-- synthesis translate_on
