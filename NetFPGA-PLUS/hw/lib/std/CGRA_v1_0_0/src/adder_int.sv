`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2021 08:17:17 PM
// Design Name: 
// Module Name: adder_int
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


module adder_int_reg #(parameter width=64)(
//putting a register at the end
    input logic [width-1:0] inp1,
    input logic [width-1:0] inp2,
    output logic [width-1:0] out1

    );
    
    logic [width-1:0] t_adder_out;
    assign t_adder_out = inp1+inp2;
    reg_r #(width) regr_inst0(.d(t_adder_out), .clk(clk), .rst(rst), .q(out1));
    
endmodule
