`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2021 05:20:22 PM
// Design Name: 
// Module Name: PE_typeC
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module PE_typeC(
// double-precision floating point processing
    data_channel d_ch,
    control_channel c_ch,
    input clk
    );
    
    always @(*) begin
    case(c_ch.op)
    2'b00: d_ch.out1 = d_ch.inp1 + d_ch.inp2;
    2'b01: d_ch.out1 = d_ch.inp1 * d_ch.inp2;
    default: d_ch.out1 = d_ch.inp1 + d_ch.inp2;
    endcase
    end
    
    floating_point_0 your_instance_name (
  .aclk(clk),                                        // input wire aclk
  .s_axis_a_tvalid(s_axis_a_tvalid),                  // input wire s_axis_a_tvalid
  .s_axis_a_tdata(s_axis_a_tdata),                    // input wire [63 : 0] s_axis_a_tdata
  .s_axis_b_tvalid(s_axis_b_tvalid),                  // input wire s_axis_b_tvalid
  .s_axis_b_tdata(s_axis_b_tdata),                    // input wire [63 : 0] s_axis_b_tdata
  .s_axis_operation_tvalid(s_axis_operation_tvalid),  // input wire s_axis_operation_tvalid
  .s_axis_operation_tdata(s_axis_operation_tdata),    // input wire [7 : 0] s_axis_operation_tdata
  .m_axis_result_tvalid(m_axis_result_tvalid),        // output wire m_axis_result_tvalid
  .m_axis_result_tdata(m_axis_result_tdata)          // output wire [63 : 0] m_axis_result_tdata
);
    
endmodule
