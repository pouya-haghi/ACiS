`timescale 1ns / 1ps

`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

module registered_add #(parameter bitwidth=20)(
    input  logic clk,
    input  logic rst,
    input  logic [bitwidth-1:0] a,
    input  logic [bitwidth-1:0] b,
    output logic [bitwidth-1:0] out
    );
    
    logic [bitwidth-1:0] t_out;
    
    assign t_out = a+b;
    
    always @(posedge clk) begin
        if (rst) begin
            out = '0;
        end else begin
            out = t_out;
        end
    end
endmodule
    