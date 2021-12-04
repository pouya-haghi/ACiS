`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2021 08:09:42 PM
// Design Name: 
// Module Name: Reduction_unit_int
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

module Reduction_unit_float(
    input logic [phit_size-1:0] inp1,
    input logic clk,
    input logic rst,
    output logic [dwidth_double-1:0] out1
    );
    
    logic [dwidth_double-1:0] t_out_adder0, t_out_adder1, t_out_adder2, t_out_adder3, t_out_adder4, t_out_adder5;
    logic t_valid0, t_valid1, t_valid2, t_valid3, t_valid4, t_valid5, t_valid6; 
  
  floating_point_0 fp_add_inst0 ( //This is an adder
  .aclk(clk),                                        // input wire aclk
  .s_axis_a_tvalid(1'b1),                  // input wire s_axis_a_tvalid
  .s_axis_a_tdata(inp1[dwidth_double-1:0]),                    // input wire [63 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1),                  // input wire s_axis_b_tvalid
  .s_axis_b_tdata(inp1[2*dwidth_double-1:dwidth_double]),                    // input wire [63 : 0] s_axis_b_tdata
  .s_axis_operation_tvalid(1'b1),  // input wire s_axis_operation_tvalid
  .s_axis_operation_tdata(8'b0),    // add operation input wire [7 : 0] s_axis_operation_tdata
  .m_axis_result_tvalid(t_valid0),        // output wire m_axis_result_tvalid
  .m_axis_result_tdata(t_out_adder0)          // output wire [63 : 0] m_axis_result_tdata
    );
    
  floating_point_0 fp_add_inst1 ( //This is an adder
  .aclk(clk),                                        // input wire aclk
  .s_axis_a_tvalid(1'b1),                  // input wire s_axis_a_tvalid
  .s_axis_a_tdata(inp1[3*dwidth_double-1:2*dwidth_double]),                    // input wire [63 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1),                  // input wire s_axis_b_tvalid
  .s_axis_b_tdata(inp1[4*dwidth_double-1:3*dwidth_double]),                    // input wire [63 : 0] s_axis_b_tdata
  .s_axis_operation_tvalid(1'b1),  // input wire s_axis_operation_tvalid
  .s_axis_operation_tdata(8'b0),    // add operation input wire [7 : 0] s_axis_operation_tdata
  .m_axis_result_tvalid(t_valid1),        // output wire m_axis_result_tvalid
  .m_axis_result_tdata(t_out_adder1)          // output wire [63 : 0] m_axis_result_tdata
    );   
    
  floating_point_0 fp_add_inst2 ( //This is an adder
  .aclk(clk),                                        // input wire aclk
  .s_axis_a_tvalid(1'b1),                  // input wire s_axis_a_tvalid
  .s_axis_a_tdata(inp1[5*dwidth_double-1:4*dwidth_double]),                    // input wire [63 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1),                  // input wire s_axis_b_tvalid
  .s_axis_b_tdata(inp1[6*dwidth_double-1:5*dwidth_double]),                    // input wire [63 : 0] s_axis_b_tdata
  .s_axis_operation_tvalid(1'b1),  // input wire s_axis_operation_tvalid
  .s_axis_operation_tdata(8'b0),    // add operation input wire [7 : 0] s_axis_operation_tdata
  .m_axis_result_tvalid(t_valid2),        // output wire m_axis_result_tvalid
  .m_axis_result_tdata(t_out_adder2)          // output wire [63 : 0] m_axis_result_tdata
    );   
    
   floating_point_0 fp_add_inst3 ( //This is an adder
  .aclk(clk),                                        // input wire aclk
  .s_axis_a_tvalid(1'b1),                  // input wire s_axis_a_tvalid
  .s_axis_a_tdata(inp1[7*dwidth_double-1:6*dwidth_double]),                    // input wire [63 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1),                  // input wire s_axis_b_tvalid
  .s_axis_b_tdata(inp1[8*dwidth_double-1:7*dwidth_double]),                    // input wire [63 : 0] s_axis_b_tdata
  .s_axis_operation_tvalid(1'b1),  // input wire s_axis_operation_tvalid
  .s_axis_operation_tdata(8'b0),    // add operation input wire [7 : 0] s_axis_operation_tdata
  .m_axis_result_tvalid(t_valid3),        // output wire m_axis_result_tvalid
  .m_axis_result_tdata(t_out_adder3)          // output wire [63 : 0] m_axis_result_tdata
    );  
    
    
  floating_point_0 fp_add_inst4 ( //This is an adder
  .aclk(clk),                                        // input wire aclk
  .s_axis_a_tvalid(1'b1),                  // input wire s_axis_a_tvalid
  .s_axis_a_tdata(t_out_adder0),                    // input wire [63 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1),                  // input wire s_axis_b_tvalid
  .s_axis_b_tdata(t_out_adder1),                    // input wire [63 : 0] s_axis_b_tdata
  .s_axis_operation_tvalid(1'b1),  // input wire s_axis_operation_tvalid
  .s_axis_operation_tdata(8'b0),    // add operation input wire [7 : 0] s_axis_operation_tdata
  .m_axis_result_tvalid(t_valid4),        // output wire m_axis_result_tvalid
  .m_axis_result_tdata(t_out_adder4)          // output wire [63 : 0] m_axis_result_tdata
    );  
    
  floating_point_0 fp_add_inst5 ( //This is an adder
  .aclk(clk),                                        // input wire aclk
  .s_axis_a_tvalid(1'b1),                  // input wire s_axis_a_tvalid
  .s_axis_a_tdata(t_out_adder2),                    // input wire [63 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1),                  // input wire s_axis_b_tvalid
  .s_axis_b_tdata(t_out_adder3),                    // input wire [63 : 0] s_axis_b_tdata
  .s_axis_operation_tvalid(1'b1),  // input wire s_axis_operation_tvalid
  .s_axis_operation_tdata(8'b0),    // add operation input wire [7 : 0] s_axis_operation_tdata
  .m_axis_result_tvalid(t_valid5),        // output wire m_axis_result_tvalid
  .m_axis_result_tdata(t_out_adder5)          // output wire [63 : 0] m_axis_result_tdata
    );  
    
    
  floating_point_0 fp_add_inst6 ( //This is an adder
  .aclk(clk),                                        // input wire aclk
  .s_axis_a_tvalid(1'b1),                  // input wire s_axis_a_tvalid
  .s_axis_a_tdata(t_out_adder4),                    // input wire [63 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1),                  // input wire s_axis_b_tvalid
  .s_axis_b_tdata(t_out_adder5),                    // input wire [63 : 0] s_axis_b_tdata
  .s_axis_operation_tvalid(1'b1),  // input wire s_axis_operation_tvalid
  .s_axis_operation_tdata(8'b0),    // add operation input wire [7 : 0] s_axis_operation_tdata
  .m_axis_result_tvalid(t_valid6),        // output wire m_axis_result_tvalid
  .m_axis_result_tdata(out1)          // output wire [63 : 0] m_axis_result_tdata
    );  
    
    
endmodule
