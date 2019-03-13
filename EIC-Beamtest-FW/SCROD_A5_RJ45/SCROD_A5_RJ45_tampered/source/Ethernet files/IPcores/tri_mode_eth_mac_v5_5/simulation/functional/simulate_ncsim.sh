#!/bin/sh
mkdir work

echo "Compiling Tri-Mode Ethernet MAC Core Simulation Models"
ncvhdl -v93 -work work ../../../tri_mode_eth_mac_v5_5.vhd

echo "Compiling Example Design"
ncvhdl -v93 -work work \
../../example_design/fifo/tri_mode_eth_mac_v5_5_tx_client_fifo.vhd \
../../example_design/fifo/tri_mode_eth_mac_v5_5_rx_client_fifo.vhd \
../../example_design/fifo/tri_mode_eth_mac_v5_5_ten_100_1g_eth_fifo.vhd \
../../example_design/common/tri_mode_eth_mac_v5_5_reset_sync.vhd \
../../example_design/common/tri_mode_eth_mac_v5_5_sync_block.vhd \
../../example_design/pat_gen/tri_mode_eth_mac_v5_5_address_swap.vhd \
../../example_design/pat_gen/tri_mode_eth_mac_v5_5_axi_mux.vhd \
../../example_design/pat_gen/tri_mode_eth_mac_v5_5_axi_pat_gen.vhd \
../../example_design/pat_gen/tri_mode_eth_mac_v5_5_axi_pat_check.vhd \
../../example_design/pat_gen/tri_mode_eth_mac_v5_5_axi_pipe.vhd \
../../example_design/pat_gen/tri_mode_eth_mac_v5_5_basic_pat_gen.vhd \
../../example_design/statistics/tri_mode_eth_mac_v5_5_vector_decode.vhd \
../../example_design/axi_lite/tri_mode_eth_mac_v5_5_axi_lite_sm.vhd \
../../example_design/tri_mode_eth_mac_v5_5_block.vhd \
../../example_design/tri_mode_eth_mac_v5_5_fifo_block.vhd \
../../example_design/tri_mode_eth_mac_v5_5_example_design.vhd

ncvhdl -v93 -work work \
../../example_design/axi_ipif/tri_mode_eth_mac_v5_5_ipif_pkg.vhd \
../../example_design/axi_ipif/tri_mode_eth_mac_v5_5_counter_f.vhd \
../../example_design/axi_ipif/tri_mode_eth_mac_v5_5_pselect_f.vhd 

ncvhdl -v93 -work work \
../../example_design/axi_ipif/tri_mode_eth_mac_v5_5_address_decoder.vhd \
../../example_design/axi_ipif/tri_mode_eth_mac_v5_5_slave_attachment.vhd \
../../example_design/axi_ipif/tri_mode_eth_mac_v5_5_axi_lite_ipif.vhd

ncvhdl -v93 -work work \
../../example_design/axi_ipif/tri_mode_eth_mac_v5_5_axi4_lite_ipif_wrapper.vhd

echo "Compiling Test Bench"
ncvhdl -v93 -work work ../demo_tb.vhd

echo "Elaborating design"
ncelab -access +r work.demo_tb:behav

echo "Starting simulation"
ncsim -gui work.demo_tb:behav -input @"simvision -input wave_ncsim.sv"
