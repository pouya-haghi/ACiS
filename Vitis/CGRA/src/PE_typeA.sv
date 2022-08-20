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
    input logic t_valid_inp1,
    input logic t_valid_inp2,
    input logic clk,
    input logic rst,
    output logic [dwidth_double-1:0] out1,
    input logic [1:0] op,
    output logic t_valid_out1
    );
    
    logic [dwidth_double-1:0] t_add;
    logic [dwidth_int-1:0] t_reg_inp1, t_reg_inp2;
    logic [dwidth_double-1:0] t_mul, t_add_extended;
    logic temp_valid;
    logic t_valid_add, t_valid_mul;
    
    assign temp_valid = t_valid_inp1 & t_valid_inp2;
    
    // implementing output t_valid
    register_pipe #(.width(1), .numPipeStage(latency))
    register_pipe_inst0 (temp_valid && (!op[1]), clk, rst, t_valid_add);
    
    register_pipe #(.width(1), .numPipeStage(latency))
    register_pipe_inst1 (temp_valid && (op[1]), clk, rst, t_valid_mul);    
    
c_addsub_1 addsub_inst0 (
  .A(inp1),      // input wire [63 : 0] A
  .B(inp2),      // input wire [63 : 0] B
  .CLK(clk),  // input wire CLK
  .SCLR(rst),
  .ADD(!op[0]),  // input wire ADD
  .S(t_add)      // output wire [31 : 0] S
);

//assign t_add = inp1 + inp2;

mult_int_0 mult_inst0 (
  .CLK(clk),  // input wire CLK
  .SCLR(rst),
  .A(inp1[dwidth_int-1:0]),      // input wire [31 : 0] A
  .B(inp2[dwidth_int-1:0]),      // input wire [31 : 0] B
  .P(t_mul)      // output wire [63 : 0] P
); 
    
    always_comb begin
        case({t_valid_add, t_valid_mul})
        2'b10: begin
            t_valid_out1 = 1'b1;
            out1 = t_add;
        end
        2'b01: begin
            t_valid_out1 = 1'b1;
            out1 = t_mul;        
        end
        default: begin
            t_valid_out1 = 1'b0;
            out1 = t_add;            
        end
        endcase
    end
    
endmodule
