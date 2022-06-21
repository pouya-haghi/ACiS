`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2021 12:41:28 PM
// Design Name: 
// Module Name: regFile
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

module regFile(
    input logic [phit_size-1:0] d_in,
    input logic clk,
    input logic [dwidth_RFadd-1:0] rd_addr1,
    input logic [dwidth_RFadd-1:0] rd_addr2,
    input logic [dwidth_RFadd-1:0] wr_addr,
    input logic wen,
    output logic [phit_size-1:0] d_out1,
    output logic [phit_size-1:0] d_out2
    );
    
    logic [phit_size-1:0] mem [depth_RF-1:0];
    integer i;
    
    // This is for simulation
    initial begin
        for (i=0;i<depth_RF;i=i+1)
            mem[i] <= 0;//i*10;
    end
    // End of simulation
    
    always_ff @(posedge clk) begin
        if(wen) 
            mem[wr_addr] <= d_in;
    end
    
    assign d_out1 = mem[rd_addr1];
    assign d_out2 = mem[rd_addr2];
    
endmodule
