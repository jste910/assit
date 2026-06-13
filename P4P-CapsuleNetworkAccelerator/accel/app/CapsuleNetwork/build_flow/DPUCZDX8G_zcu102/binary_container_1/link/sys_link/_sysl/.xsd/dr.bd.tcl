

#---------------------------
# Constant blocks
#---------------------------

#---------------------------
# Platform Parameters for xilinx_zcu102_base_202210_1
#---------------------------
set axi_interconnect_lpd [get_bd_cell /axi_interconnect_lpd]
    
set_property -dict [ list \
  CONFIG.NUM_SI 1 \
  CONFIG.NUM_MI 1 \
  ] $axi_interconnect_lpd
set interconnect_axifull [get_bd_cell /interconnect_axifull]
    
set_property -dict [ list \
  CONFIG.NUM_SI 1 \
  CONFIG.NUM_MI 1 \
  ] $interconnect_axifull
set interconnect_axilite [get_bd_cell /interconnect_axilite]
    
set_property -dict [ list \
  CONFIG.NUM_SI 1 \
  CONFIG.NUM_MI 3 \
  CONFIG.M01_HAS_REGSLICE 1 \
  CONFIG.M02_HAS_REGSLICE 1 \
  ] $interconnect_axilite
set ps_e [get_bd_cell /ps_e]
    
set_property -dict [ list \
  CONFIG.PSU__USE__S_AXI_GP0 1 \
  CONFIG.PSU__USE__S_AXI_GP2 1 \
  CONFIG.PSU__USE__S_AXI_GP3 1 \
  ] $ps_e

#---------------------------
# Instantiating DPUCZDX8G_1
#---------------------------
set DPUCZDX8G_1 [create_bd_cell -type ip -vlnv xilinx.com:RTLKernel:DPUCZDX8G:1.0 DPUCZDX8G_1]
  

#---------------------------
# Instantiating digitcaps_accel_1
#---------------------------
set digitcaps_accel_1 [create_bd_cell -type ip -vlnv xilinx.com:hls:digitcaps_accel:1.0 digitcaps_accel_1]
  

#---------------------------
# Instantiating axi_ic_ps_e_S_AXI_HPC0_FPD
#---------------------------
set axi_ic_ps_e_S_AXI_HPC0_FPD [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_ps_e_S_AXI_HPC0_FPD]
  
set_property -dict [ list  \
  CONFIG.NUM_MI {1} \
  CONFIG.NUM_SI {1} \
  CONFIG.M00_HAS_REGSLICE {0} \
  CONFIG.S00_HAS_REGSLICE {0}  ] $axi_ic_ps_e_S_AXI_HPC0_FPD

#---------------------------
# Instantiating axi_ic_ps_e_S_AXI_HP0_FPD
#---------------------------
set axi_ic_ps_e_S_AXI_HP0_FPD [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_ps_e_S_AXI_HP0_FPD]
  
set_property -dict [ list  \
  CONFIG.NUM_MI {1} \
  CONFIG.NUM_SI {3} \
  CONFIG.STRATEGY {2} \
  CONFIG.M00_HAS_REGSLICE {1} \
  CONFIG.M00_HAS_DATA_FIFO {2} \
  CONFIG.S00_HAS_REGSLICE {1} \
  CONFIG.S00_HAS_DATA_FIFO {2} \
  CONFIG.S01_HAS_REGSLICE {1} \
  CONFIG.S01_HAS_DATA_FIFO {2} \
  CONFIG.S02_HAS_REGSLICE {1} \
  CONFIG.S02_HAS_DATA_FIFO {2}  ] $axi_ic_ps_e_S_AXI_HP0_FPD

#---------------------------
# Instantiating axi_ic_ps_e_S_AXI_HP1_FPD
#---------------------------
set axi_ic_ps_e_S_AXI_HP1_FPD [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ic_ps_e_S_AXI_HP1_FPD]
  
set_property -dict [ list  \
  CONFIG.NUM_MI {1} \
  CONFIG.NUM_SI {2} \
  CONFIG.STRATEGY {2} \
  CONFIG.M00_HAS_REGSLICE {1} \
  CONFIG.M00_HAS_DATA_FIFO {2} \
  CONFIG.S00_HAS_REGSLICE {1} \
  CONFIG.S00_HAS_DATA_FIFO {2} \
  CONFIG.S01_HAS_REGSLICE {1} \
  CONFIG.S01_HAS_DATA_FIFO {2}  ] $axi_ic_ps_e_S_AXI_HP1_FPD

#---------------------------
# Instantiating axi_intc_0_intr_1_interrupt_concat
#---------------------------
set axi_intc_0_intr_1_interrupt_concat [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 axi_intc_0_intr_1_interrupt_concat]
  
set_property -dict [ list  \
  CONFIG.NUM_PORTS {32}  ] $axi_intc_0_intr_1_interrupt_concat

#---------------------------
# Instantiating irq_const_tieoff
#---------------------------
set irq_const_tieoff [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 irq_const_tieoff]
  
set_property -dict [ list  \
  CONFIG.CONST_WIDTH {1} \
  CONFIG.CONST_VAL {0}  ] $irq_const_tieoff

