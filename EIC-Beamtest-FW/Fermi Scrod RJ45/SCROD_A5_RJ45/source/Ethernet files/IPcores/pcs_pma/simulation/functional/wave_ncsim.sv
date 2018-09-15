# SimVision Command Script

#
# groups
#

if {[catch {group new -name {System Signals} -overlay 0}] != ""} {
    group using {System Signals}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :reset \
    :brefclk_p \
    :brefclk_n
    :signal_detect0 \

if {[catch {group new -name {Management I/F 0} -overlay 0}] != ""} {
    group using {Management I/F}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :dut.mdc0 \
    :dut.mdio0_i \
    :dut.mdio0_o \
    :dut.mdio0_t \
    :phyad0 \
    :status_vector0

if {[catch {group new -name {Tx GMII 0} -overlay 0}] != ""} {
    group using {Tx GMII}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :gmii_txd0 \
    :gmii_tx_en0 \
    :gmii_tx_er0

if {[catch {group new -name {Rx GMII 0} -overlay 0}] != ""} {
    group using {Rx GMII}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :gmii_rxd0 \
    :gmii_rx_dv0 \
    :gmii_rx_er0

if {[catch {group new -name {Transceiver Tx 0} -overlay 0}] != ""} {
    group using {Transceiver Tx}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :txp0 \
    :txn0

if {[catch {group new -name {Transceiver Rx 0} -overlay 0}] != ""} {
    group using {Transceiver Rx}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :rxp0 \
    :rxn0

if {[catch {group new -name {Auto-Neg control 0} -overlay 0}] != ""} {
    group using {Auto-Neg control}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :link_timer_value0 \
    :an_interrupt0
if {[catch {group new -name {Tx Monitor 0} -overlay 0}] != ""} {
    group using {Tx Monitor}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :stimulus_0.mon_tx_clk \
    :stimulus_0.tx_pdata \
    :stimulus_0.tx_is_k \
    :stimulus_0.bitclock
if {[catch {group new -name {Rx Stimulus 0} -overlay 0}] != ""} {
    group using {Rx Stimulus}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :stimulus_0.stim_rx_clk \
    :stimulus_0.rx_even \
    :stimulus_0.rx_pdata \
    :stimulus_0.rx_is_k \
    :stimulus_0.rx_rundisp_pos

if {[catch {group new -name {Test semaphores} -overlay 0}] != ""} {
    group using {Test semaphores}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
    :configuration_finished \
    :tx_monitor_finished0 \
    :rx_monitor_finished0 \
    :simulation_finished
#
# Waveform windows
#
if {[window find -match exact -name "Waveform 1"] == {}} {
    window new WaveWindow -name "Waveform 1" -geometry 906x585+25+55
} else {
    window geometry "Waveform 1" 906x585+25+55
}
window target "Waveform 1" on
waveform using {Waveform 1}
waveform sidebar visibility partial
waveform set \
    -primarycursor TimeA \
    -signalnames name \
    -signalwidth 175 \
    -units fs \
    -valuewidth 75
cursor set -using TimeA -time 50,000,000,000fs
cursor set -using TimeA -marching 1
waveform baseline set -time 0

set groupId [waveform add -groups {{System Signals}}]

set groupId [waveform add -groups {{Management I/F 0}}]

set groupId [waveform add -groups {{Tx GMII 0}}]

set groupId [waveform add -groups {{Rx GMII 0}}]

set groupId [waveform add -groups {{Transceiver Tx 0}}]

set groupId [waveform add -groups {{Transceiver Rx 0}}]

set groupId [waveform add -groups {{Auto-Neg control 0}}]

set groupId [waveform add -groups {{Tx Monitor 0}}]

set groupId [waveform add -groups {{Rx Stimulus 0}}]

set groupId [waveform add -groups {{Test semaphores}}]

waveform xview limits 0fs 10us

simcontrol run -time 200us
