
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name SCROD_QBLinkProto -dir "/home/mrich/Desktop/HMB-FW/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_Rev1/planAhead_run_2" -part xc6slx150tfgg676-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "/home/mrich/Desktop/HMB-FW/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_Rev1/SCRODQB_Top_cs.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {/home/mrich/Desktop/HMB-FW/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_Rev1} {../SCROD_A5_RJ45/source/Ethernet files/IPcores} {../SCROD_A5_RJ45/ipcore_dir/STATE_FIFO} {../SCROD_A5_RJ45/source/Ethernet files/IPcores/pcs_pma_s6_gtpwizard/implement} {../../../../QBLink/QBlink/cores} {../../../../QBLink/QBlink/ipcore_dir} {../SCROD_A5_RJ45/ipcore_dir/CMD_FIFO_w1r8} {../../../../QBLink/QBLink/cores} {../SCROD_A5_RJ45/ipcore_dir/CLK_FANOUT} }
add_files [list {../SCROD_A5_RJ45/source/Ethernet files/IPcores/tri_mode_eth_mac_v5_5.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../SCROD_A5_RJ45/source/Ethernet files/IPcores/pcs_pma.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../SCROD_A5_RJ45/source/Ethernet files/IPcores/eth_head_fifo.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../SCROD_A5_RJ45/source/Ethernet files/IPcores/ip_rx_bram.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../SCROD_A5_RJ45/source/Ethernet files/IPcores/tx_fifo.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../SCROD_A5_RJ45/ipcore_dir/STATE_FIFO/STATE_FIFO.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../../../../QBLink/QBlink/cores/srout_bram_blkmem.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../../../../QBLink/QBlink/cores/CMD_FIFO_w8r32.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../../../../QBLink/QBlink/cores/waveform_fifo_wr32_rd32.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../../../../QBLink/QBlink/cores/CMD_FIFO_w1r8.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../../../../QBLink/QBlink/cores/serializationFifo.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../../../../QBLink/QBlink/ipcore_dir/QBLtxFIFO.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../SCROD_A5_RJ45/ipcore_dir/CMD_FIFO_w1r8/CMD_FIFO_w1r8.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "HMB_SciFi_SCROD.ucf" [current_fileset -constrset]
add_files [list {HMB_SciFi_SCROD.ucf}] -fileset [get_property constrset [current_run]]
link_design
