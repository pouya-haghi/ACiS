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
    input logic t_valid_inp1,
    input logic t_valid_inp2,
    output logic [dwidth_double-1:0] out1,
    output logic t_valid_out1,
    input logic [1:0] op,
    input logic clk,
    input logic rst
    );
    
    
    logic [dwidth_double-1:0] o_floating_point_0;
    logic [dwidth_double-1:0] o_floating_point_1;
    logic [dwidth_double-1:0] t_reg_inp1, t_reg_inp2;
    logic t_valid0; // discard output valid signal
    logic t_valid1; // discard output valid signal
    logic t_valid_reg1, t_valid_reg2;
    
    floating_point_div fp_div_inst0 (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(t_valid_inp1 & op[1] & (~op[0])),            // input wire s_axis_a_tvalid
      .s_axis_a_tdata(inp1),              // input wire [63 : 0] s_axis_a_tdata
      .s_axis_b_tvalid(t_valid_inp2 & op[1] & (~op[0])),            // input wire s_axis_b_tvalid
      .s_axis_b_tdata(inp2),              // input wire [63 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(t_valid0),  // output wire m_axis_result_tvalid
      .m_axis_result_tdata(o_floating_point_0)    // output wire [63 : 0] m_axis_result_tdata
    );

    floating_point_sqrt fp_sqrt_inst0 (
      .aclk(clk),                                  // input wire aclk
      .s_axis_a_tvalid(t_valid_inp1 & t_valid_inp2 & op[0] & op[1]),            // input wire s_axis_a_tvalid
      .s_axis_a_tdata(inp1),              // input wire [63 : 0] s_axis_a_tdata
      .m_axis_result_tvalid(t_valid1),  // output wire m_axis_result_tvalid
      .m_axis_result_tdata(o_floating_point_1)    // output wire [63 : 0] m_axis_result_tdata
    );
//    assign out1 = (op[0])? o_floating_point_1 : o_floating_point_0;
    
    register_pipe #(.width(dwidth_double), .numPipeStage(latency))
        register_pipe_inst0 (inp1, clk, rst, t_reg_inp1);
    
    register_pipe #(.width(dwidth_double), .numPipeStage(latency))
        register_pipe_inst1 (inp2, clk, rst, t_reg_inp2);
    
    register_pipe #(.width(1), .numPipeStage(latency))
        register_pipe_inst2 (t_valid_inp1 & (~op[0]) & (~op[1]), clk, rst, t_valid_reg1);
            
    register_pipe #(.width(1), .numPipeStage(latency))
        register_pipe_inst3 (t_valid_inp2 & (op[0]) & (~op[1]), clk, rst, t_valid_reg2);
                
    
    always_comb begin
        case({t_valid_reg1, t_valid_reg2, t_valid0, t_valid1})
        4'b1000: begin
            t_valid_out1 = 1'b1;
            out1 = t_reg_inp1;
        end
        4'b0100: begin
            t_valid_out1 = 1'b1;
            out1 = t_reg_inp2;        
        end
        4'b0010: begin
            t_valid_out1 = 1'b1;
            out1 = o_floating_point_0;        
        end
        4'b0001: begin
            t_valid_out1 = 1'b1;
            out1 = o_floating_point_1;        
        end          
        default: begin
            t_valid_out1 = 1'b0;
            out1 = t_reg_inp1;            
        end
        endcase
    end
    
endmodule
