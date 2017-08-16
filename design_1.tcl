
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2016.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z030ffg676-2
}


# CHANGE DESIGN NAME HERE
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]
  set artx_initb_io [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 artx_initb_io ]
  set artx_programb_io [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 artx_programb_io ]
  set clk_art_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 clk_art_0 ]
  set clk_art_1 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 clk_art_1 ]
  set clk_art_2 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 clk_art_2 ]

  # Create ports
  set CLK_HV_n [ create_bd_port -dir O CLK_HV_n ]
  set CLK_HV_p [ create_bd_port -dir O CLK_HV_p ]
  set DATA_HV_n [ create_bd_port -dir O DATA_HV_n ]
  set DATA_HV_p [ create_bd_port -dir O DATA_HV_p ]
  set GTU_HV_n [ create_bd_port -dir O GTU_HV_n ]
  set GTU_HV_p [ create_bd_port -dir O GTU_HV_p ]
  set artx_conf_cclk [ create_bd_port -dir O artx_conf_cclk ]
  set artx_conf_data [ create_bd_port -dir O artx_conf_data ]
  set artx_done [ create_bd_port -dir I artx_done ]
  set cs_dac_n [ create_bd_port -dir O cs_dac_n ]
  set cs_dac_p [ create_bd_port -dir O cs_dac_p ]
  set cs_exp_n [ create_bd_port -dir O cs_exp_n ]
  set cs_exp_p [ create_bd_port -dir O cs_exp_p ]
  set data_art0 [ create_bd_port -dir I -from 15 -to 0 data_art0 ]
  set data_art1 [ create_bd_port -dir I -from 15 -to 0 data_art1 ]
  set data_art2 [ create_bd_port -dir I -from 15 -to 0 data_art2 ]
  set frame_art0 [ create_bd_port -dir I frame_art0 ]
  set frame_art1 [ create_bd_port -dir I frame_art1 ]
  set frame_art2 [ create_bd_port -dir I frame_art2 ]
  set hv_led [ create_bd_port -dir O hv_led ]
  set intr_n [ create_bd_port -dir I intr_n ]
  set intr_p [ create_bd_port -dir I intr_p ]
  set loadb_sc_pc [ create_bd_port -dir O loadb_sc_pc ]
  set miso_n [ create_bd_port -dir I miso_n ]
  set miso_p [ create_bd_port -dir I miso_p ]
  set mosi_n [ create_bd_port -dir O mosi_n ]
  set mosi_p [ create_bd_port -dir O mosi_p ]
  set resetb_pc [ create_bd_port -dir O resetb_pc ]
  set sck_n [ create_bd_port -dir O sck_n ]
  set sck_p [ create_bd_port -dir O sck_p ]
  set select_din_pc [ create_bd_port -dir O select_din_pc ]
  set select_sc_probe_pc [ create_bd_port -dir O select_sc_probe_pc ]
  set sr_ck_pc [ create_bd_port -dir O sr_ck_pc ]
  set sr_ck_pc_art [ create_bd_port -dir O sr_ck_pc_art ]
  set sr_in_pc [ create_bd_port -dir O -from 5 -to 0 sr_in_pc ]
  set sr_rstb_pc [ create_bd_port -dir O sr_rstb_pc ]
  set trig_button [ create_bd_port -dir I trig_button ]
  set trig_button_gnd [ create_bd_port -dir O -from 0 -to 0 trig_button_gnd ]
  set user_led [ create_bd_port -dir O -from 0 -to 0 user_led ]

  # Create instance: ALGO_B_0, and set properties
  set ALGO_B_0 [ create_bd_cell -type ip -vlnv user.org:user:ALGO_B:1.0 ALGO_B_0 ]

  # Create instance: HV_AERA_IP_0, and set properties
  set HV_AERA_IP_0 [ create_bd_cell -type ip -vlnv user.org:user:HV_AERA_IP:1.0 HV_AERA_IP_0 ]

  # Create instance: algo_b_conv_1, and set properties
  set algo_b_conv_1 [ create_bd_cell -type ip -vlnv user.org:user:algo_b_conv:1.0 algo_b_conv_1 ]

  # Create instance: algo_b_conv_2, and set properties
  set algo_b_conv_2 [ create_bd_cell -type ip -vlnv user.org:user:algo_b_conv:1.0 algo_b_conv_2 ]

  # Create instance: axi_artix_conf_v1_0_0, and set properties
  set axi_artix_conf_v1_0_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:axi_artix_conf_v1_0:1.0 axi_artix_conf_v1_0_0 ]

  # Create instance: axi_data_provider_0, and set properties
  set axi_data_provider_0 [ create_bd_cell -type ip -vlnv user.org:user:axi_data_provider:1.0 axi_data_provider_0 ]

  # Create instance: axi_dma_L1, and set properties
  set axi_dma_L1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_L1 ]
  set_property -dict [ list \
CONFIG.c_include_mm2s {0} \
CONFIG.c_include_sg {0} \
CONFIG.c_sg_include_stscntrl_strm {0} \
CONFIG.c_sg_length_width {23} \
 ] $axi_dma_L1

  # Create instance: axi_dma_L2, and set properties
  set axi_dma_L2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_L2 ]
  set_property -dict [ list \
CONFIG.c_include_mm2s {0} \
CONFIG.c_include_sg {0} \
CONFIG.c_sg_include_stscntrl_strm {0} \
CONFIG.c_sg_length_width {23} \
 ] $axi_dma_L2

  # Create instance: axi_dma_raw, and set properties
  set axi_dma_raw [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_raw ]
  set_property -dict [ list \
CONFIG.c_include_mm2s {0} \
CONFIG.c_include_sg {0} \
CONFIG.c_sg_include_stscntrl_strm {0} \
CONFIG.c_sg_length_width {23} \
 ] $axi_dma_raw

  # Create instance: axi_dma_tst_L1, and set properties
  set axi_dma_tst_L1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_tst_L1 ]
  set_property -dict [ list \
CONFIG.c_include_s2mm {0} \
CONFIG.c_include_sg {0} \
CONFIG.c_m_axi_mm2s_data_width {64} \
CONFIG.c_mm2s_burst_size {16} \
CONFIG.c_sg_include_stscntrl_strm {0} \
CONFIG.c_sg_length_width {23} \
 ] $axi_dma_tst_L1

  # Create instance: axi_fifo_mm_s_1, and set properties
  set axi_fifo_mm_s_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_fifo_mm_s:4.1 axi_fifo_mm_s_1 ]
  set_property -dict [ list \
CONFIG.C_AXI4_BASEADDR {0x80001000} \
CONFIG.C_AXI4_HIGHADDR {0x80002FFF} \
CONFIG.C_TX_FIFO_DEPTH {4096} \
CONFIG.C_TX_FIFO_PE_THRESHOLD {2} \
CONFIG.C_TX_FIFO_PF_THRESHOLD {4091} \
CONFIG.C_USE_RX_DATA {0} \
CONFIG.C_USE_TX_CTRL {0} \
CONFIG.C_USE_TX_CUT_THROUGH {0} \
 ] $axi_fifo_mm_s_1

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.C_AXI4_BASEADDR.VALUE_SRC {DEFAULT} \
CONFIG.C_AXI4_HIGHADDR.VALUE_SRC {DEFAULT} \
 ] $axi_fifo_mm_s_1

  # Create instance: axi_fifo_mm_s_trigger_ev, and set properties
  set axi_fifo_mm_s_trigger_ev [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_fifo_mm_s:4.1 axi_fifo_mm_s_trigger_ev ]
  set_property -dict [ list \
CONFIG.C_AXI4_BASEADDR {0x80001000} \
CONFIG.C_AXI4_HIGHADDR {0x80002FFF} \
CONFIG.C_RX_FIFO_DEPTH {4096} \
CONFIG.C_RX_FIFO_PE_THRESHOLD {2} \
CONFIG.C_RX_FIFO_PF_THRESHOLD {507} \
CONFIG.C_USE_TX_CTRL {0} \
CONFIG.C_USE_TX_DATA {0} \
 ] $axi_fifo_mm_s_trigger_ev

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.C_AXI4_BASEADDR.VALUE_SRC {DEFAULT} \
CONFIG.C_AXI4_HIGHADDR.VALUE_SRC {DEFAULT} \
 ] $axi_fifo_mm_s_trigger_ev

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list \
CONFIG.C_ALL_INPUTS {1} \
CONFIG.C_ALL_OUTPUTS_2 {1} \
CONFIG.C_GPIO2_WIDTH {32} \
CONFIG.C_GPIO_WIDTH {32} \
CONFIG.C_IS_DUAL {1} \
 ] $axi_gpio_0

  # Create instance: axi_interconnect_DMA_INT, and set properties
  set axi_interconnect_DMA_INT [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_DMA_INT ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {2} \
 ] $axi_interconnect_DMA_INT

  # Create instance: axi_interconnect_DMA_RAW, and set properties
  set axi_interconnect_DMA_RAW [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_DMA_RAW ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {2} \
 ] $axi_interconnect_DMA_RAW

  # Create instance: axi_quad_spi_0, and set properties
  set axi_quad_spi_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_quad_spi_0 ]
  set_property -dict [ list \
CONFIG.C_FIFO_DEPTH {256} \
CONFIG.C_SCK_RATIO {16} \
CONFIG.C_TYPE_OF_AXI4_INTERFACE {0} \
CONFIG.C_USE_STARTUP {0} \
CONFIG.C_USE_STARTUP_INT {0} \
CONFIG.C_XIP_MODE {0} \
CONFIG.FIFO_INCLUDED {1} \
CONFIG.Master_mode {1} \
 ] $axi_quad_spi_0

  # Create instance: axis_broadcaster_00, and set properties
  set axis_broadcaster_00 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_00 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_broadcaster_00

  # Create instance: axis_broadcaster_01, and set properties
  set axis_broadcaster_01 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_01 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_broadcaster_01

  # Create instance: axis_broadcaster_02, and set properties
  set axis_broadcaster_02 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_02 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_broadcaster_02

  # Create instance: axis_broadcaster_03, and set properties
  set axis_broadcaster_03 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_03 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_broadcaster_03

  # Create instance: axis_broadcaster_04, and set properties
  set axis_broadcaster_04 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_04 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_broadcaster_04

  # Create instance: axis_broadcaster_05, and set properties
  set axis_broadcaster_05 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_05 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_broadcaster_05

  # Create instance: axis_broadcaster_1r, and set properties
  set axis_broadcaster_1r [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_1r ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_broadcaster_1r

  # Create instance: axis_broadcaster_1r10, and set properties
  set axis_broadcaster_1r10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_1r10 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_broadcaster_1r10

  # Create instance: axis_broadcaster_1r11, and set properties
  set axis_broadcaster_1r11 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_1r11 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_broadcaster_1r11

  # Create instance: axis_broadcaster_1r12, and set properties
  set axis_broadcaster_1r12 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_1r12 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_broadcaster_1r12

  # Create instance: axis_broadcaster_1r13, and set properties
  set axis_broadcaster_1r13 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_1r13 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_broadcaster_1r13

  # Create instance: axis_broadcaster_1r14, and set properties
  set axis_broadcaster_1r14 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_1r14 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_broadcaster_1r14

  # Create instance: axis_broadcaster_1r15, and set properties
  set axis_broadcaster_1r15 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_broadcaster:1.1 axis_broadcaster_1r15 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_broadcaster_1r15

  # Create instance: axis_clock_converter_0, and set properties
  set axis_clock_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_clock_converter:1.1 axis_clock_converter_0 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
 ] $axis_clock_converter_0

  # Create instance: axis_clock_converter_1, and set properties
  set axis_clock_converter_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_clock_converter:1.1 axis_clock_converter_1 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_clock_converter_1

  # Create instance: axis_clock_converter_2, and set properties
  set axis_clock_converter_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_clock_converter:1.1 axis_clock_converter_2 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_clock_converter_2

  # Create instance: axis_clock_converter_3, and set properties
  set axis_clock_converter_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_clock_converter:1.1 axis_clock_converter_3 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_clock_converter_3

  # Create instance: axis_clock_converter_4, and set properties
  set axis_clock_converter_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_clock_converter:1.1 axis_clock_converter_4 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_clock_converter_4

  # Create instance: axis_clock_converter_5, and set properties
  set axis_clock_converter_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_clock_converter:1.1 axis_clock_converter_5 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_clock_converter_5

  # Create instance: axis_combiner_0, and set properties
  set axis_combiner_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_combiner:1.1 axis_combiner_0 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_combiner_0

  # Create instance: axis_combiner_1, and set properties
  set axis_combiner_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_combiner:1.1 axis_combiner_1 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_combiner_1

  # Create instance: axis_combiner_2, and set properties
  set axis_combiner_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_combiner:1.1 axis_combiner_2 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_combiner_2

  # Create instance: axis_data_fifo_1r, and set properties
  set axis_data_fifo_1r [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_1r ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.FIFO_MODE {2} \
CONFIG.TDATA_NUM_BYTES {8} \
 ] $axis_data_fifo_1r

  # Create instance: axis_data_fifo_6, and set properties
  set axis_data_fifo_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_6 ]

  # Create instance: axis_data_fifo_L1_tst, and set properties
  set axis_data_fifo_L1_tst [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_L1_tst ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {512} \
CONFIG.FIFO_MODE {2} \
CONFIG.HAS_TKEEP {0} \
 ] $axis_data_fifo_L1_tst

  # Create instance: axis_data_fifo_L2, and set properties
  set axis_data_fifo_L2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_L2 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {2048} \
CONFIG.FIFO_MODE {2} \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_data_fifo_L2

  # Create instance: axis_data_fifo_fc_L10, and set properties
  set axis_data_fifo_fc_L10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_fc_L10 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.FIFO_MODE {2} \
CONFIG.HAS_TKEEP {0} \
 ] $axis_data_fifo_fc_L10

  # Create instance: axis_data_fifo_fc_L11, and set properties
  set axis_data_fifo_fc_L11 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_fc_L11 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.FIFO_MODE {2} \
CONFIG.HAS_TKEEP {0} \
 ] $axis_data_fifo_fc_L11

  # Create instance: axis_data_fifo_fc_L12, and set properties
  set axis_data_fifo_fc_L12 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_fc_L12 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.FIFO_MODE {2} \
CONFIG.HAS_TKEEP {0} \
 ] $axis_data_fifo_fc_L12

  # Create instance: axis_data_fifo_fc_L13, and set properties
  set axis_data_fifo_fc_L13 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_fc_L13 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.FIFO_MODE {2} \
CONFIG.HAS_TKEEP {0} \
 ] $axis_data_fifo_fc_L13

  # Create instance: axis_data_fifo_fc_L14, and set properties
  set axis_data_fifo_fc_L14 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_fc_L14 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.FIFO_MODE {2} \
CONFIG.HAS_TKEEP {0} \
 ] $axis_data_fifo_fc_L14

  # Create instance: axis_data_fifo_fc_L2b, and set properties
  set axis_data_fifo_fc_L2b [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_fc_L2b ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {2048} \
CONFIG.FIFO_MODE {2} \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_data_fifo_fc_L2b

  # Create instance: axis_data_fifo_fc_L9, and set properties
  set axis_data_fifo_fc_L9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_fc_L9 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {256} \
CONFIG.FIFO_MODE {2} \
CONFIG.HAS_TKEEP {0} \
 ] $axis_data_fifo_fc_L9

  # Create instance: axis_data_fifo_int, and set properties
  set axis_data_fifo_int [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_int ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
 ] $axis_data_fifo_int

  # Create instance: axis_data_fifo_sa_00, and set properties
  set axis_data_fifo_sa_00 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_sa_00 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {2048} \
CONFIG.FIFO_MODE {2} \
 ] $axis_data_fifo_sa_00

  # Create instance: axis_data_fifo_sa_01, and set properties
  set axis_data_fifo_sa_01 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_sa_01 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {2048} \
CONFIG.FIFO_MODE {2} \
 ] $axis_data_fifo_sa_01

  # Create instance: axis_data_fifo_sa_02, and set properties
  set axis_data_fifo_sa_02 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_sa_02 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {2048} \
CONFIG.FIFO_MODE {2} \
 ] $axis_data_fifo_sa_02

  # Create instance: axis_data_fifo_sa_03, and set properties
  set axis_data_fifo_sa_03 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_sa_03 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {2048} \
CONFIG.FIFO_MODE {2} \
 ] $axis_data_fifo_sa_03

  # Create instance: axis_data_fifo_sa_04, and set properties
  set axis_data_fifo_sa_04 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_sa_04 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {2048} \
CONFIG.FIFO_MODE {2} \
 ] $axis_data_fifo_sa_04

  # Create instance: axis_data_fifo_sa_05, and set properties
  set axis_data_fifo_sa_05 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_sa_05 ]
  set_property -dict [ list \
CONFIG.FIFO_DEPTH {2048} \
CONFIG.FIFO_MODE {2} \
 ] $axis_data_fifo_sa_05

  # Create instance: axis_dwidth_converter_0, and set properties
  set axis_dwidth_converter_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_0 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
CONFIG.M_TDATA_NUM_BYTES {1} \
CONFIG.S_TDATA_NUM_BYTES {2} \
 ] $axis_dwidth_converter_0

  # Create instance: axis_dwidth_converter_1, and set properties
  set axis_dwidth_converter_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_1 ]
  set_property -dict [ list \
CONFIG.M_TDATA_NUM_BYTES {24} \
CONFIG.S_TDATA_NUM_BYTES {4} \
 ] $axis_dwidth_converter_1

  # Create instance: axis_dwidth_converter_2, and set properties
  set axis_dwidth_converter_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_2 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
CONFIG.M_TDATA_NUM_BYTES {1} \
CONFIG.S_TDATA_NUM_BYTES {2} \
 ] $axis_dwidth_converter_2

  # Create instance: axis_dwidth_converter_3, and set properties
  set axis_dwidth_converter_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_3 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
CONFIG.M_TDATA_NUM_BYTES {1} \
CONFIG.S_TDATA_NUM_BYTES {2} \
 ] $axis_dwidth_converter_3

  # Create instance: axis_dwidth_converter_4, and set properties
  set axis_dwidth_converter_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_4 ]
  set_property -dict [ list \
CONFIG.HAS_MI_TKEEP {0} \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
CONFIG.M_TDATA_NUM_BYTES {1} \
CONFIG.S_TDATA_NUM_BYTES {2} \
 ] $axis_dwidth_converter_4

  # Create instance: axis_dwidth_converter_5, and set properties
  set axis_dwidth_converter_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_5 ]
  set_property -dict [ list \
CONFIG.HAS_MI_TKEEP {0} \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
CONFIG.M_TDATA_NUM_BYTES {1} \
CONFIG.S_TDATA_NUM_BYTES {2} \
 ] $axis_dwidth_converter_5

  # Create instance: axis_dwidth_converter_6, and set properties
  set axis_dwidth_converter_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_6 ]
  set_property -dict [ list \
CONFIG.HAS_MI_TKEEP {0} \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
CONFIG.M_TDATA_NUM_BYTES {1} \
CONFIG.S_TDATA_NUM_BYTES {2} \
 ] $axis_dwidth_converter_6

  # Create instance: axis_dwidth_converter_7, and set properties
  set axis_dwidth_converter_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_7 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
CONFIG.M_TDATA_NUM_BYTES {8} \
 ] $axis_dwidth_converter_7

  # Create instance: axis_dwidth_converter_8, and set properties
  set axis_dwidth_converter_8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_8 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
CONFIG.M_TDATA_NUM_BYTES {8} \
 ] $axis_dwidth_converter_8

  # Create instance: axis_dwidth_converter_9, and set properties
  set axis_dwidth_converter_9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_9 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
CONFIG.M_TDATA_NUM_BYTES {8} \
 ] $axis_dwidth_converter_9

  # Create instance: axis_dwidth_converter_10, and set properties
  set axis_dwidth_converter_10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_10 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
CONFIG.M_TDATA_NUM_BYTES {8} \
 ] $axis_dwidth_converter_10

  # Create instance: axis_dwidth_converter_11, and set properties
  set axis_dwidth_converter_11 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_11 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
CONFIG.M_TDATA_NUM_BYTES {8} \
 ] $axis_dwidth_converter_11

  # Create instance: axis_dwidth_converter_12, and set properties
  set axis_dwidth_converter_12 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_12 ]
  set_property -dict [ list \
CONFIG.HAS_TKEEP {0} \
CONFIG.HAS_TSTRB {0} \
CONFIG.M_TDATA_NUM_BYTES {8} \
 ] $axis_dwidth_converter_12

  # Create instance: axis_dwidth_converter_1r, and set properties
  set axis_dwidth_converter_1r [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_1r ]
  set_property -dict [ list \
CONFIG.HAS_MI_TKEEP {1} \
CONFIG.M_TDATA_NUM_BYTES {8} \
 ] $axis_dwidth_converter_1r

  # Create instance: axis_dwidth_converter_L1_tst, and set properties
  set axis_dwidth_converter_L1_tst [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_L1_tst ]

  # Create instance: axis_flow_control_L1, and set properties
  set axis_flow_control_L1 [ create_bd_cell -type ip -vlnv user.org:user:axis_flow_control:1.0 axis_flow_control_L1 ]
  set_property -dict [ list \
CONFIG.C_CNT_DWIDTH {32} \
 ] $axis_flow_control_L1

  # Create instance: axis_flow_control_L2, and set properties
  set axis_flow_control_L2 [ create_bd_cell -type ip -vlnv user.org:user:axis_flow_control:1.0 axis_flow_control_L2 ]
  set_property -dict [ list \
CONFIG.C_AXIS_DWIDTH {32} \
CONFIG.C_CNT_DWIDTH {32} \
 ] $axis_flow_control_L2

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.3 clk_wiz_0 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_DRIVES {BUFG} \
CONFIG.CLKOUT1_JITTER {137.681} \
CONFIG.CLKOUT1_PHASE_ERROR {105.461} \
CONFIG.CLKOUT2_DRIVES {BUFG} \
CONFIG.CLKOUT3_DRIVES {BUFG} \
CONFIG.CLKOUT4_DRIVES {BUFG} \
CONFIG.CLKOUT5_DRIVES {BUFG} \
CONFIG.CLKOUT6_DRIVES {BUFG} \
CONFIG.CLKOUT7_DRIVES {BUFG} \
CONFIG.MMCM_CLKFBOUT_MULT_F {9} \
CONFIG.MMCM_CLKIN1_PERIOD {10.0} \
CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {9} \
CONFIG.MMCM_COMPENSATION {ZHOLD} \
CONFIG.MMCM_DIVCLK_DIVIDE {1} \
CONFIG.PRIMITIVE {PLL} \
CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
CONFIG.USE_RESET {false} \
 ] $clk_wiz_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.MMCM_CLKIN1_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN2_PERIOD.VALUE_SRC {DEFAULT} \
 ] $clk_wiz_0

  # Create instance: clk_wiz_1, and set properties
  set clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.3 clk_wiz_1 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {130.958} \
