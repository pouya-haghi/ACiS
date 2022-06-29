`timescale 1ns / 1ps
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_top;
    // General I/O                                                           
    reg                      clk                    ;
    reg                      rst                    ;
    // --------- Control Plane --------- //
    // Other                          
    wire                     interrupt              ;               
                                                    ;                         
    // AXI Lite                                         
    //inputs                                                            
    reg  [C_S_AXI_ADDR_WIDTH-1:0]   s_axi_control_araddr   ;           
    reg                             s_axi_control_arvalid  ;           
    reg  [C_S_AXI_ADDR_WIDTH-1:0]   s_axi_control_awaddr   ;           
    reg                             s_axi_control_awvalid  ;           
    reg                             s_axi_control_bready   ;           
    reg                             s_axi_control_rready   ;           
    reg  [C_S_AXI_DATA_WIDTH-1:0]   s_axi_control_wdata    ;           
    reg  [C_S_AXI_DATA_WIDTH/8-1:0] s_axi_control_wstrb    ;           
    reg                             s_axi_control_wvalid   ;           
    //output                                                  
    wire                          s_axi_control_arready  ;           
    wire                          s_axi_control_awready  ;           
    wire [1:0]                    s_axi_control_bresp    ;           
    wire                          s_axi_control_bvalid   ;           
    wire [C_S_AXI_DATA_WIDTH-1:0] s_axi_control_rdata    ;           
    wire                          s_axi_control_rvalid   ;           
    wire [1:0]                    s_axi_control_rresp    ;           
    wire                          s_axi_control_wready   ;           
                                                                     
    // AXI MM                                         
    //input                                                          
    reg                      m00_axi_arready        ;           
    reg  [phit_size-1:0]     m00_axi_rdata          ;           
    reg                      m00_axi_rlast          ;           
    reg                      m00_axi_rvalid         ;           
    //output                                                      
    wire [dwidth_HBMadd-1:0] m00_axi_araddr         ;           
    wire [8-1:0]             m00_axi_arlen          ;           
    wire                     m00_axi_arvalid        ;           
    wire                     m00_axi_rready         ;           
                                                                
    // --------- Data Path --------- //
    // Stream                                                   
    // input                                                    
    reg  [phit_size-1:0]     axis00_tdata           ;           
    reg  [SIMD_degree-1:0]   axis00_tvalid          ;           
    reg  [SIMD_degree-1:0]   axis01_tready          ;           
    // output                                       ;                   
    wire [phit_size-1:0]     axis01_tdata           ;           
    wire [SIMD_degree-1:0]   axis01_tvalid          ;           
    wire [SIMD_degree-1:0]   axis00_tready          ;           
                                                                       
    // AXI Col 1                                                           
    //input                                                            
    reg                      m01_axi_arready        ;
    reg                      m01_axi_awready        ;
    reg                      m01_axi_bvalid         ;
    reg  [phit_size-1:0]     m01_axi_rdata          ;
    reg                      m01_axi_rlast          ;
    reg                      m01_axi_rvalid         ;
    reg                      m01_axi_wready         ;
    //output                               
    wire [dwidth_aximm-1:0]  m01_axi_araddr         ;
    wire [7:0]               m01_axi_arlen          ;
    wire                     m01_axi_arvalid        ;
    wire [dwidth_aximm-1:0]  m01_axi_awaddr         ;
    wire [7:0]               m01_axi_awlen          ;
    wire                     m01_axi_awvalid        ;
    wire                     m01_axi_bready         ;
    wire                     m01_axi_rready         ;
    wire                     m01_axi_wvalid         ;
    wire [phit_size-1:0]     m01_axi_wdata          ;
    wire                     m01_axi_wlast          ;
    wire [(phit_size/8)-1:0] m01_axi_wstrb          ;
                                         
    // AXI Col 2                             
    //input                              
    reg                      m02_axi_arready        ;
    reg                      m02_axi_awready        ;
    reg                      m02_axi_bvalid         ;
    reg  [phit_size-1:0]     m02_axi_rdata          ;
    reg                      m02_axi_rlast          ;
    reg                      m02_axi_rvalid         ;
    reg                      m02_axi_wready         ;
    //output                              
    wire [dwidth_aximm-1:0]  m02_axi_araddr         ;
    wire [7:0]               m02_axi_arlen          ;
    wire                     m02_axi_arvalid        ;
    wire [dwidth_aximm-1:0]  m02_axi_awaddr         ;
    wire [7:0]               m02_axi_awlen          ;
    wire                     m02_axi_awvalid        ;
    wire                     m02_axi_bready         ;
    wire                     m02_axi_rready         ;
    wire                     m02_axi_wvalid         ;
    wire [phit_size-1:0]     m02_axi_wdata          ;
    wire                     m02_axi_wlast          ;
    wire [(phit_size/8)-1:0] m02_axi_wstrb          ;
    
    top top_inst0(.*);    
    
    always begin
        clk = 1'b1;
        #(clk_pd/2);
        clk = 1'b0;
        #(clk_pd/2);        
    end
    
    
    initial begin
        // Reset
        rst                     = 1'b1;
        
        s_axi_control_araddr    <= 5'b0;
        s_axi_control_arvalid   <= 1'b0;
        s_axi_control_awaddr    <= 5'b0;
        s_axi_control_awvalid   <= 1'b0;
        s_axi_control_bready    <= 1'b0;
        s_axi_control_rready    <= 1'b0;
        s_axi_control_wdata     <= 32'b0;
        s_axi_control_wstrb     <= 4'b0;
        s_axi_control_wvalid    <= 1'b0;
        m00_axi_arready         <= 1'b0;
        m00_axi_rdata           <= 512'b0;
        m00_axi_rlast           <= 1'b0;
        m00_axi_rvalid          <= 32'b0;
        axis00_tdata            <= 512'b0;
        axis00_tvalid           <= 32'b0;
        axis01_tready           <= 1'b0;
        m01_axi_arready         <= 1'b0;
        m01_axi_awready         <= 1'b0;
        m01_axi_bvalid          <= 32'b0;
        m01_axi_rdata           <= 512'b0;
        m01_axi_rlast           <= 1'b0;
        m01_axi_rvalid          <= 32'b0;
        m01_axi_wready          <= 1'b0;
        m02_axi_arready         <= 1'b0;
        m02_axi_awready         <= 1'b0;
        m02_axi_bvalid          <= 32'b0;
        m02_axi_rdata           <= 512'b0;
        m02_axi_rlast           <= 1'b0;
        m02_axi_rvalid          <= 32'b0;
        m02_axi_wready          <= 1'b0;
        
        #40; rst = 1'b0;
        // trigger ap_start
        s_axi_control_awaddr <= 5'b0;
        s_axi_control_awvalid <= 1'b1;
//        s_axi_control_wvalid <= 1'b0;
        #80;
        s_axi_control_awvalid <= 1'b0;
        s_axi_control_wstrb[0] <= 1'b1;
        s_axi_control_wdata[0] <= 1'b1;
        s_axi_control_wvalid <= 1'b1;
        #40;
        // de-assert signals to release ctrl_start
        s_axi_control_wstrb[0] <= 1'b0;
        s_axi_control_wdata[0] <= 1'b0;
        s_axi_control_wvalid <= 1'b0;
        #100;
    $finish;
    end

endmodule
