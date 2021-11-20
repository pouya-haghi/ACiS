`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2021 04:53:24 PM
// Design Name: 
// Module Name: PE_typeA
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

module PE_typeA(
    // integer processing
//    data_channel d_ch,
//    control_channel c_ch,
    input logic [dwidth_double-1:0] inp1,
    input logic [dwidth_double-1:0] inp2,
    output logic [dwidth_double-1:0] out1,
    input logic [1:0] op
    );
    
    always @(*) begin
    case(op)
    2'b00: out1 = inp1 + inp2;
    2'b01: out1 = inp1 - inp2;
    2'b10: out1 = inp1 * inp2;
//    2'b11: d_ch.out1 = d_ch.inp1 * d_ch.inp2;
    default: out1 = inp1 + inp2;
    endcase
    end
    
endmodule