CONFIG.CLKOUT1_PHASE_ERROR {98.575} \
CONFIG.MMCM_CLKFBOUT_MULT_F {10.000} \
CONFIG.MMCM_CLKIN1_PERIOD {10.0} \
CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {10.000} \
CONFIG.MMCM_COMPENSATION {ZHOLD} \
CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
CONFIG.USE_RESET {false} \
 ] $clk_wiz_1

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT1_PHASE_ERROR.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKFBOUT_MULT_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN1_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN2_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_COMPENSATION.VALUE_SRC {DEFAULT} \
 ] $clk_wiz_1

  # Create instance: clk_wiz_2, and set properties
  set clk_wiz_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.3 clk_wiz_2 ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {130.958} \
CONFIG.CLKOUT1_PHASE_ERROR {98.575} \
CONFIG.MMCM_CLKFBOUT_MULT_F {10.000} \
CONFIG.MMCM_CLKIN1_PERIOD {10.0} \
CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {10.000} \
CONFIG.MMCM_COMPENSATION {ZHOLD} \
CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
CONFIG.USE_RESET {false} \
 ] $clk_wiz_2

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER.VALUE_SRC {DEFAULT} \
CONFIG.CLKOUT1_PHASE_ERROR.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKFBOUT_MULT_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN1_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN2_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_COMPENSATION.VALUE_SRC {DEFAULT} \
 ] $clk_wiz_2

  # Create instance: hv_hk_v1_0_0, and set properties
  set hv_hk_v1_0_0 [ create_bd_cell -type ip -vlnv user.org:user:hv_hk_v1_0:1.0 hv_hk_v1_0_0 ]

  # Create instance: inst_interconnect_100MHz, and set properties
  set inst_interconnect_100MHz [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 inst_interconnect_100MHz ]
  set_property -dict [ list \
CONFIG.NUM_MI {14} \
 ] $inst_interconnect_100MHz

  # Create instance: inst_interconnect_200MHz, and set properties
  set inst_interconnect_200MHz [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 inst_interconnect_200MHz ]
  set_property -dict [ list \
CONFIG.NUM_MI {6} \
CONFIG.NUM_SI {1} \
 ] $inst_interconnect_200MHz

  # Create instance: l2_trigger_0, and set properties
  set l2_trigger_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:l2_trigger:1.0 l2_trigger_0 ]

  # Create instance: processing_system7_0, and set properties
  set processing_system7_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 processing_system7_0 ]
  set_property -dict [ list \
CONFIG.PCW_ACT_CAN_PERIPHERAL_FREQMHZ {10.000000} \
CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ {10.158730} \
CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ {125.000000} \
CONFIG.PCW_ACT_ENET1_PERIPHERAL_FREQMHZ {10.000000} \
CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ {200.000000} \
CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ {100.000000} \
CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ {10.000000} \
CONFIG.PCW_ACT_FPGA3_PERIPHERAL_FREQMHZ {10.000000} \
CONFIG.PCW_ACT_PCAP_PERIPHERAL_FREQMHZ {200.000000} \
CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ {10.000000} \
CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ {100.000000} \
CONFIG.PCW_ACT_SMC_PERIPHERAL_FREQMHZ {10.000000} \
CONFIG.PCW_ACT_SPI_PERIPHERAL_FREQMHZ {10.000000} \
CONFIG.PCW_ACT_TPIU_PERIPHERAL_FREQMHZ {200.000000} \
CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ {100.000000} \
CONFIG.PCW_APU_CLK_RATIO_ENABLE {6:2:1} \
CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {666.666666} \
CONFIG.PCW_ARMPLL_CTRL_FBDIV {40} \
CONFIG.PCW_CAN0_CAN0_IO {<Select>} \
CONFIG.PCW_CAN0_GRP_CLK_ENABLE {0} \
CONFIG.PCW_CAN0_GRP_CLK_IO {<Select>} \
CONFIG.PCW_CAN0_PERIPHERAL_CLKSRC {External} \
CONFIG.PCW_CAN0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_CAN1_CAN1_IO {<Select>} \
CONFIG.PCW_CAN1_GRP_CLK_ENABLE {0} \
CONFIG.PCW_CAN1_GRP_CLK_IO {<Select>} \
CONFIG.PCW_CAN1_PERIPHERAL_CLKSRC {External} \
CONFIG.PCW_CAN1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_CAN_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_CAN_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_CAN_PERIPHERAL_DIVISOR1 {1} \
CONFIG.PCW_CAN_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_CLK0_FREQ {200000000} \
CONFIG.PCW_CLK1_FREQ {100000000} \
CONFIG.PCW_CLK2_FREQ {10000000} \
CONFIG.PCW_CLK3_FREQ {10000000} \
CONFIG.PCW_CPU_CPU_6X4X_MAX_RANGE {800} \
CONFIG.PCW_CPU_CPU_PLL_FREQMHZ {1333.333} \
CONFIG.PCW_CPU_PERIPHERAL_CLKSRC {ARM PLL} \
CONFIG.PCW_CPU_PERIPHERAL_DIVISOR0 {2} \
CONFIG.PCW_CRYSTAL_PERIPHERAL_FREQMHZ {33.333333} \
CONFIG.PCW_DCI_PERIPHERAL_CLKSRC {DDR PLL} \
CONFIG.PCW_DCI_PERIPHERAL_DIVISOR0 {15} \
CONFIG.PCW_DCI_PERIPHERAL_DIVISOR1 {7} \
CONFIG.PCW_DCI_PERIPHERAL_FREQMHZ {10.159} \
CONFIG.PCW_DDRPLL_CTRL_FBDIV {32} \
CONFIG.PCW_DDR_DDR_PLL_FREQMHZ {1066.667} \
CONFIG.PCW_DDR_HPRLPR_QUEUE_PARTITION {HPR(0)/LPR(32)} \
CONFIG.PCW_DDR_HPR_TO_CRITICAL_PRIORITY_LEVEL {15} \
CONFIG.PCW_DDR_LPR_TO_CRITICAL_PRIORITY_LEVEL {2} \
CONFIG.PCW_DDR_PERIPHERAL_CLKSRC {DDR PLL} \
CONFIG.PCW_DDR_PERIPHERAL_DIVISOR0 {2} \
CONFIG.PCW_DDR_PORT0_HPR_ENABLE {0} \
CONFIG.PCW_DDR_PORT1_HPR_ENABLE {0} \
CONFIG.PCW_DDR_PORT2_HPR_ENABLE {0} \
CONFIG.PCW_DDR_PORT3_HPR_ENABLE {0} \
CONFIG.PCW_DDR_PRIORITY_READPORT_0 {<Select>} \
CONFIG.PCW_DDR_PRIORITY_READPORT_1 {<Select>} \
CONFIG.PCW_DDR_PRIORITY_READPORT_2 {<Select>} \
CONFIG.PCW_DDR_PRIORITY_READPORT_3 {<Select>} \
CONFIG.PCW_DDR_PRIORITY_WRITEPORT_0 {<Select>} \
CONFIG.PCW_DDR_PRIORITY_WRITEPORT_1 {<Select>} \
CONFIG.PCW_DDR_PRIORITY_WRITEPORT_2 {<Select>} \
CONFIG.PCW_DDR_PRIORITY_WRITEPORT_3 {<Select>} \
CONFIG.PCW_DDR_WRITE_TO_CRITICAL_PRIORITY_LEVEL {2} \
CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
CONFIG.PCW_ENET0_GRP_MDIO_IO {MIO 52 .. 53} \
CONFIG.PCW_ENET0_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0 {8} \
CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR1 {1} \
CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_ENET0_PERIPHERAL_FREQMHZ {1000 Mbps} \
CONFIG.PCW_ENET0_RESET_ENABLE {0} \
CONFIG.PCW_ENET0_RESET_IO {<Select>} \
CONFIG.PCW_ENET1_ENET1_IO {<Select>} \
CONFIG.PCW_ENET1_GRP_MDIO_ENABLE {0} \
CONFIG.PCW_ENET1_GRP_MDIO_IO {<Select>} \
CONFIG.PCW_ENET1_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR1 {1} \
CONFIG.PCW_ENET1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_ENET1_PERIPHERAL_FREQMHZ {1000 Mbps} \
CONFIG.PCW_ENET1_RESET_ENABLE {0} \
CONFIG.PCW_ENET1_RESET_IO {<Select>} \
CONFIG.PCW_ENET_RESET_ENABLE {0} \
CONFIG.PCW_ENET_RESET_POLARITY {Active Low} \
CONFIG.PCW_ENET_RESET_SELECT {<Select>} \
CONFIG.PCW_EN_4K_TIMER {0} \
CONFIG.PCW_EN_CLK1_PORT {1} \
CONFIG.PCW_EN_ENET0 {1} \
CONFIG.PCW_EN_GPIO {0} \
CONFIG.PCW_EN_SDIO0 {1} \
CONFIG.PCW_EN_UART0 {1} \
CONFIG.PCW_EN_UART1 {1} \
CONFIG.PCW_FCLK0_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR0 {5} \
CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR1 {1} \
CONFIG.PCW_FCLK1_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR0 {5} \
CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR1 {2} \
CONFIG.PCW_FCLK2_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR1 {1} \
CONFIG.PCW_FCLK3_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR1 {1} \
CONFIG.PCW_FCLK_CLK0_BUF {true} \
CONFIG.PCW_FCLK_CLK1_BUF {true} \
CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {200} \
CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ {50} \
CONFIG.PCW_FPGA3_PERIPHERAL_FREQMHZ {50} \
CONFIG.PCW_FPGA_FCLK0_ENABLE {1} \
CONFIG.PCW_FPGA_FCLK1_ENABLE {1} \
CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {0} \
CONFIG.PCW_GPIO_EMIO_GPIO_IO {<Select>} \
CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {0} \
CONFIG.PCW_GPIO_MIO_GPIO_IO {<Select>} \
CONFIG.PCW_GPIO_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_I2C0_GRP_INT_ENABLE {0} \
CONFIG.PCW_I2C0_GRP_INT_IO {<Select>} \
CONFIG.PCW_I2C0_I2C0_IO {<Select>} \
CONFIG.PCW_I2C0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_I2C0_RESET_ENABLE {0} \
CONFIG.PCW_I2C0_RESET_IO {<Select>} \
CONFIG.PCW_I2C1_GRP_INT_ENABLE {0} \
CONFIG.PCW_I2C1_GRP_INT_IO {<Select>} \
CONFIG.PCW_I2C1_I2C1_IO {<Select>} \
CONFIG.PCW_I2C1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_I2C1_RESET_ENABLE {0} \
CONFIG.PCW_I2C1_RESET_IO {<Select>} \
CONFIG.PCW_I2C_PERIPHERAL_FREQMHZ {25} \
CONFIG.PCW_I2C_RESET_ENABLE {0} \
CONFIG.PCW_I2C_RESET_POLARITY {Active Low} \
CONFIG.PCW_I2C_RESET_SELECT {<Select>} \
CONFIG.PCW_IOPLL_CTRL_FBDIV {30} \
CONFIG.PCW_IO_IO_PLL_FREQMHZ {1000.000} \
CONFIG.PCW_IRQ_F2P_INTR {1} \
CONFIG.PCW_MIO_0_DIRECTION {<Select>} \
CONFIG.PCW_MIO_0_IOTYPE {<Select>} \
CONFIG.PCW_MIO_0_PULLUP {<Select>} \
CONFIG.PCW_MIO_0_SLEW {<Select>} \
CONFIG.PCW_MIO_10_DIRECTION {<Select>} \
CONFIG.PCW_MIO_10_IOTYPE {<Select>} \
CONFIG.PCW_MIO_10_PULLUP {<Select>} \
CONFIG.PCW_MIO_10_SLEW {<Select>} \
CONFIG.PCW_MIO_11_DIRECTION {<Select>} \
CONFIG.PCW_MIO_11_IOTYPE {<Select>} \
CONFIG.PCW_MIO_11_PULLUP {<Select>} \
CONFIG.PCW_MIO_11_SLEW {<Select>} \
CONFIG.PCW_MIO_12_DIRECTION {out} \
CONFIG.PCW_MIO_12_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_12_PULLUP {enabled} \
CONFIG.PCW_MIO_12_SLEW {slow} \
CONFIG.PCW_MIO_13_DIRECTION {in} \
CONFIG.PCW_MIO_13_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_13_PULLUP {enabled} \
CONFIG.PCW_MIO_13_SLEW {slow} \
CONFIG.PCW_MIO_14_DIRECTION {<Select>} \
CONFIG.PCW_MIO_14_IOTYPE {<Select>} \
CONFIG.PCW_MIO_14_PULLUP {<Select>} \
CONFIG.PCW_MIO_14_SLEW {<Select>} \
CONFIG.PCW_MIO_15_DIRECTION {<Select>} \
CONFIG.PCW_MIO_15_IOTYPE {<Select>} \
CONFIG.PCW_MIO_15_PULLUP {<Select>} \
CONFIG.PCW_MIO_15_SLEW {<Select>} \
CONFIG.PCW_MIO_16_DIRECTION {out} \
CONFIG.PCW_MIO_16_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_16_PULLUP {enabled} \
CONFIG.PCW_MIO_16_SLEW {slow} \
CONFIG.PCW_MIO_17_DIRECTION {out} \
CONFIG.PCW_MIO_17_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_17_PULLUP {enabled} \
CONFIG.PCW_MIO_17_SLEW {slow} \
CONFIG.PCW_MIO_18_DIRECTION {out} \
CONFIG.PCW_MIO_18_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_18_PULLUP {enabled} \
CONFIG.PCW_MIO_18_SLEW {slow} \
CONFIG.PCW_MIO_19_DIRECTION {out} \
CONFIG.PCW_MIO_19_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_19_PULLUP {enabled} \
CONFIG.PCW_MIO_19_SLEW {slow} \
CONFIG.PCW_MIO_1_DIRECTION {<Select>} \
CONFIG.PCW_MIO_1_IOTYPE {<Select>} \
CONFIG.PCW_MIO_1_PULLUP {<Select>} \
CONFIG.PCW_MIO_1_SLEW {<Select>} \
CONFIG.PCW_MIO_20_DIRECTION {out} \
CONFIG.PCW_MIO_20_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_20_PULLUP {enabled} \
CONFIG.PCW_MIO_20_SLEW {slow} \
CONFIG.PCW_MIO_21_DIRECTION {out} \
CONFIG.PCW_MIO_21_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_21_PULLUP {enabled} \
CONFIG.PCW_MIO_21_SLEW {slow} \
CONFIG.PCW_MIO_22_DIRECTION {in} \
CONFIG.PCW_MIO_22_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_22_PULLUP {enabled} \
CONFIG.PCW_MIO_22_SLEW {slow} \
CONFIG.PCW_MIO_23_DIRECTION {in} \
CONFIG.PCW_MIO_23_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_23_PULLUP {enabled} \
CONFIG.PCW_MIO_23_SLEW {slow} \
CONFIG.PCW_MIO_24_DIRECTION {in} \
CONFIG.PCW_MIO_24_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_24_PULLUP {enabled} \
CONFIG.PCW_MIO_24_SLEW {slow} \
CONFIG.PCW_MIO_25_DIRECTION {in} \
CONFIG.PCW_MIO_25_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_25_PULLUP {enabled} \
CONFIG.PCW_MIO_25_SLEW {slow} \
CONFIG.PCW_MIO_26_DIRECTION {in} \
CONFIG.PCW_MIO_26_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_26_PULLUP {enabled} \
CONFIG.PCW_MIO_26_SLEW {slow} \
CONFIG.PCW_MIO_27_DIRECTION {in} \
CONFIG.PCW_MIO_27_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_27_PULLUP {enabled} \
CONFIG.PCW_MIO_27_SLEW {slow} \
CONFIG.PCW_MIO_28_DIRECTION {<Select>} \
CONFIG.PCW_MIO_28_IOTYPE {<Select>} \
CONFIG.PCW_MIO_28_PULLUP {<Select>} \
CONFIG.PCW_MIO_28_SLEW {<Select>} \
CONFIG.PCW_MIO_29_DIRECTION {<Select>} \
CONFIG.PCW_MIO_29_IOTYPE {<Select>} \
CONFIG.PCW_MIO_29_PULLUP {<Select>} \
CONFIG.PCW_MIO_29_SLEW {<Select>} \
CONFIG.PCW_MIO_2_DIRECTION {<Select>} \
CONFIG.PCW_MIO_2_IOTYPE {<Select>} \
CONFIG.PCW_MIO_2_PULLUP {<Select>} \
CONFIG.PCW_MIO_2_SLEW {<Select>} \
CONFIG.PCW_MIO_30_DIRECTION {<Select>} \
CONFIG.PCW_MIO_30_IOTYPE {<Select>} \
CONFIG.PCW_MIO_30_PULLUP {<Select>} \
CONFIG.PCW_MIO_30_SLEW {<Select>} \
CONFIG.PCW_MIO_31_DIRECTION {<Select>} \
CONFIG.PCW_MIO_31_IOTYPE {<Select>} \
CONFIG.PCW_MIO_31_PULLUP {<Select>} \
CONFIG.PCW_MIO_31_SLEW {<Select>} \
CONFIG.PCW_MIO_32_DIRECTION {<Select>} \
CONFIG.PCW_MIO_32_IOTYPE {<Select>} \
CONFIG.PCW_MIO_32_PULLUP {<Select>} \
CONFIG.PCW_MIO_32_SLEW {<Select>} \
CONFIG.PCW_MIO_33_DIRECTION {<Select>} \
CONFIG.PCW_MIO_33_IOTYPE {<Select>} \
CONFIG.PCW_MIO_33_PULLUP {<Select>} \
CONFIG.PCW_MIO_33_SLEW {<Select>} \
CONFIG.PCW_MIO_34_DIRECTION {<Select>} \
CONFIG.PCW_MIO_34_IOTYPE {<Select>} \
CONFIG.PCW_MIO_34_PULLUP {<Select>} \
CONFIG.PCW_MIO_34_SLEW {<Select>} \
CONFIG.PCW_MIO_35_DIRECTION {<Select>} \
CONFIG.PCW_MIO_35_IOTYPE {<Select>} \
CONFIG.PCW_MIO_35_PULLUP {<Select>} \
CONFIG.PCW_MIO_35_SLEW {<Select>} \
CONFIG.PCW_MIO_36_DIRECTION {<Select>} \
CONFIG.PCW_MIO_36_IOTYPE {<Select>} \
CONFIG.PCW_MIO_36_PULLUP {<Select>} \
CONFIG.PCW_MIO_36_SLEW {<Select>} \
CONFIG.PCW_MIO_37_DIRECTION {<Select>} \
CONFIG.PCW_MIO_37_IOTYPE {<Select>} \
CONFIG.PCW_MIO_37_PULLUP {<Select>} \
CONFIG.PCW_MIO_37_SLEW {<Select>} \
CONFIG.PCW_MIO_38_DIRECTION {<Select>} \
CONFIG.PCW_MIO_38_IOTYPE {<Select>} \
CONFIG.PCW_MIO_38_PULLUP {<Select>} \
CONFIG.PCW_MIO_38_SLEW {<Select>} \
CONFIG.PCW_MIO_39_DIRECTION {<Select>} \
CONFIG.PCW_MIO_39_IOTYPE {<Select>} \
CONFIG.PCW_MIO_39_PULLUP {<Select>} \
CONFIG.PCW_MIO_39_SLEW {<Select>} \
CONFIG.PCW_MIO_3_DIRECTION {<Select>} \
CONFIG.PCW_MIO_3_IOTYPE {<Select>} \
CONFIG.PCW_MIO_3_PULLUP {<Select>} \
CONFIG.PCW_MIO_3_SLEW {<Select>} \
CONFIG.PCW_MIO_40_DIRECTION {inout} \
CONFIG.PCW_MIO_40_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_40_PULLUP {enabled} \
CONFIG.PCW_MIO_40_SLEW {slow} \
CONFIG.PCW_MIO_41_DIRECTION {inout} \
CONFIG.PCW_MIO_41_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_41_PULLUP {enabled} \
CONFIG.PCW_MIO_41_SLEW {slow} \
CONFIG.PCW_MIO_42_DIRECTION {inout} \
CONFIG.PCW_MIO_42_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_42_PULLUP {enabled} \
CONFIG.PCW_MIO_42_SLEW {slow} \
CONFIG.PCW_MIO_43_DIRECTION {inout} \
CONFIG.PCW_MIO_43_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_43_PULLUP {enabled} \
CONFIG.PCW_MIO_43_SLEW {slow} \
CONFIG.PCW_MIO_44_DIRECTION {inout} \
CONFIG.PCW_MIO_44_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_44_PULLUP {enabled} \
CONFIG.PCW_MIO_44_SLEW {slow} \
CONFIG.PCW_MIO_45_DIRECTION {inout} \
CONFIG.PCW_MIO_45_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_45_PULLUP {enabled} \
CONFIG.PCW_MIO_45_SLEW {slow} \
CONFIG.PCW_MIO_46_DIRECTION {<Select>} \
CONFIG.PCW_MIO_46_IOTYPE {<Select>} \
CONFIG.PCW_MIO_46_PULLUP {<Select>} \
CONFIG.PCW_MIO_46_SLEW {<Select>} \
CONFIG.PCW_MIO_47_DIRECTION {<Select>} \
CONFIG.PCW_MIO_47_IOTYPE {<Select>} \
CONFIG.PCW_MIO_47_PULLUP {<Select>} \
CONFIG.PCW_MIO_47_SLEW {<Select>} \
CONFIG.PCW_MIO_48_DIRECTION {out} \
CONFIG.PCW_MIO_48_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_48_PULLUP {enabled} \
CONFIG.PCW_MIO_48_SLEW {slow} \
CONFIG.PCW_MIO_49_DIRECTION {in} \
CONFIG.PCW_MIO_49_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_49_PULLUP {enabled} \
CONFIG.PCW_MIO_49_SLEW {slow} \
CONFIG.PCW_MIO_4_DIRECTION {<Select>} \
CONFIG.PCW_MIO_4_IOTYPE {<Select>} \
CONFIG.PCW_MIO_4_PULLUP {<Select>} \
CONFIG.PCW_MIO_4_SLEW {<Select>} \
CONFIG.PCW_MIO_50_DIRECTION {in} \
CONFIG.PCW_MIO_50_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_50_PULLUP {enabled} \
CONFIG.PCW_MIO_50_SLEW {slow} \
CONFIG.PCW_MIO_51_DIRECTION {out} \
CONFIG.PCW_MIO_51_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_51_PULLUP {enabled} \
CONFIG.PCW_MIO_51_SLEW {slow} \
CONFIG.PCW_MIO_52_DIRECTION {out} \
CONFIG.PCW_MIO_52_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_52_PULLUP {enabled} \
CONFIG.PCW_MIO_52_SLEW {slow} \
CONFIG.PCW_MIO_53_DIRECTION {inout} \
CONFIG.PCW_MIO_53_IOTYPE {LVCMOS 1.8V} \
CONFIG.PCW_MIO_53_PULLUP {enabled} \
CONFIG.PCW_MIO_53_SLEW {slow} \
CONFIG.PCW_MIO_5_DIRECTION {<Select>} \
CONFIG.PCW_MIO_5_IOTYPE {<Select>} \
CONFIG.PCW_MIO_5_PULLUP {<Select>} \
CONFIG.PCW_MIO_5_SLEW {<Select>} \
CONFIG.PCW_MIO_6_DIRECTION {<Select>} \
CONFIG.PCW_MIO_6_IOTYPE {<Select>} \
CONFIG.PCW_MIO_6_PULLUP {<Select>} \
CONFIG.PCW_MIO_6_SLEW {<Select>} \
CONFIG.PCW_MIO_7_DIRECTION {<Select>} \
CONFIG.PCW_MIO_7_IOTYPE {<Select>} \
CONFIG.PCW_MIO_7_PULLUP {<Select>} \
CONFIG.PCW_MIO_7_SLEW {<Select>} \
CONFIG.PCW_MIO_8_DIRECTION {<Select>} \
CONFIG.PCW_MIO_8_IOTYPE {<Select>} \
CONFIG.PCW_MIO_8_PULLUP {<Select>} \
CONFIG.PCW_MIO_8_SLEW {<Select>} \
CONFIG.PCW_MIO_9_DIRECTION {<Select>} \
CONFIG.PCW_MIO_9_IOTYPE {<Select>} \
CONFIG.PCW_MIO_9_PULLUP {<Select>} \
CONFIG.PCW_MIO_9_SLEW {<Select>} \
CONFIG.PCW_MIO_TREE_PERIPHERALS {unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#Enet 0#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#SD 0#SD 0#SD 0#SD 0#SD 0#SD 0#unassigned#unassigned#UART 1#UART 1#UART 0#UART 0#Enet 0#Enet 0} \
CONFIG.PCW_MIO_TREE_SIGNALS {unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#tx_clk#txd[0]#txd[1]#txd[2]#txd[3]#tx_ctl#rx_clk#rxd[0]#rxd[1]#rxd[2]#rxd[3]#rx_ctl#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#unassigned#clk#cmd#data[0]#data[1]#data[2]#data[3]#unassigned#unassigned#tx#rx#rx#tx#mdc#mdio} \
CONFIG.PCW_NAND_CYCLES_T_AR {1} \
CONFIG.PCW_NAND_CYCLES_T_CLR {1} \
CONFIG.PCW_NAND_CYCLES_T_RC {11} \
CONFIG.PCW_NAND_CYCLES_T_REA {1} \
CONFIG.PCW_NAND_CYCLES_T_RR {1} \
CONFIG.PCW_NAND_CYCLES_T_WC {11} \
CONFIG.PCW_NAND_CYCLES_T_WP {1} \
CONFIG.PCW_NAND_GRP_D8_ENABLE {0} \
CONFIG.PCW_NAND_GRP_D8_IO {<Select>} \
CONFIG.PCW_NAND_NAND_IO {<Select>} \
CONFIG.PCW_NAND_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_NOR_CS0_T_CEOE {1} \
CONFIG.PCW_NOR_CS0_T_PC {1} \
CONFIG.PCW_NOR_CS0_T_RC {11} \
CONFIG.PCW_NOR_CS0_T_TR {1} \
CONFIG.PCW_NOR_CS0_T_WC {11} \
CONFIG.PCW_NOR_CS0_T_WP {1} \
CONFIG.PCW_NOR_CS0_WE_TIME {0} \
CONFIG.PCW_NOR_CS1_T_CEOE {1} \
CONFIG.PCW_NOR_CS1_T_PC {1} \
CONFIG.PCW_NOR_CS1_T_RC {11} \
CONFIG.PCW_NOR_CS1_T_TR {1} \
CONFIG.PCW_NOR_CS1_T_WC {11} \
CONFIG.PCW_NOR_CS1_T_WP {1} \
CONFIG.PCW_NOR_CS1_WE_TIME {0} \
CONFIG.PCW_NOR_GRP_A25_ENABLE {0} \
CONFIG.PCW_NOR_GRP_A25_IO {<Select>} \
CONFIG.PCW_NOR_GRP_CS0_ENABLE {0} \
CONFIG.PCW_NOR_GRP_CS0_IO {<Select>} \
CONFIG.PCW_NOR_GRP_CS1_ENABLE {0} \
CONFIG.PCW_NOR_GRP_CS1_IO {<Select>} \
CONFIG.PCW_NOR_GRP_SRAM_CS0_ENABLE {0} \
CONFIG.PCW_NOR_GRP_SRAM_CS0_IO {<Select>} \
CONFIG.PCW_NOR_GRP_SRAM_CS1_ENABLE {0} \
CONFIG.PCW_NOR_GRP_SRAM_CS1_IO {<Select>} \
CONFIG.PCW_NOR_GRP_SRAM_INT_ENABLE {0} \
CONFIG.PCW_NOR_GRP_SRAM_INT_IO {<Select>} \
CONFIG.PCW_NOR_NOR_IO {<Select>} \
CONFIG.PCW_NOR_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_NOR_SRAM_CS0_T_CEOE {1} \
CONFIG.PCW_NOR_SRAM_CS0_T_PC {1} \
CONFIG.PCW_NOR_SRAM_CS0_T_RC {11} \
CONFIG.PCW_NOR_SRAM_CS0_T_TR {1} \
CONFIG.PCW_NOR_SRAM_CS0_T_WC {11} \
CONFIG.PCW_NOR_SRAM_CS0_T_WP {1} \
CONFIG.PCW_NOR_SRAM_CS0_WE_TIME {0} \
CONFIG.PCW_NOR_SRAM_CS1_T_CEOE {1} \
CONFIG.PCW_NOR_SRAM_CS1_T_PC {1} \
CONFIG.PCW_NOR_SRAM_CS1_T_RC {11} \
CONFIG.PCW_NOR_SRAM_CS1_T_TR {1} \
CONFIG.PCW_NOR_SRAM_CS1_T_WC {11} \
CONFIG.PCW_NOR_SRAM_CS1_T_WP {1} \
CONFIG.PCW_NOR_SRAM_CS1_WE_TIME {0} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY0 {0.109} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY1 {0.098} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY2 {0.100} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY3 {0.106} \
CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_0 {-0.022} \
CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_1 {0.007} \
CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_3 {-0.015} \
CONFIG.PCW_PACKAGE_NAME {ffg676} \
CONFIG.PCW_PCAP_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_PCAP_PERIPHERAL_DIVISOR0 {5} \
CONFIG.PCW_PCAP_PERIPHERAL_FREQMHZ {200} \
CONFIG.PCW_PJTAG_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_PJTAG_PJTAG_IO {<Select>} \
CONFIG.PCW_PLL_BYPASSMODE_ENABLE {0} \
CONFIG.PCW_PRESET_BANK0_VOLTAGE {LVCMOS 1.8V} \
CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} \
CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {0} \
CONFIG.PCW_QSPI_GRP_FBCLK_IO {<Select>} \
CONFIG.PCW_QSPI_GRP_IO1_ENABLE {0} \
CONFIG.PCW_QSPI_GRP_IO1_IO {<Select>} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {0} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_IO {<Select>} \
CONFIG.PCW_QSPI_GRP_SS1_ENABLE {0} \
CONFIG.PCW_QSPI_GRP_SS1_IO {<Select>} \
CONFIG.PCW_QSPI_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_QSPI_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_QSPI_PERIPHERAL_FREQMHZ {200} \
CONFIG.PCW_QSPI_QSPI_IO {<Select>} \
CONFIG.PCW_SD0_GRP_CD_ENABLE {0} \
CONFIG.PCW_SD0_GRP_CD_IO {<Select>} \
CONFIG.PCW_SD0_GRP_POW_ENABLE {0} \
CONFIG.PCW_SD0_GRP_POW_IO {<Select>} \
CONFIG.PCW_SD0_GRP_WP_ENABLE {0} \
CONFIG.PCW_SD0_GRP_WP_IO {<Select>} \
CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_SD0_SD0_IO {MIO 40 .. 45} \
CONFIG.PCW_SD1_GRP_CD_ENABLE {0} \
CONFIG.PCW_SD1_GRP_CD_IO {<Select>} \
CONFIG.PCW_SD1_GRP_POW_ENABLE {0} \
CONFIG.PCW_SD1_GRP_POW_IO {<Select>} \
CONFIG.PCW_SD1_GRP_WP_ENABLE {0} \
CONFIG.PCW_SD1_GRP_WP_IO {<Select>} \
CONFIG.PCW_SD1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_SD1_SD1_IO {<Select>} \
CONFIG.PCW_SDIO_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_SDIO_PERIPHERAL_DIVISOR0 {10} \
CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_SDIO_PERIPHERAL_VALID {1} \
CONFIG.PCW_SMC_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_SMC_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_SMC_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_SPI0_GRP_SS0_ENABLE {0} \
CONFIG.PCW_SPI0_GRP_SS0_IO {<Select>} \
CONFIG.PCW_SPI0_GRP_SS1_ENABLE {0} \
CONFIG.PCW_SPI0_GRP_SS1_IO {<Select>} \
CONFIG.PCW_SPI0_GRP_SS2_ENABLE {0} \
CONFIG.PCW_SPI0_GRP_SS2_IO {<Select>} \
CONFIG.PCW_SPI0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_SPI0_SPI0_IO {<Select>} \
CONFIG.PCW_SPI1_GRP_SS0_ENABLE {0} \
CONFIG.PCW_SPI1_GRP_SS0_IO {<Select>} \
CONFIG.PCW_SPI1_GRP_SS1_ENABLE {0} \
CONFIG.PCW_SPI1_GRP_SS1_IO {<Select>} \
CONFIG.PCW_SPI1_GRP_SS2_ENABLE {0} \
CONFIG.PCW_SPI1_GRP_SS2_IO {<Select>} \
CONFIG.PCW_SPI1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_SPI1_SPI1_IO {<Select>} \
CONFIG.PCW_SPI_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_SPI_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_SPI_PERIPHERAL_FREQMHZ {166.666666} \
CONFIG.PCW_S_AXI_HP0_DATA_WIDTH {64} \
CONFIG.PCW_S_AXI_HP1_DATA_WIDTH {64} \
CONFIG.PCW_S_AXI_HP2_DATA_WIDTH {64} \
CONFIG.PCW_S_AXI_HP3_DATA_WIDTH {64} \
CONFIG.PCW_TPIU_PERIPHERAL_CLKSRC {External} \
CONFIG.PCW_TPIU_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_TPIU_PERIPHERAL_FREQMHZ {200} \
CONFIG.PCW_TRACE_GRP_16BIT_ENABLE {0} \
CONFIG.PCW_TRACE_GRP_16BIT_IO {<Select>} \
CONFIG.PCW_TRACE_GRP_2BIT_ENABLE {0} \
CONFIG.PCW_TRACE_GRP_2BIT_IO {<Select>} \
CONFIG.PCW_TRACE_GRP_32BIT_ENABLE {0} \
CONFIG.PCW_TRACE_GRP_32BIT_IO {<Select>} \
CONFIG.PCW_TRACE_GRP_4BIT_ENABLE {0} \
CONFIG.PCW_TRACE_GRP_4BIT_IO {<Select>} \
CONFIG.PCW_TRACE_GRP_8BIT_ENABLE {0} \
CONFIG.PCW_TRACE_GRP_8BIT_IO {<Select>} \
CONFIG.PCW_TRACE_INTERNAL_WIDTH {2} \
CONFIG.PCW_TRACE_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_TRACE_TRACE_IO {<Select>} \
CONFIG.PCW_TTC0_CLK0_PERIPHERAL_CLKSRC {CPU_1X} \
CONFIG.PCW_TTC0_CLK0_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_TTC0_CLK0_PERIPHERAL_FREQMHZ {133.333333} \
CONFIG.PCW_TTC0_CLK1_PERIPHERAL_CLKSRC {CPU_1X} \
CONFIG.PCW_TTC0_CLK1_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_TTC0_CLK1_PERIPHERAL_FREQMHZ {133.333333} \
CONFIG.PCW_TTC0_CLK2_PERIPHERAL_CLKSRC {CPU_1X} \
CONFIG.PCW_TTC0_CLK2_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_TTC0_CLK2_PERIPHERAL_FREQMHZ {133.333333} \
CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_TTC0_TTC0_IO {<Select>} \
CONFIG.PCW_TTC1_CLK0_PERIPHERAL_CLKSRC {CPU_1X} \
CONFIG.PCW_TTC1_CLK0_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_TTC1_CLK0_PERIPHERAL_FREQMHZ {133.333333} \
CONFIG.PCW_TTC1_CLK1_PERIPHERAL_CLKSRC {CPU_1X} \
CONFIG.PCW_TTC1_CLK1_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_TTC1_CLK1_PERIPHERAL_FREQMHZ {133.333333} \
CONFIG.PCW_TTC1_CLK2_PERIPHERAL_CLKSRC {CPU_1X} \
CONFIG.PCW_TTC1_CLK2_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_TTC1_CLK2_PERIPHERAL_FREQMHZ {133.333333} \
CONFIG.PCW_TTC1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_TTC1_TTC1_IO {<Select>} \
CONFIG.PCW_TTC_PERIPHERAL_FREQMHZ {50} \
CONFIG.PCW_UART0_BAUD_RATE {115200} \
CONFIG.PCW_UART0_GRP_FULL_ENABLE {0} \
CONFIG.PCW_UART0_GRP_FULL_IO {<Select>} \
CONFIG.PCW_UART0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_UART0_UART0_IO {MIO 50 .. 51} \
CONFIG.PCW_UART1_BAUD_RATE {115200} \
CONFIG.PCW_UART1_GRP_FULL_ENABLE {0} \
CONFIG.PCW_UART1_GRP_FULL_IO {<Select>} \
CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_UART1_UART1_IO {MIO 48 .. 49} \
CONFIG.PCW_UART_PERIPHERAL_CLKSRC {IO PLL} \
CONFIG.PCW_UART_PERIPHERAL_DIVISOR0 {10} \
CONFIG.PCW_UART_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_UART_PERIPHERAL_VALID {1} \
CONFIG.PCW_UIPARAM_DDR_ADV_ENABLE {0} \
CONFIG.PCW_UIPARAM_DDR_AL {0} \
CONFIG.PCW_UIPARAM_DDR_BANK_ADDR_COUNT {3} \
CONFIG.PCW_UIPARAM_DDR_BL {8} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0 {0.0} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1 {0.0} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2 {0.0} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3 {0.0} \
CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH {32 Bit} \
CONFIG.PCW_UIPARAM_DDR_CL {7} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_0_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PACKAGE_LENGTH {97.8165} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_1_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PACKAGE_LENGTH {97.8165} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_2_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PACKAGE_LENGTH {97.8165} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_3_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PACKAGE_LENGTH {97.8165} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_STOP_EN {0} \
CONFIG.PCW_UIPARAM_DDR_COL_ADDR_COUNT {10} \
CONFIG.PCW_UIPARAM_DDR_CWL {6} \
CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY {4096 MBits} \
CONFIG.PCW_UIPARAM_DDR_DQS_0_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_DQS_0_PACKAGE_LENGTH {119.765} \
CONFIG.PCW_UIPARAM_DDR_DQS_0_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_DQS_1_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_DQS_1_PACKAGE_LENGTH {90.906} \
CONFIG.PCW_UIPARAM_DDR_DQS_1_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_DQS_2_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_DQS_2_PACKAGE_LENGTH {106.248} \
CONFIG.PCW_UIPARAM_DDR_DQS_2_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_DQS_3_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_DQS_3_PACKAGE_LENGTH {113.2035} \
CONFIG.PCW_UIPARAM_DDR_DQS_3_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0 {0.0} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1 {0.0} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2 {0.0} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3 {0.0} \
CONFIG.PCW_UIPARAM_DDR_DQ_0_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_DQ_0_PACKAGE_LENGTH {120.1555} \
CONFIG.PCW_UIPARAM_DDR_DQ_0_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_DQ_1_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_DQ_1_PACKAGE_LENGTH {97.811} \
CONFIG.PCW_UIPARAM_DDR_DQ_1_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_DQ_2_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_DQ_2_PACKAGE_LENGTH {102.5285} \
CONFIG.PCW_UIPARAM_DDR_DQ_2_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_DQ_3_LENGTH_MM {0} \
CONFIG.PCW_UIPARAM_DDR_DQ_3_PACKAGE_LENGTH {113.5445} \
CONFIG.PCW_UIPARAM_DDR_DQ_3_PROPOGATION_DELAY {160} \
CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH {16 Bits} \
CONFIG.PCW_UIPARAM_DDR_ECC {Disabled} \
CONFIG.PCW_UIPARAM_DDR_ENABLE {1} \
CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ {533.333333} \
CONFIG.PCW_UIPARAM_DDR_HIGH_TEMP {Normal (0-85)} \
CONFIG.PCW_UIPARAM_DDR_MEMORY_TYPE {DDR 3} \
CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41K256M16 RE-15E} \
CONFIG.PCW_UIPARAM_DDR_ROW_ADDR_COUNT {15} \
CONFIG.PCW_UIPARAM_DDR_SPEED_BIN {DDR3_1066F} \
CONFIG.PCW_UIPARAM_DDR_TRAIN_DATA_EYE {1} \
CONFIG.PCW_UIPARAM_DDR_TRAIN_READ_GATE {1} \
CONFIG.PCW_UIPARAM_DDR_TRAIN_WRITE_LEVEL {1} \
CONFIG.PCW_UIPARAM_DDR_T_FAW {45.0} \
CONFIG.PCW_UIPARAM_DDR_T_RAS_MIN {36.0} \
CONFIG.PCW_UIPARAM_DDR_T_RC {49.5} \
CONFIG.PCW_UIPARAM_DDR_T_RCD {7} \
CONFIG.PCW_UIPARAM_DDR_T_RP {7} \
CONFIG.PCW_UIPARAM_DDR_USE_INTERNAL_VREF {0} \
CONFIG.PCW_USB0_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_USB0_PERIPHERAL_FREQMHZ {60} \
CONFIG.PCW_USB0_RESET_ENABLE {0} \
CONFIG.PCW_USB0_RESET_IO {<Select>} \
CONFIG.PCW_USB0_USB0_IO {<Select>} \
CONFIG.PCW_USB1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_USB1_PERIPHERAL_FREQMHZ {60} \
CONFIG.PCW_USB1_RESET_ENABLE {0} \
CONFIG.PCW_USB1_RESET_IO {<Select>} \
CONFIG.PCW_USB1_USB1_IO {<Select>} \
CONFIG.PCW_USB_RESET_ENABLE {0} \
CONFIG.PCW_USB_RESET_POLARITY {Active Low} \
CONFIG.PCW_USB_RESET_SELECT {<Select>} \
CONFIG.PCW_USE_CROSS_TRIGGER {0} \
CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
CONFIG.PCW_USE_M_AXI_GP1 {1} \
CONFIG.PCW_USE_S_AXI_GP0 {0} \
CONFIG.PCW_USE_S_AXI_HP0 {1} \
CONFIG.PCW_USE_S_AXI_HP1 {1} \
CONFIG.PCW_WDT_PERIPHERAL_CLKSRC {CPU_1X} \
CONFIG.PCW_WDT_PERIPHERAL_DIVISOR0 {1} \
CONFIG.PCW_WDT_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_WDT_PERIPHERAL_FREQMHZ {133.333333} \
CONFIG.PCW_WDT_WDT_IO {<Select>} \
 ] $processing_system7_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.PCW_ACT_CAN_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ACT_DCI_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ACT_ENET0_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ACT_ENET1_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ACT_FPGA0_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ACT_FPGA1_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ACT_FPGA2_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ACT_FPGA3_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ACT_PCAP_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ACT_QSPI_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ACT_SDIO_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ACT_SMC_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ACT_SPI_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ACT_TPIU_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ACT_UART_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_APU_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ARMPLL_CTRL_FBDIV.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CAN0_CAN0_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CAN0_GRP_CLK_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CAN0_GRP_CLK_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CAN0_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CAN0_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CAN1_CAN1_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CAN1_GRP_CLK_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CAN1_GRP_CLK_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CAN1_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CAN1_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CAN_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CAN_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CAN_PERIPHERAL_DIVISOR1.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CAN_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CLK0_FREQ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CLK1_FREQ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CLK2_FREQ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CLK3_FREQ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CPU_CPU_6X4X_MAX_RANGE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CPU_CPU_PLL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CPU_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CPU_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_CRYSTAL_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DCI_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DCI_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DCI_PERIPHERAL_DIVISOR1.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DCI_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDRPLL_CTRL_FBDIV.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_DDR_PLL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_HPRLPR_QUEUE_PARTITION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_HPR_TO_CRITICAL_PRIORITY_LEVEL.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_LPR_TO_CRITICAL_PRIORITY_LEVEL.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_PORT0_HPR_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_PORT1_HPR_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_PORT2_HPR_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_PORT3_HPR_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_PRIORITY_READPORT_0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_PRIORITY_READPORT_1.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_PRIORITY_READPORT_2.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_PRIORITY_READPORT_3.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_PRIORITY_WRITEPORT_0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_PRIORITY_WRITEPORT_1.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_PRIORITY_WRITEPORT_2.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_PRIORITY_WRITEPORT_3.VALUE_SRC {DEFAULT} \
