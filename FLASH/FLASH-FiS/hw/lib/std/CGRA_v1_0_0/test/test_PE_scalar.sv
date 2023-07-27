`timescale 1ns / 1ps

`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

module test_PE_scalar;
    reg [dwidth_int-1:0] inp1;
    reg [dwidth_int-1:0] inp2;
    reg [dwidth_int-1:0] R_immediate;
    reg [2:0] op_scalar;
    wire [dwidth_int-1:0] out1;
    wire flag_eq;
    
    PE_scalar PE_scalar_inst0
     (.inp1(inp1),
      .inp2(inp2),
      .R_immediate(R_immediate),
      .op_scalar(op_scalar),
      .out1(out1),
      .flag_eq(flag_eq) // correct me
     );
    
    initial begin
        op_scalar <= 001; inp1 <= 32'h12345678; R_immediate <= 32'h87654321;
        inp2 <= 32'h12345678;
        #10 op_scalar <= 010;
        #10
        
        $finish;
    end
endmodule
