//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
module PE_typeC #(
    parameter latency=12
) (
    input logic aclk,
    input logic aresetn,
    input logic s_axis_a_tvalid,
    input logic [31:0] s_axis_a_tdata,
    input logic s_axis_b_tvalid,
    input logic [31:0] s_axis_b_tdata,
    input logic s_axis_c_tvalid,
    input logic [31:0] s_axis_c_tdata,
    input logic s_axis_operation_tvalid
    input logic [7:0] s_axis_operation_tdata,
    output logic m_axis_result_tvalid,
    output logic [31:0] m_axis_result_tdata
);
    

floating_point_MAC fp_MAC_inst0 (
  .aclk(aclk),                                        // input wire aclk
  .aresetn(aresetn),                                  // input wire aresetn
  .s_axis_a_tvalid(s_axis_a_tvalid),                  // input wire s_axis_a_tvalid
  .s_axis_a_tdata(s_axis_a_tdata),                    // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(s_axis_b_tvalid),                  // input wire s_axis_b_tvalid
  .s_axis_b_tdata(s_axis_b_tdata),                    // input wire [31 : 0] s_axis_b_tdata
  .s_axis_c_tvalid(s_axis_c_tvalid),                  // input wire s_axis_c_tvalid
  .s_axis_c_tdata(s_axis_c_tdata),                    // input wire [31 : 0] s_axis_c_tdata
  .s_axis_operation_tvalid(s_axis_operation_tvalid),  // input wire s_axis_operation_tvalid
  .s_axis_operation_tdata(s_axis_operation_tdata),    // input wire [7 : 0] s_axis_operation_tdata
  .m_axis_result_tvalid(m_axis_result_tvalid),        // output wire m_axis_result_tvalid
  .m_axis_result_tdata(m_axis_result_tdata)          // output wire [31 : 0] m_axis_result_tdata
);

endmodule