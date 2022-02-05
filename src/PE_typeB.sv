`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif
//latency=4
module PE_typeB #(parameter latency=4)(
// double-precision floating point processing
//    data_channel d_ch,
//    control_channel c_ch,
    input logic [dwidth_double-1:0] inp1,
    input logic t_valid_inp1,
    output logic [dwidth_double-1:0] out1,
    input logic clk,
    input rst,
    input logic [1:0] op,
    output t_valid_out1
    );
    
    logic temp_valid; // discard output valid signal
    logic [dwidth_double-1:0] t_out1, t_reg_inp1;
    logic t_valid_out_PE;
    
floating_point_1 int2double_inst_0 (
// This ip converts integer (64 bits) to double
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(t_valid_inp1),            // input wire s_axis_a_tvalid
  .s_axis_a_tdata(inp1),              // input wire [63 : 0] s_axis_a_tdata
  .m_axis_result_tvalid(t_valid_out_PE),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(t_out1)    // output wire [63 : 0] m_axis_result_tdata
);

    register_pipe #(.width(dwidth_double), .numPipeStage(latency))
        register_pipe_inst0 (inp1, clk, rst, t_reg_inp1);
        
   register_pipe #(.width(1), .numPipeStage(latency))
        register_pipe_inst1 (t_valid_inp1, clk, rst, temp_valid);    

    assign out1 = (op[0])? t_out1 : t_reg_inp1;
    assign t_valid_out1 = (op[0])? t_valid_out_PE : temp_valid;
    
endmodule
