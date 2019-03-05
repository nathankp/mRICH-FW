view structure
view signals
view wave

onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {System Signals}
add wave -noupdate -format logic /demo_tb/reset
add wave -noupdate -format logic /demo_tb/brefclk_p
add wave -noupdate -format logic /demo_tb/brefclk_n
add wave -noupdate -divider {}
add wave -noupdate -divider {Core Inst 0}
add wave -noupdate -divider {}
add wave -noupdate -format logic /demo_tb/signal_detect0
add wave -noupdate -divider {Management I/F}
add wave -noupdate -format logic /demo_tb/dut/mdc0
add wave -noupdate -format logic /demo_tb/dut/mdio0_i
add wave -noupdate -format logic /demo_tb/dut/mdio0_o
add wave -noupdate -format logic /demo_tb/dut/mdio0_t
add wave -noupdate -format logic -binary /demo_tb/phyad0
add wave -noupdate -format logic -binary /demo_tb/status_vector0
add wave -noupdate -divider {Tx GMII}
add wave -noupdate -format logic -hex /demo_tb/gmii_txd0
add wave -noupdate -format logic /demo_tb/gmii_tx_en0
add wave -noupdate -format logic /demo_tb/gmii_tx_er0
add wave -noupdate -divider {Rx GMII}
add wave -noupdate -format logic -hex /demo_tb/gmii_rxd0
add wave -noupdate -format logic /demo_tb/gmii_rx_dv0
add wave -noupdate -format logic /demo_tb/gmii_rx_er0
add wave -noupdate -divider {Transceiver Tx}
add wave -noupdate -format logic /demo_tb/txp0
add wave -noupdate -format logic /demo_tb/txn0
add wave -noupdate -divider {Transceiver Rx}
add wave -noupdate -format logic /demo_tb/rxp0
add wave -noupdate -format logic /demo_tb/rxn0
add wave -noupdate -divider {Auto-Neg control}
add wave -noupdate -format logic -hex /demo_tb/link_timer_value0
add wave -noupdate -format logic /demo_tb/an_interrupt0
add wave -noupdate -divider {Tx Monitor}
add wave -noupdate -format logic /demo_tb/stimulus_0/mon_tx_clk
add wave -noupdate -format logic -hex /demo_tb/stimulus_0/tx_pdata
add wave -noupdate -format logic /demo_tb/stimulus_0/tx_is_k
add wave -noupdate -format logic /demo_tb/stimulus_0/bitclock
add wave -noupdate -divider {Rx Stimulus}
add wave -noupdate -format logic /demo_tb/stimulus_0/stim_rx_clk
add wave -noupdate -format logic /demo_tb/stimulus_0/rx_even
add wave -noupdate -format logic -hex /demo_tb/stimulus_0/rx_pdata
add wave -noupdate -format logic /demo_tb/stimulus_0/rx_is_k
add wave -noupdate -format logic /demo_tb/stimulus_0/rx_rundisp_pos
add wave -noupdate -divider {}
add wave -noupdate -divider {Test semaphores}
add wave -noupdate -divider {}
add wave -noupdate -format logic /demo_tb/configuration_finished
add wave -noupdate -format logic /demo_tb/tx_monitor_finished0
add wave -noupdate -format logic /demo_tb/rx_monitor_finished0
add wave -noupdate -format logic /demo_tb/simulation_finished
TreeUpdate [SetDefaultTree]
