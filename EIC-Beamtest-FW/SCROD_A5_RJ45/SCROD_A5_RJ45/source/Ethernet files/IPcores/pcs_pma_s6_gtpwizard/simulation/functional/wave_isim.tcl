###############################################################################
## isim_wave.tcl
###############################################################################
onerror {resume}

wcfg new
divider add "FRAME CHECK MODULE tile0_frame_check0"
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/TILE0_frame_check0/begin_r
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/TILE0_frame_check0/track_data_r
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/TILE0_frame_check0/data_error_detected_r
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/TILE0_frame_check0/start_of_packet_detected_r
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/TILE0_frame_check0/RX_DATA
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/TILE0_frame_check0/ERROR_COUNT
divider add "FRAME CHECK MODULE tile0_frame_check1"
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/TILE0_frame_check1/begin_r
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/TILE0_frame_check1/track_data_r
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/TILE0_frame_check1/data_error_detected_r
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/TILE0_frame_check1/start_of_packet_detected_r
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/TILE0_frame_check1/RX_DATA
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/TILE0_frame_check1/ERROR_COUNT
divider add "Loopback and Powerdown Ports"
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/LOOPBACK0_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/LOOPBACK1_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXPOWERDOWN0_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXPOWERDOWN1_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXPOWERDOWN0_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXPOWERDOWN1_IN
divider add "PLL Ports"
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/CLK00_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/CLK01_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/GTPRESET0_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/GTPRESET1_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/PLLLKDET0_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/PLLLKDET1_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RESETDONE0_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RESETDONE1_OUT
divider add "Receive Ports - 8b10b Decoder"
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXCHARISCOMMA0_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXCHARISCOMMA1_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXCHARISK0_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXCHARISK1_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXDISPERR0_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXDISPERR1_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXNOTINTABLE0_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXNOTINTABLE1_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXRUNDISP0_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXRUNDISP1_OUT
divider add "Receive Ports - Clock Correction"
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXCLKCORCNT0_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXCLKCORCNT1_OUT
divider add "Receive Ports - Comma Detection and Alignment"
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXENMCOMMAALIGN0_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXENMCOMMAALIGN1_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXENPCOMMAALIGN0_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXENPCOMMAALIGN1_IN
divider add "Receive Ports - RX Data Path interface"
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXDATA0_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXDATA1_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXRECCLK0_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXRECCLK1_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXRESET0_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXRESET1_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXUSRCLK0_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXUSRCLK1_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXUSRCLK20_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXUSRCLK21_IN
divider add "Receive Ports - RX Driver,OOB signalling,Coupling and Eq.,CDR"
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXN0_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXN1_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXP0_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXP1_IN
divider add "Receive Ports - RX Elastic Buffer and Phase Alignment"
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXBUFRESET0_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXBUFRESET1_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXBUFSTATUS0_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/RXBUFSTATUS1_OUT
divider add "TX/RX Datapath Ports"
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/GTPCLKOUT0_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/GTPCLKOUT1_OUT
divider add "Transmit Ports - 8b10b Encoder Control"
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXCHARDISPMODE0_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXCHARDISPMODE1_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXCHARDISPVAL0_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXCHARDISPVAL1_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXCHARISK0_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXCHARISK1_IN
divider add "Transmit Ports - TX Buffer and Phase Alignment"
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXBUFSTATUS0_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXBUFSTATUS1_OUT
divider add "Transmit Ports - TX Data Path interface"
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXDATA0_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXDATA1_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXOUTCLK0_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXOUTCLK1_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXRESET0_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXRESET1_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXUSRCLK0_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXUSRCLK1_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXUSRCLK20_IN
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXUSRCLK21_IN
divider add "Transmit Ports - TX Driver and OOB signalling"
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXN0_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXN1_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXP0_OUT
wave add /DEMO_TB/pcs_pma_s6_gtpwizard_top_i/pcs_pma_s6_gtpwizard_i/tile0_pcs_pma_s6_gtpwizard_i/TXP1_OUT


run 50 us
quit




