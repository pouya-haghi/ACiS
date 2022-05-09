`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2021 05:59:16 PM
// Design Name: 
// Module Name: floating_accumulator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module floating_accumulator(
    input logic clk,
    input logic a_tvalid,
    input logic [63:0] a,
    input logic a_tlast,
    output logic out1_tvalid,
    output logic [63:0] out1,
    output logic out1_tlast

    );
    
floating_point_accumulator fp_acc_inst0 (
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(a_tvalid),            // input wire s_axis_a_tvalid
  .s_axis_a_tdata(a),              // input wire [63 : 0] s_axis_a_tdata
  .s_axis_a_tlast(a_tlast),              // input wire s_axis_a_tlast
  .m_axis_result_tvalid(out1_tvalid),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(out1),    // output wire [63 : 0] m_axis_result_tdata
  .m_axis_result_tlast(out1_tlast)    // output wire m_axis_result_tlast
);

endmodule
