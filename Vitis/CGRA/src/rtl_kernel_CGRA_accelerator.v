`timescale 1ns / 1ps

//`ifndef MY_INTERFACE
//  `define MY_INTERFACE
//  `include "my_interface.vh"
//`endif

module rtl_kernel_CGRA_accelerator #(
    parameter C_S_AXI_ADDR_WIDTH = 5,
    parameter C_S_AXI_DATA_WIDTH = 32,
    parameter C_M_AXI_ADDR_WIDTH = 64,
    parameter phit_size = 512,
    parameter dwidth_aximm = 64,
    parameter num_col = 2,
    parameter dwidth_int = 32

)

(
    // General I/O
    input wire                ap_clk,
    input wire                ap_reset_n,
//    output wire [dwidth_int-1:0]    csr_out,
    // Control Plane other 
    output wire                     interrupt,
    
    // AXI Lite Control Plane                               
    //inputs                                                
    input  wire [C_S_AXI_ADDR_WIDTH-1:0]   s_axi_control_araddr  ,
    input  wire                            s_axi_control_arvalid ,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0]   s_axi_control_awaddr  ,
    input  wire                            s_axi_control_awvalid ,
    input  wire                            s_axi_control_bready  ,
    input  wire                            s_axi_control_rready  ,
    input  wire [C_S_AXI_DATA_WIDTH-1:0]   s_axi_control_wdata   ,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] s_axi_control_wstrb   ,
    input  wire                            s_axi_control_wvalid  ,
    //output                                               ,
    output wire                            s_axi_control_arready ,
    output wire                            s_axi_control_awready ,
    output wire [1:0]                      s_axi_control_bresp   ,
    output wire                            s_axi_control_bvalid  ,
    output wire [C_S_AXI_DATA_WIDTH-1:0]   s_axi_control_rdata   ,
    output wire                            s_axi_control_rvalid  ,
    output wire [1:0]                      s_axi_control_rresp   ,
    output wire                            s_axi_control_wready  ,
    
    // AXI MM Control Plane                         
    //input                                         
    input  wire                     m00_axi_arready  ,
    input  wire                     m00_axi_awready  ,
    input  wire                     m00_axi_bvalid   ,
    input  wire [phit_size-1:0]     m00_axi_rdata    ,
    input  wire                     m00_axi_rlast    ,
    input  wire                     m00_axi_rvalid   ,
    input  wire                     m00_axi_wready   ,
    //output                                          ,
    output wire [C_M_AXI_ADDR_WIDTH-1:0] m00_axi_araddr   ,
    output wire [8-1:0]             m00_axi_arlen    ,
    output wire                     m00_axi_arvalid  ,
    output wire [dwidth_aximm-1:0]  m00_axi_awaddr   ,
    output wire [7:0]               m00_axi_awlen    ,
    output wire                     m00_axi_awvalid  ,
    output wire                     m00_axi_bready   ,
    output wire                     m00_axi_rready   ,
    output wire                     m00_axi_wvalid   ,
    output wire [phit_size-1:0]     m00_axi_wdata    ,
    output wire                     m00_axi_wlast    ,
    output wire [(phit_size/8)-1:0] m00_axi_wstrb    ,
    
    // Data Path
    // Stream
    // Stream in
    input  wire [phit_size-1:0]     axis00_tdata      ,
    input  wire                     axis00_tvalid     ,
    input  wire                     axis00_tlast     ,
    output wire                     axis00_tready     ,
    input  wire [phit_size/8-1:0]   axis00_tkeep     ,
    // Stream out
    output wire [phit_size-1:0]     axis01_tdata      ,
    output wire                     axis01_tvalid     ,
    output wire                     axis01_tlast     ,
    input  wire                     axis01_tready     ,
    output wire [phit_size/8-1:0]   axis01_tkeep     ,
    
    // Col 1
    //input
    input  wire                     m01_axi_arready  ,
    input  wire                     m01_axi_awready  ,
    input  wire                     m01_axi_bvalid   ,
    input  wire [phit_size-1:0]     m01_axi_rdata    ,
    input  wire                     m01_axi_rlast    ,
    input  wire                     m01_axi_rvalid   ,
    input  wire                     m01_axi_wready   ,
    //output                        
    output wire [dwidth_aximm-1:0]  m01_axi_araddr   ,
    output wire [7:0]               m01_axi_arlen    ,
    output wire                     m01_axi_arvalid  ,
    output wire [dwidth_aximm-1:0]  m01_axi_awaddr   ,
    output wire [7:0]               m01_axi_awlen    ,
    output wire                     m01_axi_awvalid  ,
    output wire                     m01_axi_bready   ,
    output wire                     m01_axi_rready   ,
    output wire                     m01_axi_wvalid   ,
    output wire [phit_size-1:0]     m01_axi_wdata    ,
    output wire                     m01_axi_wlast    ,
    output wire [(phit_size/8)-1:0] m01_axi_wstrb    ,
    
    // Col 2
    //input
    input  wire                     m02_axi_arready  ,
    input  wire                     m02_axi_awready  ,
    input  wire                     m02_axi_bvalid   ,
    input  wire [phit_size-1:0]     m02_axi_rdata    ,
    input  wire                     m02_axi_rlast    ,
    input  wire                     m02_axi_rvalid   ,
    input  wire                     m02_axi_wready   ,
    //output                           
    output wire [dwidth_aximm-1:0]  m02_axi_araddr   ,
    output wire [7:0]               m02_axi_arlen    ,
    output wire                     m02_axi_arvalid  ,
    output wire [dwidth_aximm-1:0]  m02_axi_awaddr   ,
    output wire [7:0]               m02_axi_awlen    ,
    output wire                     m02_axi_awvalid  ,
    output wire                     m02_axi_bready   ,
    output wire                     m02_axi_rready   ,
    output wire                     m02_axi_wvalid   ,
    output wire [phit_size-1:0]     m02_axi_wdata    ,
    output wire                     m02_axi_wlast    ,
    output wire [(phit_size/8)-1:0] m02_axi_wstrb    
    
