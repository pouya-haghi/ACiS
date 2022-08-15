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
        input  logic is_header,
        input  logic header_in;
        input  logic [phit_size-1:0]   tdata_in,
        input  logic [SIMD_degree-1:0] tvalid_in,
        input  logic [SIMD_degree-1:0] tlast_in,
        output logic [phit_size-1:0]   tdata_out,
        output logic [SIMD_degree-1:0] tvalid_out,
        output logic [SIMD_degree-1:0] tlast_out 
    );
    
    logic [15:0] spl_val;
    
    localparam bitwidth = 20;
    logic [bitwidth-1:0] out0to4, out1to4, out2to5, out3to5, out4to6, out5to6, out6to7, out7to8, in_d;
    logic [15:0] checksum_inv, checksum;
    
    logic [phit_size-1:0]   tdata_d;
    logic [SIMD_degree-1:0] tvalid_d;
    logic [SIMD_degree-1:0] tlast_d;

    logic is_header_d;
    logic [header_bytes*8-1:0] header_in_d;
    logic [header_bytes*8-1:0] header_out, header_out_t;
    
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
    
    logic [1:0] state, state_prev;
    logic [1:0] IDLE = 2'b0;
    logic [1:0] HEADER = 2'b1;
    logic [1:0] PAYLOAD = 2'b10;
    
    // delayed portion of beat
    logic [({header_bytes*8)-1):0] tdata_d;
    logic [header_deg-1:0] tlast_d;
    logic [header_deg-1:0] tvalid_d;
    
    // --------------- Checksum and header generation --------------- //    
    registered_add #(bitwidth) add0(clk, rst, {4'b0, header_in[127:112]}, {4'b0, spl_val}, out0to4);
    registered_add #(bitwidth) add1(clk, rst, {4'b0, header_in[159:144]}, {4'b0, header_in[175:160]}, out1to4);
    registered_add #(bitwidth) add2(clk, rst, {4'b0, header_in[191:176]}, {4'b0, header_in[223:208]}, out2to5);
    registered_add #(bitwidth) add3(clk, rst, {4'b0, header_in[239:224]}, {4'b0, header_in[255:240]}, out3to5);
    registered_add #(bitwidth) add4(clk, rst, out0to4, out1to4, out4to6);
    registered_add #(bitwidth) add5(clk, rst, out2to5, out3to5, out5to6);
    registered_add #(bitwidth) add6(clk, rst, out4to6, out5to6, out6to7);
    registered_add #(bitwidth) add7(clk, rst, out6to7, in_d, out7to8);
    registered_add #(16)       add8(clk, rst, out7to8[15:0], {{(32-bitwidth){1'b0}}, out7to8[bitwidth-1:16]}, checksum_inv); 
    register_pipe #(bitwidth,4) rp0(clk, rst, {4'b0, header_in[271:256]}, in_d);
    assign checksum = ~checksum_inv;

    register_pipe #((header_bytes*8+1),6) rp1(clk, rst, {is_header, header_in}, {is_header_d, header_in_d});

    always_ff @(posedge clk) begin
        if (rst)
            header_out = '0;
        else
            header_out <= header_out_t;
    end

    always_comb begin
        header_out_t = (is_header_d) ? {header_in_d[phit_size-1:208],checksum,header_in_d[191:144],spl_val,header_in_d[127:0]} : header_out_t;
    end

    // --------------- Packet re-wrapping --------------- //
    always_ff @(posedge clk) begin
        if(rst) begin
           state_prev <= IDLE;
           tdata_out <= '0;
        end
        else begin
           state_prev <= state;
           tdata_out <= (state == HEADER) ? {tdata_in[phit_size-header_bytes*8-1:0], header}, {tdata_in[phit_size-header_bytes*8-1:0], tdata_d};
           //             is tlast      but end isn't valid                                 or   is delayed tlast and is valid
           tlast_out <= ((|tlast_in && !(|tvalid_in[phit_size-1:phit_size-header_bytes*8])) || (|tlast_d && |tvalid_d)) ? {SIMD_degree{1'b1}} : {SIMD_degree{1'b1}};
           tvalid_out <= (state == HEADER) ? {tvalid_in[SIMD_degree-header_deg-1:0], {header_deg{1'b1}}} : {tvalid_in[SIMD_degree-header_deg-1:0], tvalid_d};
        end
    end
    
    always_comb begin
        case(state_prev)
            IDLE: begin
                if (is_vstreamout_global) begin
                    state = HEADER;
                    tdata_d = tdata_in[phit_size-1:phit_size-header_bytes*8];
                    tlast_d = tlast_in[SIMD_degree-1:SIMD_degree-header_deg];
                    tvalid_d= tvalid_in[SIMD_degree-1:SIMD_degree-header_deg];
                end else begin
                    state = IDLE;
                    tdata_d = '0;
                    tlast_d = '0;
                    tvalid_d= '0;
                end
            end

            HEADER: begin
                state = (tlast_in) ? IDLE : PAYLOAD;
                tdata_d = tdata_in[phit_size-1:phit_size-header_bytes*8];
                tlast_d = tlast_in[SIMD_degree-1:SIMD_degree-header_deg];
                tvalid_d= tvalid_in[SIMD_degree-1:SIMD_degree-header_deg];
            end
            
            PAYLOAD: begin
                state = (tlast_in) ? IDLE : PAYLOAD;
                tdata_d = tdata_in[phit_size-1:phit_size-header_bytes*8];
                tlast_d = tlast_in[SIMD_degree-1:SIMD_degree-header_deg];
                tvalid_d= tvalid_in[SIMD_degree-1:SIMD_degree-header_deg];
            end

            default: begin
                state = state_prev;
                tdata_d = '0;
                tlast_d = '0;
                tvalid_d = '0;
            end
        endcase 
    end
endmodule

// to do: change re-wrapping logic, add bubble logic
