
###############################################################################
## wave_ncsim.sv
###############################################################################

  window new WaveWindow  -name  "Waves for Spartan-6 GTP Wizard Example Design"
  waveform  using  "Waves for Spartan-6 GTP Wizard Example Design"
  
  waveform  add  -label FRAME_CHECK_MODULE -comment tile0_frame_check0
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i+delimiter+tile0_frame_check0:begin_r
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i+delimiter+tile0_frame_check0:track_data_r
  waveform  add  -siganls  :pcs_pma_s6_gtpwizard_top_i+delimiter+tile0_frame_check0:data_error_detected_r
  wavefrom  add  -siganls  :pcs_pma_s6_gtpwizard_top_i+delimiter+tile0_frame_check0:start_of_packet_detected_r
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i+delimiter+tile0_frame_check0:RX_DATA
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i+delimiter+tile0_frame_check0:ERROR_COUNT
  waveform  add  -label FRAME_CHECK_MODULE -comment tile0_frame_check1
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i+delimiter+tile0_frame_check1:begin_r
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i+delimiter+tile0_frame_check1:track_data_r
  waveform  add  -siganls  :pcs_pma_s6_gtpwizard_top_i+delimiter+tile0_frame_check1:data_error_detected_r
  wavefrom  add  -siganls  :pcs_pma_s6_gtpwizard_top_i+delimiter+tile0_frame_check1:start_of_packet_detected_r
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i+delimiter+tile0_frame_check1:RX_DATA
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i+delimiter+tile0_frame_check1:ERROR_COUNT

  waveform  add  -label TILE0_pcs_pma_s6_gtpwizard -comment TILE0_pcs_pma_s6_gtpwizard
  waveform  add  -label Loopback_and_Powerdown_Ports  -comment  Loopback_and_Powerdown_Ports
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:LOOPBACK0_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:LOOPBACK1_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXPOWERDOWN0_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXPOWERDOWN1_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXPOWERDOWN0_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXPOWERDOWN1_IN
  waveform  add  -label PLL_Ports  -comment  PLL_Ports
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:CLK00_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:CLK01_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:GTPRESET0_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:GTPRESET1_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:PLLLKDET0_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:PLLLKDET1_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RESETDONE0_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RESETDONE1_OUT
  waveform  add  -label Receive_Ports_-_8b10b_Decoder  -comment  Receive_Ports_-_8b10b_Decoder
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXCHARISCOMMA0_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXCHARISCOMMA1_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXCHARISK0_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXCHARISK1_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXDISPERR0_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXDISPERR1_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXNOTINTABLE0_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXNOTINTABLE1_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXRUNDISP0_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXRUNDISP1_OUT
  waveform  add  -label Receive_Ports_-_Clock_Correction  -comment  Receive_Ports_-_Clock_Correction
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXCLKCORCNT0_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXCLKCORCNT1_OUT
  waveform  add  -label Receive_Ports_-_Comma_Detection_and_Alignment  -comment  Receive_Ports_-_Comma_Detection_and_Alignment
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXENMCOMMAALIGN0_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXENMCOMMAALIGN1_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXENPCOMMAALIGN0_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXENPCOMMAALIGN1_IN
  waveform  add  -label Receive_Ports_-_RX_Data_Path_interface  -comment  Receive_Ports_-_RX_Data_Path_interface
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXDATA0_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXDATA1_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXRECCLK0_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXRECCLK1_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXRESET0_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXRESET1_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXUSRCLK0_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXUSRCLK1_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXUSRCLK20_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXUSRCLK21_IN
  waveform  add  -label Receive_Ports_-_RX_Driver,OOB_signalling,Coupling_and_Eq.,CDR  -comment  Receive_Ports_-_RX_Driver,OOB_signalling,Coupling_and_Eq.,CDR
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXN0_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXN1_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXP0_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXP1_IN
  waveform  add  -label Receive_Ports_-_RX_Elastic_Buffer_and_Phase_Alignment  -comment  Receive_Ports_-_RX_Elastic_Buffer_and_Phase_Alignment
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXBUFRESET0_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXBUFRESET1_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXBUFSTATUS0_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:RXBUFSTATUS1_OUT
  waveform  add  -label TX/RX_Datapath_Ports  -comment  TX/RX_Datapath_Ports
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:GTPCLKOUT0_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:GTPCLKOUT1_OUT
  waveform  add  -label Transmit_Ports_-_8b10b_Encoder_Control  -comment  Transmit_Ports_-_8b10b_Encoder_Control
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXCHARDISPMODE0_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXCHARDISPMODE1_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXCHARDISPVAL0_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXCHARDISPVAL1_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXCHARISK0_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXCHARISK1_IN
  waveform  add  -label Transmit_Ports_-_TX_Buffer_and_Phase_Alignment  -comment  Transmit_Ports_-_TX_Buffer_and_Phase_Alignment
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXBUFSTATUS0_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXBUFSTATUS1_OUT
  waveform  add  -label Transmit_Ports_-_TX_Data_Path_interface  -comment  Transmit_Ports_-_TX_Data_Path_interface
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXDATA0_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXDATA1_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXOUTCLK0_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXOUTCLK1_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXRESET0_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXRESET1_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXUSRCLK0_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXUSRCLK1_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXUSRCLK20_IN
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXUSRCLK21_IN
  waveform  add  -label Transmit_Ports_-_TX_Driver_and_OOB_signalling  -comment  Transmit_Ports_-_TX_Driver_and_OOB_signalling
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXN0_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXN1_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXP0_OUT
  waveform  add  -signals  :pcs_pma_s6_gtpwizard_top_i:pcs_pma_s6_gtpwizard_i:tile0_pcs_pma_s6_gtpwizard_i:TXP1_OUT

  console submit -using simulator -wait no "run 50 us"

