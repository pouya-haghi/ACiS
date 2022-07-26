`timescale 1ns / 1ps

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif


module test_emulators;
    reg                      ap_clk;
    reg                      ap_rst_n;

    wire                     axi_arready ;
    wire                     axi_awready ;
    wire                     axi_bvalid  ;
    wire [phit_size-1:0]     axi_rdata   ;
    wire                     axi_rlast   ;
    wire                     axi_rvalid  ;
    wire                     axi_wready  ;
    reg [dwidth_aximm-1:0]   axi_araddr  ;
    reg [7:0]                axi_arlen   ;
    reg                      axi_arvalid ;
    reg [dwidth_aximm-1:0]   axi_awaddr  ;
    reg [7:0]                axi_awlen   ;
    reg                      axi_awvalid ;
    reg                      axi_bready  ;
    reg                      axi_rready  ;
    reg                      axi_wvalid  ;
    reg [phit_size-1:0]      axi_wdata   ;
    reg                      axi_wlast   ;
    reg [(phit_size/8)-1:0]  axi_wstrb   ;
    
    emulate_HBM emulate_HBM_inst(.*);
    
    always begin
        #5;
        ap_clk = ~ap_clk;
    end
    
    initial begin
        ap_clk     ='0;
        ap_rst_n   ='0;
        axi_araddr ='0;
        axi_arlen  ='0;
        axi_arvalid='0;
        axi_awaddr ='0;
        axi_awlen  ='0;
        axi_awvalid='0;
        axi_bready ='0;
        axi_rready ='0;
        axi_wvalid ='0;
        axi_wdata  ='0;
        axi_wlast  ='0;
        axi_wstrb  ='0;
        #20;
        ap_rst_n = 1'b1;
        #40;
        
        // test read
        axi_arvalid = 1'b1;
        axi_arlen = 8'd4;
        #10;
        axi_rready = 1'b1;
        #10;
        axi_arvalid = 1'b0;
        #10;              
        axi_rready = 1'b0; // stall
        #10;              
        axi_rready = 1'b1;
        #30;
        axi_rready = 1'b1;
        #10;
        
        // test write
        axi_awvalid = 1'b1;
        axi_awlen = 8'd4;
        #50; 
        
        axi_araddr ='0;
        axi_arlen  ='0;
        axi_arvalid='0;
        axi_awaddr ='0;
        axi_awlen  ='0;
        axi_awvalid='0;
        axi_bready ='0;
        axi_rready ='0;
        axi_wvalid ='0;
        axi_wdata  ='0;
        axi_wlast  ='0;
        axi_wstrb  ='0;
        
        
        $finish;
        
    end
endmodule
