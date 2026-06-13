set trace_signals(kernel_group) {
  DPUCZDX8G_1 { \
    S_AXI_CONTROL*ARADDR \
    S_AXI_CONTROL*RDATA \
    S_AXI_CONTROL*RVALID \
    S_AXI_CONTROL*RREADY \
    S_AXI_CONTROL*AWADDR \
    S_AXI_CONTROL*WDATA \
    S_AXI_CONTROL*WVALID \
    S_AXI_CONTROL*WREADY \
    M_AXI_GP0*ARADDR \
    M_AXI_GP0*RDATA \
    M_AXI_GP0*RVALID \
    M_AXI_GP0*RREADY \
    M_AXI_GP0*AWADDR \
    M_AXI_GP0*WDATA \
    M_AXI_GP0*WVALID \
    M_AXI_GP0*WREADY \
    M_AXI_HP0*ARADDR \
    M_AXI_HP0*RDATA \
    M_AXI_HP0*RVALID \
    M_AXI_HP0*RREADY \
    M_AXI_HP0*AWADDR \
    M_AXI_HP0*WDATA \
    M_AXI_HP0*WVALID \
    M_AXI_HP0*WREADY \
    M_AXI_HP2*ARADDR \
    M_AXI_HP2*RDATA \
    M_AXI_HP2*RVALID \
    M_AXI_HP2*RREADY \
    M_AXI_HP2*AWADDR \
    M_AXI_HP2*WDATA \
    M_AXI_HP2*WVALID \
    M_AXI_HP2*WREADY \
  } {}

  digitcaps_accel_1 { \
    s_axi_control*ARADDR \
    s_axi_control*RDATA \
    s_axi_control*RVALID \
    s_axi_control*RREADY \
    s_axi_control*AWADDR \
    s_axi_control*WDATA \
    s_axi_control*WVALID \
    s_axi_control*WREADY \
    m_axi_gmem0*ARADDR \
    m_axi_gmem0*RDATA \
    m_axi_gmem0*RVALID \
    m_axi_gmem0*RREADY \
    m_axi_gmem0*AWADDR \
    m_axi_gmem0*WDATA \
    m_axi_gmem0*WVALID \
    m_axi_gmem0*WREADY \
    m_axi_gmem1*ARADDR \
    m_axi_gmem1*RDATA \
    m_axi_gmem1*RVALID \
    m_axi_gmem1*RREADY \
    m_axi_gmem1*AWADDR \
    m_axi_gmem1*WDATA \
    m_axi_gmem1*WVALID \
    m_axi_gmem1*WREADY \
    m_axi_gmem2*ARADDR \
    m_axi_gmem2*RDATA \
    m_axi_gmem2*RVALID \
    m_axi_gmem2*RREADY \
    m_axi_gmem2*AWADDR \
    m_axi_gmem2*WDATA \
    m_axi_gmem2*WVALID \
    m_axi_gmem2*WREADY \
  } {}

}

set trace_signals(kernel) {
  ap_start ap_ready ap_done
}

set trace_signals(adapter) {
  *axis_*tdata *axis_*tvalid *axis_*tready S*WADDR S*WDATA S*ARADDR S*RDATA
}

set trace_signals(datamover) {
  stream_t* reg_bus_awaddr reg_bus_wdata
}
