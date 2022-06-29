`timescale 1ns / 1ps
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_top;
    // General I/O                                                           
    reg                      clk                    ;
    wire                     rst                    ;
    // --------- Control Plane --------- //
    // Other                          
    reg  [dwidth_HBMadd-1:0] ctrl_addr_offset       ;               
    reg  [phit_size-1:0]     ctrl_xfer_size_in_bytes;               
    wire                     interrupt              ;               
                                                    ;                         
    // AXI Lite                                         
    //inputs                                                            
    reg  [dwidth_HBMadd-1:0] s_axi_control_araddr   ;           
    reg  [dwidth_HBMadd-1:0] s_axi_control_arvalid  ;           
    reg                      s_axi_control_awaddr   ;           
    reg                      s_axi_control_awvalid  ;           
    reg                      s_axi_control_bready   ;           
    reg                      s_axi_control_rready   ;           
    reg  [phit_size-1:0]     s_axi_control_wdata    ;           
    reg  [phit_size/8-1:0]   s_axi_control_wstrb    ;           
    reg                      s_axi_control_wvalid   ;           
    //output                                                  
    wire                     s_axi_control_arready  ;           
    wire                     s_axi_control_awready  ;           
    wire [1:0]               s_axi_control_bresp    ;           
    wire                     s_axi_control_bvalid   ;           
    wire [phit_size-1:0]     s_axi_control_rdata    ;           
    wire                     s_axi_control_rvalid   ;           
    wire [1:0]               s_axi_control_rresp    ;           
    wire                     s_axi_control_wready   ;           
                                                                     
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
    
    always begin
        
        
    end
    
    
    initial begin
    
    
    $finish;
    end

endmodule