#---------------------------
# Instantiating axcache_0xe
#---------------------------
set axcache_0xe [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 axcache_0xe]
  
set_property -dict [ list  \
  CONFIG.CONST_WIDTH {4} \
  CONFIG.CONST_VAL {14}  ] $axcache_0xe

#---------------------------
# Instantiating axprot_0x2
#---------------------------
set axprot_0x2 [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 axprot_0x2]
  
set_property -dict [ list  \
  CONFIG.CONST_WIDTH {3} \
  CONFIG.CONST_VAL {2}  ] $axprot_0x2
#---------------------------
# Clock/Reset Annotation Registration
#---------------------------

::sdsoc::mark_pfm_border


#---------------------------
# Connectivity Phase 1
#---------------------------
connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /axi_ic_ps_e_S_AXI_HPC0_FPD/M00_AXI] \
  [get_bd_intf_pins -auto_enable /ps_e/S_AXI_HPC0_FPD] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /axi_ic_ps_e_S_AXI_HP0_FPD/M00_AXI] \
  [get_bd_intf_pins -auto_enable /ps_e/S_AXI_HP0_FPD] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /axi_ic_ps_e_S_AXI_HP1_FPD/M00_AXI] \
  [get_bd_intf_pins -auto_enable /ps_e/S_AXI_HP1_FPD] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /interconnect_axilite/M01_AXI] \
  [get_bd_intf_pins -auto_enable /DPUCZDX8G_1/S_AXI_CONTROL] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /DPUCZDX8G_1/M_AXI_GP0] \
  [get_bd_intf_pins -auto_enable /axi_ic_ps_e_S_AXI_HPC0_FPD/S00_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /DPUCZDX8G_1/M_AXI_HP0] \
  [get_bd_intf_pins -auto_enable /axi_ic_ps_e_S_AXI_HP0_FPD/S00_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /DPUCZDX8G_1/M_AXI_HP2] \
  [get_bd_intf_pins -auto_enable /axi_ic_ps_e_S_AXI_HP1_FPD/S00_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /interconnect_axilite/M02_AXI] \
  [get_bd_intf_pins -auto_enable /digitcaps_accel_1/s_axi_control] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /digitcaps_accel_1/m_axi_gmem0] \
  [get_bd_intf_pins -auto_enable /axi_ic_ps_e_S_AXI_HP0_FPD/S01_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /digitcaps_accel_1/m_axi_gmem1] \
  [get_bd_intf_pins -auto_enable /axi_ic_ps_e_S_AXI_HP0_FPD/S02_AXI] \

connect_bd_intf_net \
  [get_bd_intf_pins -auto_enable /digitcaps_accel_1/m_axi_gmem2] \
  [get_bd_intf_pins -auto_enable /axi_ic_ps_e_S_AXI_HP1_FPD/S01_AXI] \

connect_bd_net  \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/dout] \
  [get_bd_pins -auto_enable /axi_intc_0/intr] \

connect_bd_net  \
  [get_bd_pins -auto_enable /DPUCZDX8G_1/interrupt] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In1] \

connect_bd_net  \
  [get_bd_pins -auto_enable /digitcaps_accel_1/interrupt] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In0] \

connect_bd_net  \
  [get_bd_pins -auto_enable /irq_const_tieoff/dout] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In2] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In3] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In4] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In5] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In6] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In7] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In8] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In9] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In10] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In11] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In12] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In13] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In14] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In15] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In16] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In17] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In18] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In19] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In20] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In21] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In22] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In23] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In24] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In25] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In26] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In27] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In28] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In29] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In30] \
  [get_bd_pins -auto_enable /axi_intc_0_intr_1_interrupt_concat/In31] \

connect_bd_net  \
  [get_bd_pins -auto_enable /axcache_0xe/dout] \
  [get_bd_pins -auto_enable /axi_ic_ps_e_S_AXI_HPC0_FPD/S00_AXI_arcache] \
  [get_bd_pins -auto_enable /axi_ic_ps_e_S_AXI_HPC0_FPD/S00_AXI_awcache] \

connect_bd_net  \
  [get_bd_pins -auto_enable /axprot_0x2/dout] \
  [get_bd_pins -auto_enable /axi_ic_ps_e_S_AXI_HPC0_FPD/S00_AXI_arprot] \
  [get_bd_pins -auto_enable /axi_ic_ps_e_S_AXI_HPC0_FPD/S00_AXI_awprot] \


#---------------------------
# Clock/Reset Annotation
#---------------------------

