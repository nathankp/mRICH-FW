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
    :gtx_clk

if {[catch {group new -name {TX MAC Interface} -overlay 0}] != ""} {
    group using {TX MAC Interface}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :dut.trimac_fifo_block.tx_mac_resetn \
    :dut.trimac_fifo_block.tx_axis_mac_tvalid \
    :dut.trimac_fifo_block.tx_axis_mac_tdata \
    :dut.trimac_fifo_block.tx_axis_mac_tready \
    :dut.trimac_fifo_block.tx_axis_mac_tlast \
    :dut.trimac_fifo_block.tx_axis_mac_tuser


if {[catch {group new -name {TX Statistics Vector} -overlay 0}] != ""} {
    group using {TX Statistics Vector}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :dut.tx_statistics_vector \
    :dut.tx_statistics_valid

if {[catch {group new -name {RX MAC Interface} -overlay 0}] != ""} {
    group using {RX MAC Interface}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :dut.trimac_fifo_block.rx_mac_resetn \
    :dut.trimac_fifo_block.rx_axis_mac_tvalid \
    :dut.trimac_fifo_block.rx_axis_mac_tdata \
    :dut.trimac_fifo_block.rx_axis_mac_tlast \
    :dut.trimac_fifo_block.rx_axis_mac_tuser


if {[catch {group new -name {RX Statistics Vector} -overlay 0}] != ""} {
    group using {RX Statistics Vector}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :dut.rx_statistics_vector \
    :dut.rx_statistics_valid


if {[catch {group new -name {Flow Control} -overlay 0}] != ""} {
    group using {Flow Control}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :dut.pause_val \
    :dut.pause_req

if {[catch {group new -name {Rx FIFO Interface} -overlay 0}] != ""} {
    group using {Rx FIFO Interface}

    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :dut.trimac_fifo_block.rx_fifo_clock \
    :dut.trimac_fifo_block.rx_fifo_resetn \
    :dut.trimac_fifo_block.rx_axis_fifo_tdata \
    :dut.trimac_fifo_block.rx_axis_fifo_tlast \
    :dut.trimac_fifo_block.rx_axis_fifo_tready \
    :dut.trimac_fifo_block.rx_axis_fifo_tvalid

if {[catch {group new -name {Tx FIFO Interface} -overlay 0}] != ""} {
    group using {Tx FIFO Interface}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :dut.trimac_fifo_block.tx_fifo_clock \
    :dut.trimac_fifo_block.tx_fifo_resetn \
    :dut.trimac_fifo_block.tx_axis_fifo_tdata \
    :dut.trimac_fifo_block.tx_axis_fifo_tlast \
    :dut.trimac_fifo_block.tx_axis_fifo_tready \
    :dut.trimac_fifo_block.tx_axis_fifo_tvalid

if {[catch {group new -name {TX GMII/MII Interface} -overlay 0}] != ""} {
    group using {TX GMII/MII Interface}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :gmii_tx_en \
    :gmii_tx_er \
    :gmii_txd

if {[catch {group new -name {RX GMII/MII Interface} -overlay 0}] != ""} {
    group using {RX GMII/MII Interface}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :gmii_rx_dv \
    :gmii_rx_er \
    :gmii_rxd 



if {[catch {group new -name {MDIO Interface} -overlay 0}] != ""} {
    group using {MDIO Interface}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :mdc \
    :mdio

if {[catch {group new -name {Configuration Interface} -overlay 0}] != ""} {
    group using {Configuration Interface}
    group set -overlay 0
    group set -comment {}
    group clear 0 end
}
group insert \
    :dut.s_axi_aclk    \
    :dut.s_axi_awaddr  \
    :dut.s_axi_awvalid \
    :dut.s_axi_awready \
    :dut.s_axi_wdata   \
    :dut.s_axi_wvalid  \
    :dut.s_axi_wready  \
    :dut.s_axi_bresp   \
    :dut.s_axi_bvalid  \
    :dut.s_axi_bready  \
    :dut.s_axi_araddr  \
    :dut.s_axi_arvalid \
    :dut.s_axi_arready \
    :dut.s_axi_rdata   \
    :dut.s_axi_rresp   \
    :dut.s_axi_rvalid  \
    :dut.s_axi_rready


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
set groupId [waveform add -groups {{TX MAC Interface}}]
set groupId [waveform add -groups {{TX Statistics Vector}}]
set groupId [waveform add -groups {{RX MAC Interface}}]
set groupId [waveform add -groups {{RX Statistics Vector}}]
set groupId [waveform add -groups {{Flow Control}}]
set groupId [waveform add -groups {{Rx FIFO Interface}}]
set groupId [waveform add -groups {{Tx FIFO Interface}}]

set groupId [waveform add -groups {{MDIO Interface}}]
set groupId [waveform add -groups {{Configuration Interface}}]

waveform xview limits 0fs 10us

simcontrol run -time 500us
