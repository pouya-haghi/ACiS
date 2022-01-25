`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

// Latency is 6
module PE_typeA #(parameter latency = 6)(
    // integer processing
//    data_channel d_ch,
//    control_channel c_ch,
    input logic [dwidth_double-1:0] inp1,
    input logic [dwidth_double-1:0] inp2,
    input logic clk,
    input logic rst,
    output logic [dwidth_double-1:0] out1,
    input logic [1:0] op
    );
    
    logic [dwidth_double-1:0] t_add;
    logic [dwidth_int-1:0] t_reg_inp1, t_reg_inp2;
    logic [dwidth_double-1:0] t_mul, t_add_extended;
    
//    always @(*) begin
//    case(op)
//    2'b00: out1 = inp1 + inp2;
//    2'b01: out1 = inp1 - inp2;
//    2'b10: out1 = inp1 * inp2;
////    2'b11: out1 = inp1 * inp2;
//    default: out1 = inp1 + inp2;
//    endcase
//    end

  c_addsub_1 addsub_inst0 (
  .A(inp1),      // input wire [63 : 0] A
  .B(inp2),      // input wire [63 : 0] B
  .CLK(clk),  // input wire CLK
  .ADD(!op[0]),  // input wire ADD
  .S(t_add)      // output wire [31 : 0] S
);

//assign t_add = inp1 + inp2;

   mult_int_0 mult_inst0 (
  .CLK(clk),  // input wire CLK
  .A(inp1[dwidth_int-1:0]),      // input wire [31 : 0] A
  .B(inp2[dwidth_int-1:0]),      // input wire [31 : 0] B
  .P(t_mul)      // output wire [63 : 0] P
); 

//register_pipe #(.width(dwidth_int),.numPipeStage(latency))
//    register_pipe_inst0(inp1[(2*dwidth_int)-1:dwidth_int], clk, rst, t_reg_inp1);
    
//register_pipe #(.width(dwidth_int),.numPipeStage(latency))
//    register_pipe_inst1(inp2[(2*dwidth_int)-1:dwidth_int], clk, rst, t_reg_inp2);


    always_comb begin
        case(op)
            2'b00: out1 = t_add; // Add with zero propagates inp1
            2'b01: out1 = t_add; // Sub with zero propagates inp2
            2'b10: out1 = t_mul;
            2'b11: out1 = t_mul;
            default: out1 = t_add;
        endcase
    end
    
endmodule
