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

module Reduction_unit_int(
    input logic [phit_size-1:0] inp1,
    input clk,
    input rst,
    output logic [dwidth_double-1:0] out1
    );
    
    logic [dwidth_double-1:0] t_out_adder0, t_out_adder1, t_out_adder2, t_out_adder3, t_out_adder4, t_out_adder5;
    
    adder_int_reg #(dwidth_double) adder_inst0 (.inp1(inp1[dwidth_double-1:0]), 
    .inp2(inp1[2*dwidth_double-1:dwidth_double]), 
    .clk(clk),
    .rst(rst),
    .out1(t_out_adder0));
    
    adder_int_reg #(dwidth_double) adder_inst1 (.inp1(inp1[3*dwidth_double-1:2*dwidth_double]), 
    .inp2(inp1[4*dwidth_double-1:3*dwidth_double]), 
    .clk(clk),
    .rst(rst),
    .out1(t_out_adder1));
    
    
    adder_int_reg #(dwidth_double) adder_inst2 (.inp1(inp1[5*dwidth_double-1:4*dwidth_double]), 
    .inp2(inp1[6*dwidth_double-1:5*dwidth_double]), 
    .clk(clk),
    .rst(rst),
    .out1(t_out_adder2));
    
    
    adder_int_reg #(dwidth_double) adder_inst3 (.inp1(inp1[7*dwidth_double-1:6*dwidth_double]), 
    .inp2(inp1[8*dwidth_double-1:7*dwidth_double]),
    .clk(clk),
    .rst(rst),
    .out1(t_out_adder3));
    
    adder_int_reg #(dwidth_double) adder_inst4 (.inp1(t_out_adder0), 
    .inp2(t_out_adder1),
    .clk(clk),
    .rst(rst),
    .out1(t_out_adder4));
    
    adder_int_reg #(dwidth_double) adder_inst5 (.inp1(t_out_adder2), 
    .inp2(t_out_adder3),
    .clk(clk),
    .rst(rst),
    .out1(t_out_adder5));
    
    adder_int_reg #(dwidth_double) adder_inst6 (.inp1(t_out_adder4), 
    .inp2(t_out_adder5),
    .clk(clk),
    .rst(rst),
    .out1(out1));    
    
endmodule
