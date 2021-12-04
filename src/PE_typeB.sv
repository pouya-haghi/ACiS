`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2021 05:20:22 PM
// Design Name: 
// Module Name: PE_typeC
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
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module PE_typeB(
// double-precision floating point processing
//    data_channel d_ch,
//    control_channel c_ch,
    input logic [dwidth_double-1:0] inp1,
    output logic [dwidth_double-1:0] out1,
    input logic clk
    );
    
    logic t_valid; // discard output valid signal
    
floating_point_1 int2double_inst_0 (
// This ip converts integer (64 bits) to double
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(1'b1),            // input wire s_axis_a_tvalid
  .s_axis_a_tdata(inp1),              // input wire [63 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(t_valid),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(out1)    // output wire [63 : 0] m_axis_result_tdata
);
    
endmodule
