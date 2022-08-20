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
    input logic t_last1_in,
    input logic t_last2_in,
    input logic t_valid_inp1,
    input logic t_valid_inp2,
//    input logic t_valid_inp3,
    input logic en_ITR_sp, // added
    output logic [dwidth_float-1:0] out,
    output logic t_valid_out,
    output logic t_last_out,
    input logic [2:0] op,
    input logic clk,
    input logic rst
    );
    
    logic t_last_in;
    assign t_last_in = t_last1_in || t_last2_in; // output t_last is determined by an OR of input t_lasts (from stream or VRF)
    
    logic [dwidth_float-1:0] o_fp_add;
    logic [dwidth_float-1:0] o_fp_mul;
    logic t_valid_add; //discard output valid signal
    logic t_valid_mul; //discard output valid signal
    logic o_fp_acc_t_last, o_fp_acc_tvalid;
    
    localparam [2:0] ADD = 3'b000;
    localparam [2:0] ACC = 3'b001;
    localparam [2:0] MUL = 3'b010;
    localparam [2:0] MACC= 3'b011;
    localparam [2:0] NOP = 3'b100;
    
    logic t_valid_inp1_d, t_valid_inp1_dd, t_valid_inp2_d, t_valid_inp3_d, t_valid_mul_d;
    logic [dwidth_float-1:0] inp1_d, inp1_dd, inp2_d, inp3_d, o_fp_mul_d;
    logic t_last_d, t_last_dd, t_last_mul, t_last_mul_d, t_last_add; 
    logic [2:0] op_d, op_dd;
//    logic t_valid_out_t, t_valid_out_tt;
//    logic [dwidth_float-1:0] out_t, out_tt;
//    assign en_sp = tvalid_PE & (~en_ITR_sp) & ACC;  
    
    // PH: important: if you change your Vector regiter file from 0 cycle read latency to 2 cycles you need 2 delay cycles for t_valid_inp1_d if it is spvacc
    floating_point_add fp_add_inst0 (
      .aclk(clk),                                        // input wire aclk
      .aresetn(!rst),                                  // input wire aresetn 
      .s_axis_a_tvalid((op_d == ADD) ? (t_valid_inp1_d) : ((op_d == MACC) ? t_valid_mul : ((op_d == ACC)?(t_valid_inp1_d & t_valid_inp2_d & (~en_ITR_sp)):1'b0))), // PH: for vmacc: I need tvalid from the stream_in. we want (~en_ITR_sp) to invalidate the first beat which contains VLEN
      .s_axis_a_tdata((op_d == ADD) ? inp1_d : ((op_d == ACC)? inp2_d : o_fp_mul)),  // input wire [31 : 0] s_axis_a_tdata
      .s_axis_a_tlast((op_d == ADD || op_d == ACC) ? t_last_d : t_last_mul),
      .s_axis_b_tvalid((op_d == ADD) ? t_valid_inp2_d : ((op_d == MACC) ? t_valid_inp3_d : ((op_d == ACC)?(t_valid_inp1_d & t_valid_inp3_d & (~en_ITR_sp)):1'b0))),                  // input wire s_axis_b_tvalid
      .s_axis_b_tdata((op_d == ADD) ? inp2_d : inp3_d),                    // input wire [31 : 0] s_axis_b_tdata
      .s_axis_operation_tvalid((t_valid_inp1_d & t_valid_inp2_d & (op_d == ADD || op_d == MACC)) | ((~en_ITR_sp)&t_valid_inp1_d & t_valid_inp2_d & t_valid_inp3_d & (op_d == ACC))),  // input wire s_axis_operation_tvalid
      .s_axis_operation_tdata(8'b0),    // input wire [7 : 0] s_axis_operation_tdata
      .m_axis_result_tvalid(t_valid_add),        // output wire m_axis_result_tvalid
      .m_axis_result_tdata(o_fp_add),          // output wire [31 : 0] m_axis_result_tdata
      .m_axis_result_tlast(t_last_add)
    );
     
    floating_point_mul fp_mul_inst0 (
      .aclk(clk),                                        // input wire aclk
      .s_axis_a_tvalid(t_valid_inp1 && (op == MUL || op == MACC)),                  // input wire s_axis_a_tvalid
      // only if it is a multiplier
      .s_axis_a_tdata(inp1),                    // input wire [31 : 0] s_axis_a_tdata
      .s_axis_a_tlast(t_last_in),
      .s_axis_b_tvalid(t_valid_inp2 && (op == MUL || op == MACC)),                  // input wire s_axis_b_tvalid
      .s_axis_b_tdata(inp2),                    // input wire [31 : 0] s_axis_b_tdata
      .m_axis_result_tvalid(t_valid_mul),        // output wire m_axis_result_tvalid
      .m_axis_result_tdata(o_fp_mul),          // output wire [31 : 0] m_axis_result_tdata
      .m_axis_result_tlast(t_last_mul),
      .aresetn(!rst)
    );
    
//    // I have made an accumulator IP b/c it allows me to get  high throughput II=1 but with some latency
//    // The ACC internally uses fixed point but make fptofxp conversions 
    
    
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
    
    register_pipe #(dwidth_float+2, latency)   rp_inst0(clk, rst, {t_last1_in, t_valid_inp1, inp1}, {t_last_dd, t_valid_inp1_dd, inp1_dd}); // inp1
    register_pipe #(dwidth_float+2, latency/2) rp_inst1(clk, rst, {t_last1_in, t_valid_inp1, inp1}, {t_last_d, t_valid_inp1_d, inp1_d}); // inp1
    register_pipe #(dwidth_float+1, latency/2) rp_inst2(clk, rst, {t_valid_inp2, inp2}, {t_valid_inp2_d, inp2_d}); // inp2
    register_pipe #(dwidth_float+1, latency/2) rp_inst3(clk, rst, {1'b1        , inp3}, {t_valid_inp3_d, inp3_d}); // inp3
    register_pipe #(dwidth_float+2, latency/2) rp_inst4(clk, rst, {t_last_mul, t_valid_mul, o_fp_mul}, {t_last_mul_d, t_valid_mul_d, o_fp_mul_d}); // MUL IP
    register_pipe #(3             , latency/2) rp_inst5(clk, rst, op, op_d); // (latency/2) delayed op
    register_pipe #(3             , latency/2) rp_inst6(clk, rst, op_d, op_dd); // (latency) delayed op
    
    
    always_comb begin
        case (op_dd)
            ADD: begin
                out = o_fp_add;
                t_valid_out = t_valid_add;
                t_last_out = t_last_add;
            end
            ACC: begin
                out = o_fp_add;
                t_valid_out = t_valid_add;
                t_last_out = t_last_add;
            end
            MUL: begin
                out = o_fp_mul_d;
                t_valid_out = t_valid_mul_d;
                t_last_out = t_last_mul_d;
            end
            MACC: begin
                out = o_fp_add;
                t_valid_out = t_valid_add;
                t_last_out = t_last_add;
            end
            NOP: begin
                out = inp1_dd;
                t_valid_out = t_valid_inp1_dd;
                t_last_out = t_last_dd;
            end
            default: begin
                out = inp1_dd;
                t_valid_out = t_valid_inp1_dd;
                t_last_out = t_last_dd;
            end
        endcase    
    end

endmodule
