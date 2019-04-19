vlib work
vmap work work



echo "Compiling Core Simulation Models"
vcom -work work ../../../pcs_pma.vhd

echo "Compiling Example Design"
vcom -2008 -work work \
../../example_design/pcs_pma_sync_block.vhd \
../../example_design/pcs_pma_reset_sync.vhd \
../../example_design/transceiver/pcs_pma_s6_gtpwizard_tile.vhd \
../../example_design/transceiver/pcs_pma_s6_gtpwizard.vhd \
../../example_design/transceiver/pcs_pma_transceiver_A.vhd \
../../example_design/pcs_pma_tx_elastic_buffer.vhd \
../../example_design/pcs_pma_block.vhd \
../../example_design/pcs_pma_example_design.vhd

echo "Compiling Test Bench"
vcom -work work -novopt ../stimulus_tb.vhd ../demo_tb.vhd

echo "Starting simulation"
vsim -voptargs="+acc" -t ps work.demo_tb
do wave_mti.do
run -all
