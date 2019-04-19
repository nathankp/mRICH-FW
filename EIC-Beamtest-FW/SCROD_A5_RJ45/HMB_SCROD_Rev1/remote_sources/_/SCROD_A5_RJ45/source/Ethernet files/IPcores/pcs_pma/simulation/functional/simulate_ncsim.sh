#!/bin/sh
mkdir work

echo "Compiling Core Simulation Models"
ncvhdl -v93 -work work ../../../pcs_pma.vhd

echo "Compiling Example Design"
ncvhdl -v93 -work work \
../../example_design/pcs_pma_sync_block.vhd \
../../example_design/pcs_pma_reset_sync.vhd \
../../example_design/transceiver/pcs_pma_s6_gtpwizard_tile.vhd \
../../example_design/transceiver/pcs_pma_s6_gtpwizard.vhd \
../../example_design/transceiver/pcs_pma_transceiver_A.vhd \
../../example_design/pcs_pma_tx_elastic_buffer.vhd \
../../example_design/pcs_pma_block.vhd \
../../example_design/pcs_pma_example_design.vhd

echo "Compiling Test Bench"
ncvhdl -v93 -work work ../stimulus_tb.vhd ../demo_tb.vhd

echo "Elaborating design"
ncelab -access +rw work.demo_tb:behav

echo "Starting simulation"
ncsim -gui work.demo_tb:behav -input @"simvision -input wave_ncsim.sv"
