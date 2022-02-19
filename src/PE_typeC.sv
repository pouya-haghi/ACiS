`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module PE_typeC #(parameter latency=12)(
// double-precision floating point processing
//    data_channel d_ch,
//    control_channel c_ch,
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
    
    logic [dwidth_double-1:0] o_fp_add;
    logic [dwidth_double-1:0] o_fp_mul;
    logic t_valid0; //discard output valid signal
    logic t_valid1; //discard output valid signal
    logic o_fp_acc_tlast, o_fp_acc_tvalid;
    logic [dwidth_double-1:0] i_fp_acc, o_fp_acc;
    logic is_add, is_mul, is_acc;
    
    
 floating_point_0 fp_add_inst0 ( //This is an adder
  .aclk(clk),                                        // input wire aclk
  .s_axis_a_tvalid(t_valid_inp1 && is_add),         // input wire s_axis_a_tvalid
    // only if it is an adder 
  .s_axis_a_tdata(inp1),                    // input wire [63 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(t_valid_inp2 && is_add),                  // input wire s_axis_b_tvalid
  .s_axis_b_tdata(inp2),                    // input wire [63 : 0] s_axis_b_tdata
  .s_axis_operation_tvalid(t_valid_inp1),  // input wire s_axis_operation_tvalid
  .s_axis_operation_tdata({7'b0, op[0]}),    // input wire [7 : 0] s_axis_operation_tdata
  .m_axis_result_tvalid(t_valid0),        // output wire m_axis_result_tvalid
  .m_axis_result_tdata(o_fp_add)          // output wire [63 : 0] m_axis_result_tdata
);
    
 floating_point_mul fp_mul_inst0 (
  .aclk(clk),                                        // input wire aclk
  .s_axis_a_tvalid(t_valid_inp1 && is_mul),                  // input wire s_axis_a_tvalid
  // only if it is a multiplier
  .s_axis_a_tdata(inp1),                    // input wire [63 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(t_valid_inp2 && is_mul),                  // input wire s_axis_b_tvalid
  .s_axis_b_tdata(inp2),                    // input wire [63 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(t_valid1),        // output wire m_axis_result_tvalid
  .m_axis_result_tdata(o_fp_mul)          // output wire [63 : 0] m_axis_result_tdata
);

// I have made an accumulator IP b/c it allows me to get  high throughput II=1 but with some latency
// The acc internally uses fixed point but make fptofxp conversions 
floating_point_accumulator fp_acc_inst0 (
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(t_valid_inp1 && t_valid_inp2 && is_acc),            // input wire s_axis_a_tvalid
  // only if it is an accumulator
  .s_axis_a_tdata(i_fp_acc),              // input wire [63 : 0] s_axis_a_tdata
  .s_axis_a_tlast(1'b0),              // input wire s_axis_a_tlast
  .m_axis_result_tvalid(o_fp_acc_tvalid),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(o_fp_acc),    // output wire [63 : 0] m_axis_result_tdata
  .m_axis_result_tlast(o_fp_acc_tlast),    // output wire m_axis_result_tlast
  .aresetn(!rst)
);

    assign i_fp_acc = ((op[1])? inp2 : inp1);

    always_comb begin
    case(op)
        2'b00: begin 
               is_add = 1'b1;
               is_mul = 1'b0;
               is_acc = 1'b0;
               end
        2'b01: begin
               is_add = 1'b0;
               is_mul = 1'b0;
               is_acc = 1'b1;
               end
        2'b10: begin 
               is_add = 1'b0;
               is_mul = 1'b1;
               is_acc = 1'b0;
               end
        2'b11: begin 
               is_add = 1'b0;
               is_mul = 1'b0;
               is_acc = 1'b1;
               end
        default: begin 
               is_add = 1'b1;
               is_mul = 1'b0;
               is_acc = 1'b0;
            end
    endcase
    end
    
    always_comb begin
        case({t_valid0, t_valid1, o_fp_acc_tvalid})
        3'b100: begin
            t_valid_out1 = 1'b1;
            out1 = o_fp_add;
        end
        3'b010: begin
            t_valid_out1 = 1'b1;
            out1 = o_fp_mul;        
        end
        3'b001: begin
            t_valid_out1 = 1'b1;
            out1 = o_fp_acc;
        end
        default: begin
            t_valid_out1 = 1'b0;
            out1 = o_fp_add;            
        end
        endcase
    end
        
endmodule
