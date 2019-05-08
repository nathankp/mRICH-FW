##############################################################################
##    ____  ____
##   /   /\/   /
##  /___/  \  /    Vendor: Xilinx
##  \   \   \/     Version : 1.11
##   \   \         Application : Spartan-6 FPGA GTP Transceiver Wizard
##   /   /         Filename : pcs_pma_s6_gtpwizard_xmdf.tcl
##  /___/   /\      
##  \   \  /  \ 
##   \___\/\___\
## 

# ::gen_comp_name_xmdf::xmdfApplyParams
# The package naming convention is <core_name>_xmdf
package provide pcs_pma_s6_gtpwizard_xmdf 1.0

# This includes some utilities that support common XMDF operations
package require utilities_xmdf

# Define a namespace for this package. The name of the name space
# is <core_name>_xmdf
namespace eval ::pcs_pma_s6_gtpwizard_xmdf {
# Use this to define any statics
}

# Function called by client to rebuild the params and port arrays
# Optional when the use context does not require the param or ports
# arrays to be available.
proc ::pcs_pma_s6_gtpwizard_xmdf::xmdfInit { instance } {
# Variable containg name of library into which module is compiled
# Recommendation: <module_name>
# Required
utilities_xmdf::xmdfSetData $instance Module Attributes Name pcs_pma_s6_gtpwizard
}
# ::pcs_pma_s6_gtpwizard_xmdf::xmdfInit

# Function called by client to fill in all the xmdf* data variables
# based on the current settings of the parameters
proc ::pcs_pma_s6_gtpwizard_xmdf::xmdfApplyParams { instance } {

set fcount 0
# Array containing libraries that are assumed to exist
# Examples include unisim and xilinxcorelib
# Optional
# In this example, we assume that the unisim library will
# be magically
# available to the simulation and synthesis tool
utilities_xmdf::xmdfSetData $instance FileSet $fcount type logical_library
utilities_xmdf::xmdfSetData $instance FileSet $fcount logical_library unisim
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/doc/s6_gtpwizard_ds713.pdf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount
utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/doc/s6_gtpwizard_gsg546.pdf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/example_design/frame_gen.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl 
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/example_design/frame_check.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl 
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/example_design/pcs_pma_s6_gtpwizard_top.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl 
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard_tile.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl 
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl 
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard.vho
utilities_xmdf::xmdfSetData $instance FileSet $fcount type vhdl_template
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/simulation/demo_tb.vhd
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/example_design/gtp_attributes.ucf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ucf
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/example_design/pcs_pma_s6_gtpwizard_top.ucf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ucf
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/implement/chipscope_project.cpj
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/implement/data_vio.ngc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ngc
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/implement/icon.ngc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ngc
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/implement/ila.ngc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ngc
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/implement/implement.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/implement/implement.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/implement/implement_synplify.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/implement/implement_synplify.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/implement/null_vio.ngc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ngc
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/implement/shared_vio.ngc
utilities_xmdf::xmdfSetData $instance FileSet $fcount type ngc
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/implement/synplify.prj
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/implement/xst.prj
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/implement/xst.scr
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/s6_gtpwizard_v1_11_readme.txt
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/pcs_pma_s6_gtpwizard.pf
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/simulation/demo_tb.v
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/simulation/functional/simulate_isim.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/simulation/functional/simulate_isim.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/simulation/functional/simulate_mti.do
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/simulation/functional/simulate_ncsim.bat
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/simulation/functional/simulate_ncsim.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/simulation/functional/simulate_vcs.sh
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/simulation/functional/ucli_commands.key
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/simulation/functional/vcs_session.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/simulation/functional/wave_isim.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/simulation/functional/wave_mti.do
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard/simulation/functional/wave_ncsim.sv
utilities_xmdf::xmdfSetData $instance FileSet $fcount type Ignore
incr fcount


utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard.xco
utilities_xmdf::xmdfSetData $instance FileSet $fcount type coregen_ip
incr fcount

utilities_xmdf::xmdfSetData $instance FileSet $fcount relative_path pcs_pma_s6_gtpwizard_xmdf.tcl
utilities_xmdf::xmdfSetData $instance FileSet $fcount type AnyView
incr fcount

#utilities_xmdf::xmdfSetData $instance FileSet $fcount associated_module pcs_pma_s6_gtpwizard
#incr fcount

}

# ::gen_comp_name_xmdf::xmdfApplyParams



