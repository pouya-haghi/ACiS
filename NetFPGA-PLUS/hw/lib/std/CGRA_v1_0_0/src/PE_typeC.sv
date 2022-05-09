`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module PE_typeC #(parameter latency=8)(
// double-precision floating point processing
//    data_channel d_ch,
//    control_channel c_ch,
    input logic [dwidth_float-1:0] inp1,
    input logic [dwidth_float-1:0] inp2,
    input logic t_valid_inp1,
    input logic t_valid_inp2,
    output logic [dwidth_float-1:0] out1,
    output logic t_valid_out1,
    output logic [dwidth_float-1:0] out2,
    output logic t_valid_out2,
    input logic [1:0] op,
    input logic clk,
    input logic rst
    );
    
    logic [dwidth_float-1:0] o_fp_add;
    logic [dwidth_float-1:0] o_fp_mul;
    logic t_valid0; //discard output valid signal
    logic t_valid1; //discard output valid signal
    logic o_fp_acc_tlast, o_fp_acc_tvalid;
    logic [dwidth_float-1:0] i_fp_acc, o_fp_acc;
    logic is_add, is_mul, is_acc;
    logic tvalid_fp_acc;
    
    
floating_point_add fp_add_inst0 (
  .aclk(clk),                                        // input wire aclk
  .aresetn(!rst),                                  // input wire aresetn
  .s_axis_a_tvalid(t_valid_inp1 && is_add),                  // input wire s_axis_a_tvalid
  .s_axis_a_tdata(inp1),                    // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(t_valid_inp2 && is_add),                  // input wire s_axis_b_tvalid
  .s_axis_b_tdata(inp2),                    // input wire [31 : 0] s_axis_b_tdata
  .s_axis_operation_tvalid(t_valid_inp1 & t_valid_inp2 & is_add),  // input wire s_axis_operation_tvalid
  .s_axis_operation_tdata({7'b0, op[0]}),    // input wire [7 : 0] s_axis_operation_tdata
  .m_axis_result_tvalid(t_valid0),        // output wire m_axis_result_tvalid
  .m_axis_result_tdata(o_fp_add)          // output wire [31 : 0] m_axis_result_tdata
);
    
 floating_point_multiplier fp_mul_inst0 (
  .aclk(clk),                                        // input wire aclk
  .s_axis_a_tvalid(t_valid_inp1 && is_mul),                  // input wire s_axis_a_tvalid
  // only if it is a multiplier
  .s_axis_a_tdata(inp1),                    // input wire [31 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(t_valid_inp2 && is_mul),                  // input wire s_axis_b_tvalid
  .s_axis_b_tdata(inp2),                    // input wire [31 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(t_valid1),        // output wire m_axis_result_tvalid
  .m_axis_result_tdata(o_fp_mul),          // output wire [31 : 0] m_axis_result_tdata
  .aresetn(!rst)
);

// I have made an accumulator IP b/c it allows me to get  high throughput II=1 but with some latency
// The acc internally uses fixed point but make fptofxp conversions 


floating_point_acc fp_acc_inst0 (
  .aclk(clk),                                  // input wire aclk
  .aresetn(!rst),                            // input wire aresetn
  .s_axis_a_tvalid(tvalid_fp_acc & is_acc),            // input wire s_axis_a_tvalid
  .s_axis_a_tdata(i_fp_acc),              // input wire [31 : 0] s_axis_a_tdata
  .s_axis_a_tlast(1'b0),              // input wire s_axis_a_tlast
  .m_axis_result_tvalid(o_fp_acc_tvalid),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(o_fp_acc),    // output wire [31 : 0] m_axis_result_tdata
  .m_axis_result_tlast(o_fp_acc_tlast)    // output wire m_axis_result_tlast
);

    assign i_fp_acc = ((op[1])? inp2 : inp1);
    assign tvalid_fp_acc = ((op[1])? t_valid_inp2: t_valid_inp1);


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
    
    register_pipe #(dwidth_float+1, latency) rp_inst0(clk, rst, {t_valid_inp1, inp1}, {t_valid_out2, out2});
//    register_pipe #(1, latency) rp_inst1(clk, rst, t_valid_inp1, t_valid_out2);
    
        
endmodule
