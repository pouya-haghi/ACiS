`timescale 1ns / 1ps
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module emulate_stream_in(
    input  logic                     ap_clk       ,
    input  logic                     ap_rst_n     ,
    
    output logic  [phit_size-1:0]    axis00_tdata ,
    output logic                     axis00_tvalid,
    input  logic                     axis00_tready,
    output logic                     axis00_tlast ,
    output logic  [phit_size/8-1:0]  axis00_tkeep ,
    // out                                
    input  logic [phit_size-1:0]     axis01_tdata ,
    input  logic                     axis01_tvalid,
    output logic                     axis01_tready,
    input  logic                     axis01_tlast ,
    input  logic [phit_size/8-1:0]   axis01_tkeep 
    );
    
    
    logic state, next_state;
    logic INACTIVE =  1'd0;
    logic STREAM_IN = 1'd1;
    
    logic rst;
    logic [31:0] count, next_count;
    
    assign axis01_tready = 1'b1; // always ready for streamout
    
    always @(posedge ap_clk) begin
        if (rst) begin
            next_state <= INACTIVE;
            next_count <= '0;
        end else begin
            state <= next_state;
            count <= next_count;
        end
    end
    
    logic [31:0] temp_float;
    float_generator fg_inst(count[4:0], temp_float);
    
    always_comb begin
        rst = ~ap_rst_n;
        case(state)
            INACTIVE: begin
                next_state = (axis00_tready) ? STREAM_IN : INACTIVE;
                axis00_tdata  = '0;
                axis00_tvalid = '0;
                axis00_tlast  = '0;
                axis00_tkeep  = '0;
            end 
            STREAM_IN: begin
                next_state = (axis00_tready) ? STREAM_IN : INACTIVE;
                axis00_tvalid = 1'b1;
                axis00_tkeep  = {(phit_size/8){1'b1}};
                if (count == 0) begin // if first clock of packet, insert header
                    axis00_tdata = {{(phit_size-32){1'b0}},32'h12345678};
                    axis00_tlast = 1'b0;
                    next_count = count+1;
                end else if (count == (packet_length-1)) begin // if last clock, assert tlast
                    axis00_tdata = {(phit_size/32){temp_float}};
                    axis00_tlast = 1'b1;
                    next_count = 0;
                end else begin // if somewhere in the middle
                    axis00_tdata = {(phit_size/32){temp_float}};
                    axis00_tlast  = 1'b0;
                    next_count = count+1;
                end
            end
        endcase
    end
endmodule
