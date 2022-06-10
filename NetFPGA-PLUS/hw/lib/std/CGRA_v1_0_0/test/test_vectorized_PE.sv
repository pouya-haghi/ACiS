`timescale 1ns / 1ps

`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

module test_vectorized_PE;
    reg [phit_size-1:0] i1_PE_typeC;            // input 1
    reg [phit_size-1:0] i2_PE_typeC;            // input 2
    reg [SIMD_degree-1:0] i_tvalid1_PE_typeC;   // valid 1
    reg [SIMD_degree-1:0] i_tvalid2_PE_typeC;   // valid 2
    reg clk;
    reg rst;
    reg [2:0] op;                               // OPCODE 000-Add, 001-Acc, 010-Mul, 011-MAcc, 100-NOP
    wire [phit_size-1:0] o1_PE_typeC;
    wire [phit_size-1:0] o2_PE_typeC;           // Should be input 2 delayed 16 cycles
    wire [SIMD_degree-1:0] o1_tvalid1_PE_typeC;
    wire [SIMD_degree-1:0] o2_tvalid1_PE_typeC; // Should be valid 2 delayed 16 cycles
    
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
        i1_PE_typeC <= {512{1'b0}};
        i2_PE_typeC <= {512{1'b0}};
        i_tvalid1_PE_typeC <= {16{1'b0}};
        i_tvalid2_PE_typeC <= {16{1'b0}};
        op = 0;
        rst = 1;
        #20;
        rst = 0;
        #15;
        i1_PE_typeC <= 512'h4000000040000000; i2_PE_typeC <= 512'h4080000040800000;
        i_tvalid1_PE_typeC <= 16'hFFFF; i_tvalid2_PE_typeC <= 16'hFFFF; op = 3'b000;
//        #10;
//        i1_PE_typeC <= 512'd54321; i2_PE_typeC <= 512'd09876;
//        i_tvalid1_PE_typeC <= 0; i_tvalid2_PE_typeC <= 16'hFFFF; op = 3'b000;
//        #10;
//        i1_PE_typeC <= 512'h10101; i2_PE_typeC <= 512'h12121;
//        i_tvalid1_PE_typeC <= 16'hFFFF; i_tvalid2_PE_typeC <= 0; op = 3'b000;
//        #10;
//        i1_PE_typeC <= 512'd34343; i2_PE_typeC <= 512'd65656;
//        i_tvalid1_PE_typeC <= 0; i_tvalid2_PE_typeC <= 0; op = 3'b000;
        
//        #10 op = 3'b100;
        
//        #10
//        i1_PE_typeC <= 512'd00001; i2_PE_typeC <= 512'd00004;
//        i_tvalid1_PE_typeC <= 16'hFFFF; i_tvalid2_PE_typeC <= 16'hFFFF; op = 3'b001;
//        #10
//        i1_PE_typeC <= 512'd00010; i2_PE_typeC <= 512'd00040;
//        i_tvalid1_PE_typeC <= 16'hFFFF; i_tvalid2_PE_typeC <= 16'hFFFF; op = 3'b001;
//        #10
//        i1_PE_typeC <= 512'd00100; i2_PE_typeC <= 512'd00400;
//        i_tvalid1_PE_typeC <= 16'hFFFF; i_tvalid2_PE_typeC <= 16'hFFFF; op = 3'b001;
        
//        #10 op = 3'b100;
        
//        #10
//        i1_PE_typeC <= 512'd44444; i2_PE_typeC <= 512'd00002;
//        i_tvalid1_PE_typeC <= 16'hFFFF; i_tvalid2_PE_typeC <= 16'hFFFF; op = 3'b010;
//        #10
//        i1_PE_typeC <= 512'd33333; i2_PE_typeC <= 512'd00003;
//        i_tvalid1_PE_typeC <= 0; i_tvalid2_PE_typeC <= 16'hFFFF; op = 3'b010;
//        #10
//        i1_PE_typeC <= 512'd22222; i2_PE_typeC <= 512'd00004;
//        i_tvalid1_PE_typeC <= 16'hFFFF; i_tvalid2_PE_typeC <= 0; op = 3'b010;
        
//        #10 op = 3'b100;
        
        #160;
        i1_PE_typeC <= 512'h4000000040000000; i2_PE_typeC <= 512'h4080000040800000;
        i_tvalid1_PE_typeC <= 16'hFFFF; i_tvalid2_PE_typeC <= 16'hFFFF; op = 3'b011;
        #10;
        i1_PE_typeC <= 512'h4040000040400000; i2_PE_typeC <= 512'h40a0000040a00000;
        i_tvalid1_PE_typeC <= 16'hFFFF; i_tvalid2_PE_typeC <= 16'hFFFF; op = 3'b011;
        #10;
        i1_PE_typeC <= 512'h40c0000040c00000; i2_PE_typeC <= 512'h4120000041200000;
        i_tvalid1_PE_typeC <= 16'hFFFF; i_tvalid2_PE_typeC <= 16'hFFFF; op = 3'b011;
        
        #10; i_tvalid1_PE_typeC <= 16'h0; i_tvalid2_PE_typeC <= 16'h0;
        
        #200;
        $finish;
    end
endmodule
