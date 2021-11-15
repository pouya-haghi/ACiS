`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2021 04:18:22 PM
// Design Name: 
// Module Name: data_path
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

module data_path(
//    data_channel d_ch,
//    control_channel c_ch,
    input logic [dwidth_double-1:0] inp1,
    input logic [dwidth_double-1:0] inp2,
    output logic [dwidth_double-1:0] out1,
    input logic [1:0] op,
    input logic clk
    );
    
//    data_channel d_ch0;
//    control_channel c_ch0;
    // TypeC: 
    wire [dwidth_double-1:0] temp1, temp2;
    PE_typeC (.inp1(inp1), .inp2(inp2), .clk(clk), .op(2'b00), .out1(temp1));
    PE_typeC (.inp1(temp1), .inp2(64'b0), .clk(clk), .op(2'b00), .out1(out1));
    
endmodule
