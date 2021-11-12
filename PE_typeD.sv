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

module PE_typeD(
// double-precision floating point processing
    data_channel d_ch,
    control_channel c_ch,
    input clk
    );
    
    logic [63:0] o_floating_point_0;
    logic [63:0] o_floating_point_1;
    logic t_valid0; // discard output valid signal
    logic t_valid1; // discard output valid signal
    
    floating_point_div fp_div_inst0 (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(1'b1),            // input wire s_axis_a_tvalid
      .s_axis_a_tdata(d_ch.inp1),              // input wire [63 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(1'b1),            // input wire s_axis_b_tvalid
      .s_axis_b_tdata(d_ch.inp2),              // input wire [63 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(t_valid0),  // output wire m_axis_result_tvalid
      .m_axis_result_tdata(o_floating_point_0)    // output wire [63 : 0] m_axis_result_tdata
    );

    floating_point_sqrt fp_sqrt_inst0 (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(1'b1),            // input wire s_axis_a_tvalid
      .s_axis_a_tdata(d_ch.inp1),              // input wire [63 : 0] s_axis_a_tdata
      .m_axis_result_tvalid(t_valid1),  // output wire m_axis_result_tvalid
      .m_axis_result_tdata(o_floating_point_1)    // output wire [63 : 0] m_axis_result_tdata
    );

    assign d_ch.out1 = (c_ch.op[0])? o_floating_point_1 : o_floating_point_0;
    
endmodule
