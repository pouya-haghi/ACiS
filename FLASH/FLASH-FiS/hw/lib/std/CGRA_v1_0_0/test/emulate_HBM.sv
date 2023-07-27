`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module emulate_HBM(
    input  logic                     ap_clk     ,
    input  logic                     ap_rst_n   ,
    
    input  logic [dwidth_aximm-1:0]  axi_araddr , //ignore
    input  logic [7:0]               axi_arlen  , //length
    input  logic                     axi_arvalid, //addr valid
    input  logic [dwidth_aximm-1:0]  axi_awaddr , //ignore
    input  logic [7:0]               axi_awlen  , //len
    input  logic                     axi_awvalid, //addr valid
    input  logic                     axi_bready , //idk
    input  logic                     axi_rready , //read ready
    input  logic                     axi_wvalid , //write valid
    input  logic [phit_size-1:0]     axi_wdata  , //write data
    input  logic                     axi_wlast  , //write last
    input  logic [(phit_size/8)-1:0] axi_wstrb  , //idk
    input  logic [dwidth_RFadd-1:0] AXI_vlen,
    
    output logic                     axi_arready, //addr read ready
    output logic                     axi_awready, //addr write ready
    output logic                     axi_bvalid , //idk
    output logic [phit_size-1:0]     axi_rdata  , //read data
    output logic                     axi_rlast  , //read last
    output logic                     axi_rvalid , //read valid
    output logic                     axi_wready   //write ready
    );
    
    logic [2:0] state, next_state;
    logic [2:0] INACTIVE = 3'd0;
    logic [2:0] READ =     3'd1;
    logic [2:0] WRITE =    3'd2;
    logic [2:0] ADDR_R =   3'd3;
    logic [2:0] ADDR_W =   3'd4;
    logic [2:0] WAIT_ADDR_R = 3'd5;
    logic [2:0] WAIT_ADDR_W = 3'd6;
    
    logic rst;
    logic read_len_en, write_len_en;
    logic [dwidth_RFadd-1:0] read_len, write_len;
    logic [dwidth_RFadd-1:0] count, next_count;
    logic [9:0] delay_count_rd, next_delay_count_rd;
    logic [9:0] delay_count_wr, next_delay_count_wr;
    
    always_ff @(posedge ap_clk) begin
        if (rst) begin
            state <= INACTIVE;
            count <= '0;
            delay_count_rd <= '0;
            delay_count_wr <= '0;
            
        end else begin
            state <= next_state;
            count <= next_count;
            delay_count_rd <= next_delay_count_rd;
            delay_count_wr <= next_delay_count_wr;
        end
    end
    
    logic [31:0] temp_float;
    float_generator fg_inst(count[4:0], temp_float);
    assign rst = ~ap_rst_n;
    
    always_comb begin
        case(state)
            INACTIVE: begin
                if (axi_arvalid) begin
                    next_state = ADDR_R;
                    axi_arready = '0;
                    axi_awready = '0;
                    axi_rdata   = '0;
                    axi_rlast   = '0;
                    axi_rvalid  = '0;
                    axi_wready  = '0;
                    next_count = '0;
                    next_delay_count_rd = '0;
                    next_delay_count_wr = '0;
                end else if (axi_awvalid) begin
                    next_state = ADDR_W;
                    axi_arready = '0;
                    axi_awready = '0;
                    axi_rdata   = '0;
                    axi_rlast   = '0;
                    axi_rvalid  = '0;
                    axi_wready  = '0;
                    next_count = '0;
                    next_delay_count_rd = '0;
                    next_delay_count_wr = '0;
//                end else if (axi_rready) begin
//                    next_state = READ;
//                end else if (axi_wvalid) begin
//                    next_state = WRITE;
                end else begin
                    axi_arready = '0;
                    axi_awready = '0;
                    axi_rdata   = '0;
                    axi_rlast   = '0;
                    axi_rvalid  = '0;
                    axi_wready  = '0;
                    next_state = INACTIVE;
                    next_count = '0;
                    next_delay_count_rd = '0;
                    next_delay_count_wr = '0;
                end
            end
            READ: begin
                if (axi_rready & (count < (read_len-1))) begin // if was ready at clock's edge and not done
                    axi_rdata = {(phit_size/32){temp_float}};
                    axi_rvalid = 1'b1;
                    axi_rlast = 1'b0;
                    next_state = READ;
                    next_count = count+1;
                    axi_arready = 1'b0;
                    //
                    axi_awready = 1'b0;
                    axi_wready = 1'b0;
                    next_delay_count_rd = delay_count_rd;
                    next_delay_count_wr = delay_count_wr;
                end else if (axi_rready & (count == (read_len-1))) begin // is last
                    axi_rdata = {(phit_size/32){temp_float}};
                    axi_rvalid = 1'b1;
                    axi_rlast = 1'b1;
                    next_state = INACTIVE;
                    next_count = '0;
                    axi_arready = 1'b0;
                    //
                    axi_awready = 1'b0;
                    axi_wready = 1'b0;
                    next_delay_count_rd = delay_count_rd;
                    next_delay_count_wr = delay_count_wr;
                end else begin // if not ready
                    axi_rdata = '0;
                    axi_rvalid = 1'b0;
                    axi_rlast = 1'b0;
                    next_state = READ;
                    next_count = count;
                    axi_arready = 1'b0;
                    //
                    axi_awready = 1'b0;
                    axi_wready = 1'b0;
                    next_delay_count_rd = delay_count_rd;
                    next_delay_count_wr = delay_count_wr;
                end
            end
            WRITE: begin
                axi_rdata = '0;
                axi_rlast = 1'b0;
                axi_rvalid = 1'b0;
                axi_awready = 1'b0;
                axi_wready = 1'b1;
                axi_arready = 1'b0;
                next_state = (axi_wlast) ? INACTIVE : WRITE;
                next_count = count;
                next_delay_count_rd = delay_count_rd;
                next_delay_count_wr = delay_count_wr;
            end
            ADDR_R: begin
                axi_rdata = '0;
                axi_rlast = 1'b0;
                axi_rvalid = 1'b0;
                axi_awready = 1'b0;
                axi_wready = 1'b0;
                axi_arready = 1'b1;
                next_state = WAIT_ADDR_R;
                next_count = count;
                next_delay_count_rd = delay_count_rd;
                next_delay_count_wr = delay_count_wr;
            end
            WAIT_ADDR_R: begin
                if (delay_count_rd == delay_read_HBM - 1) begin
                    axi_rdata = '0;
                    axi_rlast = 1'b0;
                    axi_rvalid = 1'b0;
                    axi_awready = 1'b0;
                    axi_wready = 1'b0;
                    axi_arready = 1'b0;
                    next_state = READ;
                    next_count = count;
                    next_delay_count_rd = '0;
                    next_delay_count_wr = delay_count_wr;
                end else begin
                    axi_rdata = '0;
                    axi_rlast = 1'b0;
                    axi_rvalid = 1'b0;
                    axi_awready = 1'b0;
                    axi_wready = 1'b0;
                    axi_arready = 1'b0;
                    next_state = WAIT_ADDR_R;
                    next_count = count;
                    next_delay_count_rd = delay_count_rd + 1;
                    next_delay_count_wr = delay_count_wr;
                end
            end
            ADDR_W: begin
                axi_rdata = '0;
                axi_rlast = 1'b0;
                axi_rvalid = 1'b0;
                axi_awready = 1'b1;
                axi_wready = 1'b0;
                axi_arready = 1'b0;
                next_state = WRITE;
                next_count = count;
                next_delay_count_rd = delay_count_rd;
                next_delay_count_wr = delay_count_wr;
            end
            WAIT_ADDR_W: begin
                if (delay_count_wr == delay_write_HBM - 1) begin
                    axi_rdata = '0;
                    axi_rlast = 1'b0;
                    axi_rvalid = 1'b0;
                    axi_awready = 1'b0;
                    axi_wready = 1'b0;
                    axi_arready = 1'b0;
                    next_state = WRITE;
                    next_count = count;
                    next_delay_count_rd = delay_count_rd;
                    next_delay_count_wr = '0;
                end else begin
                    axi_rdata = '0;
                    axi_rlast = 1'b0;
                    axi_rvalid = 1'b0;
                    axi_awready = 1'b0;
                    axi_wready = 1'b0;
                    axi_arready = 1'b0;
                    next_state = WAIT_ADDR_W;
                    next_count = count;
                    next_delay_count_rd = delay_count_rd;
                    next_delay_count_wr = delay_count_wr + 1;
                end
            end
        endcase
    end
    
    // registering read_len
    always_ff @(posedge ap_clk) begin
    if(rst) begin
        read_len <= '0;
    end else if (read_len_en) begin
//        read_len <= axi_arlen;
        read_len <= AXI_vlen;
    end
    end
    
    // registering write_len
    always_ff @(posedge ap_clk) begin
    if(rst) begin
        write_len <= '0;
    end else if (write_len_en) begin
        write_len <= AXI_vlen;
    end
    end
    
    assign read_len_en = (state==INACTIVE && axi_arvalid);
    assign write_len_en = (state==INACTIVE && axi_awvalid);
    assign axi_bvalid  = (axi_bready)? 1'b1 : 1'b0;
    
endmodule
