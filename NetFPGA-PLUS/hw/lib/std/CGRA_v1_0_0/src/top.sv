`timescale 1ns / 1ps

`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module top(
    // General I/O
    input  logic                     ap_clk,
    input  logic                     ap_rst_n,
    // Control Plane other 
    output logic                     interrupt,
    
    // AXI Lite Control Plane                               
    //inputs                                                
    input  logic [C_S_AXI_ADDR_WIDTH-1:0]   s_axi_control_araddr  ,
    input  logic                            s_axi_control_arvalid ,
    input  logic [C_S_AXI_ADDR_WIDTH-1:0]   s_axi_control_awaddr  ,
    input  logic                            s_axi_control_awvalid ,
    input  logic                            s_axi_control_bready  ,
    input  logic                            s_axi_control_rready  ,
    input  logic [C_S_AXI_DATA_WIDTH-1:0]   s_axi_control_wdata   ,
    input  logic [C_S_AXI_DATA_WIDTH/8-1:0] s_axi_control_wstrb   ,
    input  logic                            s_axi_control_wvalid  ,
    //output                                               ,
    output logic                            s_axi_control_arready ,
    output logic                            s_axi_control_awready ,
    output logic [1:0]                      s_axi_control_bresp   ,
    output logic                            s_axi_control_bvalid  ,
    output logic [C_S_AXI_DATA_WIDTH-1:0]   s_axi_control_rdata   ,
    output logic                            s_axi_control_rvalid  ,
    output logic [1:0]                      s_axi_control_rresp   ,
    output logic                            s_axi_control_wready  ,
    
    // AXI MM Control Plane                         
    //input                                         
    input  logic                     m00_axi_arready  ,
    input  logic [phit_size-1:0]     m00_axi_rdata    ,
    input  logic                     m00_axi_rlast    ,
    input  logic                     m00_axi_rvalid   ,
    //output                                          ,
    output logic [dwidth_HBMadd-1:0] m00_axi_araddr   ,
    output logic [8-1:0]             m00_axi_arlen    ,
    output logic                     m00_axi_arvalid  ,
    output logic                     m00_axi_rready   ,
    
    // Data Path
    // Stream
    // Stream in
    input  logic [phit_size-1:0]     axis00_tdata      ,
    input  logic                     axis00_tvalid     ,
    input  logic                     axis00_tlast     ,
    output logic                     axis00_tready     ,
    input  logic [phit_size/8-1:0]   axis00_tkeep     ,
    // Stream out
    output logic [phit_size-1:0]     axis01_tdata      ,
    output logic                     axis01_tvalid     ,
    output logic                     axis01_tlast     ,
    input  logic                     axis01_tready     ,
    output logic [phit_size/8-1:0]   axis01_tkeep     ,
    
    // Col 1
    //input
    input  logic                     m01_axi_arready  ,
    input  logic                     m01_axi_awready  ,
    input  logic                     m01_axi_bvalid   ,
    input  logic [phit_size-1:0]     m01_axi_rdata    ,
    input  logic                     m01_axi_rlast    ,
    input  logic                     m01_axi_rvalid   ,
    input  logic                     m01_axi_wready   ,
    //output                        
    output logic [dwidth_aximm-1:0]  m01_axi_araddr   ,
    output logic [7:0]               m01_axi_arlen    ,
    output logic                     m01_axi_arvalid  ,
    output logic [dwidth_aximm-1:0]  m01_axi_awaddr   ,
    output logic [7:0]               m01_axi_awlen    ,
    output logic                     m01_axi_awvalid  ,
    output logic                     m01_axi_bready   ,
    output logic                     m01_axi_rready   ,
    output logic                     m01_axi_wvalid   ,
    output logic [phit_size-1:0]     m01_axi_wdata    ,
    output logic                     m01_axi_wlast    ,
    output logic [(phit_size/8)-1:0] m01_axi_wstrb    ,
    
    // Col 2
    //input
    input  logic                     m02_axi_arready  ,
    input  logic                     m02_axi_awready  ,
    input  logic                     m02_axi_bvalid   ,
    input  logic [phit_size-1:0]     m02_axi_rdata    ,
    input  logic                     m02_axi_rlast    ,
    input  logic                     m02_axi_rvalid   ,
    input  logic                     m02_axi_wready   ,
    //output                           
    output logic [dwidth_aximm-1:0]  m02_axi_araddr   ,
    output logic [7:0]               m02_axi_arlen    ,
    output logic                     m02_axi_arvalid  ,
    output logic [dwidth_aximm-1:0]  m02_axi_awaddr   ,
    output logic [7:0]               m02_axi_awlen    ,
    output logic                     m02_axi_awvalid  ,
    output logic                     m02_axi_bready   ,
    output logic                     m02_axi_rready   ,
    output logic                     m02_axi_wvalid   ,
    output logic [phit_size-1:0]     m02_axi_wdata    ,
    output logic                     m02_axi_wlast    ,
    output logic [(phit_size/8)-1:0] m02_axi_wstrb    
    
//    // Col 3
//    //input
//    input  logic                     m01_axi_arready  ,
//    input  logic                     m01_axi_awready  ,
//    input  logic                     m01_axi_bvalid   ,
//    input  logic [phit_size-1:0]     m01_axi_rdata    ,
//    input  logic                     m01_axi_rlast    ,
//    input  logic                     m01_axi_rvalid   ,
//    input  logic                     m01_axi_wready   ,
//    //output                        
//    output logic [width_aximm-1:0]   m01_axi_araddr   ,
//    output logic [7:0]               m01_axi_arlen    ,
//    output logic                     m01_axi_arvalid  ,
//    output logic [dwidth_aximm-1:0]  m01_axi_awaddr   ,
//    output logic [7:0]               m01_axi_awlen    ,
//    output logic                     m01_axi_awvalid  ,
//    output logic                     m01_axi_bready   ,
//    output logic                     m01_axi_rready   ,
//    output logic                     m01_axi_wvalid   ,
//    output logic [phit_size-1:0]     m01_axi_wdata    ,
//    output logic                     m01_axi_wlast    ,
//    output logic [(phit_size/8)-1:0] m01_axi_wstrb    ,
    
//    ...
    
    );
    // Internal Signals
    logic [(num_col*dwidth_int)-1:0] instr;
    logic done_loader;
    logic [num_col-1:0] clken_PC;
    logic [num_col-1:0] load_PC;
    logic [num_col-1:0] incr_PC;
    logic [num_col*12-1:0] load_value_PC;
    logic [dwidth_int-1:0] cycle_register;
    logic areset;

    // Data Path concatinated signals       
    //input
    logic [num_col-1:0]                 data_arready;
    logic [num_col-1:0]                 data_awready;
    logic [num_col-1:0]                 data_bvalid ;
    logic [(phit_size*num_col)-1:0]     data_rdata  ;
    logic [num_col-1:0]                 data_rlast  ;
    logic [num_col-1:0]                 data_rvalid ;
    logic [num_col-1:0]                 data_wready ;
    
    assign data_arready = {m02_axi_arready , m01_axi_arready};
    assign data_awready = {m02_axi_awready , m01_axi_awready};
    assign data_bvalid  = {m02_axi_bvalid  , m01_axi_bvalid };
    assign data_rdata   = {m02_axi_rdata   , m01_axi_rdata  };
    assign data_rlast   = {m02_axi_rlast   , m01_axi_rlast  };
    assign data_rvalid  = {m02_axi_rvalid  , m01_axi_rvalid };
    assign data_wready  = {m02_axi_wready  , m01_axi_wready };
    
    //outputs
    logic [(dwidth_aximm*num_col)-1:0]  data_araddr  ; 
    logic [(num_col*8)-1:0]             data_arlen   ; 
    logic [num_col-1:0]                 data_arvalid ; 
    logic [(dwidth_aximm*num_col)-1:0]  data_awaddr  ; 
    logic [(num_col*8)-1:0]             data_awlen   ; 
    logic [num_col-1:0]                 data_awvalid ; 
    logic [num_col-1:0]                 data_bready  ; 
    logic [num_col-1:0]                 data_rready  ; 
    logic [num_col-1:0]                 data_wvalid  ; 
    logic [(num_col*phit_size)-1:0]     data_wdata   ; 
    logic [num_col-1:0]                 data_wlast   ; 
    logic [(num_col*(phit_size/8))-1:0] data_wstrb   ; 


    always @(posedge ap_clk) begin
      areset <= ~ap_rst_n;
    end
    
    control_plane control_plane_inst0(
        //inputs
        .ap_clk                     (ap_clk),  
        .ap_rst_n                   (ap_rst_n),
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
        

endmodule









// ---------------------------- Old Code ---------------------------- //


//module top(
//    // NOTE: one characteristics of inbound is that it is runtime; you can use the array temp two times for two 
//    // different HL collective and their value is loaded to the tables at runtime.
//    // In the new version, there is no inbound
////    input logic [phit_size-1:0] inbound,
//    input logic [SIMD_degree-1:0] t_stream_in_valid,
//    input logic [phit_size-1:0] stream_in,
//    input logic [phit_size-1:0] wr_data_ctrl_plane, // should I merge it to stream_in b/c I have onle one QDMA? 
//    input logic clk,
//    input logic rst,
//    output logic [phit_size-1:0] stream_out,
//    output logic [SIMD_degree-1:0] t_stream_out_valid,
//    // start_loader and done_loader (which is done internally by runtimeLoadTable) are single cycle pulse but start_stream_in and ready_stream_in are handshaking signals
//    input logic start_loader, // start signal to write to state/config tables and inbound
//    input logic start_stream_in,
//    input logic [dwidth_RFadd-1:0] num_entry_config_table, //comes from a header specialized for packet processing 
//    input logic [dwidth_RFadd-1:0] num_entry_inbound,
//    output logic ready_stream_in, // I have to wait (backpressure to stream_in) if start_inbound has not been asserted yet
//    // 4-phase handshaking for ready_stream_in and start_stream_in. when ready becomes high start should be low and the next cycle after deasserting start, stream-in should send valid data.
//    output logic [phit_size-1:0] stream_out_PEa0,
//    output logic [phit_size-1:0] stream_out_PEa1,
//    output logic [phit_size-1:0] stream_out_PEb,
//    output logic [phit_size-1:0] stream_out_PEc0, 
//    output logic [phit_size-1:0] stream_out_PEc1
//    );
                                                             
//    logic [(sz_config*(num_col))-1:0] rd_data_ctrl;      
//    logic [(dwidth_double*(num_col))-1:0] imm;
//    logic [num_col-1:0] valid_config_table;
//    logic [(2*num_col)-1:0] op; 
//    logic [(4*num_col)-1:0] sel_mux4;
//    logic [num_col-1:0] wr_en_RF_config_table;
//    logic [(dwidth_RFadd*(num_col))-1:0] wr_addr_RF_config_table, rd_addr_RF_config_table;
//    logic [num_col-1:0] isItr;
//    logic [(dwidth_RFadd*(num_col))-1:0] wr_addr_RF;
    
//    logic wr_en_RF_runtimeLoadTable; //it is drived by runtimeLoadTable
//    logic [dwidth_RFadd-1:0] wr_add_RF_runtimeLoadTable;
    
//    logic [((num_col)*dwidth_double)-1:0] itr;                                                                       
//    logic [num_col-1:0] wen_RF;                           

////    logic [dwidth_int-1:0] itr_k, itr_k_PEA1, itr_k_PEB, itr_k_PEC0, itr_k_PEC1, itr_k_PED;            
////    logic [dwidth_int-1:0] smart_ptr, smart_ptr_PEA1, smart_ptr_PEB, smart_ptr_PEC0, smart_ptr_PEC1, smart_ptr_PED;
    
//    control_plane control_plane_inst0 (
//    .clk(clk),
//    .rst(rst),
//    .wr_data(wr_data_ctrl_plane),
//    .rd_data_ctrl(rd_data_ctrl),
//    .rd_data_imm(imm),
//    .itr(itr),
//    .start_loader(start_loader),
//    .start_stream_in(start_stream_in),
//    .num_entry_config_table(num_entry_config_table),
//    .num_entry_inbound(num_entry_inbound),
//    .ready_stream_in(ready_stream_in),
//    .wr_en_RF_runtimeLoadTable(wr_en_RF_runtimeLoadTable),
//    .wr_add_RF_runtimeLoadTable(wr_add_RF_runtimeLoadTable)
//    );
    
//    // unpacking data
//    genvar i;
//    generate 
//        // i = 0 => wr_en [2:1] => rd_data[sz_config-1:0] => PEA0 => valid_config_table[0]
//        // i = 1 => ...
//        for(i=0; i<num_col; i++) begin 
//            assign valid_config_table[i] = rd_data_ctrl[(sz_config*(i+1))-1]; // TODO: parametrized the bitwidth and offset of data fields
//            assign op[(2*(i+1))-1:2*i] = rd_data_ctrl[(sz_config*(i+1))-3:(sz_config*(i+1))-4];
//            assign sel_mux4[(4*(i+1))-1:4*i] = rd_data_ctrl[(sz_config*(i+1))-5:(sz_config*(i+1))-8];
//            assign wr_addr_RF_config_table[(dwidth_RFadd*(i+1))-1:dwidth_RFadd*i] = rd_data_ctrl[(sz_config*(i+1))-9:(sz_config*(i+1))-8-dwidth_RFadd];
//            assign rd_addr_RF_config_table[(dwidth_RFadd*(i+1))-1:dwidth_RFadd*i] = rd_data_ctrl[(sz_config*(i+1))-9-dwidth_RFadd:(sz_config*(i+1))-8-(dwidth_RFadd*2)];
//            assign wr_en_RF_config_table[i] = rd_data_ctrl[(sz_config*(i+1))-9-(dwidth_RFadd*2)];
//            assign isItr[i] = rd_data_ctrl[(sz_config*(i+1))-10-(dwidth_RFadd*2)];
//        end
//    endgenerate
    
//    // high fan-out maybe you can optimize timing
//    assign wen_RF = (ready_stream_in)?(valid_config_table & wr_en_RF_config_table):{num_col{wr_en_RF_runtimeLoadTable}};
//    // we can reuse ready_stream_in as a selector of mux (when ready_stream_in=1 => reading from config table; when ready_stream_in=0 => reading from runtimeLoadTable)
//    // when we are reading from config table: if valid = 0 then wr_en should be zero => we have ANDed valid with wr_en
//    assign wr_addr_RF = (ready_stream_in)? wr_addr_RF_config_table: {num_col{wr_add_RF_runtimeLoadTable}};
    
//    data_path data_path_inst0 (
//    .clk(clk),
//    .rst(rst),
//    .t_stream_in_valid(t_stream_in_valid),
//    .stream_in(stream_in),
//    .itr(itr),
//    .isItr(isItr),
//    .imm(imm),
//    .sel_mux4(sel_mux4),
//    .op(op),
//    .wen_RF(wen_RF),
//    .rd_addr_RF(rd_addr_RF_config_table),
//    .wr_addr_RF(wr_addr_RF),
//    .wr_data(wr_data_ctrl_plane), // will be mapped to RFs
//    .wr_en_RF_runtimeLoadTable(wr_en_RF_runtimeLoadTable), // to select what is the source of data for RF data_in
//    .stream_out(stream_out),
//    .t_stream_out_valid(t_stream_out_valid),
//    .stream_out_PEa0(stream_out_PEa0),
//    .stream_out_PEa1(stream_out_PEa1),
//    .stream_out_PEb(stream_out_PEb),
//    .stream_out_PEc0(stream_out_PEc0), 
//    .stream_out_PEc1(stream_out_PEc1)
//    );
      
    
//endmodule