//    // Col 3
//    //input
//    input  wire                     m01_axi_arready  ,
//    input  wire                     m01_axi_awready  ,
//    input  wire                     m01_axi_bvalid   ,
//    input  wire [phit_size-1:0]     m01_axi_rdata    ,
//    input  wire                     m01_axi_rlast    ,
//    input  wire                     m01_axi_rvalid   ,
//    input  wire                     m01_axi_wready   ,
//    //output                        
//    output wire [width_aximm-1:0]   m01_axi_araddr   ,
//    output wire [7:0]               m01_axi_arlen    ,
//    output wire                     m01_axi_arvalid  ,
//    output wire [dwidth_aximm-1:0]  m01_axi_awaddr   ,
//    output wire [7:0]               m01_axi_awlen    ,
//    output wire                     m01_axi_awvalid  ,
//    output wire                     m01_axi_bready   ,
//    output wire                     m01_axi_rready   ,
//    output wire                     m01_axi_wvalid   ,
//    output wire [phit_size-1:0]     m01_axi_wdata    ,
//    output wire                     m01_axi_wlast    ,
//    output wire [(phit_size/8)-1:0] m01_axi_wstrb    ,
    
//    ...
    
    );
    // Internal Signals
    wire [(num_col*dwidth_int)-1:0] instr;
    wire done_loader;
    wire [num_col-1:0] clken_PC;
    wire [num_col-1:0] load_PC;
    wire [num_col-1:0] incr_PC;
    wire [num_col*12-1:0] load_value_PC;
    wire [dwidth_int-1:0] cycle_register;
    reg areset;

    // Data Path concatinated signals       
    //input
    wire [num_col-1:0]                 data_arready;
    wire [num_col-1:0]                 data_awready;
    wire [num_col-1:0]                 data_bvalid ;
    wire [(phit_size*num_col)-1:0]     data_rdata  ;
    wire [num_col-1:0]                 data_rlast  ;
    wire [num_col-1:0]                 data_rvalid ;
    wire [num_col-1:0]                 data_wready ;
    
    // we dont need write portion of AXI_mm0 (we only read from it to load config tables); making all of them invalid
    assign m00_axi_awaddr = {(dwidth_aximm){1'b0}};
    assign m00_axi_awlen = {(8){1'b0}};
    assign m00_axi_awvalid = 1'b0;
    assign m00_axi_bready = 1'b0;
    assign m00_axi_wvalid = 1'b0;
    assign m00_axi_wdata = {(phit_size){1'b0}};
    assign m00_axi_wlast = 1'b0;
    assign m00_axi_wstrb = {(phit_size/8){1'b0}};
    
    assign data_arready = {m02_axi_arready , m01_axi_arready};
    assign data_awready = {m02_axi_awready , m01_axi_awready};
    assign data_bvalid  = {m02_axi_bvalid  , m01_axi_bvalid };
    assign data_rdata   = {m02_axi_rdata   , m01_axi_rdata  };
    assign data_rlast   = {m02_axi_rlast   , m01_axi_rlast  };
    assign data_rvalid  = {m02_axi_rvalid  , m01_axi_rvalid };
    assign data_wready  = {m02_axi_wready  , m01_axi_wready };
    
    //outputs
    wire [(dwidth_aximm*num_col)-1:0]  data_araddr  ; 
    wire [(num_col*8)-1:0]             data_arlen   ; 
    wire [num_col-1:0]                 data_arvalid ; 
    wire [(dwidth_aximm*num_col)-1:0]  data_awaddr  ; 
    wire [(num_col*8)-1:0]             data_awlen   ; 
    wire [num_col-1:0]                 data_awvalid ; 
    wire [num_col-1:0]                 data_bready  ; 
    wire [num_col-1:0]                 data_rready  ; 
    wire [num_col-1:0]                 data_wvalid  ; 
    wire [(num_col*phit_size)-1:0]     data_wdata   ; 
    wire [num_col-1:0]                 data_wlast   ; 
    wire [(num_col*(phit_size/8))-1:0] data_wstrb   ; 
    
    wire ap_done;
    wire done_steady;


    always @(posedge ap_clk) begin
      areset <= ~ap_reset_n;
    end
    
    control_plane control_plane_inst0(
        //inputs
        .ap_clk                     (ap_clk),  
        .ap_rst_n                   (ap_reset_n),
        .ap_done_i                  (ap_done),
        .AWADDR                     (s_axi_control_awaddr),               
        .AWVALID                    (s_axi_control_awvalid),               
        .WDATA                      (s_axi_control_wdata),               
        .WSTRB                      (s_axi_control_wstrb),               
        .WVALID                     (s_axi_control_wvalid),               
        .BREADY                     (s_axi_control_bready),               
        .ARADDR                     (s_axi_control_araddr),               
        .ARVALID                    (s_axi_control_arvalid),               
        .RREADY                     (s_axi_control_rready),    
        .m_axi_arready              (m00_axi_arready),
        .m_axi_rvalid               (m00_axi_rvalid),
        .m_axi_rdata                (m00_axi_rdata),
        .m_axi_rlast                (m00_axi_rlast),
        .done_steady                (done_steady),
        .clken_PC                   (clken_PC),
        .load_PC                    (load_PC),
        .incr_PC                    (incr_PC),
        .load_value_PC              (load_value_PC),
        //outputs        
        .AWREADY                    (s_axi_control_awready),                
        .WREADY                     (s_axi_control_wready),                
        .BRESP                      (s_axi_control_bresp),                
        .BVALID                     (s_axi_control_bvalid),                
        .ARREADY                    (s_axi_control_arready),                
        .RDATA                      (s_axi_control_rdata),                
        .RRESP                      (s_axi_control_rresp),                
        .RVALID                     (s_axi_control_rvalid),                
        .interrupt                  (interrupt),                
        .m_axi_arvalid              (m00_axi_arvalid),
        .m_axi_araddr               (m00_axi_araddr),
        .m_axi_arlen                (m00_axi_arlen),
        .m_axi_rready               (m00_axi_rready),
        .cycle_register             (cycle_register),
        .instr                      (instr),
        .done_loader                (done_loader));
        
    data_path data_path_inst0(
        //inputs
        .done_loader                (done_loader),
        .instr                      (instr),
        .clk                        (ap_clk),
        .rst                        (areset),
        .ap_done                    (ap_done),
        .done_steady                (done_steady),
        .tdata_stream_in            (axis00_tdata),
        .tvalid_stream_in           (axis00_tvalid),
        .tready_stream_out          (axis01_tready),
        .tlast_stream_in            (axis00_tlast),
        .tkeep_stream_in            (axis00_tkeep),
        .arready_HBM                (data_arready),
        .rvalid_HBM                 (data_rvalid),
        .rdata_HBM                  (data_rdata),
        .rlast_HBM                  (data_rlast),
        .wready_HBM                 (data_wready),
        .bvalid_HBM                 (data_bvalid),
        .awready_HBM                (data_awready),
        .cycle_register             (cycle_register),
        //outputs
        .tready_stream_in           (axis00_tready),
        .tdata_stream_out           (axis01_tdata),
        .tvalid_stream_out          (axis01_tvalid),
        .tlast_stream_out           (axis01_tlast),
        .tkeep_stream_out           (axis01_tkeep),
        .araddr_HBM                 (data_araddr),
        .rready_HBM                 (data_rready),
        .arvalid_HBM                (data_arvalid),
        .arlen_HBM                  (data_arlen),
        .wvalid_HBM                 (data_wvalid),
        .awvalid_HBM                (data_awvalid),
        .awlen_HBM                  (data_awlen),
        .wdata_HBM                  (data_wdata),
        .wstrb_HBM                  (data_wstrb),
        .wlast_HBM                  (data_wlast),
        .bready_HBM                 (data_bready),
        .awaddr_HBM                 (data_awaddr),
        .clken_PC                   (clken_PC),
        .load_PC                    (load_PC),
        .incr_PC                    (incr_PC),
        .load_value_PC              (load_value_PC));
    
    
    assign m02_axi_araddr  = data_araddr [dwidth_aximm*2-1 : dwidth_aximm]; 
    assign m02_axi_arlen   = data_arlen  [15               : 8           ]; 
    assign m02_axi_arvalid = data_arvalid[1                              ]; 
    assign m02_axi_awaddr  = data_awaddr [dwidth_aximm*2-1 : dwidth_aximm]; 
    assign m02_axi_awlen   = data_awlen  [15               : 8           ]; 
    assign m02_axi_awvalid = data_awvalid[1                              ]; 
    assign m02_axi_bready  = data_bready [1                              ]; 
    assign m02_axi_rready  = data_rready [1                              ]; 
    assign m02_axi_wvalid  = data_wvalid [1                              ]; 
    assign m02_axi_wdata   = data_wdata  [2*phit_size-1    : phit_size   ]; 
    assign m02_axi_wlast   = data_wlast  [1                              ]; 
    assign m02_axi_wstrb   = data_wstrb  [phit_size/4-1    : phit_size/8 ]; 
    
    
    assign m01_axi_araddr  = data_araddr [dwidth_aximm-1   : 0           ]; 
    assign m01_axi_arlen   = data_arlen  [7                : 0           ]; 
    assign m01_axi_arvalid = data_arvalid[0                              ]; 
    assign m01_axi_awaddr  = data_awaddr [dwidth_aximm-1   : 0           ]; 
    assign m01_axi_awlen   = data_awlen  [7                : 0           ]; 
    assign m01_axi_awvalid = data_awvalid[0                              ]; 
    assign m01_axi_bready  = data_bready [0                              ]; 
    assign m01_axi_rready  = data_rready [0                              ]; 
    assign m01_axi_wvalid  = data_wvalid [0                              ]; 
    assign m01_axi_wdata   = data_wdata  [phit_size-1      : 0           ]; 
    assign m01_axi_wlast   = data_wlast  [0                              ]; 
    assign m01_axi_wstrb   = data_wstrb  [phit_size/8 -1   : 0           ]; 
    

    
    
        
//    assign csr_out = cycle_register;
endmodule
