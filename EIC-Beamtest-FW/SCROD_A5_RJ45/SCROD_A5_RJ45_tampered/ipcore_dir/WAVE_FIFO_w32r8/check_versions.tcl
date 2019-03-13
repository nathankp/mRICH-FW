##
## Core Generator Run Script, generator for Project Navigator checkversion command
##

proc findRtfPath { relativePath } {
   set xilenv ""
   if { [info exists ::env(XILINX) ] } {
      if { [info exists ::env(MYXILINX)] } {
         set xilenv [join [list $::env(MYXILINX) $::env(XILINX)] $::xilinx::path_sep ]
      } else {
         set xilenv $::env(XILINX)
      }
   }
   foreach path [ split $xilenv $::xilinx::path_sep ] {
      set fullPath [ file join $path $relativePath ]
      if { [ file exists $fullPath ] } {
         return $fullPath
      }
   }
   return ""
}

source [ findRtfPath "data/projnav/scripts/dpm_cgUtils.tcl" ]

set result [ run_cg_vcheck {{C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_A5_RJ45/source/Ethernet files/IPcores/eth_head_fifo.xco} {C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_A5_RJ45/source/Ethernet files/IPcores/ip_rx_bram.xco} {C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_A5_RJ45/source/Ethernet files/IPcores/tx_fifo.xco} {C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_A5_RJ45/source/Ethernet files/IPcores/pcs_pma_s6_gtpwizard.xco} {C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_A5_RJ45/source/Ethernet files/IPcores/pcs_pma.xco} {C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_A5_RJ45/source/Ethernet files/IPcores/tri_mode_eth_mac_v5_5.xco} C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_A5_RJ45/ipcore_dir/CLK_FANOUT/CLK_FANOUT.xco C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_A5_RJ45/ipcore_dir/STATE_FIFO/STATE_FIFO.xco C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_A5_RJ45/ipcore_dir/blk_mem_gen_v7_3/blk_mem_gen_v7_3.xco C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_A5_RJ45/ipcore_dir/CMD_FIFO_w1r8/CMD_FIFO_w1r8.xco C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_A5_RJ45/ipcore_dir/CMD_FIFO_w8r32/CMD_FIFO_w8r32.xco C:/Users/Kevin/Desktop/HMB/EIC-Beamtest-FW/SCROD_A5_RJ45/SCROD_A5_RJ45/ipcore_dir/WAVE_FIFO_w32r8/WAVE_FIFO.xco} xc6slx150t-3fgg676 ]

if { $result == 0 } {
   puts "Core Generator checkversion command completed successfully."
} elseif { $result == 1 } {
   puts "Core Generator checkversion command failed."
} elseif { $result == 3 || $result == 4 } {
   # convert 'version check' result to real return range, bypassing any messages.
   set result [ expr $result - 3 ]
} else {
   puts "Core Generator checkversion cancelled."
}
exit $result
