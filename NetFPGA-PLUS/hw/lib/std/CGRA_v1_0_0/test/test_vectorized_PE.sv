`timescale 1ns / 1ps

`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

module test_vectorized_PE;
    reg [phit_size-1:0] i1_PE_typeC;            // input 1
    reg [phit_size-1:0] i2_PE_typeC;            // input 2
    reg [phit_size-1:0] i3_PE_typeC;            // input 3
    reg [SIMD_degree-1:0] i_tvalid1_PE_typeC;   // valid 1
    reg [SIMD_degree-1:0] i_tvalid2_PE_typeC;   // valid 2
    reg [SIMD_degree-1:0] i_tlast1_PE_typeC;
    reg [SIMD_degree-1:0] i_tlast2_PE_typeC;
    reg clk;
    reg rst;
    reg [2:0] op;
    reg [1:0] state;
    wire [phit_size-1:0] o_PE_typeC;
    wire [SIMD_degree-1:0] o_tvalid_PE_typeC;
    wire [SIMD_degree-1:0] o_tlast_PE_typeC;
    
    vectorized_PE vectorized_PE_inst0 (.*);
        
    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end

    initial begin
        i1_PE_typeC <= {512{1'b0}};
        i2_PE_typeC <= {512{1'b0}};
        i3_PE_typeC <= {512{1'b0}};
        i_tvalid1_PE_typeC <= {16{1'b0}};
        i_tvalid2_PE_typeC <= {16{1'b0}};
        op <= ADD;
        state <= PAYLOAD;
        i_tlast1_PE_typeC <= '0;
        i_tlast2_PE_typeC <= '0;
        rst = 1;
        
        #20;
        rst = 0;
        
        #15;
        i1_PE_typeC <= 512'h4000000040000000; i2_PE_typeC <= 512'h4080000040800000;     // Add 2 and 4 expected: 0x40c00000
        i_tvalid1_PE_typeC <= 16'hFFFF; i_tvalid2_PE_typeC <= 16'hFFFF;
        i_tlast1_PE_typeC <= 16'hFFFF;
        i_tlast2_PE_typeC <= 16'hFFFF;
        
        #10; // MUL 2x4 expected: 0x41000000
        op <= MUL;
        
        #10; // NOP expected: inp1 = 40000000
        op <= NOP;
        i_tlast1_PE_typeC <= '0;
        i_tlast2_PE_typeC <= '0;

        #10;
        op <= MACC; // MAC
        i1_PE_typeC <= 512'h4000000040000000; i2_PE_typeC <= 512'h4080000040800000; i3_PE_typeC <= 512'h4040000040400000;//2x4+3 expected: 0x41300000
        
        #10;
        i1_PE_typeC <= 512'h4040000040400000; i2_PE_typeC <= 512'h40a0000040a00000; i3_PE_typeC <= 512'h4040000040400000; //3x5+3 expected: 0x41900000
        
        #10;
        i1_PE_typeC <= 512'h40c0000040c00000; i2_PE_typeC <= 512'h4120000041200000; i3_PE_typeC <= 512'h4040000040400000; //6x10+3 expected: 0x427c0000
        i_tlast1_PE_typeC <= 16'hFFFF;
        i_tlast2_PE_typeC <= 16'hFFFF;
        
        #10; 
        // invalidate first input
        i_tvalid1_PE_typeC <= 16'h0; 
        
        #40;
        // invalidate first input
        i_tvalid2_PE_typeC <= 16'h0;
        
        #200;
        $finish;
    end
endmodule
