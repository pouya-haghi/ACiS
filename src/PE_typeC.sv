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
    output logic [dwidth_double-1:0] out1,
    input logic [1:0] op,
    input logic clk
    );
    
    logic [dwidth_double-1:0] o_fp_add;
    logic [dwidth_double-1:0] o_fp_mul;
    logic t_valid0; //discard output valid signal
    logic t_valid1; //discard output valid signal
    logic o_fp_acc_tlast, o_fp_acc_tvalid;
    logic [dwidth_double-1:0] i_fp_acc, o_fp_acc;
    
    
 floating_point_0 fp_add_inst0 ( //This is an adder
  .aclk(clk),                                        // input wire aclk
  .s_axis_a_tvalid(1'b1),                  // input wire s_axis_a_tvalid
  .s_axis_a_tdata(inp1),                    // input wire [63 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1),                  // input wire s_axis_b_tvalid
  .s_axis_b_tdata(inp2),                    // input wire [63 : 0] s_axis_b_tdata
  .s_axis_operation_tvalid(1'b1),  // input wire s_axis_operation_tvalid
  .s_axis_operation_tdata({7'b0, op[0]}),    // input wire [7 : 0] s_axis_operation_tdata
  .m_axis_result_tvalid(t_valid0),        // output wire m_axis_result_tvalid
  .m_axis_result_tdata(o_fp_add)          // output wire [63 : 0] m_axis_result_tdata
);
    
 floating_point_mul fp_mul_inst0 (
  .aclk(clk),                                        // input wire aclk
  .s_axis_a_tvalid(1'b1),                  // input wire s_axis_a_tvalid
  .s_axis_a_tdata(inp1),                    // input wire [63 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(1'b1),                  // input wire s_axis_b_tvalid
  .s_axis_b_tdata(inp2),                    // input wire [63 : 0] s_axis_b_tdata
  .m_axis_result_tvalid(t_valid1),        // output wire m_axis_result_tvalid
  .m_axis_result_tdata(o_fp_mul)          // output wire [63 : 0] m_axis_result_tdata
);

// I have made an accumulator IP b/c it allows me to get  high throughput II=1 but with some latency
// The acc internally uses fixed point but make fptofxp conversions 
floating_point_accumulator fp_acc_inst0 (
  .aclk(clk),                                  // input wire aclk
  .s_axis_a_tvalid(1'b1),            // input wire s_axis_a_tvalid
  .s_axis_a_tdata(i_fp_acc),              // input wire [63 : 0] s_axis_a_tdata
  .s_axis_a_tlast(1'b0),              // input wire s_axis_a_tlast
  .m_axis_result_tvalid(o_fp_acc_tvalid),  // output wire m_axis_result_tvalid
  .m_axis_result_tdata(o_fp_acc),    // output wire [63 : 0] m_axis_result_tdata
  .m_axis_result_tlast(o_fp_acc_tlast)    // output wire m_axis_result_tlast
);

    assign i_fp_acc = (op[1])? inp2 : inp1;

    always@(*) begin
    case(op)
        2'b00: out1 = o_fp_add;
        2'b01: out1 = o_fp_acc;
        2'b10: out1 = o_fp_mul;
        2'b11: out1 = o_fp_acc;
        default: out1 = o_fp_add;
    endcase
    end
    
endmodule