set_property HDL_ATTRIBUTE.CLOCK_AUTOMATION true [get_bd_cells ps_e]
set_property HDL_ATTRIBUTE.saxihpc0_fpd_aclk.FREQ_HZ {300000000} [get_bd_cells ps_e]
set_property HDL_ATTRIBUTE.saxihpc0_fpd_aclk.FREQ_HZ_TOLERANCE {15000000} [get_bd_cells ps_e]
set_property HDL_ATTRIBUTE.CLOCK_AUTOMATION true [get_bd_cells ps_e]
set_property HDL_ATTRIBUTE.saxihp0_fpd_aclk.FREQ_HZ {300000000} [get_bd_cells ps_e]
set_property HDL_ATTRIBUTE.saxihp0_fpd_aclk.FREQ_HZ_TOLERANCE {15000000} [get_bd_cells ps_e]
set_property HDL_ATTRIBUTE.CLOCK_AUTOMATION true [get_bd_cells ps_e]
set_property HDL_ATTRIBUTE.saxihp1_fpd_aclk.FREQ_HZ {300000000} [get_bd_cells ps_e]
set_property HDL_ATTRIBUTE.saxihp1_fpd_aclk.FREQ_HZ_TOLERANCE {15000000} [get_bd_cells ps_e]

set_property HDL_ATTRIBUTE.CLOCK_AUTOMATION true $DPUCZDX8G_1
set_property HDL_ATTRIBUTE.aclk.FREQ_HZ {300000000} $DPUCZDX8G_1
set_property HDL_ATTRIBUTE.aclk.FREQ_HZ_TOLERANCE {15000000} $DPUCZDX8G_1
set_property HDL_ATTRIBUTE.ap_clk_2.FREQ_HZ {600000000} $DPUCZDX8G_1
set_property HDL_ATTRIBUTE.ap_clk_2.FREQ_HZ_TOLERANCE {30000000} $DPUCZDX8G_1

set_property HDL_ATTRIBUTE.CLOCK_AUTOMATION true $digitcaps_accel_1
set_property HDL_ATTRIBUTE.ap_clk.FREQ_HZ {300000000} $digitcaps_accel_1
set_property HDL_ATTRIBUTE.ap_clk.FREQ_HZ_TOLERANCE {15000000} $digitcaps_accel_1


#---------------------------
# Invoke clock automation
#---------------------------

::sdsoc::run_clock_reset_automation
::sdsoc::erase_clock_properties


#---------------------------
# Connectivity Phase 2
#---------------------------

#---------------------------
# Create Stream Map file
#---------------------------
set stream_subsystems [get_bd_cells * -hierarchical -quiet -filter {VLNV =~ "*:*:sdx_stream_subsystem:*"}]
if {[string length $stream_subsystems] > 0} {    
  set xmlFile $vpl_output_dir/qdma_stream_map.xml
  set fp [open ${xmlFile} w]
  puts $fp "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
  puts $fp "<xd:streamMap xmlns:xd=\"http://www.xilinx.com/xd\">"
  foreach streamSS [get_bd_cells * -hierarchical -quiet -filter {VLNV =~ "*:*:sdx_stream_subsystem:*"}] {
    set ssInstance [string trimleft $streamSS /]
    set ssRegion [get_property CONFIG.SLR_ASSIGNMENTS $streamSS]
    foreach ssIntf [get_bd_intf_pins $streamSS/* -quiet -filter {NAME=~"S??_AXIS"}] {
      set pinName [get_property NAME $ssIntf]
      set routeId [sdx_stream_subsystem::get_routeid $ssIntf]
      set flowId [sdx_stream_subsystem::get_flowid $ssIntf]
      puts $fp "  <xd:streamRoute xd:instanceRef=\"$ssInstance\" xd:portRef=\"$pinName\" xd:route=\"$routeId\" xd:flow=\"$flowId\" xd:region=\"$ssRegion\">"
      foreach connection [find_bd_objs -relation connected_to $ssIntf -thru_hier] {
        set connectedRegion [get_property CONFIG.SLR_ASSIGNMENTS [bd::utils::get_parent $connection]]
        set connectedPort [bd::utils::get_short_name $connection]
        set connectedInst [string trimleft [bd::utils::get_parent $connection] /]
        puts $fp "    <xd:connection xd:instanceRef=\"$connectedInst\" xd:portRef=\"$connectedPort\" xd:region=\"$connectedRegion\"/>"
      }
      puts $fp "  </xd:streamRoute>"
    }
    foreach ssIntf [get_bd_intf_pins $streamSS/* -quiet -filter {NAME=~"M??_AXIS"}] {
      set pinName [get_property NAME $ssIntf]
      set routeId [sdx_stream_subsystem::get_routeid $ssIntf]
      set flowId [sdx_stream_subsystem::get_flowid $ssIntf]
      puts $fp "  <xd:streamRoute xd:instanceRef=\"$ssInstance\" xd:portRef=\"$pinName\" xd:route=\"$routeId\" xd:flow=\"$flowId\" xd:region=\"$ssRegion\">"
      foreach connection [find_bd_objs -relation connected_to $ssIntf -thru_hier] {
        set connectedRegion [get_property CONFIG.SLR_ASSIGNMENTS [bd::utils::get_parent $connection]]
        set connectedPort [bd::utils::get_short_name $connection]
        set connectedInst [string trimleft [bd::utils::get_parent $connection] /]
        puts $fp "    <xd:connection xd:instanceRef=\"$connectedInst\" xd:portRef=\"$connectedPort\" xd:region=\"$connectedRegion\"/>"
      }
      puts $fp "  </xd:streamRoute>"
    }
  }
  puts $fp "</xd:streamMap>"
  close $fp
}


