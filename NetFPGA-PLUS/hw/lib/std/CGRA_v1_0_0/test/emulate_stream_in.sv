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
    
    
    logic [2:0] state, next_state;
    logic [2:0] INACTIVE = 3'd0;
    logic [2:0] READ =     3'd1;
    logic [2:0] WRITE =    3'd2;
    logic [2:0] ADDR_R =   3'd3;
    logic [2:0] ADDR_W =   3'd4;
    
    logic rst;
    logic [7:0] read_len, write_len;
    logic [7:0] count, next_count;
    logic curr_axi_rready, curr_axi_wvalid;
    
    always @(posedge ap_clk) begin
        if (rst) begin
            next_state <= INACTIVE;
            next_count <= '0;
        end else begin
            state <= next_state;
            count <= next_count;
            curr_axi_rready <= axi_rready;
            curr_axi_wvalid <= axi_wvalid;
        end
    end
    
    always_comb begin
        rst = ~ap_rst_n;
        case(state)
            INACTIVE: begin
                if (axi_arvalid) begin
                    next_state = ADDR_R;
                end else if (axi_awvalid) begin
                    next_state = ADDR_W;
//                end else if (axi_rready) begin
//                    next_state = READ;
//                end else if (axi_wvalid) begin
//                    next_state = WRITE;
                end else begin
                    next_state = INACTIVE;
                end
                
                axi_arready = '0;
                axi_awready = '0;
                axi_bvalid  = '0;
                axi_rdata   = '0;
                axi_rlast   = '0;
                axi_rvalid  = '0;
                axi_wready  = '0;
            end
            READ: begin
                axi_arready = 1'b0;
                if (curr_axi_rready & (count < (read_len-1))) begin // if was ready at clock's edge and not done
                    axi_rdata = '0; // add something here
                    axi_rvalid = 1'b1;
                    axi_rlast = 1'b0;
                    next_count = count+1;
                end else if (curr_axi_rready & (count == (read_len-1))) begin // is last
                    axi_rdata = '0; // add something here
                    axi_rvalid = 1'b1;
                    axi_rlast = 1'b1;
                    next_state = INACTIVE;
                end else begin // if not ready
                    axi_rdata = '0;
                    axi_rvalid = 1'b0;
                    axi_rlast = 1'b0;
                end
            end
            WRITE: begin
                axi_awready = 1'b0;
                axi_wready = 1'b1;
                next_state = (axi_wlast) ? INACTIVE : WRITE;
            end
            ADDR_R: begin
                axi_arready = 1'b1;
                read_len = axi_arlen;
                next_state = READ;
            end
            ADDR_W: begin
                axi_awready = 1'b1;
                write_len = axi_awlen;
                next_state = WRITE;
            end
        endcase
    end
endmodule
