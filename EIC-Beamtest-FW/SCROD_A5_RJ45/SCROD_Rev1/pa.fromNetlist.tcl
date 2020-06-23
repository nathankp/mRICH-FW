
# PlanAhead Launch Script for Post-Synthesis floorplanning, created by Project Navigator

create_project -name HMB_SCROD -dir "C:/Users/Kevin/Desktop/HMB-FW/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_Rev1/planAhead_run_1" -part xc6slx150tfgg676-3
set_property design_mode GateLvl [get_property srcset [current_run -impl]]
set_property edif_top_file "C:/Users/Kevin/Desktop/HMB-FW/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_Rev1/SCRODQB_Top_cs.ngc" [ get_property srcset [ current_run ] ]
add_files -norecurse { {C:/Users/Kevin/Desktop/HMB-FW/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_Rev1} {../SCROD_A5_RJ45/ipcore_dir/STATE_FIFO} {../SCROD_A5_RJ45/ipcore_dir/CMD_FIFO_w1r8} {remoteFiles/SCROD_ETHERNET_V3/ExampleProject/ise/coregen} {ipcore_dir} {../../../QBLink/QBlink/cores} {../../../QBLink/QBlink/ipcore_dir} {../../../SCROD_ETHERNET_V3/ExampleProject/ise/coregen} {../../mRICH_hodo_DC_V1/mRICH_hodo_DC_V1/hodo_dc_v1/cores} }
add_files [list {../SCROD_A5_RJ45/ipcore_dir/STATE_FIFO/STATE_FIFO.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../SCROD_A5_RJ45/ipcore_dir/CMD_FIFO_w1r8/CMD_FIFO_w1r8.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {remoteFiles/SCROD_ETHERNET_V3/ExampleProject/ise/coregen/bram8x3000.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {remoteFiles/SCROD_ETHERNET_V3/ExampleProject/ise/coregen/fifo16x64.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {remoteFiles/SCROD_ETHERNET_V3/ExampleProject/ise/coregen/fifo18x16.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {remoteFiles/SCROD_ETHERNET_V3/ExampleProject/ise/coregen/fifo32x512RxAxi.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {remoteFiles/SCROD_ETHERNET_V3/ExampleProject/ise/coregen/fifo8x64.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {remoteFiles/SCROD_ETHERNET_V3/ExampleProject/ise/coregen/fifoDist8x16.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/ChipscopeICON.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/Timestamper.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/udp64kfifo.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {ipcore_dir/VIO.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../../../QBLink/QBlink/cores/CMD_FIFO_w1r8.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../../../QBLink/QBlink/cores/CMD_FIFO_w8r32.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../../../QBLink/QBlink/cores/serializationFifo.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../../../QBLink/QBlink/cores/srout_bram_blkmem.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../../../QBLink/QBlink/cores/waveform_fifo_wr32_rd32.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../../../QBLink/QBlink/ipcore_dir/QBLtxFIFO.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../../mRICH_hodo_DC_V1/mRICH_hodo_DC_V1/hodo_dc_v1/cores/CMD_FIFO_w1r8.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../../mRICH_hodo_DC_V1/mRICH_hodo_DC_V1/hodo_dc_v1/cores/CMD_FIFO_w8r32.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../../mRICH_hodo_DC_V1/mRICH_hodo_DC_V1/hodo_dc_v1/cores/srout_bram_blkmem.ncf}] -fileset [get_property constrset [current_run]]
add_files [list {../../mRICH_hodo_DC_V1/mRICH_hodo_DC_V1/hodo_dc_v1/cores/waveform_fifo_wr32_rd32.ncf}] -fileset [get_property constrset [current_run]]
set_property target_constrs_file "HMB_SciFi_SCROD.ucf" [current_fileset -constrset]
add_files [list {HMB_SciFi_SCROD.ucf}] -fileset [get_property constrset [current_run]]
link_design
