`timescale 1ns / 1ps

module PE_typeC(
   input logic aclk,
   input logic aresetn,
   input logic s_axis_a_tvalid,
   input logic [31 : 0] s_axis_a_tdata,
   input logic s_axis_a_tlast,
   output logic m_axis_result_tvalid,
   output logic [31 : 0] m_axis_result_tdata,
   output logic m_axis_result_tlast
    );
    
floating_point_acc fp_acc_inst0 (
  .aclk(aclk),                                  // input wire aclk
  .aresetn(aresetn),                            // input wire aresetn
  .s_axis_a_tvalid(s_axis_a_tvalid),            // input wire s_axis_a_tvalid
  .s_axis_a_tdata(s_axis_a_tdata),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_a_tlast(s_axis_a_tlast),              // input wire s_axis_a_tlast
  .m_axis_result_tvalid(m_axis_result_tvalid),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(m_axis_result_tdata),    // output wire [31 : 0] m_axis_result_tdata
  .m_axis_result_tlast(m_axis_result_tlast)    // output wire m_axis_result_tlast
);
    
endmodule
