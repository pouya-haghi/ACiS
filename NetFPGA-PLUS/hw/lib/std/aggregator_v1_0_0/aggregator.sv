

  //PH: adding floating_point_adder
  nf_floating_point_adder inst_fp_adder (
  .aclk(aclk),                                        // input wire aclk
  .aresetn(aresetn),                                  // input wire aresetn
  .s_axis_a_tvalid(s_axis_a_tvalid),                  // input wire s_axis_a_tvalid
  .s_axis_a_tready(s_axis_a_tready),                  // output wire s_axis_a_tready
  .s_axis_a_tdata(s_axis_a_tdata),                    // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(s_axis_b_tvalid),                  // input wire s_axis_b_tvalid
  .s_axis_b_tready(s_axis_b_tready),                  // output wire s_axis_b_tready
  .s_axis_b_tdata(s_axis_b_tdata),                    // input wire [31 : 0] s_axis_b_tdata
  .s_axis_operation_tvalid(s_axis_operation_tvalid),  // input wire s_axis_operation_tvalid
  .s_axis_operation_tready(s_axis_operation_tready),  // output wire s_axis_operation_tready
  .s_axis_operation_tdata(s_axis_operation_tdata),    // input wire [7 : 0] s_axis_operation_tdata
  .m_axis_result_tvalid(m_axis_result_tvalid),        // output wire m_axis_result_tvalid
  .m_axis_result_tready(m_axis_result_tready),        // input wire m_axis_result_tready
  .m_axis_result_tdata(m_axis_result_tdata)          // output wire [31 : 0] m_axis_result_tdata
);