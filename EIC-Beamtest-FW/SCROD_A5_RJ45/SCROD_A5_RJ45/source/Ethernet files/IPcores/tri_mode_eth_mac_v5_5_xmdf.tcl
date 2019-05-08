# The package naming convention is <core_name>_xmdf
package provide tri_mode_eth_mac_v5_5_xmdf 1.0

# This includes some utilities that support common XMDF operations
package require utilities_xmdf

# Define a namespace for this package. The name of the name space
# is <core_name>_xmdf
namespace eval ::tri_mode_eth_mac_v5_5_xmdf {
# Use this to define any statics
}

# Function called by client to rebuild the params and port arrays
# Optional when the use context does not require the param or ports
# arrays to be available.
proc ::tri_mode_eth_mac_v5_5_xmdf::xmdfInit { instance } {
# Variable containing name of library into which module is compiled
# Recommendation: <module_name>
# Required
utilities_xmdf::xmdfSetData $instance Module Attributes Name tri_mode_eth_mac_v5_5
}
# ::tri_mode_eth_mac_v5_5_xmdf::xmdfInit

# Function called by client to fill in all the xmdf* data variables
# based on the current settings of the parameters
proc ::tri_mode_eth_mac_v5_5_xmdf::xmdfApplyParams { instance } {

set fcount 0
# Array containing libraries that are assumed to exist
# Examples include unisim and xilinxcorelib
# Optional
# In this example, we assume that the unisim library will
# be available to the simulation and synthesis tool
utilities_xmdf::xmdfSetData $instance FileSet $fcount type logical_library
utilities_xmdf::xmdfSetData $instance FileSet $fcount logical_library unisim
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/doc/pg051-tri-mode-eth-mac.pdf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/doc/tri_mode_eth_mac_readme.txt
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/doc/tri_mode_eth_mac_v5_5_vinfo.html
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/axi_ipif/tri_mode_eth_mac_v5_5_address_decoder.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/axi_ipif/tri_mode_eth_mac_v5_5_axi4_lite_ipif_wrapper.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/axi_ipif/tri_mode_eth_mac_v5_5_axi_lite_ipif.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/axi_ipif/tri_mode_eth_mac_v5_5_counter_f.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/axi_ipif/tri_mode_eth_mac_v5_5_ipif_pkg.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/axi_ipif/tri_mode_eth_mac_v5_5_pselect_f.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/axi_ipif/tri_mode_eth_mac_v5_5_slave_attachment.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/axi_lite/tri_mode_eth_mac_v5_5_axi_lite_sm.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/common/tri_mode_eth_mac_v5_5_reset_sync.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/common/tri_mode_eth_mac_v5_5_sync_block.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/fifo/tri_mode_eth_mac_v5_5_rx_client_fifo.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/fifo/tri_mode_eth_mac_v5_5_ten_100_1g_eth_fifo.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/fifo/tri_mode_eth_mac_v5_5_tx_client_fifo.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/pat_gen/tri_mode_eth_mac_v5_5_address_swap.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/pat_gen/tri_mode_eth_mac_v5_5_axi_mux.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/pat_gen/tri_mode_eth_mac_v5_5_axi_pat_check.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/pat_gen/tri_mode_eth_mac_v5_5_axi_pat_gen.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/pat_gen/tri_mode_eth_mac_v5_5_axi_pipe.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/pat_gen/tri_mode_eth_mac_v5_5_basic_pat_gen.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/statistics/tri_mode_eth_mac_v5_5_vector_decode.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/tri_mode_eth_mac_v5_5_block.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/tri_mode_eth_mac_v5_5_example_design.ucf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/tri_mode_eth_mac_v5_5_example_design.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/example_design/tri_mode_eth_mac_v5_5_fifo_block.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/implement/implement.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/implement/implement.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/implement/xst.prj
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/implement/xst.scr
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/simulation/demo_tb.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/simulation/functional/simulate_mti.do
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/simulation/functional/simulate_ncsim.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/simulation/functional/wave_mti.do
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/simulation/functional/wave_ncsim.sv
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5/tri_mode_eth_mac_readme.txt
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5.asy
utilities_xmdf::xmdfSetData $instance FileSet $fcount type asy
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5.ngc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ngc
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5.sym
utilities_xmdf::xmdfSetData $instance FileSet $fcount type symbol
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5.vho
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl_template
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5.xco
utilities_xmdf::xmdfSetData $instance FileSet $fcount type coregen_ip
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path tri_mode_eth_mac_v5_5_xmdf.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type AnyView
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount associated_module tri_mode_eth_mac_v5_5
incr fcount

}

# ::gen_comp_name_xmdf::xmdfApplyParams
