`timescale 1ns / 1ps
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module disassembler(
    input  logic                   clk,
    input  logic                   rst,
    input  logic [phit_size-1:0]   tdata_in,
    input  logic [phit_size/8-1:0] tkeep_in,
    input  logic                   tready_in,
    input  logic                   tlast_in,
    input  logic                   tvalid_in,
    input  logic [SIMD_degree-1:0] empty,
    output logic                   is_header,
    output logic [phit_size-1:0]   tdata_out,
    output logic [SIMD_degree-1:0] tlast_out,
    output logic [SIMD_degree-1:0] tvalid_out
    );
    
    logic [SIMD_degree-1:0] tkeep_condensed;
    logic [phit_size/8-1:0] tkeep_out;
    
    logic is_header_t;

    // control singnals
    logic [1:0] state, state_prev;
    logic [1:0] IDLE = 2'b00;
    logic [1:0] HEADER = 2'b01;
    logic [1:0] PAYLOAD = 2'b10;
    
    // delayed portion of beat
    logic [(phit_size-(header_bytes*8)-1):0] tdata_d;
    logic [(phit_size/8-header_bytes-1):0] tkeep_d;
    logic tlast_d;
    logic tvalid_d;
    
    // temp - delayed portion of beat
    logic [(phit_size-(header_bytes*8)-1):0] tdata_t;
    logic [(phit_size/8-header_bytes-1):0] tkeep_t;
    logic tlast_t;
    logic tvalid_t;
    
    always_ff @(posedge clk) begin
        if(rst) begin
            state_prev <= IDLE;
            tdata_d <= '0;
            tkeep_d <= '0;
            tlast_d <= '0;
            tvalid_d <= '0;
        end
        else begin
            state_prev <= state;
            tdata_d   <= tdata_t    ;
            tkeep_d   <= tkeep_t    ;
            tlast_d   <= tlast_t    ;
            tvalid_d  <= tvalid_t   ;          
        end
    end
    
    assign tdata_out = {tdata_in[header_bytes*8-1:0], tdata_d};
    assign tkeep_out = {tkeep_in[header_bytes-1:0], tkeep_d};
    //            is tlast      but end isn't kept                      or   is delayed tlast and is valid
    assign tlast_out = ((tlast_in && !(|tkeep_in[phit_size/8-1:header_bytes])) || (|tkeep_d && tlast_d && tvalid_d)) ? {SIMD_degree{1'b1}} : {SIMD_degree{1'b0}};
    assign tvalid_out = (tvalid_d && !is_header) ? tkeep_condensed : '0;
    assign is_header = is_header_t;
        
    // assign tkeep/tvalid for each float as and of whole float
    genvar i;
    generate
        for (i=0; i<SIMD_degree; i++)
            assign tkeep_condensed[i] = &tkeep_out[4*(i+1)-1:4*i];
    endgenerate

    always_comb begin
        if (tready_in && tvalid_in) begin
            case(state_prev)
                IDLE: begin
                    if (!(&empty) && !tlast_in) begin
                        state = HEADER;
                        tdata_t = tdata_in[phit_size-1:header_bytes*8];
                        tkeep_t = tkeep_in[phit_size/8-1:header_bytes];
                        tlast_t = tlast_in;
                        tvalid_t= tvalid_in;
                        is_header_t = 1'b1;
                    end else begin
                        state = IDLE;
                        tdata_t = '0;
                        tkeep_t = '0;
                        tlast_t = '0;
                        tvalid_t= '0;                        
                        is_header_t = '0;
                    end
                end
    
                HEADER: begin
                    state = (tlast_in) ? IDLE : PAYLOAD;
                    tdata_t = tdata_in[phit_size-1:header_bytes*8];
                    tkeep_t = tkeep_in[phit_size/8-1:header_bytes];
                    tlast_t = tlast_in;
                    tvalid_t= tvalid_in;
                    is_header_t = '0;
                end
                
                PAYLOAD: begin
                    state = (tlast_in) ? IDLE : PAYLOAD;
                    tdata_t = tdata_in[phit_size-1:header_bytes*8];
                    tkeep_t = tkeep_in[phit_size/8-1:header_bytes];
                    tlast_t = tlast_in;
                    tvalid_t= tvalid_in;
                    is_header_t = '0;
                end

                default: begin
                    state = state_prev;
                    tdata_t = tdata_t;
                    tkeep_t = tkeep_t;
                    tlast_t = tlast_t;
                    tvalid_t= tvalid_t;
                    is_header_t = is_header_t;
                end
            endcase 
        end
        else begin
            state = state_prev;
            tdata_t = (state != IDLE) ? tdata_t : '0;
            tkeep_t = (state != IDLE) ? tkeep_t : '0;
            tlast_t = (state != IDLE) ? tlast_t : '0;
            tvalid_t= (state != IDLE) ? tvalid_t: '0;
            is_header_t = '0;
        end
    end  
    
endmodule