CONFIG.PCW_DDR_WRITE_TO_CRITICAL_PRIORITY_LEVEL.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET0_GRP_MDIO_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET0_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET0_PERIPHERAL_DIVISOR1.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET0_RESET_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET0_RESET_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET1_ENET1_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET1_GRP_MDIO_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET1_GRP_MDIO_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET1_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET1_PERIPHERAL_DIVISOR1.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET1_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET1_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET1_RESET_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET1_RESET_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET_RESET_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET_RESET_POLARITY.VALUE_SRC {DEFAULT} \
CONFIG.PCW_ENET_RESET_SELECT.VALUE_SRC {DEFAULT} \
CONFIG.PCW_EN_4K_TIMER.VALUE_SRC {DEFAULT} \
CONFIG.PCW_EN_ENET0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_EN_GPIO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_EN_SDIO0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_EN_UART0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_EN_UART1.VALUE_SRC {DEFAULT} \
CONFIG.PCW_FCLK0_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_FCLK0_PERIPHERAL_DIVISOR1.VALUE_SRC {DEFAULT} \
CONFIG.PCW_FCLK1_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_FCLK1_PERIPHERAL_DIVISOR1.VALUE_SRC {DEFAULT} \
CONFIG.PCW_FCLK2_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_FCLK2_PERIPHERAL_DIVISOR1.VALUE_SRC {DEFAULT} \
CONFIG.PCW_FCLK3_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_FCLK3_PERIPHERAL_DIVISOR1.VALUE_SRC {DEFAULT} \
CONFIG.PCW_FCLK_CLK0_BUF.VALUE_SRC {DEFAULT} \
CONFIG.PCW_FCLK_CLK1_BUF.VALUE_SRC {DEFAULT} \
CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_FPGA3_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_FPGA_FCLK0_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_FPGA_FCLK1_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_GPIO_EMIO_GPIO_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_GPIO_MIO_GPIO_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_GPIO_MIO_GPIO_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_GPIO_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_I2C0_GRP_INT_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_I2C0_GRP_INT_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_I2C0_I2C0_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_I2C0_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_I2C0_RESET_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_I2C0_RESET_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_I2C1_GRP_INT_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_I2C1_GRP_INT_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_I2C1_I2C1_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_I2C1_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_I2C1_RESET_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_I2C1_RESET_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_I2C_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_I2C_RESET_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_I2C_RESET_POLARITY.VALUE_SRC {DEFAULT} \
CONFIG.PCW_I2C_RESET_SELECT.VALUE_SRC {DEFAULT} \
CONFIG.PCW_IOPLL_CTRL_FBDIV.VALUE_SRC {DEFAULT} \
CONFIG.PCW_IO_IO_PLL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_0_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_0_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_0_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_0_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_10_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_10_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_10_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_10_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_11_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_11_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_11_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_11_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_12_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_12_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_12_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_12_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_13_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_13_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_13_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_13_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_14_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_14_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_14_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_14_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_15_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_15_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_15_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_15_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_16_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_16_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_16_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_16_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_17_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_17_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_17_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_17_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_18_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_18_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_18_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_18_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_19_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_19_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_19_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_19_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_1_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_1_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_1_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_1_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_20_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_20_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_20_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_20_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_21_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_21_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_21_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_21_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_22_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_22_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_22_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_22_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_23_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_23_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_23_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_23_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_24_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_24_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_24_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_24_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_25_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_25_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_25_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_25_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_26_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_26_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_26_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_26_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_27_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_27_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_27_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_27_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_28_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_28_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_28_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_28_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_29_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_29_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_29_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_29_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_2_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_2_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_2_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_2_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_30_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_30_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_30_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_30_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_31_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_31_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_31_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_31_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_32_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_32_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_32_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_32_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_33_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_33_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_33_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_33_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_34_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_34_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_34_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_34_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_35_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_35_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_35_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_35_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_36_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_36_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_36_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_36_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_37_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_37_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_37_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_37_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_38_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_38_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_38_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_38_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_39_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_39_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_39_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_39_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_3_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_3_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_3_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_3_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_40_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_40_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_40_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_40_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_41_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_41_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_41_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_41_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_42_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_42_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_42_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_42_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_43_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_43_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_43_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_43_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_44_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_44_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_44_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_44_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_45_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_45_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_45_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_45_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_46_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_46_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_46_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_46_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_47_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_47_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_47_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_47_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_48_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_48_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_48_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_48_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_49_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_49_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_49_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_49_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_4_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_4_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_4_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_4_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_50_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_50_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_50_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_50_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_51_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_51_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_51_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_51_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_52_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_52_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_52_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_52_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_53_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_53_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_53_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_53_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_5_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_5_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_5_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_5_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_6_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_6_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_6_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_6_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_7_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_7_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_7_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_7_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_8_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_8_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_8_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_8_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_9_DIRECTION.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_9_IOTYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_9_PULLUP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_9_SLEW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_TREE_PERIPHERALS.VALUE_SRC {DEFAULT} \
CONFIG.PCW_MIO_TREE_SIGNALS.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NAND_CYCLES_T_AR.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NAND_CYCLES_T_CLR.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NAND_CYCLES_T_RC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NAND_CYCLES_T_REA.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NAND_CYCLES_T_RR.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NAND_CYCLES_T_WC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NAND_CYCLES_T_WP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NAND_GRP_D8_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NAND_GRP_D8_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NAND_NAND_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NAND_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_CS0_T_CEOE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_CS0_T_PC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_CS0_T_RC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_CS0_T_TR.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_CS0_T_WC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_CS0_T_WP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_CS0_WE_TIME.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_CS1_T_CEOE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_CS1_T_PC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_CS1_T_RC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_CS1_T_TR.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_CS1_T_WC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_CS1_T_WP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_CS1_WE_TIME.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_GRP_A25_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_GRP_A25_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_GRP_CS0_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_GRP_CS0_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_GRP_CS1_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_GRP_CS1_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_GRP_SRAM_CS0_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_GRP_SRAM_CS0_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_GRP_SRAM_CS1_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_GRP_SRAM_CS1_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_GRP_SRAM_INT_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_GRP_SRAM_INT_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_NOR_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_SRAM_CS0_T_CEOE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_SRAM_CS0_T_PC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_SRAM_CS0_T_RC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_SRAM_CS0_T_TR.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_SRAM_CS0_T_WC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_SRAM_CS0_T_WP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_SRAM_CS0_WE_TIME.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_SRAM_CS1_T_CEOE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_SRAM_CS1_T_PC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_SRAM_CS1_T_RC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_SRAM_CS1_T_TR.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_SRAM_CS1_T_WC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_SRAM_CS1_T_WP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_NOR_SRAM_CS1_WE_TIME.VALUE_SRC {DEFAULT} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY1.VALUE_SRC {DEFAULT} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY2.VALUE_SRC {DEFAULT} \
CONFIG.PCW_PACKAGE_DDR_BOARD_DELAY3.VALUE_SRC {DEFAULT} \
CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_1.VALUE_SRC {DEFAULT} \
CONFIG.PCW_PACKAGE_DDR_DQS_TO_CLK_DELAY_3.VALUE_SRC {DEFAULT} \
CONFIG.PCW_PACKAGE_NAME.VALUE_SRC {DEFAULT} \
CONFIG.PCW_PCAP_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_PCAP_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_PCAP_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_PJTAG_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_PJTAG_PJTAG_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_PLL_BYPASSMODE_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_QSPI_GRP_FBCLK_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_QSPI_GRP_IO1_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_QSPI_GRP_IO1_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_QSPI_GRP_SS1_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_QSPI_GRP_SS1_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_QSPI_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_QSPI_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_QSPI_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_QSPI_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_QSPI_QSPI_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SD0_GRP_CD_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SD0_GRP_CD_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SD0_GRP_POW_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SD0_GRP_POW_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SD0_GRP_WP_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SD0_GRP_WP_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SD0_SD0_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SD1_GRP_CD_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SD1_GRP_CD_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SD1_GRP_POW_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SD1_GRP_POW_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SD1_GRP_WP_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SD1_GRP_WP_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SD1_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SD1_SD1_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SDIO_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SDIO_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SDIO_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SDIO_PERIPHERAL_VALID.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SMC_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SMC_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SMC_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI0_GRP_SS0_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI0_GRP_SS0_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI0_GRP_SS1_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI0_GRP_SS1_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI0_GRP_SS2_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI0_GRP_SS2_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI0_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI0_SPI0_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI1_GRP_SS0_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI1_GRP_SS0_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI1_GRP_SS1_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI1_GRP_SS1_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI1_GRP_SS2_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI1_GRP_SS2_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI1_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI1_SPI1_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_SPI_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_S_AXI_HP0_DATA_WIDTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_S_AXI_HP1_DATA_WIDTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_S_AXI_HP2_DATA_WIDTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_S_AXI_HP3_DATA_WIDTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TPIU_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TPIU_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TPIU_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TRACE_GRP_16BIT_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TRACE_GRP_16BIT_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TRACE_GRP_2BIT_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TRACE_GRP_2BIT_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TRACE_GRP_32BIT_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TRACE_GRP_32BIT_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TRACE_GRP_4BIT_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TRACE_GRP_4BIT_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TRACE_GRP_8BIT_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TRACE_GRP_8BIT_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TRACE_INTERNAL_WIDTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TRACE_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TRACE_TRACE_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC0_CLK0_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC0_CLK0_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC0_CLK0_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC0_CLK1_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC0_CLK1_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC0_CLK1_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC0_CLK2_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC0_CLK2_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC0_CLK2_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC0_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC0_TTC0_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC1_CLK0_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC1_CLK0_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC1_CLK0_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC1_CLK1_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC1_CLK1_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC1_CLK1_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC1_CLK2_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC1_CLK2_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC1_CLK2_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC1_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC1_TTC1_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_TTC_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UART0_BAUD_RATE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UART0_GRP_FULL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UART0_GRP_FULL_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UART1_BAUD_RATE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UART1_GRP_FULL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UART1_GRP_FULL_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UART_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UART_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UART_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UART_PERIPHERAL_VALID.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_ADV_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_AL.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_BANK_ADDR_COUNT.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_BL.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY1.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY2.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_BOARD_DELAY3.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_BUS_WIDTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_CL.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_0_LENGTH_MM.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PACKAGE_LENGTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_0_PROPOGATION_DELAY.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_1_LENGTH_MM.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PACKAGE_LENGTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_1_PROPOGATION_DELAY.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_2_LENGTH_MM.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PACKAGE_LENGTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_2_PROPOGATION_DELAY.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_3_LENGTH_MM.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PACKAGE_LENGTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_3_PROPOGATION_DELAY.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_CLOCK_STOP_EN.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_COL_ADDR_COUNT.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_CWL.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DEVICE_CAPACITY.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQS_0_LENGTH_MM.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQS_0_PACKAGE_LENGTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQS_0_PROPOGATION_DELAY.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQS_1_LENGTH_MM.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQS_1_PACKAGE_LENGTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQS_1_PROPOGATION_DELAY.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQS_2_LENGTH_MM.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQS_2_PACKAGE_LENGTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQS_2_PROPOGATION_DELAY.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQS_3_LENGTH_MM.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQS_3_PACKAGE_LENGTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQS_3_PROPOGATION_DELAY.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_1.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_2.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQS_TO_CLK_DELAY_3.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQ_0_LENGTH_MM.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQ_0_PACKAGE_LENGTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQ_0_PROPOGATION_DELAY.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQ_1_LENGTH_MM.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQ_1_PACKAGE_LENGTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQ_1_PROPOGATION_DELAY.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQ_2_LENGTH_MM.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQ_2_PACKAGE_LENGTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQ_2_PROPOGATION_DELAY.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQ_3_LENGTH_MM.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQ_3_PACKAGE_LENGTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DQ_3_PROPOGATION_DELAY.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_DRAM_WIDTH.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_ECC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_FREQ_MHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_HIGH_TEMP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_MEMORY_TYPE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_ROW_ADDR_COUNT.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_SPEED_BIN.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_TRAIN_DATA_EYE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_TRAIN_READ_GATE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_TRAIN_WRITE_LEVEL.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_T_FAW.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_T_RAS_MIN.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_T_RC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_T_RCD.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_T_RP.VALUE_SRC {DEFAULT} \
CONFIG.PCW_UIPARAM_DDR_USE_INTERNAL_VREF.VALUE_SRC {DEFAULT} \
CONFIG.PCW_USB0_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_USB0_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_USB0_RESET_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_USB0_RESET_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_USB0_USB0_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_USB1_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_USB1_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_USB1_RESET_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_USB1_RESET_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_USB1_USB1_IO.VALUE_SRC {DEFAULT} \
CONFIG.PCW_USB_RESET_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_USB_RESET_POLARITY.VALUE_SRC {DEFAULT} \
CONFIG.PCW_USB_RESET_SELECT.VALUE_SRC {DEFAULT} \
CONFIG.PCW_USE_CROSS_TRIGGER.VALUE_SRC {DEFAULT} \
CONFIG.PCW_WDT_PERIPHERAL_CLKSRC.VALUE_SRC {DEFAULT} \
CONFIG.PCW_WDT_PERIPHERAL_DIVISOR0.VALUE_SRC {DEFAULT} \
CONFIG.PCW_WDT_PERIPHERAL_ENABLE.VALUE_SRC {DEFAULT} \
CONFIG.PCW_WDT_PERIPHERAL_FREQMHZ.VALUE_SRC {DEFAULT} \
CONFIG.PCW_WDT_WDT_IO.VALUE_SRC {DEFAULT} \
 ] $processing_system7_0

  # Create instance: rst_processing_system7_0_100M, and set properties
  set rst_processing_system7_0_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_processing_system7_0_100M ]

  # Create instance: rst_processing_system7_0_200M, and set properties
  set rst_processing_system7_0_200M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_processing_system7_0_200M ]

  # Create instance: scurve_adder_0, and set properties
  set scurve_adder_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:scurve_adder:1.0 scurve_adder_0 ]

  # Create instance: spaciroc3_sc_0, and set properties
  set spaciroc3_sc_0 [ create_bd_cell -type ip -vlnv user.org:user:spaciroc3_sc:1.0 spaciroc3_sc_0 ]

  # Create instance: top_switch_raw, and set properties
  set top_switch_raw [ create_bd_cell -type ip -vlnv user.org:user:top_switch:1.0 top_switch_raw ]
  set_property -dict [ list \
CONFIG.C_AXIS_DWIDTH {64} \
CONFIG.C_SHORT_SWITCH {"1"} \
 ] $top_switch_raw

  # Create instance: top_switch_tst, and set properties
  set top_switch_tst [ create_bd_cell -type ip -vlnv user.org:user:top_switch:1.0 top_switch_tst ]
  set_property -dict [ list \
CONFIG.C_AXIS_DWIDTH {16} \
CONFIG.C_SHORT_SWITCH {"1"} \
 ] $top_switch_tst

  # Create instance: util_vector_logic_0, and set properties
  set util_vector_logic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_0 ]
  set_property -dict [ list \
CONFIG.C_OPERATION {or} \
CONFIG.C_SIZE {1} \
CONFIG.LOGO_FILE {data/sym_orgate.png} \
 ] $util_vector_logic_0

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
CONFIG.IN3_WIDTH {13} \
CONFIG.IN4_WIDTH {16} \
CONFIG.NUM_PORTS {5} \
 ] $xlconcat_0

  # Create instance: xlconcat_1, and set properties
  set xlconcat_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_1 ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {3} \
 ] $xlconcat_1

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $xlconstant_1

  # Create instance: xlslice_0, and set properties
  set xlslice_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 xlslice_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net CLK_IN1_D_1 [get_bd_intf_ports clk_art_0] [get_bd_intf_pins clk_wiz_0/CLK_IN1_D]
  connect_bd_intf_net -intf_net CLK_IN1_D_1_2 [get_bd_intf_ports clk_art_2] [get_bd_intf_pins clk_wiz_2/CLK_IN1_D]
  connect_bd_intf_net -intf_net S01_AXI_1 [get_bd_intf_pins axi_dma_L1/M_AXI_S2MM] [get_bd_intf_pins axi_interconnect_DMA_INT/S01_AXI]
  connect_bd_intf_net -intf_net axi_artix_conf_v1_0_0_artx_initb_io [get_bd_intf_ports artx_initb_io] [get_bd_intf_pins axi_artix_conf_v1_0_0/artx_initb_io]
  connect_bd_intf_net -intf_net axi_artix_conf_v1_0_0_artx_programb_io [get_bd_intf_ports artx_programb_io] [get_bd_intf_pins axi_artix_conf_v1_0_0/artx_programb_io]
  connect_bd_intf_net -intf_net axi_data_provider_0_m_axis_art0l [get_bd_intf_pins axi_data_provider_0/m_axis_art0l] [get_bd_intf_pins axis_broadcaster_00/S_AXIS]
  connect_bd_intf_net -intf_net axi_data_provider_0_m_axis_art0r [get_bd_intf_pins axi_data_provider_0/m_axis_art0r] [get_bd_intf_pins axis_broadcaster_01/S_AXIS]
  connect_bd_intf_net -intf_net axi_data_provider_0_m_axis_art1l [get_bd_intf_pins axi_data_provider_0/m_axis_art1l] [get_bd_intf_pins axis_broadcaster_02/S_AXIS]
  connect_bd_intf_net -intf_net axi_data_provider_0_m_axis_art1r [get_bd_intf_pins axi_data_provider_0/m_axis_art1r] [get_bd_intf_pins axis_broadcaster_03/S_AXIS]
  connect_bd_intf_net -intf_net axi_data_provider_0_m_axis_art2l [get_bd_intf_pins axi_data_provider_0/m_axis_art2l] [get_bd_intf_pins axis_broadcaster_04/S_AXIS]
  connect_bd_intf_net -intf_net axi_data_provider_0_m_axis_art2r [get_bd_intf_pins axi_data_provider_0/m_axis_art2r] [get_bd_intf_pins axis_broadcaster_05/S_AXIS]
  connect_bd_intf_net -intf_net axi_dma_L2_M_AXI_S2MM [get_bd_intf_pins axi_dma_L2/M_AXI_S2MM] [get_bd_intf_pins axi_interconnect_DMA_INT/S00_AXI]
  connect_bd_intf_net -intf_net axi_dma_raw_M_AXI_S2MM [get_bd_intf_pins axi_dma_raw/M_AXI_S2MM] [get_bd_intf_pins axi_interconnect_DMA_RAW/S00_AXI]
  connect_bd_intf_net -intf_net axi_dma_tst_L1_M_AXIS_MM2S [get_bd_intf_pins axi_dma_tst_L1/M_AXIS_MM2S] [get_bd_intf_pins axis_dwidth_converter_L1_tst/S_AXIS]
  connect_bd_intf_net -intf_net axi_dma_tst_L1_M_AXI_MM2S [get_bd_intf_pins axi_dma_tst_L1/M_AXI_MM2S] [get_bd_intf_pins axi_interconnect_DMA_RAW/S01_AXI]
  connect_bd_intf_net -intf_net axi_fifo_mm_s_1_AXI_STR_TXD [get_bd_intf_pins axi_fifo_mm_s_1/AXI_STR_TXD] [get_bd_intf_pins axis_dwidth_converter_1/S_AXIS]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_DMA_INT/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP1]
  connect_bd_intf_net -intf_net axi_interconnect_1_M00_AXI [get_bd_intf_pins axi_interconnect_DMA_RAW/M00_AXI] [get_bd_intf_pins processing_system7_0/S_AXI_HP0]
  connect_bd_intf_net -intf_net axis_broadcaster_1r10_M00_AXIS [get_bd_intf_pins axis_broadcaster_1r10/M00_AXIS] [get_bd_intf_pins axis_combiner_0/S00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r10_M01_AXIS [get_bd_intf_pins axis_broadcaster_1r10/M01_AXIS] [get_bd_intf_pins axis_dwidth_converter_7/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r11_M00_AXIS [get_bd_intf_pins axis_broadcaster_1r11/M00_AXIS] [get_bd_intf_pins axis_combiner_0/S01_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r11_M01_AXIS [get_bd_intf_pins axis_broadcaster_1r11/M01_AXIS] [get_bd_intf_pins axis_dwidth_converter_10/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r12_M00_AXIS [get_bd_intf_pins axis_broadcaster_1r12/M00_AXIS] [get_bd_intf_pins axis_combiner_2/S00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r12_M01_AXIS [get_bd_intf_pins axis_broadcaster_1r12/M01_AXIS] [get_bd_intf_pins axis_dwidth_converter_8/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r13_M00_AXIS [get_bd_intf_pins axis_broadcaster_1r13/M00_AXIS] [get_bd_intf_pins axis_combiner_2/S01_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r13_M01_AXIS [get_bd_intf_pins axis_broadcaster_1r13/M01_AXIS] [get_bd_intf_pins axis_dwidth_converter_11/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r14_M00_AXIS [get_bd_intf_pins axis_broadcaster_1r14/M00_AXIS] [get_bd_intf_pins axis_combiner_1/S00_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r14_M01_AXIS [get_bd_intf_pins axis_broadcaster_1r14/M01_AXIS] [get_bd_intf_pins axis_dwidth_converter_9/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r15_M00_AXIS [get_bd_intf_pins axis_broadcaster_1r15/M00_AXIS] [get_bd_intf_pins axis_combiner_1/S01_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r15_M01_AXIS [get_bd_intf_pins axis_broadcaster_1r15/M01_AXIS] [get_bd_intf_pins axis_dwidth_converter_12/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r1_M00_AXIS [get_bd_intf_pins axis_broadcaster_00/M00_AXIS] [get_bd_intf_pins axis_data_fifo_sa_00/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r1_M01_AXIS [get_bd_intf_pins axis_broadcaster_00/M01_AXIS] [get_bd_intf_pins axis_clock_converter_0/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r2_M00_AXIS [get_bd_intf_pins axis_broadcaster_02/M00_AXIS] [get_bd_intf_pins axis_data_fifo_sa_02/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r2_M01_AXIS [get_bd_intf_pins axis_broadcaster_02/M01_AXIS] [get_bd_intf_pins axis_clock_converter_5/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r3_M00_AXIS [get_bd_intf_pins axis_broadcaster_05/M00_AXIS] [get_bd_intf_pins axis_data_fifo_sa_05/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r3_M01_AXIS [get_bd_intf_pins axis_broadcaster_05/M01_AXIS] [get_bd_intf_pins axis_clock_converter_3/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r4_M00_AXIS [get_bd_intf_pins axis_broadcaster_04/M00_AXIS] [get_bd_intf_pins axis_data_fifo_sa_04/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r4_M01_AXIS [get_bd_intf_pins axis_broadcaster_04/M01_AXIS] [get_bd_intf_pins axis_clock_converter_2/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r5_M00_AXIS [get_bd_intf_pins axis_broadcaster_03/M00_AXIS] [get_bd_intf_pins axis_data_fifo_sa_03/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r5_M01_AXIS [get_bd_intf_pins axis_broadcaster_03/M01_AXIS] [get_bd_intf_pins axis_clock_converter_4/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r6_M00_AXIS [get_bd_intf_pins axis_broadcaster_01/M00_AXIS] [get_bd_intf_pins axis_data_fifo_sa_01/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r6_M01_AXIS [get_bd_intf_pins axis_broadcaster_01/M01_AXIS] [get_bd_intf_pins axis_clock_converter_1/S_AXIS]
  connect_bd_intf_net -intf_net axis_broadcaster_1r_M00_AXIS [get_bd_intf_pins axis_broadcaster_1r/M00_AXIS] [get_bd_intf_pins axis_flow_control_L2/s_axis]
  connect_bd_intf_net -intf_net axis_broadcaster_1r_M01_AXIS [get_bd_intf_pins axis_broadcaster_1r/M01_AXIS] [get_bd_intf_pins axis_data_fifo_L2/S_AXIS]
  connect_bd_intf_net -intf_net axis_clock_converter_0_M_AXIS [get_bd_intf_pins axis_clock_converter_0/M_AXIS] [get_bd_intf_pins axis_dwidth_converter_0/S_AXIS]
  connect_bd_intf_net -intf_net axis_clock_converter_1_M_AXIS [get_bd_intf_pins axis_clock_converter_1/M_AXIS] [get_bd_intf_pins axis_dwidth_converter_3/S_AXIS]
  connect_bd_intf_net -intf_net axis_clock_converter_2_M_AXIS [get_bd_intf_pins axis_clock_converter_2/M_AXIS] [get_bd_intf_pins axis_dwidth_converter_4/S_AXIS]
  connect_bd_intf_net -intf_net axis_clock_converter_3_M_AXIS [get_bd_intf_pins axis_clock_converter_3/M_AXIS] [get_bd_intf_pins axis_dwidth_converter_5/S_AXIS]
  connect_bd_intf_net -intf_net axis_clock_converter_4_M_AXIS [get_bd_intf_pins axis_clock_converter_4/M_AXIS] [get_bd_intf_pins axis_dwidth_converter_6/S_AXIS]
  connect_bd_intf_net -intf_net axis_clock_converter_5_M_AXIS [get_bd_intf_pins axis_clock_converter_5/M_AXIS] [get_bd_intf_pins axis_dwidth_converter_2/S_AXIS]
  connect_bd_intf_net -intf_net axis_combiner_1_M_AXIS [get_bd_intf_pins algo_b_conv_2/s_axis] [get_bd_intf_pins axis_combiner_1/M_AXIS]
  connect_bd_intf_net -intf_net axis_combiner_2_M_AXIS [get_bd_intf_pins algo_b_conv_1/s_axis] [get_bd_intf_pins axis_combiner_2/M_AXIS]
  connect_bd_intf_net -intf_net axis_data_fifo_L1_tst_M_AXIS [get_bd_intf_pins axis_data_fifo_L1_tst/M_AXIS] [get_bd_intf_pins top_switch_tst/s_axis_0]
  connect_bd_intf_net -intf_net axis_data_fifo_L2_M_AXIS [get_bd_intf_pins axis_data_fifo_L2/M_AXIS] [get_bd_intf_pins l2_trigger_0/in_stream]
  connect_bd_intf_net -intf_net axis_data_fifo_fc_L10_M_AXIS [get_bd_intf_pins axis_data_fifo_fc_L10/M_AXIS] [get_bd_intf_pins top_switch_raw/s_axis_2]
  connect_bd_intf_net -intf_net axis_data_fifo_fc_L11_M_AXIS [get_bd_intf_pins axis_data_fifo_fc_L11/M_AXIS] [get_bd_intf_pins top_switch_raw/s_axis_3]
  connect_bd_intf_net -intf_net axis_data_fifo_fc_L12_M_AXIS [get_bd_intf_pins axis_data_fifo_fc_L12/M_AXIS] [get_bd_intf_pins top_switch_raw/s_axis_1]
  connect_bd_intf_net -intf_net axis_data_fifo_fc_L13_M_AXIS [get_bd_intf_pins axis_data_fifo_fc_L13/M_AXIS] [get_bd_intf_pins top_switch_raw/s_axis_4]
  connect_bd_intf_net -intf_net axis_data_fifo_fc_L14_M_AXIS [get_bd_intf_pins axis_data_fifo_fc_L14/M_AXIS] [get_bd_intf_pins top_switch_raw/s_axis_5]
  connect_bd_intf_net -intf_net axis_data_fifo_fc_L9_M_AXIS [get_bd_intf_pins axis_data_fifo_fc_L9/M_AXIS] [get_bd_intf_pins top_switch_raw/s_axis_0]
  connect_bd_intf_net -intf_net axis_data_fifo_sa_00_M_AXIS [get_bd_intf_pins axis_data_fifo_sa_00/M_AXIS] [get_bd_intf_pins scurve_adder_0/in_stream0]
  connect_bd_intf_net -intf_net axis_data_fifo_sa_01_M_AXIS [get_bd_intf_pins axis_data_fifo_sa_01/M_AXIS] [get_bd_intf_pins scurve_adder_0/in_stream1]
  connect_bd_intf_net -intf_net axis_data_fifo_sa_02_M_AXIS [get_bd_intf_pins axis_data_fifo_sa_02/M_AXIS] [get_bd_intf_pins scurve_adder_0/in_stream2]
  connect_bd_intf_net -intf_net axis_data_fifo_sa_03_M_AXIS [get_bd_intf_pins axis_data_fifo_sa_03/M_AXIS] [get_bd_intf_pins scurve_adder_0/in_stream3]
  connect_bd_intf_net -intf_net axis_data_fifo_sa_04_M_AXIS [get_bd_intf_pins axis_data_fifo_sa_04/M_AXIS] [get_bd_intf_pins scurve_adder_0/in_stream4]
  connect_bd_intf_net -intf_net axis_data_fifo_sa_05_M_AXIS [get_bd_intf_pins axis_data_fifo_sa_05/M_AXIS] [get_bd_intf_pins scurve_adder_0/in_stream5]
  connect_bd_intf_net -intf_net axis_dwidth_converter_0_M_AXIS [get_bd_intf_pins axis_broadcaster_1r10/S_AXIS] [get_bd_intf_pins axis_dwidth_converter_0/M_AXIS]
  connect_bd_intf_net -intf_net axis_dwidth_converter_10_M_AXIS [get_bd_intf_pins axis_data_fifo_fc_L12/S_AXIS] [get_bd_intf_pins axis_dwidth_converter_10/M_AXIS]
  connect_bd_intf_net -intf_net axis_dwidth_converter_11_M_AXIS [get_bd_intf_pins axis_data_fifo_fc_L11/S_AXIS] [get_bd_intf_pins axis_dwidth_converter_11/M_AXIS]
  connect_bd_intf_net -intf_net axis_dwidth_converter_12_M_AXIS [get_bd_intf_pins axis_data_fifo_fc_L14/S_AXIS] [get_bd_intf_pins axis_dwidth_converter_12/M_AXIS]
  connect_bd_intf_net -intf_net axis_dwidth_converter_1_M_AXIS [get_bd_intf_pins axis_dwidth_converter_1/M_AXIS] [get_bd_intf_pins spaciroc3_sc_0/s00_axis]
  connect_bd_intf_net -intf_net axis_dwidth_converter_2_M_AXIS [get_bd_intf_pins axis_broadcaster_1r12/S_AXIS] [get_bd_intf_pins axis_dwidth_converter_2/M_AXIS]
  connect_bd_intf_net -intf_net axis_dwidth_converter_3_M_AXIS [get_bd_intf_pins axis_broadcaster_1r11/S_AXIS] [get_bd_intf_pins axis_dwidth_converter_3/M_AXIS]
  connect_bd_intf_net -intf_net axis_dwidth_converter_4_M_AXIS [get_bd_intf_pins axis_broadcaster_1r14/S_AXIS] [get_bd_intf_pins axis_dwidth_converter_4/M_AXIS]
  connect_bd_intf_net -intf_net axis_dwidth_converter_5_M_AXIS [get_bd_intf_pins axis_data_fifo_1r/S_AXIS] [get_bd_intf_pins axis_dwidth_converter_1r/M_AXIS]
  connect_bd_intf_net -intf_net axis_dwidth_converter_5_M_AXIS1 [get_bd_intf_pins axis_broadcaster_1r15/S_AXIS] [get_bd_intf_pins axis_dwidth_converter_5/M_AXIS]
  connect_bd_intf_net -intf_net axis_dwidth_converter_6_M_AXIS [get_bd_intf_pins axis_broadcaster_1r13/S_AXIS] [get_bd_intf_pins axis_dwidth_converter_6/M_AXIS]
  connect_bd_intf_net -intf_net axis_dwidth_converter_7_M_AXIS [get_bd_intf_pins axis_data_fifo_fc_L9/S_AXIS] [get_bd_intf_pins axis_dwidth_converter_7/M_AXIS]
  connect_bd_intf_net -intf_net axis_dwidth_converter_8_M_AXIS [get_bd_intf_pins axis_data_fifo_fc_L10/S_AXIS] [get_bd_intf_pins axis_dwidth_converter_8/M_AXIS]
  connect_bd_intf_net -intf_net axis_dwidth_converter_9_M_AXIS [get_bd_intf_pins axis_data_fifo_fc_L13/S_AXIS] [get_bd_intf_pins axis_dwidth_converter_9/M_AXIS]
  connect_bd_intf_net -intf_net axis_dwidth_converter_L1_tst_M_AXIS [get_bd_intf_pins axis_data_fifo_L1_tst/S_AXIS] [get_bd_intf_pins axis_dwidth_converter_L1_tst/M_AXIS]
  connect_bd_intf_net -intf_net axis_flow_control_0_m_axis [get_bd_intf_pins axis_data_fifo_6/S_AXIS] [get_bd_intf_pins axis_flow_control_L1/m_axis]
  connect_bd_intf_net -intf_net axis_flow_control_1_m_axis [get_bd_intf_pins axis_data_fifo_int/S_AXIS] [get_bd_intf_pins axis_flow_control_L2/m_axis]
  connect_bd_intf_net -intf_net clk_art_1_1 [get_bd_intf_ports clk_art_1] [get_bd_intf_pins clk_wiz_1/CLK_IN1_D]
  connect_bd_intf_net -intf_net dma_L1_S_AXIS [get_bd_intf_pins axi_dma_L1/S_AXIS_S2MM] [get_bd_intf_pins axis_data_fifo_int/M_AXIS]
  connect_bd_intf_net -intf_net dma_L2_S_AXIS [get_bd_intf_pins axi_dma_L2/S_AXIS_S2MM] [get_bd_intf_pins axis_data_fifo_fc_L2b/M_AXIS]
  connect_bd_intf_net -intf_net dma_RAW_S_AXIS [get_bd_intf_pins axi_dma_raw/S_AXIS_S2MM] [get_bd_intf_pins axis_data_fifo_6/M_AXIS]
  connect_bd_intf_net -intf_net inst_interconnect_100MHz_M01_AXI [get_bd_intf_pins inst_interconnect_100MHz/M01_AXI] [get_bd_intf_pins l2_trigger_0/s_axi_CTRL_BUS]
  connect_bd_intf_net -intf_net inst_interconnect_100MHz_M04_AXI [get_bd_intf_pins inst_interconnect_100MHz/M04_AXI] [get_bd_intf_pins scurve_adder_0/s_axi_CTRL_BUS]
  connect_bd_intf_net -intf_net inst_interconnect_100MHz_M11_AXI [get_bd_intf_pins axi_dma_L1/S_AXI_LITE] [get_bd_intf_pins inst_interconnect_100MHz/M11_AXI]
  connect_bd_intf_net -intf_net inst_interconnect_100MHz_M12_AXI [get_bd_intf_pins axis_flow_control_L2/S_AXI] [get_bd_intf_pins inst_interconnect_100MHz/M12_AXI]
  connect_bd_intf_net -intf_net inst_interconnect_100MHz_M13_AXI [get_bd_intf_pins axi_dma_L2/S_AXI_LITE] [get_bd_intf_pins inst_interconnect_100MHz/M13_AXI]
  connect_bd_intf_net -intf_net inst_interconnect_200MHz_M02_AXI [get_bd_intf_pins inst_interconnect_200MHz/M02_AXI] [get_bd_intf_pins top_switch_raw/S_AXI]
  connect_bd_intf_net -intf_net inst_interconnect_200MHz_M03_AXI [get_bd_intf_pins axis_flow_control_L1/S_AXI] [get_bd_intf_pins inst_interconnect_200MHz/M03_AXI]
  connect_bd_intf_net -intf_net inst_interconnect_200MHz_M04_AXI [get_bd_intf_pins inst_interconnect_200MHz/M04_AXI] [get_bd_intf_pins top_switch_tst/S_AXI]
  connect_bd_intf_net -intf_net inst_interconnect_200MHz_M05_AXI [get_bd_intf_pins axi_fifo_mm_s_trigger_ev/S_AXI] [get_bd_intf_pins inst_interconnect_200MHz/M05_AXI]
  connect_bd_intf_net -intf_net l2_trigger_0_out_stream [get_bd_intf_pins axis_data_fifo_fc_L2b/S_AXIS] [get_bd_intf_pins l2_trigger_0/out_stream]
  connect_bd_intf_net -intf_net processing_system7_0_DDR [get_bd_intf_ports DDR] [get_bd_intf_pins processing_system7_0/DDR]
  connect_bd_intf_net -intf_net processing_system7_0_FIXED_IO [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins processing_system7_0/FIXED_IO]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP0 [get_bd_intf_pins inst_interconnect_200MHz/S00_AXI] [get_bd_intf_pins processing_system7_0/M_AXI_GP0]
  connect_bd_intf_net -intf_net processing_system7_0_M_AXI_GP1 [get_bd_intf_pins inst_interconnect_100MHz/S00_AXI] [get_bd_intf_pins processing_system7_0/M_AXI_GP1]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph1_M00_AXI [get_bd_intf_pins axi_dma_raw/S_AXI_LITE] [get_bd_intf_pins inst_interconnect_200MHz/M00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph1_M01_AXI [get_bd_intf_pins axi_dma_tst_L1/S_AXI_LITE] [get_bd_intf_pins inst_interconnect_200MHz/M01_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M00_AXI [get_bd_intf_pins axi_artix_conf_v1_0_0/s00_axi] [get_bd_intf_pins inst_interconnect_100MHz/M00_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M02_AXI [get_bd_intf_pins axi_quad_spi_0/AXI_LITE] [get_bd_intf_pins inst_interconnect_100MHz/M02_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M03_AXI [get_bd_intf_pins axi_gpio_0/S_AXI] [get_bd_intf_pins inst_interconnect_100MHz/M03_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M05_AXI [get_bd_intf_pins HV_AERA_IP_0/s00_axi] [get_bd_intf_pins inst_interconnect_100MHz/M05_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M06_AXI [get_bd_intf_pins axi_fifo_mm_s_1/S_AXI] [get_bd_intf_pins inst_interconnect_100MHz/M06_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M07_AXI [get_bd_intf_pins inst_interconnect_100MHz/M07_AXI] [get_bd_intf_pins spaciroc3_sc_0/s00_axi]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M08_AXI [get_bd_intf_pins hv_hk_v1_0_0/s00_axi] [get_bd_intf_pins inst_interconnect_100MHz/M08_AXI]
  connect_bd_intf_net -intf_net processing_system7_0_axi_periph_M09_AXI [get_bd_intf_pins axi_data_provider_0/s00_axi] [get_bd_intf_pins inst_interconnect_100MHz/M09_AXI]
  connect_bd_intf_net -intf_net scurve_adder_0_out_stream [get_bd_intf_pins axis_broadcaster_1r/S_AXIS] [get_bd_intf_pins scurve_adder_0/out_stream]
  connect_bd_intf_net -intf_net top_switch_0_m_axis [get_bd_intf_pins axis_flow_control_L1/s_axis] [get_bd_intf_pins top_switch_raw/m_axis]
  connect_bd_intf_net -intf_net top_switch_tst_m_axis_event [get_bd_intf_pins axi_fifo_mm_s_trigger_ev/AXI_STR_RXD] [get_bd_intf_pins top_switch_tst/m_axis_event]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins axi_interconnect_DMA_RAW/ARESETN] [get_bd_pins inst_interconnect_200MHz/ARESETN] [get_bd_pins rst_processing_system7_0_200M/interconnect_aresetn]
  connect_bd_net -net HV_AERA_IP_0_CLK_HV_n [get_bd_ports CLK_HV_n] [get_bd_pins HV_AERA_IP_0/CLK_HV_n]
  connect_bd_net -net HV_AERA_IP_0_CLK_HV_p [get_bd_ports CLK_HV_p] [get_bd_pins HV_AERA_IP_0/CLK_HV_p]
  connect_bd_net -net HV_AERA_IP_0_DATA_HV_n [get_bd_ports DATA_HV_n] [get_bd_pins HV_AERA_IP_0/DATA_HV_n]
  connect_bd_net -net HV_AERA_IP_0_DATA_HV_p [get_bd_ports DATA_HV_p] [get_bd_pins HV_AERA_IP_0/DATA_HV_p]
  connect_bd_net -net HV_AERA_IP_0_GTU_HV_n [get_bd_ports GTU_HV_n] [get_bd_pins HV_AERA_IP_0/GTU_HV_n]
  connect_bd_net -net HV_AERA_IP_0_GTU_HV_p [get_bd_ports GTU_HV_p] [get_bd_pins HV_AERA_IP_0/GTU_HV_p]
  connect_bd_net -net algo_b_conv_0_L1_EVENT [get_bd_pins ALGO_B_0/L1_EVENT] [get_bd_pins axis_flow_control_L1/trig0] [get_bd_pins top_switch_tst/trig_tst]
  connect_bd_net -net algo_b_conv_1_L1_EVENT [get_bd_pins algo_b_conv_1/L1_EVENT] [get_bd_pins axis_flow_control_L1/trig1]
  connect_bd_net -net algo_b_conv_2_L1_EVENT [get_bd_pins algo_b_conv_2/L1_EVENT] [get_bd_pins axis_flow_control_L1/trig2]
  connect_bd_net -net artx_done_1 [get_bd_ports artx_done] [get_bd_pins axi_artix_conf_v1_0_0/artx_done]
  connect_bd_net -net axi_data_provider_0_gtu_sig [get_bd_pins axi_data_provider_0/gtu_sig] [get_bd_pins axis_flow_control_L1/gtu_sig] [get_bd_pins axis_flow_control_L2/gtu_sig]
  connect_bd_net -net axi_dma_L1_s2mm_introut [get_bd_pins axi_dma_L1/s2mm_introut] [get_bd_pins xlconcat_1/In1]
  connect_bd_net -net axi_dma_L2_s2mm_introut [get_bd_pins axi_dma_L2/s2mm_introut] [get_bd_pins xlconcat_1/In2]
  connect_bd_net -net axi_dma_raw_s2mm_introut [get_bd_pins axi_dma_raw/s2mm_introut] [get_bd_pins xlconcat_1/In0]
  connect_bd_net -net axi_quad_spi_0_io0_o [get_bd_ports artx_conf_data] [get_bd_pins axi_quad_spi_0/io0_o]
  connect_bd_net -net axi_quad_spi_0_sck_o [get_bd_ports artx_conf_cclk] [get_bd_pins axi_quad_spi_0/sck_o]
  connect_bd_net -net axis_data_fifo_6_axis_data_count [get_bd_pins axis_data_fifo_6/axis_data_count] [get_bd_pins axis_flow_control_L1/gpio_0]
  connect_bd_net -net axis_data_fifo_fc_L10_axis_data_count [get_bd_pins axis_data_fifo_fc_L10/axis_data_count] [get_bd_pins top_switch_raw/gpio_2]
  connect_bd_net -net axis_data_fifo_fc_L11_axis_data_count [get_bd_pins axis_data_fifo_fc_L11/axis_data_count] [get_bd_pins top_switch_raw/gpio_1]
  connect_bd_net -net axis_data_fifo_fc_L9_axis_data_count [get_bd_pins axis_data_fifo_fc_L9/axis_data_count] [get_bd_pins top_switch_raw/gpio_0]
  connect_bd_net -net axis_flow_control_L1_trig_led [get_bd_pins axis_flow_control_L1/trig_led] [get_bd_pins util_vector_logic_0/Op1]
  connect_bd_net -net axis_flow_control_L2_trig_led [get_bd_pins axis_flow_control_L2/trig_led] [get_bd_pins util_vector_logic_0/Op2]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins axi_data_provider_0/clk_art0_x1] [get_bd_pins clk_wiz_0/clk_out1]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins clk_wiz_0/locked] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net clk_wiz_2_clk_out1 [get_bd_pins axi_data_provider_0/clk_art2_x1] [get_bd_pins clk_wiz_2/clk_out1]
  connect_bd_net -net clk_wiz_2_locked [get_bd_pins clk_wiz_2/locked] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net clk_wiz_3_clk_out1 [get_bd_pins axi_data_provider_0/clk_art1_x1] [get_bd_pins clk_wiz_1/clk_out1]
  connect_bd_net -net clk_wiz_3_locked [get_bd_pins clk_wiz_1/locked] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net data_art0_1 [get_bd_ports data_art0] [get_bd_pins axi_data_provider_0/data_art0]
  connect_bd_net -net data_art1_1 [get_bd_ports data_art1] [get_bd_pins axi_data_provider_0/data_art1]
  connect_bd_net -net data_art2_1 [get_bd_ports data_art2] [get_bd_pins axi_data_provider_0/data_art2]
  connect_bd_net -net frame_art0_1 [get_bd_ports frame_art0] [get_bd_pins axi_data_provider_0/frame_art0]
  connect_bd_net -net frame_art1_1 [get_bd_ports frame_art1] [get_bd_pins axi_data_provider_0/frame_art1]
  connect_bd_net -net frame_art2_1 [get_bd_ports frame_art2] [get_bd_pins axi_data_provider_0/frame_art2]
  connect_bd_net -net hv_hk_v1_0_0_cs_dac_n [get_bd_ports cs_dac_n] [get_bd_pins hv_hk_v1_0_0/cs_dac_n]
  connect_bd_net -net hv_hk_v1_0_0_cs_dac_p [get_bd_ports cs_dac_p] [get_bd_pins hv_hk_v1_0_0/cs_dac_p]
  connect_bd_net -net hv_hk_v1_0_0_cs_exp_n [get_bd_ports cs_exp_n] [get_bd_pins hv_hk_v1_0_0/cs_exp_n]
  connect_bd_net -net hv_hk_v1_0_0_cs_exp_p [get_bd_ports cs_exp_p] [get_bd_pins hv_hk_v1_0_0/cs_exp_p]
  connect_bd_net -net hv_hk_v1_0_0_hv_led [get_bd_ports hv_led] [get_bd_pins hv_hk_v1_0_0/hv_led]
  connect_bd_net -net hv_hk_v1_0_0_mosi_n [get_bd_ports mosi_n] [get_bd_pins hv_hk_v1_0_0/mosi_n]
  connect_bd_net -net hv_hk_v1_0_0_mosi_p [get_bd_ports mosi_p] [get_bd_pins hv_hk_v1_0_0/mosi_p]
  connect_bd_net -net hv_hk_v1_0_0_sck_n [get_bd_ports sck_n] [get_bd_pins hv_hk_v1_0_0/sck_n]
  connect_bd_net -net hv_hk_v1_0_0_sck_p [get_bd_ports sck_p] [get_bd_pins hv_hk_v1_0_0/sck_p]
  connect_bd_net -net intr_n_1 [get_bd_ports intr_n] [get_bd_pins hv_hk_v1_0_0/intr_n]
  connect_bd_net -net intr_p_1 [get_bd_ports intr_p] [get_bd_pins hv_hk_v1_0_0/intr_p]
  connect_bd_net -net l2_trigger_0_trig_data [get_bd_pins l2_trigger_0/trig_data] [get_bd_pins xlslice_0/Din]
  connect_bd_net -net miso_n_1 [get_bd_ports miso_n] [get_bd_pins hv_hk_v1_0_0/miso_n]
  connect_bd_net -net miso_p_1 [get_bd_ports miso_p] [get_bd_pins hv_hk_v1_0_0/miso_p]
  connect_bd_net -net processing_system7_0_FCLK_CLK0 [get_bd_pins HV_AERA_IP_0/s00_axi_aclk] [get_bd_pins axi_artix_conf_v1_0_0/s00_axi_aclk] [get_bd_pins axi_data_provider_0/m_axis_aclk] [get_bd_pins axi_data_provider_0/s00_axi_aclk] [get_bd_pins axi_dma_L1/m_axi_s2mm_aclk] [get_bd_pins axi_dma_L1/s_axi_lite_aclk] [get_bd_pins axi_dma_L2/m_axi_s2mm_aclk] [get_bd_pins axi_dma_L2/s_axi_lite_aclk] [get_bd_pins axi_fifo_mm_s_1/s_axi_aclk] [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_interconnect_DMA_INT/ACLK] [get_bd_pins axi_interconnect_DMA_INT/M00_ACLK] [get_bd_pins axi_interconnect_DMA_INT/S00_ACLK] [get_bd_pins axi_interconnect_DMA_INT/S01_ACLK] [get_bd_pins axi_quad_spi_0/ext_spi_clk] [get_bd_pins axi_quad_spi_0/s_axi_aclk] [get_bd_pins axis_broadcaster_00/aclk] [get_bd_pins axis_broadcaster_01/aclk] [get_bd_pins axis_broadcaster_02/aclk] [get_bd_pins axis_broadcaster_03/aclk] [get_bd_pins axis_broadcaster_04/aclk] [get_bd_pins axis_broadcaster_05/aclk] [get_bd_pins axis_broadcaster_1r/aclk] [get_bd_pins axis_clock_converter_0/s_axis_aclk] [get_bd_pins axis_clock_converter_1/s_axis_aclk] [get_bd_pins axis_clock_converter_2/s_axis_aclk] [get_bd_pins axis_clock_converter_3/s_axis_aclk] [get_bd_pins axis_clock_converter_4/s_axis_aclk] [get_bd_pins axis_clock_converter_5/s_axis_aclk] [get_bd_pins axis_data_fifo_1r/s_axis_aclk] [get_bd_pins axis_data_fifo_L2/s_axis_aclk] [get_bd_pins axis_data_fifo_fc_L2b/s_axis_aclk] [get_bd_pins axis_data_fifo_int/s_axis_aclk] [get_bd_pins axis_data_fifo_sa_00/s_axis_aclk] [get_bd_pins axis_data_fifo_sa_01/s_axis_aclk] [get_bd_pins axis_data_fifo_sa_02/s_axis_aclk] [get_bd_pins axis_data_fifo_sa_03/s_axis_aclk] [get_bd_pins axis_data_fifo_sa_04/s_axis_aclk] [get_bd_pins axis_data_fifo_sa_05/s_axis_aclk] [get_bd_pins axis_dwidth_converter_1/aclk] [get_bd_pins axis_dwidth_converter_1r/aclk] [get_bd_pins axis_flow_control_L2/S_AXI_ACLK] [get_bd_pins axis_flow_control_L2/s_axis_aclk] [get_bd_pins hv_hk_v1_0_0/s00_axi_aclk] [get_bd_pins inst_interconnect_100MHz/ACLK] [get_bd_pins inst_interconnect_100MHz/M00_ACLK] [get_bd_pins inst_interconnect_100MHz/M01_ACLK] [get_bd_pins inst_interconnect_100MHz/M02_ACLK] [get_bd_pins inst_interconnect_100MHz/M03_ACLK] [get_bd_pins inst_interconnect_100MHz/M04_ACLK] [get_bd_pins inst_interconnect_100MHz/M05_ACLK] [get_bd_pins inst_interconnect_100MHz/M06_ACLK] [get_bd_pins inst_interconnect_100MHz/M07_ACLK] [get_bd_pins inst_interconnect_100MHz/M08_ACLK] [get_bd_pins inst_interconnect_100MHz/M09_ACLK] [get_bd_pins inst_interconnect_100MHz/M10_ACLK] [get_bd_pins inst_interconnect_100MHz/M11_ACLK] [get_bd_pins inst_interconnect_100MHz/M12_ACLK] [get_bd_pins inst_interconnect_100MHz/M13_ACLK] [get_bd_pins inst_interconnect_100MHz/S00_ACLK] [get_bd_pins l2_trigger_0/ap_clk] [get_bd_pins processing_system7_0/FCLK_CLK1] [get_bd_pins processing_system7_0/M_AXI_GP1_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP1_ACLK] [get_bd_pins rst_processing_system7_0_100M/slowest_sync_clk] [get_bd_pins scurve_adder_0/ap_clk] [get_bd_pins spaciroc3_sc_0/s00_axi_aclk] [get_bd_pins spaciroc3_sc_0/s00_axis_aclk]
  connect_bd_net -net processing_system7_0_FCLK_CLK1 [get_bd_pins ALGO_B_0/CLOCK_200] [get_bd_pins algo_b_conv_1/s_axis_aclk] [get_bd_pins algo_b_conv_2/s_axis_aclk] [get_bd_pins axi_dma_raw/m_axi_s2mm_aclk] [get_bd_pins axi_dma_raw/s_axi_lite_aclk] [get_bd_pins axi_dma_tst_L1/m_axi_mm2s_aclk] [get_bd_pins axi_dma_tst_L1/s_axi_lite_aclk] [get_bd_pins axi_fifo_mm_s_trigger_ev/s_axi_aclk] [get_bd_pins axi_interconnect_DMA_RAW/ACLK] [get_bd_pins axi_interconnect_DMA_RAW/M00_ACLK] [get_bd_pins axi_interconnect_DMA_RAW/S00_ACLK] [get_bd_pins axi_interconnect_DMA_RAW/S01_ACLK] [get_bd_pins axis_broadcaster_1r10/aclk] [get_bd_pins axis_broadcaster_1r11/aclk] [get_bd_pins axis_broadcaster_1r12/aclk] [get_bd_pins axis_broadcaster_1r13/aclk] [get_bd_pins axis_broadcaster_1r14/aclk] [get_bd_pins axis_broadcaster_1r15/aclk] [get_bd_pins axis_clock_converter_0/m_axis_aclk] [get_bd_pins axis_clock_converter_1/m_axis_aclk] [get_bd_pins axis_clock_converter_2/m_axis_aclk] [get_bd_pins axis_clock_converter_3/m_axis_aclk] [get_bd_pins axis_clock_converter_4/m_axis_aclk] [get_bd_pins axis_clock_converter_5/m_axis_aclk] [get_bd_pins axis_combiner_0/aclk] [get_bd_pins axis_combiner_1/aclk] [get_bd_pins axis_combiner_2/aclk] [get_bd_pins axis_data_fifo_6/s_axis_aclk] [get_bd_pins axis_data_fifo_L1_tst/s_axis_aclk] [get_bd_pins axis_data_fifo_fc_L10/s_axis_aclk] [get_bd_pins axis_data_fifo_fc_L11/s_axis_aclk] [get_bd_pins axis_data_fifo_fc_L12/s_axis_aclk] [get_bd_pins axis_data_fifo_fc_L13/s_axis_aclk] [get_bd_pins axis_data_fifo_fc_L14/s_axis_aclk] [get_bd_pins axis_data_fifo_fc_L9/s_axis_aclk] [get_bd_pins axis_dwidth_converter_0/aclk] [get_bd_pins axis_dwidth_converter_10/aclk] [get_bd_pins axis_dwidth_converter_11/aclk] [get_bd_pins axis_dwidth_converter_12/aclk] [get_bd_pins axis_dwidth_converter_2/aclk] [get_bd_pins axis_dwidth_converter_3/aclk] [get_bd_pins axis_dwidth_converter_4/aclk] [get_bd_pins axis_dwidth_converter_5/aclk] [get_bd_pins axis_dwidth_converter_6/aclk] [get_bd_pins axis_dwidth_converter_7/aclk] [get_bd_pins axis_dwidth_converter_8/aclk] [get_bd_pins axis_dwidth_converter_9/aclk] [get_bd_pins axis_dwidth_converter_L1_tst/aclk] [get_bd_pins axis_flow_control_L1/S_AXI_ACLK] [get_bd_pins axis_flow_control_L1/s_axis_aclk] [get_bd_pins inst_interconnect_200MHz/ACLK] [get_bd_pins inst_interconnect_200MHz/M00_ACLK] [get_bd_pins inst_interconnect_200MHz/M01_ACLK] [get_bd_pins inst_interconnect_200MHz/M02_ACLK] [get_bd_pins inst_interconnect_200MHz/M03_ACLK] [get_bd_pins inst_interconnect_200MHz/M04_ACLK] [get_bd_pins inst_interconnect_200MHz/M05_ACLK] [get_bd_pins inst_interconnect_200MHz/S00_ACLK] [get_bd_pins processing_system7_0/FCLK_CLK0] [get_bd_pins processing_system7_0/M_AXI_GP0_ACLK] [get_bd_pins processing_system7_0/S_AXI_HP0_ACLK] [get_bd_pins rst_processing_system7_0_200M/slowest_sync_clk] [get_bd_pins top_switch_raw/S_AXI_ACLK] [get_bd_pins top_switch_raw/s_axis_aclk] [get_bd_pins top_switch_tst/S_AXI_ACLK] [get_bd_pins top_switch_tst/s_axis_aclk]
  connect_bd_net -net processing_system7_0_FCLK_RESET0_N [get_bd_pins processing_system7_0/FCLK_RESET0_N] [get_bd_pins rst_processing_system7_0_100M/ext_reset_in] [get_bd_pins rst_processing_system7_0_200M/ext_reset_in]
  connect_bd_net -net rst_processing_system7_0_200M_peripheral_aresetn [get_bd_pins axi_dma_raw/axi_resetn] [get_bd_pins axi_dma_tst_L1/axi_resetn] [get_bd_pins axi_fifo_mm_s_trigger_ev/s_axi_aresetn] [get_bd_pins axi_interconnect_DMA_RAW/M00_ARESETN] [get_bd_pins axi_interconnect_DMA_RAW/S00_ARESETN] [get_bd_pins axi_interconnect_DMA_RAW/S01_ARESETN] [get_bd_pins axis_broadcaster_1r10/aresetn] [get_bd_pins axis_broadcaster_1r11/aresetn] [get_bd_pins axis_broadcaster_1r12/aresetn] [get_bd_pins axis_broadcaster_1r13/aresetn] [get_bd_pins axis_broadcaster_1r14/aresetn] [get_bd_pins axis_broadcaster_1r15/aresetn] [get_bd_pins axis_clock_converter_0/m_axis_aresetn] [get_bd_pins axis_clock_converter_1/m_axis_aresetn] [get_bd_pins axis_clock_converter_2/m_axis_aresetn] [get_bd_pins axis_clock_converter_3/m_axis_aresetn] [get_bd_pins axis_clock_converter_4/m_axis_aresetn] [get_bd_pins axis_clock_converter_5/m_axis_aresetn] [get_bd_pins axis_combiner_0/aresetn] [get_bd_pins axis_combiner_1/aresetn] [get_bd_pins axis_combiner_2/aresetn] [get_bd_pins axis_data_fifo_6/s_axis_aresetn] [get_bd_pins axis_data_fifo_L1_tst/s_axis_aresetn] [get_bd_pins axis_data_fifo_fc_L10/s_axis_aresetn] [get_bd_pins axis_data_fifo_fc_L11/s_axis_aresetn] [get_bd_pins axis_data_fifo_fc_L12/s_axis_aresetn] [get_bd_pins axis_data_fifo_fc_L13/s_axis_aresetn] [get_bd_pins axis_data_fifo_fc_L14/s_axis_aresetn] [get_bd_pins axis_data_fifo_fc_L9/s_axis_aresetn] [get_bd_pins axis_dwidth_converter_0/aresetn] [get_bd_pins axis_dwidth_converter_10/aresetn] [get_bd_pins axis_dwidth_converter_11/aresetn] [get_bd_pins axis_dwidth_converter_12/aresetn] [get_bd_pins axis_dwidth_converter_2/aresetn] [get_bd_pins axis_dwidth_converter_3/aresetn] [get_bd_pins axis_dwidth_converter_4/aresetn] [get_bd_pins axis_dwidth_converter_5/aresetn] [get_bd_pins axis_dwidth_converter_6/aresetn] [get_bd_pins axis_dwidth_converter_7/aresetn] [get_bd_pins axis_dwidth_converter_8/aresetn] [get_bd_pins axis_dwidth_converter_9/aresetn] [get_bd_pins axis_dwidth_converter_L1_tst/aresetn] [get_bd_pins axis_flow_control_L1/S_AXI_ARESETN] [get_bd_pins axis_flow_control_L1/s_axis_aresetn] [get_bd_pins inst_interconnect_200MHz/M00_ARESETN] [get_bd_pins inst_interconnect_200MHz/M01_ARESETN] [get_bd_pins inst_interconnect_200MHz/M02_ARESETN] [get_bd_pins inst_interconnect_200MHz/M03_ARESETN] [get_bd_pins inst_interconnect_200MHz/M04_ARESETN] [get_bd_pins inst_interconnect_200MHz/M05_ARESETN] [get_bd_pins inst_interconnect_200MHz/S00_ARESETN] [get_bd_pins rst_processing_system7_0_200M/peripheral_aresetn] [get_bd_pins top_switch_raw/S_AXI_ARESETN] [get_bd_pins top_switch_raw/s_axis_aresetn] [get_bd_pins top_switch_tst/S_AXI_ARESETN] [get_bd_pins top_switch_tst/s_axis_aresetn]
  connect_bd_net -net rst_processing_system7_0_50M_interconnect_aresetn [get_bd_pins axi_interconnect_DMA_INT/ARESETN] [get_bd_pins inst_interconnect_100MHz/ARESETN] [get_bd_pins rst_processing_system7_0_100M/interconnect_aresetn]
  connect_bd_net -net rst_processing_system7_0_50M_peripheral_aresetn [get_bd_pins HV_AERA_IP_0/s00_axi_aresetn] [get_bd_pins axi_artix_conf_v1_0_0/s00_axi_aresetn] [get_bd_pins axi_data_provider_0/s00_axi_aresetn] [get_bd_pins axi_dma_L1/axi_resetn] [get_bd_pins axi_fifo_mm_s_1/s_axi_aresetn] [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_interconnect_DMA_INT/M00_ARESETN] [get_bd_pins axi_interconnect_DMA_INT/S00_ARESETN] [get_bd_pins axi_interconnect_DMA_INT/S01_ARESETN] [get_bd_pins axi_quad_spi_0/s_axi_aresetn] [get_bd_pins axis_broadcaster_00/aresetn] [get_bd_pins axis_broadcaster_01/aresetn] [get_bd_pins axis_broadcaster_02/aresetn] [get_bd_pins axis_broadcaster_03/aresetn] [get_bd_pins axis_broadcaster_04/aresetn] [get_bd_pins axis_broadcaster_05/aresetn] [get_bd_pins axis_broadcaster_1r/aresetn] [get_bd_pins axis_clock_converter_0/s_axis_aresetn] [get_bd_pins axis_clock_converter_1/s_axis_aresetn] [get_bd_pins axis_clock_converter_2/s_axis_aresetn] [get_bd_pins axis_clock_converter_3/s_axis_aresetn] [get_bd_pins axis_clock_converter_4/s_axis_aresetn] [get_bd_pins axis_clock_converter_5/s_axis_aresetn] [get_bd_pins axis_data_fifo_1r/s_axis_aresetn] [get_bd_pins axis_data_fifo_L2/s_axis_aresetn] [get_bd_pins axis_data_fifo_fc_L2b/s_axis_aresetn] [get_bd_pins axis_data_fifo_int/s_axis_aresetn] [get_bd_pins axis_data_fifo_sa_00/s_axis_aresetn] [get_bd_pins axis_data_fifo_sa_01/s_axis_aresetn] [get_bd_pins axis_data_fifo_sa_02/s_axis_aresetn] [get_bd_pins axis_data_fifo_sa_03/s_axis_aresetn] [get_bd_pins axis_data_fifo_sa_04/s_axis_aresetn] [get_bd_pins axis_data_fifo_sa_05/s_axis_aresetn] [get_bd_pins axis_dwidth_converter_1/aresetn] [get_bd_pins axis_dwidth_converter_1r/aresetn] [get_bd_pins axis_flow_control_L2/S_AXI_ARESETN] [get_bd_pins axis_flow_control_L2/s_axis_aresetn] [get_bd_pins hv_hk_v1_0_0/s00_axi_aresetn] [get_bd_pins inst_interconnect_100MHz/M00_ARESETN] [get_bd_pins inst_interconnect_100MHz/M01_ARESETN] [get_bd_pins inst_interconnect_100MHz/M02_ARESETN] [get_bd_pins inst_interconnect_100MHz/M03_ARESETN] [get_bd_pins inst_interconnect_100MHz/M04_ARESETN] [get_bd_pins inst_interconnect_100MHz/M05_ARESETN] [get_bd_pins inst_interconnect_100MHz/M06_ARESETN] [get_bd_pins inst_interconnect_100MHz/M07_ARESETN] [get_bd_pins inst_interconnect_100MHz/M08_ARESETN] [get_bd_pins inst_interconnect_100MHz/M09_ARESETN] [get_bd_pins inst_interconnect_100MHz/M10_ARESETN] [get_bd_pins inst_interconnect_100MHz/M11_ARESETN] [get_bd_pins inst_interconnect_100MHz/M12_ARESETN] [get_bd_pins inst_interconnect_100MHz/M13_ARESETN] [get_bd_pins inst_interconnect_100MHz/S00_ARESETN] [get_bd_pins l2_trigger_0/ap_rst_n] [get_bd_pins rst_processing_system7_0_100M/peripheral_aresetn] [get_bd_pins scurve_adder_0/ap_rst_n] [get_bd_pins spaciroc3_sc_0/s00_axi_aresetn] [get_bd_pins spaciroc3_sc_0/s00_axis_aresetn]
  connect_bd_net -net spaciroc3_sc_0_loadb_sc_pc [get_bd_ports loadb_sc_pc] [get_bd_pins spaciroc3_sc_0/loadb_sc_pc]
  connect_bd_net -net spaciroc3_sc_0_resetb_pc [get_bd_ports resetb_pc] [get_bd_pins spaciroc3_sc_0/resetb_pc]
  connect_bd_net -net spaciroc3_sc_0_select_din_pc [get_bd_ports select_din_pc] [get_bd_pins spaciroc3_sc_0/select_din_pc]
  connect_bd_net -net spaciroc3_sc_0_select_sc_probe_pc [get_bd_ports select_sc_probe_pc] [get_bd_pins spaciroc3_sc_0/select_sc_probe_pc]
  connect_bd_net -net spaciroc3_sc_0_sr_ck_pc [get_bd_ports sr_ck_pc] [get_bd_ports sr_ck_pc_art] [get_bd_pins spaciroc3_sc_0/sr_ck_pc]
  connect_bd_net -net spaciroc3_sc_0_sr_in_pc [get_bd_ports sr_in_pc] [get_bd_pins spaciroc3_sc_0/sr_in_pc]
  connect_bd_net -net spaciroc3_sc_0_sr_rstb_pc [get_bd_ports sr_rstb_pc] [get_bd_pins spaciroc3_sc_0/sr_rstb_pc]
  connect_bd_net -net top_switch_tst_m_axis_tdata [get_bd_pins ALGO_B_0/DATA] [get_bd_pins top_switch_tst/m_axis_tdata]
  connect_bd_net -net top_switch_tst_m_axis_tvalid [get_bd_pins ALGO_B_0/FRAME] [get_bd_pins top_switch_tst/m_axis_tvalid]
  connect_bd_net -net trig_button_1 [get_bd_ports trig_button] [get_bd_pins axis_flow_control_L1/trig_button] [get_bd_pins axis_flow_control_L2/trig_button]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_ports user_led] [get_bd_pins util_vector_logic_0/Res]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins axi_gpio_0/gpio_io_i] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconcat_1_dout [get_bd_pins processing_system7_0/IRQ_F2P] [get_bd_pins xlconcat_1/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins top_switch_tst/m_axis_tready] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_ports trig_button_gnd] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins axis_flow_control_L2/trig0] [get_bd_pins axis_flow_control_L2/trig1] [get_bd_pins axis_flow_control_L2/trig2] [get_bd_pins xlslice_0/Dout]

  # Create address segments
  create_bd_addr_seg -range 0x40000000 -offset 0x00000000 [get_bd_addr_spaces axi_dma_L1/Data_S2MM] [get_bd_addr_segs processing_system7_0/S_AXI_HP1/HP1_DDR_LOWOCM] SEG_processing_system7_0_HP1_DDR_LOWOCM
  create_bd_addr_seg -range 0x40000000 -offset 0x00000000 [get_bd_addr_spaces axi_dma_L2/Data_S2MM] [get_bd_addr_segs processing_system7_0/S_AXI_HP1/HP1_DDR_LOWOCM] SEG_processing_system7_0_HP1_DDR_LOWOCM
  create_bd_addr_seg -range 0x40000000 -offset 0x00000000 [get_bd_addr_spaces axi_dma_raw/Data_S2MM] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x40000000 -offset 0x00000000 [get_bd_addr_spaces axi_dma_tst_L1/Data_MM2S] [get_bd_addr_segs processing_system7_0/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_processing_system7_0_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x00010000 -offset 0x83C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs HV_AERA_IP_0/s00_axi/reg0] SEG_HV_AERA_IP_0_reg0
  create_bd_addr_seg -range 0x00010000 -offset 0x83C20000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_artix_conf_v1_0_0/s00_axi/reg0] SEG_axi_artix_conf_v1_0_0_reg0
  create_bd_addr_seg -range 0x00010000 -offset 0x83C30000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_data_provider_0/s00_axi/reg0] SEG_axi_data_provider_0_reg0
  create_bd_addr_seg -range 0x00010000 -offset 0x80400000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_dma_L1/S_AXI_LITE/Reg] SEG_axi_dma_L1_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x80410000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_dma_L2/S_AXI_LITE/Reg] SEG_axi_dma_L2_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40400000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_dma_raw/S_AXI_LITE/Reg] SEG_axi_dma_raw_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40410000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_dma_tst_L1/S_AXI_LITE/Reg] SEG_axi_dma_tst_L1_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C30000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_fifo_mm_s_trigger_ev/S_AXI/Mem0] SEG_axi_fifo_mm_s_0_Mem0
  create_bd_addr_seg -range 0x00010000 -offset 0x83C40000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_fifo_mm_s_1/S_AXI/Mem0] SEG_axi_fifo_mm_s_1_Mem0
  create_bd_addr_seg -range 0x00010000 -offset 0x81200000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x81E00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axi_quad_spi_0/AXI_LITE/Reg] SEG_axi_quad_spi_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x43C00000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axis_flow_control_L1/S_AXI/reg0] SEG_axis_flow_control_0_reg0
  create_bd_addr_seg -range 0x00010000 -offset 0x83C50000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs axis_flow_control_L2/S_AXI/reg0] SEG_axis_flow_control_1_reg0
  create_bd_addr_seg -range 0x00010000 -offset 0x83C60000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs hv_hk_v1_0_0/s00_axi/reg0] SEG_hv_hk_v1_0_0_reg0
  create_bd_addr_seg -range 0x00010000 -offset 0x83C10000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs l2_trigger_0/s_axi_CTRL_BUS/Reg] SEG_l2_trigger_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x83C70000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs scurve_adder_0/s_axi_CTRL_BUS/Reg] SEG_scurve_adder_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x83C80000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs spaciroc3_sc_0/s00_axi/reg0] SEG_spaciroc3_sc_0_reg0
  create_bd_addr_seg -range 0x00010000 -offset 0x43C10000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs top_switch_raw/S_AXI/reg0] SEG_top_switch_0_reg0
  create_bd_addr_seg -range 0x00010000 -offset 0x43C20000 [get_bd_addr_spaces processing_system7_0/Data] [get_bd_addr_segs top_switch_tst/S_AXI/reg0] SEG_top_switch_tst_reg0

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.12  2016-01-29 bk=1.3547 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port miso_p -pg 1 -y 2660 -defaultsOSRD
preplace port loadb_sc_pc -pg 1 -y 2810 -defaultsOSRD
preplace port artx_programb_io -pg 1 -y 1090 -defaultsOSRD
preplace port DDR -pg 1 -y 1220 -defaultsOSRD
preplace port artx_initb_io -pg 1 -y 1070 -defaultsOSRD
preplace port frame_art0 -pg 1 -y 2170 -defaultsOSRD
preplace port intr_n -pg 1 -y 2510 -defaultsOSRD
preplace port sck_n -pg 1 -y 2440 -defaultsOSRD
preplace port artx_done -pg 1 -y 540 -defaultsOSRD
preplace port cs_exp_n -pg 1 -y 2520 -defaultsOSRD
preplace port sr_rstb_pc -pg 1 -y 2730 -defaultsOSRD
preplace port sr_ck_pc -pg 1 -y 2830 -defaultsOSRD
preplace port DATA_HV_n -pg 1 -y 960 -defaultsOSRD
preplace port frame_art1 -pg 1 -y 2190 -defaultsOSRD
preplace port frame_art2 -pg 1 -y 2210 -defaultsOSRD
preplace port intr_p -pg 1 -y 2620 -defaultsOSRD
preplace port cs_dac_n -pg 1 -y 2560 -defaultsOSRD
preplace port sck_p -pg 1 -y 2420 -defaultsOSRD
preplace port hv_led -pg 1 -y 2580 -defaultsOSRD
preplace port cs_exp_p -pg 1 -y 2500 -defaultsOSRD
preplace port resetb_pc -pg 1 -y 2770 -defaultsOSRD
preplace port DATA_HV_p -pg 1 -y 940 -defaultsOSRD
preplace port CLK_HV_n -pg 1 -y 920 -defaultsOSRD
preplace port clk_art_0 -pg 1 -y 1240 -defaultsOSRD
preplace port sr_ck_pc_art -pg 1 -y 2710 -defaultsOSRD
preplace port cs_dac_p -pg 1 -y 2540 -defaultsOSRD
preplace port select_sc_probe_pc -pg 1 -y 2750 -defaultsOSRD
preplace port clk_art_1 -pg 1 -y 2570 -defaultsOSRD
preplace port select_din_pc -pg 1 -y 2790 -defaultsOSRD
preplace port CLK_HV_p -pg 1 -y 900 -defaultsOSRD
preplace port clk_art_2 -pg 1 -y 2450 -defaultsOSRD
preplace port GTU_HV_n -pg 1 -y 880 -defaultsOSRD
preplace port artx_conf_data -pg 1 -y 2290 -defaultsOSRD
preplace port FIXED_IO -pg 1 -y 1240 -defaultsOSRD
preplace port mosi_n -pg 1 -y 2480 -defaultsOSRD
preplace port artx_conf_cclk -pg 1 -y 2310 -defaultsOSRD
preplace port GTU_HV_p -pg 1 -y 860 -defaultsOSRD
preplace port miso_n -pg 1 -y 2640 -defaultsOSRD
preplace port mosi_p -pg 1 -y 2460 -defaultsOSRD
preplace port trig_button -pg 1 -y 1750 -defaultsOSRD
preplace portBus trig_button_gnd -pg 1 -y 2380 -defaultsOSRD
preplace portBus data_art0 -pg 1 -y 2230 -defaultsOSRD
preplace portBus data_art1 -pg 1 -y 2250 -defaultsOSRD
preplace portBus data_art2 -pg 1 -y 2270 -defaultsOSRD
preplace portBus user_led -pg 1 -y 2400 -defaultsOSRD
preplace portBus sr_in_pc -pg 1 -y 2690 -defaultsOSRD
preplace inst axis_data_fifo_fc_L10 -pg 1 -lvl 10 -y 180 -defaultsOSRD
preplace inst axis_data_fifo_sa_01 -pg 1 -lvl 6 -y 2160 -defaultsOSRD
preplace inst processing_system7_0 -pg 1 -lvl 18 -y 1290 -defaultsOSRD
preplace inst axis_data_fifo_fc_L11 -pg 1 -lvl 10 -y 330 -defaultsOSRD
preplace inst axis_data_fifo_sa_02 -pg 1 -lvl 6 -y 1860 -defaultsOSRD
preplace inst axis_data_fifo_L2 -pg 1 -lvl 13 -y 2020 -defaultsOSRD
preplace inst axis_data_fifo_fc_L12 -pg 1 -lvl 10 -y 30 -defaultsOSRD
preplace inst axis_data_fifo_sa_03 -pg 1 -lvl 6 -y 2340 -defaultsOSRD
preplace inst axis_data_fifo_fc_L13 -pg 1 -lvl 10 -y 540 -defaultsOSRD
preplace inst axis_data_fifo_sa_04 -pg 1 -lvl 6 -y 2010 -defaultsOSRD
preplace inst axi_interconnect_DMA_INT -pg 1 -lvl 17 -y 1930 -defaultsOSRD
preplace inst axis_data_fifo_fc_L2b -pg 1 -lvl 15 -y 1760 -defaultsOSRD
preplace inst top_switch_tst -pg 1 -lvl 11 -y 750 -defaultsOSRD
preplace inst axis_data_fifo_fc_L14 -pg 1 -lvl 10 -y 690 -defaultsOSRD
preplace inst axis_dwidth_converter_0 -pg 1 -lvl 6 -y 500 -defaultsOSRD
preplace inst axis_data_fifo_sa_05 -pg 1 -lvl 6 -y 1670 -defaultsOSRD
preplace inst axis_data_fifo_fc_L9 -pg 1 -lvl 10 -y -120 -defaultsOSRD
preplace inst axis_dwidth_converter_1 -pg 1 -lvl 17 -y 2710 -defaultsOSRD
preplace inst axis_broadcaster_1r10 -pg 1 -lvl 7 -y 510 -defaultsOSRD
preplace inst axis_dwidth_converter_2 -pg 1 -lvl 6 -y 1260 -defaultsOSRD
preplace inst axis_broadcaster_1r11 -pg 1 -lvl 7 -y 680 -defaultsOSRD
preplace inst axis_dwidth_converter_3 -pg 1 -lvl 6 -y 660 -defaultsOSRD
preplace inst clk_wiz_0 -pg 1 -lvl 2 -y 1210 -defaultsOSRD
preplace inst inst_interconnect_100MHz -pg 1 -lvl 2 -y 1830 -defaultsOSRD
preplace inst axis_broadcaster_1r12 -pg 1 -lvl 7 -y 830 -defaultsOSRD
preplace inst clk_wiz_1 -pg 1 -lvl 2 -y 2550 -defaultsOSRD
preplace inst axis_dwidth_converter_4 -pg 1 -lvl 6 -y 830 -defaultsOSRD
preplace inst axis_data_fifo_L1_tst -pg 1 -lvl 10 -y 840 -defaultsOSRD
preplace inst axis_broadcaster_1r13 -pg 1 -lvl 7 -y 960 -defaultsOSRD
preplace inst axis_dwidth_converter_5 -pg 1 -lvl 6 -y 990 -defaultsOSRD
preplace inst clk_wiz_2 -pg 1 -lvl 2 -y 2440 -defaultsOSRD
preplace inst axis_combiner_0 -pg 1 -lvl 8 -y 540 -defaultsOSRD
preplace inst axis_broadcaster_1r14 -pg 1 -lvl 7 -y 1090 -defaultsOSRD
preplace inst axis_combiner_1 -pg 1 -lvl 8 -y 1030 -defaultsOSRD
preplace inst axis_dwidth_converter_6 -pg 1 -lvl 6 -y 1130 -defaultsOSRD
preplace inst axis_broadcaster_1r15 -pg 1 -lvl 7 -y 1240 -defaultsOSRD
preplace inst axis_combiner_2 -pg 1 -lvl 8 -y 840 -defaultsOSRD
preplace inst axis_dwidth_converter_7 -pg 1 -lvl 9 -y 100 -defaultsOSRD
preplace inst axis_dwidth_converter_8 -pg 1 -lvl 9 -y 360 -defaultsOSRD
preplace inst axis_broadcaster_1r -pg 1 -lvl 9 -y 1970 -defaultsOSRD
preplace inst axi_data_provider_0 -pg 1 -lvl 3 -y 2100 -defaultsOSRD
preplace inst axis_dwidth_converter_10 -pg 1 -lvl 9 -y 230 -defaultsOSRD
preplace inst axis_dwidth_converter_9 -pg 1 -lvl 9 -y 680 -defaultsOSRD
preplace inst axis_dwidth_converter_11 -pg 1 -lvl 9 -y 550 -defaultsOSRD
preplace inst axis_data_fifo_int -pg 1 -lvl 15 -y 1940 -defaultsOSRD
preplace inst axis_dwidth_converter_12 -pg 1 -lvl 9 -y 810 -defaultsOSRD
preplace inst axis_broadcaster_00 -pg 1 -lvl 4 -y 1520 -defaultsOSRD
preplace inst ALGO_B_0 -pg 1 -lvl 13 -y 470 -defaultsOSRD
preplace inst axis_broadcaster_01 -pg 1 -lvl 4 -y 2130 -defaultsOSRD
preplace inst axi_artix_conf_v1_0_0 -pg 1 -lvl 18 -y 1070 -defaultsOSRD
preplace inst scurve_adder_0 -pg 1 -lvl 8 -y 1960 -defaultsOSRD
preplace inst axis_broadcaster_02 -pg 1 -lvl 4 -y 1840 -defaultsOSRD
preplace inst axi_gpio_0 -pg 1 -lvl 3 -y 2370 -defaultsOSRD
preplace inst rst_processing_system7_0_200M -pg 1 -lvl 1 -y 1750 -defaultsOSRD
preplace inst axis_broadcaster_03 -pg 1 -lvl 4 -y 2260 -defaultsOSRD
preplace inst HV_AERA_IP_0 -pg 1 -lvl 18 -y 900 -defaultsOSRD
preplace inst axis_broadcaster_04 -pg 1 -lvl 4 -y 1980 -defaultsOSRD
preplace inst axis_broadcaster_05 -pg 1 -lvl 4 -y 1690 -defaultsOSRD
preplace inst rst_processing_system7_0_100M -pg 1 -lvl 1 -y 1530 -defaultsOSRD
preplace inst util_vector_logic_0 -pg 1 -lvl 15 -y 1390 -defaultsOSRD
preplace inst axis_flow_control_L1 -pg 1 -lvl 14 -y 1100 -defaultsOSRD
preplace inst top_switch_raw -pg 1 -lvl 13 -y 140 -defaultsOSRD
preplace inst axis_dwidth_converter_L1_tst -pg 1 -lvl 9 -y 940 -defaultsOSRD
preplace inst axis_flow_control_L2 -pg 1 -lvl 14 -y 1770 -defaultsOSRD
preplace inst axi_interconnect_DMA_RAW -pg 1 -lvl 17 -y 1250 -defaultsOSRD
preplace inst xlconcat_0 -pg 1 -lvl 3 -y 2530 -defaultsOSRD
preplace inst xlconcat_1 -pg 1 -lvl 17 -y 1500 -defaultsOSRD
preplace inst axi_fifo_mm_s_trigger_ev -pg 1 -lvl 13 -y 920 -defaultsOSRD
preplace inst algo_b_conv_1 -pg 1 -lvl 13 -y 680 -defaultsOSRD
preplace inst hv_hk_v1_0_0 -pg 1 -lvl 18 -y 2500 -defaultsOSRD
preplace inst algo_b_conv_2 -pg 1 -lvl 13 -y 790 -defaultsOSRD
preplace inst axis_data_fifo_6 -pg 1 -lvl 15 -y 1210 -defaultsOSRD
preplace inst axis_clock_converter_0 -pg 1 -lvl 5 -y 430 -defaultsOSRD
preplace inst axis_clock_converter_1 -pg 1 -lvl 5 -y 620 -defaultsOSRD
preplace inst axis_clock_converter_2 -pg 1 -lvl 5 -y 800 -defaultsOSRD
preplace inst spaciroc3_sc_0 -pg 1 -lvl 18 -y 2740 -defaultsOSRD
preplace inst axi_dma_raw -pg 1 -lvl 16 -y 1150 -defaultsOSRD
preplace inst xlconstant_0 -pg 1 -lvl 12 -y 780 -defaultsOSRD
preplace inst axi_fifo_mm_s_1 -pg 1 -lvl 16 -y 2700 -defaultsOSRD
preplace inst axi_quad_spi_0 -pg 1 -lvl 18 -y 2300 -defaultsOSRD
preplace inst axis_data_fifo_1r -pg 1 -lvl 2 -y 1350 -defaultsOSRD
preplace inst axi_dma_L1 -pg 1 -lvl 16 -y 1970 -defaultsOSRD
preplace inst axis_clock_converter_3 -pg 1 -lvl 5 -y 980 -defaultsOSRD
preplace inst axis_dwidth_converter_1r -pg 1 -lvl 1 -y 1360 -defaultsOSRD
preplace inst xlslice_0 -pg 1 -lvl 13 -y 1840 -defaultsOSRD
preplace inst xlconstant_1 -pg 1 -lvl 18 -y 2900 -defaultsOSRD
preplace inst axi_dma_L2 -pg 1 -lvl 16 -y 1770 -defaultsOSRD
preplace inst axis_clock_converter_4 -pg 1 -lvl 5 -y 1160 -defaultsOSRD
preplace inst inst_interconnect_200MHz -pg 1 -lvl 10 -y 1200 -defaultsOSRD
preplace inst axis_clock_converter_5 -pg 1 -lvl 5 -y 1340 -defaultsOSRD
preplace inst l2_trigger_0 -pg 1 -lvl 14 -y 2070 -defaultsOSRD
preplace inst axi_dma_tst_L1 -pg 1 -lvl 16 -y 1320 -defaultsOSRD
preplace inst axis_data_fifo_sa_00 -pg 1 -lvl 6 -y 1510 -defaultsOSRD
preplace netloc axis_broadcaster_1r_M01_AXIS 1 9 4 NJ 1980 NJ 1980 NJ 1980 4830
preplace netloc axis_broadcaster_1r1_M00_AXIS 1 4 2 NJ 1490 NJ
preplace netloc spaciroc3_sc_0_sr_rstb_pc 1 18 1 NJ
preplace netloc data_art0_1 1 0 3 NJ 2230 NJ 2230 NJ
preplace netloc axis_flow_control_1_m_axis 1 14 1 6090
preplace netloc inst_interconnect_200MHz_M02_AXI 1 10 3 4040 -30 NJ -30 NJ
preplace netloc axi_data_provider_0_m_axis_art2r 1 3 1 960
preplace netloc axis_data_fifo_fc_L9_axis_data_count 1 10 3 NJ -130 N -130 4890
preplace netloc axis_broadcaster_1r12_M01_AXIS 1 7 2 2680 340 NJ
preplace netloc axis_data_fifo_fc_L11_M_AXIS 1 10 3 4030 50 NJ 50 NJ
preplace netloc axis_clock_converter_0_M_AXIS 1 5 1 1790
preplace netloc processing_system7_0_axi_periph_M08_AXI 1 2 16 NJ 2270 NJ 2330 NJ 2330 NJ 2440 NJ 2440 NJ 2440 NJ 2440 NJ 2440 NJ 2440 NJ 2440 NJ 2440 NJ 2440 NJ 2440 NJ 2440 NJ 2440 NJ
preplace netloc util_vector_logic_0_Res 1 15 4 NJ 1430 NJ 1430 NJ 1430 7740
preplace netloc processing_system7_0_FIXED_IO 1 18 1 NJ
preplace netloc axis_broadcaster_1r2_M01_AXIS 1 4 1 1390
preplace netloc spaciroc3_sc_0_resetb_pc 1 18 1 NJ
preplace netloc clk_wiz_2_locked 1 2 1 460
preplace netloc spaciroc3_sc_0_select_sc_probe_pc 1 18 1 NJ
preplace netloc clk_art_1_1 1 0 2 NJ 2550 N
preplace netloc axis_dwidth_converter_5_M_AXIS1 1 6 1 2290
preplace netloc axi_dma_raw_s2mm_introut 1 16 1 6920
preplace netloc axis_broadcaster_1r11_M00_AXIS 1 7 1 2690
preplace netloc frame_art0_1 1 0 3 NJ 2170 NJ 2240 NJ
preplace netloc axis_broadcaster_1r15_M00_AXIS 1 7 1 2780
preplace netloc inst_interconnect_100MHz_M12_AXI 1 2 12 NJ 1770 NJ 1770 NJ 1770 NJ 1770 NJ 1610 NJ 1610 NJ 1610 NJ 1610 NJ 1610 NJ 1610 N 1610 N
preplace netloc axi_dma_L1_s2mm_introut 1 16 1 6930
preplace netloc HV_AERA_IP_0_CLK_HV_n 1 18 1 NJ
preplace netloc top_switch_tst_m_axis_tvalid 1 11 2 4510 490 N
preplace netloc xlconcat_1_dout 1 17 1 7270
preplace netloc axi_fifo_mm_s_1_AXI_STR_TXD 1 16 1 6890
preplace netloc frame_art1_1 1 0 3 NJ 2190 NJ 2210 NJ
preplace netloc axis_broadcaster_1r12_M00_AXIS 1 7 1 2710
preplace netloc HV_AERA_IP_0_CLK_HV_p 1 18 1 NJ
preplace netloc clk_wiz_3_clk_out1 1 2 1 610
preplace netloc xlconcat_0_dout 1 3 1 950
preplace netloc axi_quad_spi_0_sck_o 1 18 1 NJ
preplace netloc CLK_IN1_D_1_2 1 0 2 NJ 2440 NJ
preplace netloc l2_trigger_0_out_stream 1 14 1 6130
preplace netloc axis_dwidth_converter_12_M_AXIS 1 9 1 3590
preplace netloc axis_broadcaster_1r6_M01_AXIS 1 4 1 1360
preplace netloc dma_L2_S_AXIS 1 15 1 6500
preplace netloc axi_quad_spi_0_io0_o 1 18 1 NJ
preplace netloc top_switch_tst_m_axis_event 1 11 2 4560 730 4830
preplace netloc axi_data_provider_0_m_axis_art1l 1 3 1 950
preplace netloc axis_flow_control_L2_trig_led 1 14 1 6110
preplace netloc hv_hk_v1_0_0_cs_dac_n 1 18 1 NJ
preplace netloc spaciroc3_sc_0_loadb_sc_pc 1 18 1 NJ
preplace netloc axis_dwidth_converter_2_M_AXIS 1 6 1 2250
preplace netloc processing_system7_0_axi_periph_M06_AXI 1 2 14 NJ 2680 NJ 2680 NJ 2680 NJ 2680 NJ 2680 NJ 2680 NJ 2680 NJ 2680 NJ 2680 NJ 2680 NJ 2680 NJ 2680 NJ 2680 N
preplace netloc axis_data_fifo_fc_L10_axis_data_count 1 10 3 N 170 NJ 170 NJ
preplace netloc processing_system7_0_DDR 1 18 1 NJ
preplace netloc axis_dwidth_converter_8_M_AXIS 1 9 1 3560
preplace netloc axis_dwidth_converter_4_M_AXIS 1 6 1 2270
preplace netloc clk_wiz_3_locked 1 2 1 650
preplace netloc hv_hk_v1_0_0_cs_dac_p 1 18 1 NJ
preplace netloc HV_AERA_IP_0_DATA_HV_n 1 18 1 NJ
preplace netloc axis_broadcaster_1r13_M01_AXIS 1 7 2 2700 460 NJ
preplace netloc axis_dwidth_converter_6_M_AXIS 1 6 1 2260
preplace netloc S01_AXI_1 1 16 1 6950
preplace netloc top_switch_0_m_axis 1 13 1 5350
preplace netloc HV_AERA_IP_0_DATA_HV_p 1 18 1 NJ
preplace netloc axis_data_fifo_6_axis_data_count 1 13 3 NJ 1350 NJ 1290 6510
preplace netloc inst_interconnect_200MHz_M04_AXI 1 10 1 4090
preplace netloc axi_interconnect_1_M00_AXI 1 17 1 N
preplace netloc xlconstant_1_dout 1 18 1 7760
preplace netloc axis_dwidth_converter_11_M_AXIS 1 9 1 3570
preplace netloc axis_data_fifo_fc_L12_M_AXIS 1 10 3 N 0 NJ 0 NJ
preplace netloc processing_system7_0_axi_periph1_M01_AXI 1 10 6 NJ 1170 NJ 1170 NJ 1170 NJ 1320 NJ 1320 6520
preplace netloc axi_data_provider_0_m_axis_art1r 1 3 1 980
preplace netloc processing_system7_0_axi_periph_M05_AXI 1 2 16 NJ 1430 NJ 1430 NJ 1430 NJ 1430 NJ 1430 NJ 1430 NJ 1430 NJ 1430 NJ 1340 NJ 1340 NJ 1340 NJ 1340 NJ 1330 NJ 1410 NJ 1410 NJ
preplace netloc axi_dma_L2_s2mm_introut 1 16 1 6910
preplace netloc rst_processing_system7_0_50M_interconnect_aresetn 1 1 16 130 1450 NJ 1460 NJ 1600 NJ 1600 NJ 2250 NJ 2250 NJ 2250 NJ 1870 NJ 1870 NJ 1870 NJ 1870 NJ 1900 NJ 1990 NJ 2020 NJ 1880 6890
preplace netloc axis_broadcaster_1r2_M00_AXIS 1 4 2 NJ 1830 1770
preplace netloc axis_flow_control_L1_trig_led 1 14 1 6080
preplace netloc hv_hk_v1_0_0_mosi_n 1 18 1 NJ
preplace netloc spaciroc3_sc_0_sr_in_pc 1 18 1 NJ
preplace netloc frame_art2_1 1 0 3 NJ 2220 NJ 2220 NJ
preplace netloc processing_system7_0_FCLK_RESET0_N 1 0 19 -320 1660 NJ 2950 NJ 2950 NJ 2950 NJ 2950 NJ 2950 NJ 2950 NJ 2950 NJ 2950 NJ 2950 NJ 2950 NJ 2950 NJ 2950 NJ 2950 NJ 2950 NJ 2950 NJ 2950 NJ 2950 7730
preplace netloc l2_trigger_0_trig_data 1 12 3 4860 1520 NJ 1520 6070
preplace netloc axis_data_fifo_L2_M_AXIS 1 13 1 5260
preplace netloc inst_interconnect_200MHz_M03_AXI 1 10 4 NJ 1210 NJ 1210 NJ 1210 NJ
preplace netloc axi_dma_tst_L1_M_AXI_MM2S 1 16 1 6900
preplace netloc axis_dwidth_converter_5_M_AXIS 1 1 1 70
preplace netloc dma_L1_S_AXIS 1 15 1 6500
preplace netloc axis_dwidth_converter_10_M_AXIS 1 9 1 3550
preplace netloc axis_data_fifo_fc_L10_M_AXIS 1 10 3 4020 30 NJ 30 NJ
preplace netloc axis_broadcaster_1r4_M01_AXIS 1 4 1 1370
preplace netloc processing_system7_0_axi_periph_M03_AXI 1 2 1 460
preplace netloc processing_system7_0_axi_periph_M02_AXI 1 2 16 NJ 1450 NJ 1450 NJ 1450 NJ 2260 NJ 2260 NJ 2260 NJ 2260 NJ 2260 NJ 2260 NJ 2260 NJ 2260 NJ 2260 NJ 2260 NJ 2260 NJ 2260 NJ
preplace netloc hv_hk_v1_0_0_mosi_p 1 18 1 NJ
preplace netloc intr_n_1 1 0 18 NJ 2510 NJ 2620 NJ 2620 NJ 2520 NJ 2520 NJ 2520 NJ 2520 NJ 2520 NJ 2520 NJ 2520 NJ 2520 NJ 2520 NJ 2520 NJ 2520 NJ 2520 NJ 2520 NJ 2520 NJ
preplace netloc CLK_IN1_D_1 1 0 2 NJ 1210 NJ
preplace netloc axis_dwidth_converter_3_M_AXIS 1 6 1 N
preplace netloc processing_system7_0_axi_periph_M07_AXI 1 2 16 NJ 2780 NJ 2780 NJ 2780 NJ 2780 NJ 2780 NJ 2780 NJ 2780 NJ 2780 NJ 2780 NJ 2780 NJ 2780 NJ 2780 NJ 2780 NJ 2780 NJ 2780 NJ
preplace netloc data_art2_1 1 0 3 NJ 2270 NJ 2270 NJ
preplace netloc data_art1_1 1 0 3 NJ 2250 NJ 2250 NJ
preplace netloc axis_data_fifo_L1_tst_M_AXIS 1 10 1 4080
preplace netloc axis_data_fifo_fc_L14_M_AXIS 1 10 3 4070 90 NJ 90 NJ
preplace netloc axis_data_fifo_fc_L13_M_AXIS 1 10 3 4050 70 NJ 70 NJ
preplace netloc axis_flow_control_0_m_axis 1 14 1 6130
preplace netloc axis_clock_converter_2_M_AXIS 1 5 1 1750
preplace netloc axis_clock_converter_4_M_AXIS 1 5 1 1750
preplace netloc processing_system7_0_axi_periph_M09_AXI 1 2 1 560
preplace netloc xlslice_0_Dout 1 13 1 5340
preplace netloc axis_data_fifo_fc_L11_axis_data_count 1 10 3 4060 190 NJ 190 NJ
preplace netloc top_switch_tst_m_axis_tdata 1 11 2 4500 470 N
preplace netloc inst_interconnect_100MHz_M13_AXI 1 2 14 NJ 1590 NJ 1590 NJ 1590 NJ 1590 NJ 1540 NJ 1540 NJ 1540 NJ 1540 NJ 1540 NJ 1540 NJ 1540 NJ 1540 NJ 1540 6520
preplace netloc axis_dwidth_converter_0_M_AXIS 1 6 1 2320
preplace netloc axis_data_fifo_sa_00_M_AXIS 1 6 2 NJ 1480 2750
preplace netloc axis_broadcaster_1r14_M00_AXIS 1 7 1 2750
preplace netloc axis_broadcaster_1r5_M01_AXIS 1 4 1 1410
preplace netloc trig_button_1 1 0 14 NJ 2360 NJ 2360 NJ 2440 NJ 2440 NJ 2440 NJ 2450 NJ 1750 NJ 1750 NJ 1750 NJ 1750 NJ 1750 NJ 1750 NJ 1750 NJ
preplace netloc HV_AERA_IP_0_GTU_HV_n 1 18 1 NJ
preplace netloc axis_broadcaster_1r5_M00_AXIS 1 4 2 NJ 2250 NJ
preplace netloc axi_data_provider_0_m_axis_art0l 1 3 1 940
preplace netloc intr_p_1 1 0 18 NJ 2620 NJ 2630 NJ 2630 NJ 2500 NJ 2500 NJ 2500 NJ 2500 NJ 2500 NJ 2500 NJ 2500 NJ 2500 NJ 2500 NJ 2500 NJ 2500 NJ 2500 NJ 2500 NJ 2500 NJ
preplace netloc axis_data_fifo_sa_04_M_AXIS 1 6 2 N 1980 NJ
preplace netloc axis_broadcaster_1r14_M01_AXIS 1 7 2 NJ 660 NJ
preplace netloc HV_AERA_IP_0_GTU_HV_p 1 18 1 NJ
preplace netloc axi_dma_tst_L1_M_AXIS_MM2S 1 8 9 3190 -200 NJ -200 NJ -200 NJ -200 NJ -200 NJ -200 NJ -200 NJ -200 6890
preplace netloc axis_broadcaster_1r10_M01_AXIS 1 7 2 2660 80 NJ
preplace netloc inst_interconnect_100MHz_M11_AXI 1 2 14 NJ 1910 NJ 1910 NJ 1910 NJ 2240 NJ 2240 NJ 2240 NJ 1880 NJ 1880 NJ 1880 NJ 1880 NJ 1890 NJ 1980 NJ 1860 NJ
preplace netloc axis_clock_converter_5_M_AXIS 1 5 1 1750
preplace netloc scurve_adder_0_out_stream 1 8 1 N
preplace netloc processing_system7_0_FCLK_CLK0 1 0 19 -320 1430 110 1440 470 1520 1010 1620 1330 1530 1780 2420 NJ 2100 2700 2100 3160 1900 3550 1910 NJ 1910 N 1910 4860 1910 5350 1550 6120 1840 6540 1870 6900 2080 7280 1160 7750
preplace netloc algo_b_conv_2_L1_EVENT 1 13 1 5280
preplace netloc axi_artix_conf_v1_0_0_artx_programb_io 1 18 1 NJ
preplace netloc inst_interconnect_200MHz_M05_AXI 1 10 3 NJ 1250 NJ 890 NJ
preplace netloc axis_broadcaster_1r15_M01_AXIS 1 7 2 NJ 760 NJ
preplace netloc axis_data_fifo_fc_L9_M_AXIS 1 10 3 NJ -150 N -150 4900
preplace netloc processing_system7_0_FCLK_CLK1 1 0 19 -340 1270 NJ 1270 NJ 1270 NJ 1270 1380 520 1760 590 2310 580 NJ 430 NJ 20 3610 920 4100 1010 N 1010 4850 1010 5330 1360 6120 1300 6540 1060 6930 1400 7300 1420 7740
preplace netloc spaciroc3_sc_0_select_din_pc 1 18 1 NJ
preplace netloc axis_broadcaster_1r10_M00_AXIS 1 7 1 2720
preplace netloc axis_data_fifo_sa_03_M_AXIS 1 6 2 2300 1960 NJ
preplace netloc inst_interconnect_100MHz_M04_AXI 1 2 6 NJ 1760 NJ 1760 NJ 1760 NJ 1760 NJ 1880 N
preplace netloc axis_dwidth_converter_9_M_AXIS 1 9 1 3580
preplace netloc axis_clock_converter_1_M_AXIS 1 5 1 1750
preplace netloc processing_system7_0_axi_periph_M00_AXI 1 2 16 NJ 710 NJ 710 NJ 710 NJ 750 NJ 750 NJ 750 NJ 1020 NJ 970 NJ 1330 NJ 1330 NJ 1330 NJ 1330 NJ 1030 NJ 1030 NJ 1030 NJ
preplace netloc hv_hk_v1_0_0_hv_led 1 18 1 NJ
preplace netloc clk_wiz_0_locked 1 2 1 570
preplace netloc axis_data_fifo_sa_01_M_AXIS 1 6 2 2260 1920 NJ
preplace netloc axi_data_provider_0_m_axis_art0r 1 3 1 1000
preplace netloc axis_combiner_2_M_AXIS 1 8 5 3120 1010 NJ 950 NJ 980 NJ 670 NJ
preplace netloc algo_b_conv_1_L1_EVENT 1 13 1 5290
preplace netloc rst_processing_system7_0_50M_peripheral_aresetn 1 0 18 -330 1290 100 2260 650 1930 1020 1610 NJ 1520 NJ 2430 NJ 2090 2770 2090 3180 2040 3590 2020 NJ 2020 N 2020 4900 1940 5360 1560 6100 1850 6520 1860 6910 2090 7290
preplace netloc miso_n_1 1 0 18 NJ 2640 NJ 2640 NJ 2640 NJ 2480 NJ 2480 NJ 2480 NJ 2480 NJ 2480 NJ 2480 NJ 2480 NJ 2480 NJ 2480 NJ 2480 NJ 2480 NJ 2480 NJ 2480 NJ 2480 NJ
preplace netloc axis_broadcaster_1r4_M00_AXIS 1 4 2 NJ 1970 1740
preplace netloc axi_data_provider_0_gtu_sig 1 3 11 990 2050 NJ 2050 NJ 1780 NJ 1770 NJ 1770 NJ 1770 NJ 1770 NJ 1770 NJ 1770 NJ 1770 NJ
preplace netloc axi_artix_conf_v1_0_0_artx_initb_io 1 18 1 NJ
preplace netloc axis_dwidth_converter_7_M_AXIS 1 9 1 NJ
preplace netloc processing_system7_0_axi_periph1_M00_AXI 1 10 6 NJ 1150 NJ 1150 NJ 1150 NJ 1310 NJ 1110 NJ
preplace netloc dma_RAW_S_AXIS 1 15 1 6530
preplace netloc hv_hk_v1_0_0_cs_exp_n 1 18 1 NJ
preplace netloc axi_dma_L2_M_AXI_S2MM 1 16 1 6890
preplace netloc axis_broadcaster_1r3_M00_AXIS 1 4 2 NJ 1650 NJ
preplace netloc rst_processing_system7_0_200M_peripheral_aresetn 1 1 16 120 1430 NJ 1340 NJ 1340 NJ 1250 NJ 570 NJ 590 2770 440 3160 30 3600 930 4110 1020 NJ 1020 NJ 1020 NJ 1370 6110 1310 NJ 1400 6910
preplace netloc axi_dma_raw_M_AXI_S2MM 1 16 1 6940
preplace netloc axis_dwidth_converter_1_M_AXIS 1 17 1 7310
preplace netloc clk_wiz_0_clk_out1 1 2 1 640
preplace netloc hv_hk_v1_0_0_cs_exp_p 1 18 1 NJ
preplace netloc axis_dwidth_converter_L1_tst_M_AXIS 1 9 1 3560
preplace netloc processing_system7_0_M_AXI_GP0 1 9 10 3650 980 NJ 990 NJ 620 NJ 620 NJ 620 NJ 620 NJ 620 NJ 620 NJ 620 7740
preplace netloc axis_clock_converter_3_M_AXIS 1 5 1 1750
preplace netloc axis_broadcaster_1r3_M01_AXIS 1 4 1 1350
preplace netloc axis_broadcaster_1r1_M01_AXIS 1 4 1 1310
preplace netloc hv_hk_v1_0_0_sck_n 1 18 1 NJ
preplace netloc processing_system7_0_M_AXI_GP1 1 1 18 140 340 NJ 340 NJ 340 NJ 340 NJ 350 NJ 350 NJ 350 NJ 440 NJ 440 NJ 440 NJ 440 NJ 550 NJ 550 NJ 550 NJ 550 NJ 550 NJ 550 7760
preplace netloc axi_data_provider_0_m_axis_art2l 1 3 1 970
preplace netloc xlconstant_0_dout 1 11 2 4520 700 NJ
preplace netloc axis_data_fifo_sa_05_M_AXIS 1 6 2 NJ 1640 2700
preplace netloc axis_data_fifo_sa_02_M_AXIS 1 6 2 N 1830 NJ
preplace netloc axis_broadcaster_1r11_M01_AXIS 1 7 2 2670 210 NJ
preplace netloc axis_broadcaster_1r13_M00_AXIS 1 7 1 2730
preplace netloc hv_hk_v1_0_0_sck_p 1 18 1 NJ
preplace netloc ARESETN_1 1 1 16 50 1070 NJ 1070 NJ 1070 NJ 1070 NJ 1060 NJ 1160 NJ 1160 NJ 1160 NJ 1420 NJ 1420 NJ 1420 NJ 1420 NJ 1420 NJ 1050 NJ 1050 NJ
preplace netloc algo_b_conv_0_L1_EVENT 1 10 4 4120 1000 NJ 1000 N 1000 5340
preplace netloc artx_done_1 1 0 18 NJ 530 NJ 530 NJ 530 NJ 530 NJ 530 NJ 410 NJ 410 NJ 410 NJ 430 NJ 430 NJ 430 NJ 430 NJ 540 NJ 540 NJ 540 NJ 540 NJ 540 NJ
preplace netloc axis_broadcaster_1r_M00_AXIS 1 9 5 3620 1630 NJ 1630 NJ 1630 NJ 1630 NJ
preplace netloc axis_broadcaster_1r6_M00_AXIS 1 4 2 NJ 2120 1720
preplace netloc spaciroc3_sc_0_sr_ck_pc 1 18 1 NJ
preplace netloc clk_wiz_2_clk_out1 1 2 1 620
preplace netloc inst_interconnect_100MHz_M01_AXI 1 2 12 NJ 1440 NJ 1440 NJ 1440 NJ 1750 NJ 1740 NJ 1740 NJ 1740 NJ 1740 NJ 1740 NJ 1740 NJ 1740 5280
preplace netloc axis_combiner_1_M_AXIS 1 8 5 NJ 1030 NJ 940 NJ 970 NJ 720 NJ
preplace netloc axi_interconnect_0_M00_AXI 1 17 1 7260
preplace netloc miso_p_1 1 0 18 NJ 2660 NJ 2660 NJ 2660 NJ 2460 NJ 2460 NJ 2460 NJ 2460 NJ 2460 NJ 2460 NJ 2460 NJ 2460 NJ 2460 NJ 2460 NJ 2460 NJ 2460 NJ 2460 NJ 2460 NJ
levelinfo -pg 1 -360 -120 300 810 1170 1600 2090 2520 2980 3400 3860 4350 4750 5100 5930 6340 6720 7100 7520 7790 -top -210 -bot 3080
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


