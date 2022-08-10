`timescale 1ns / 1ps

`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

module assembler(
        input  logic clk,
        input  logic rst,
        input  logic is_vstreamout_global,
        input  logic is_spl,
        input  logic [31:0] RF_in,
        input  logic [phit_size-1:0] tdata_in,
        input  logic [phit_size/8-1:0] tkeep_in,
        input  logic tvalid_in,
        input  logic tlast_in,
        output logic [phit_size-1:0] tdata_out,
        output logic [phit_size/8-1:0] tkeep_out,
        output logic tvalid_out,
        output logic tlast_out 
    );
    
    logic [phit_size/8-1:0] is_header_byte = {{(phit_size/8-header_bytes){1'b0}},{header_bytes{1'b1}}};
    logic [15:0] spl_val;
    
    localparam bitwidth = 20;
    logic [bitwidth-1:0] out0to4, out1to4, out2to5, out3to5, out4to6, out5to6, out6to7, out7to8, in_d;
    logic [15:0] checksum_inv, checksum;
    
    logic [phit_size-1:0] tdata_d;
    logic [phit_size/8-1:0] tkeep_d;
    logic tvalid_d;
    logic tlast_d;
    
    // Save SPL val
    reg_enr #(16) reg_enr_inst0 
    (
    .d(RF_in[15:0]),
    .clk(clk),
    .rst(rst),
    .en(is_spl),
    .q(spl_val)
    ); 
    
    logic sel_mux;
    
    logic [1:0] state, state_next;
    logic [1:0] IDLE = 2'b0;
    logic [1:0] HEADER = 2'b1;
    logic [1:0] PAYLOAD = 2'b10;
    
    
    // FSM for stream_out
    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            state_next <= IDLE;
        end else begin
            state <= state_next;
        end
    end
    
    always_comb begin
        case (state)
            IDLE: begin
                state_next = (is_vstreamout_global) ? HEADER : IDLE;
                sel_mux = 1'b0; 
            end
            HEADER: begin
                if (tvalid_d) begin
                    sel_mux = 1'b1; 
                    state_next = PAYLOAD;
                end else begin
                    sel_mux = 1'b0; 
                    state_next = HEADER;
                end
            end
            PAYLOAD: begin 
                state_next = (is_vstreamout_global) ? PAYLOAD : IDLE;
                sel_mux = 1'b0;
            end
        endcase
    end
   
//    tdata_in[127:112] //version IHL tos
//    tdata_in[143:128] //length
//    tdata_in[159:144] //ID
//    tdata_in[175:160] //flags and offset
//    tdata_in[191:176] //ttl and protocol
//    tdata_in[207:192] //checksum
//    tdata_in[223:208] //source addr
//    tdata_in[239:224] //source addr
//    tdata_in[255:240] //dest addr
//    tdata_in[271:256] //dest addr
    // --------------- Checksum generation --------------- //    
    registered_add #(bitwidth) add0(clk, rst, {4'b0, tdata_in[127:112]}, {4'b0, spl_val}, out0to4);
    registered_add #(bitwidth) add1(clk, rst, {4'b0, tdata_in[159:144]}, {4'b0, tdata_in[175:160]}, out1to4);
    registered_add #(bitwidth) add2(clk, rst, {4'b0, tdata_in[191:176]}, {4'b0, tdata_in[223:208]}, out2to5);
    registered_add #(bitwidth) add3(clk, rst, {4'b0, tdata_in[239:224]}, {4'b0, tdata_in[255:240]}, out3to5);
    registered_add #(bitwidth) add4(clk, rst, out0to4, out1to4, out4to6);
    registered_add #(bitwidth) add5(clk, rst, out2to5, out3to5, out5to6);
    registered_add #(bitwidth) add6(clk, rst, out4to6, out5to6, out6to7);
    registered_add #(bitwidth) add7(clk, rst, out6to7, in_d, out7to8);
    registered_add #(16)       add8(clk, rst, out7to8[15:0], {{(32-bitwidth){1'b0}}, out7to8[bitwidth-1:16]}, checksum_inv); 
    register_pipe #(bitwidth,4) rp0(clk, rst, {4'b0, tdata_in[271:256]}, in_d);
    assign checksum = ~checksum_inv;
    
    // --------------- Output generation --------------- //
    register_pipe #((phit_size+phit_size/8+2),6) rp1(clk, rst, {tlast_in, tvalid_in, tkeep_in, tdata_in}, {tlast_d, tvalid_d, tkeep_d, tdata_d});
    
    mux2 #((phit_size+phit_size/8+1)) mux2_inst0(
            {tlast_d, tvalid_d, tkeep_d, tdata_d},
            {tlast_d, tvalid_d, (tkeep_d | is_header_byte), {tdata_d[phit_size-1:208],checksum,tdata_d[191:144],spl_val,tdata_d[127:0]}},
            sel_mux,
            {tlast_out, tvalid_out, tkeep_out, tdata_out} );
    
endmodule
