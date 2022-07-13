`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module PE_typeC #(parameter latency=16)( // 8 for multiply and 8 for adder
// double-precision floating point processing
//    data_channel d_ch,
//    control_channel c_ch,
    input logic [dwidth_float-1:0] inp1, //stream
    input logic [dwidth_float-1:0] inp2,
    input logic [dwidth_float-1:0] inp3,
    input logic t_last_in,
    input logic t_valid_inp1,
    input logic t_valid_inp2,
//    input logic t_valid_inp3,
    output logic [dwidth_float-1:0] out,
    output logic t_valid_out,
    output logic t_last_out,
    input logic [2:0] op,
    input logic clk,
    input logic rst
    );
    
    logic [dwidth_float-1:0] o_fp_add;
    logic [dwidth_float-1:0] o_fp_mul;
    logic t_valid_add; //discard output valid signal
    logic t_valid_mul; //discard output valid signal
    logic o_fp_acc_t_last, o_fp_acc_tvalid;
//    logic [dwidth_float-1:0] i_fp_acc, o_fp_acc;
    logic is_add, is_mul, is_acc, is_macc;
//    logic tvalid_fp_acc;
//    logic tvalid_o_macc;
    logic t_valid_inp1_d, t_valid_inp2_d, t_valid_inp3_d, t_valid_mul_d;
    logic [dwidth_float-1:0] inp1_d, inp2_d, inp3_d, o_fp_mul_d;
    logic t_last_d, t_last_mul, t_last_mul_d, t_last_add; 
    logic [2:0] op_d, op_dd;
//    logic t_valid_out_t, t_valid_out_tt;
//    logic [dwidth_float-1:0] out_t, out_tt;
    
    
    floating_point_add fp_add_inst0 (
      .aclk(clk),                                        // input wire aclk
      .aresetn(!rst),                                  // input wire aresetn
      .s_axis_a_tvalid((op_d == 3'b000) ? t_valid_inp1_d : ((op_d == 3'b011) ? t_valid_mul : 1'b0)),                  // input wire s_axis_a_tvalid
      .s_axis_a_tdata((op_d == 3'b000) ? inp1_d : o_fp_mul),                    // input wire [31 : 0] s_axis_a_tdata
      .s_axis_a_tlast((op_d == 3'b000) ? t_last_d : t_last_mul),
      .s_axis_b_tvalid((op_d == 3'b000) ? t_valid_inp2_d : ((op_d == 3'b011) ? t_valid_inp3_d : 1'b0)),                  // input wire s_axis_b_tvalid
      .s_axis_b_tdata((op_d == 3'b000) ? inp2_d : inp3_d),                    // input wire [31 : 0] s_axis_b_tdata
      .s_axis_operation_tvalid(t_valid_inp1_d & t_valid_inp2_d & (op_d == 3'b000 || op_d == 3'b011)),  // input wire s_axis_operation_tvalid
      .s_axis_operation_tdata(8'b0),    // input wire [7 : 0] s_axis_operation_tdata
      .m_axis_result_tvalid(t_valid_add),        // output wire m_axis_result_tvalid
      .m_axis_result_tdata(o_fp_add),          // output wire [31 : 0] m_axis_result_tdata
      .m_axis_result_tlast(t_last_add)
    );
     
    floating_point_multiplier fp_mul_inst0 (
      .aclk(clk),                                        // input wire aclk
      .s_axis_a_tvalid(t_valid_inp1 && (is_mul || is_macc)),                  // input wire s_axis_a_tvalid
      // only if it is a multiplier
      .s_axis_a_tdata(inp1),                    // input wire [31 : 0] s_axis_a_tdata
      .s_axis_a_tlast(t_last_in),
      .s_axis_b_tvalid(t_valid_inp2 && (is_mul || is_macc)),                  // input wire s_axis_b_tvalid
      .s_axis_b_tdata(inp2),                    // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(t_valid_mul),        // output wire m_axis_result_tvalid
      .m_axis_result_tdata(o_fp_mul),          // output wire [31 : 0] m_axis_result_tdata
      .m_axis_result_tlast(t_last_mul),
      .aresetn(!rst)
    );
    
//    // I have made an accumulator IP b/c it allows me to get  high throughput II=1 but with some latency
//    // The acc internally uses fixed point but make fptofxp conversions 
    
    
//    floating_point_acc fp_acc_inst0 (
//      .aclk(clk),                                  // input wire aclk
//      .aresetn(!rst),                            // input wire aresetn
//      .s_axis_a_tvalid((is_macc)?t_valid_mul:(t_valid_inp1 & is_acc)),            // input wire s_axis_a_tvalid
//      .s_axis_a_tdata((is_macc)?o_fp_mul:inp1),              // input wire [31 : 0] s_axis_a_tdata
//      .s_axis_a_t_last(1'b0),              // input wire s_axis_a_t_last
//      .m_axis_result_tvalid(o_fp_acc_tvalid),  // output wire m_axis_result_tvalid
//      .m_axis_result_tdata(o_fp_acc),    // output wire [31 : 0] m_axis_result_tdata
//      .m_axis_result_t_last(o_fp_acc_t_last)    // output wire m_axis_result_t_last
//    );



    always_comb begin
    case(op)
        3'b000: begin 
               is_add = 1'b1;
               is_mul = 1'b0;
               is_acc = 1'b0;
               is_macc = 1'b0;
               end
        3'b001: begin
               is_add = 1'b0;
               is_mul = 1'b0;
               is_acc = 1'b1;
               is_macc = 1'b0;
               end
        3'b010: begin 
               is_add = 1'b0;
               is_mul = 1'b1;
               is_acc = 1'b0;
               is_macc = 1'b0;
               end
        3'b011: begin 
               is_add = 1'b0;
               is_mul = 1'b0;
               is_acc = 1'b0;
               is_macc = 1'b1;
               end
        3'b100: begin // NoP
               is_add = 1'b0;
               is_mul = 1'b0;
               is_acc = 1'b0;
               is_macc = 1'b0;
            end
               
        default: begin 
               is_add = 1'b0;
               is_mul = 1'b0;
               is_acc = 1'b0;
               is_macc = 1'b0;
            end
    endcase
    end
    
//    always_comb begin
//        case({t_valid_add, t_valid_mul, o_fp_acc_tvalid})
//        3'b100: begin
//            t_valid_out_t = 1'b1;
//            out_t = o_fp_add;
//        end
//        3'b010: begin
//            t_valid_out_t = 1'b1;
//            out_t = o_fp_mul;        
//        end
//        3'b001: begin // both macc and acc
//            t_valid_out_t = 1'b1;
//            out_t = o_fp_acc;
//        end
//        default: begin
//            t_valid_out_t = 1'b0;
//            out_t = o_fp_add;            
//        end
//        endcase
//    end
    
    register_pipe #(dwidth_float+2, latency/2) rp_inst1(clk, rst, {t_last_in, t_valid_inp1, inp1}, {t_last_d, t_valid_inp1_d, inp1_d}); // inp1
    register_pipe #(dwidth_float+1, latency/2) rp_inst2(clk, rst, {t_valid_inp2, inp2}, {t_valid_inp2_d, inp2_d}); // inp2
    register_pipe #(dwidth_float+1, latency/2) rp_inst3(clk, rst, {1'b1        , inp3}, {t_valid_inp3_d, inp3_d}); // inp3
    register_pipe #(dwidth_float+2, latency/2) rp_inst4(clk, rst, {t_last_mul, t_valid_mul, o_fp_mul}, {t_last_mul_d, t_valid_mul_d, o_fp_mul_d}); // mul IP
    register_pipe #(3             , latency/2) rp_inst5(clk, rst, op, op_d); // (latency/2) delayed op
    register_pipe #(3             , latency/2) rp_inst6(clk, rst, op_d, op_dd); // (latency) delayed op
    
    assign out = (op_dd == 3'b010) ? o_fp_mul_d : o_fp_add;
    assign t_valid_out = (op_dd == 3'b010) ? t_valid_mul_d : ((op_dd == 3'b011 || op_dd == 3'b000) ? t_valid_add : 1'b0);
    assign t_last_out = (op_dd == 3'b010) ? t_last_mul_d : t_last_add;

endmodule
