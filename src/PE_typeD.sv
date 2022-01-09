`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module PE_typeD #(parameter latency=57)(
// double-precision floating point processing
    input logic [dwidth_double-1:0] inp1,
    input logic [dwidth_double-1:0] inp2,
    output logic [dwidth_double-1:0] out1,
    input logic [1:0] op,
    input logic clk,
    input logic rst
    );
    
    logic [dwidth_double-1:0] o_floating_point_0;
    logic [dwidth_double-1:0] o_floating_point_1;
    logic [dwidth_double-1:0] t_reg_inp1, t_reg_inp2;
    logic t_valid0; // discard output valid signal
    logic t_valid1; // discard output valid signal
    
    floating_point_div fp_div_inst0 (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(1'b1),            // input wire s_axis_a_tvalid
      .s_axis_a_tdata(inp1),              // input wire [63 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(1'b1),            // input wire s_axis_b_tvalid
      .s_axis_b_tdata(inp2),              // input wire [63 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(t_valid0),  // output wire m_axis_result_tvalid
      .m_axis_result_tdata(o_floating_point_0)    // output wire [63 : 0] m_axis_result_tdata
    );

    floating_point_sqrt fp_sqrt_inst0 (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(1'b1),            // input wire s_axis_a_tvalid
      .s_axis_a_tdata(inp1),              // input wire [63 : 0] s_axis_a_tdata
      .m_axis_result_tvalid(t_valid1),  // output wire m_axis_result_tvalid
      .m_axis_result_tdata(o_floating_point_1)    // output wire [63 : 0] m_axis_result_tdata
    );

//    assign out1 = (op[0])? o_floating_point_1 : o_floating_point_0;
    
    register_pipe #(.width(dwidth_double), .numPipeStage(latency))
        register_pipe_inst0 (inp1, clk, rst, t_reg_inp1);
    
    register_pipe #(.width(dwidth_double), .numPipeStage(latency))
        register_pipe_inst1 (inp2, clk, rst, t_reg_inp2);
        
    always_comb begin
        case(op)
            2'b00: out1 = t_reg_inp1; //NoP
            2'b01: out1 = t_reg_inp2; //Nop
            2'b10: out1 = o_floating_point_0;
            2'b11: out1 = o_floating_point_1;
            default: out1 = t_reg_inp1; //Nop
        endcase
    end
    
endmodule
