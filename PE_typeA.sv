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
//interface data_channel;
//logic [63:0] inp1, inp2, out1;
//endinterface

//interface control_channel;
//logic [1:0] op;
//endinterface
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module PE_typeA(
    // integer processing
    data_channel d_ch,
    control_channel c_ch
    );
    
    always @(*) begin
    case(c_ch.op)
    2'b00: d_ch.out1 = d_ch.inp1 + d_ch.inp2;
    2'b01: d_ch.out1 = d_ch.inp1 * d_ch.inp2;
    default: d_ch.out1 = d_ch.inp1 + d_ch.inp2;
    endcase
    end
    
endmodule
