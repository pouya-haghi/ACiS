`timescale 1ns / 1ps

`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

module test_vectorized_PE;
    reg [phit_size-1:0] i1_PE_typeC;
    reg [phit_size-1:0] i2_PE_typeC;    
    reg [SIMD_degree-1:0] i_tvalid1_PE_typeC;
    reg [SIMD_degree-1:0] i_tvalid2_PE_typeC;  
    reg clk;
    reg rst;
    reg [2:0] op;
    wire [phit_size-1:0] o1_PE_typeC;
    wire [phit_size-1:0] o2_PE_typeC;
    wire [SIMD_degree-1:0] o1_tvalid1_PE_typeC;
    wire [SIMD_degree-1:0] o2_tvalid1_PE_typeC;
    
    vectorized_PE vectorized_PE_inst0 (
        .i1_PE_typeC(i1_PE_typeC),
        .i2_PE_typeC(i2_PE_typeC),
        .i_tvalid1_PE_typeC(i_tvalid1_PE_typeC),
        .i_tvalid2_PE_typeC(i_tvalid2_PE_typeC),
        .clk(clk),
        .rst(rst),
        .op(op),
        .o1_PE_typeC(o1_PE_typeC),
        .o2_PE_typeC(o2_PE_typeC),
        .o1_tvalid1_PE_typeC(o1_tvalid1_PE_typeC),
        .o2_tvalid1_PE_typeC(o2_tvalid1_PE_typeC)            
        );
        
    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end

    initial begin
        rst = 1;
        #20
        rst = 0;
        
        
        $finish;
    end
endmodule
