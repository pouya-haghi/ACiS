//`timescale 1ns / 1ps
//`ifndef MY_INTERFACE
//    `define MY_INTERFACE
//    `include "my_interface.vh"
//`endif

//module test_top;
//    // General I/O                                                           
//    reg                      ap_clk                    ;
//    reg                      ap_rst_n                    ;
//    // --------- Control Plane --------- //
//    // Other                          
//    wire                     interrupt              ;                                      
//    // AXI Lite                                         
//    //inputs                                                            
//    reg  [C_S_AXI_ADDR_WIDTH-1:0]   s_axi_control_araddr   ;           
//    reg                             s_axi_control_arvalid  ;           
//    reg  [C_S_AXI_ADDR_WIDTH-1:0]   s_axi_control_awaddr   ;           
//    reg                             s_axi_control_awvalid  ;           
//    reg                             s_axi_control_bready   ;           
//    reg                             s_axi_control_rready   ;           
//    reg  [C_S_AXI_DATA_WIDTH-1:0]   s_axi_control_wdata    ;           
//    reg  [C_S_AXI_DATA_WIDTH/8-1:0] s_axi_control_wstrb    ;           
//    reg                             s_axi_control_wvalid   ;           
//    //output                                                  
//    wire                          s_axi_control_arready  ;           
//    wire                          s_axi_control_awready  ;           
//    wire [1:0]                    s_axi_control_bresp    ;           
//    wire                          s_axi_control_bvalid   ;           
//    wire [C_S_AXI_DATA_WIDTH-1:0] s_axi_control_rdata    ;           
//    wire                          s_axi_control_rvalid   ;           
//    wire [1:0]                    s_axi_control_rresp    ;           
//    wire                          s_axi_control_wready   ;           
                                                                     
//    // AXI MM                                         
//    //input                                                          
//    reg                      m00_axi_arready        ;           
//    reg  [phit_size-1:0]     m00_axi_rdata          ;           
//    reg                      m00_axi_rlast          ;           
//    reg                      m00_axi_rvalid         ;           
//    //output                                                      
//    wire [C_M_AXI_ADDR_WIDTH-1:0] m00_axi_araddr    ;           
//    wire [8-1:0]             m00_axi_arlen          ;           
//    wire                     m00_axi_arvalid        ;           
//    wire                     m00_axi_rready         ;           
                                                                
////    // --------- Data Path --------- //
////    // Stream                                                   
////    // in                                                    
////    wire [phit_size-1:0]     axis00_tdata           ;           
////    wire                     axis00_tvalid          ;           
////    wire                     axis00_tready          ;           
////    wire                     axis00_tlast           ;           
////    wire [phit_size/8-1:0]   axis00_tkeep           ;           
////    // out
////    wire [phit_size-1:0]     axis01_tdata           ;           
////    wire                     axis01_tvalid          ;           
////    wire                     axis01_tready          ;           
////    wire                     axis01_tlast           ;           
////    wire [phit_size/8-1:0]   axis01_tkeep           ;           
                                                                       
////    // AXI Col 1                                                           
////    //input                                                            
////    wire                     m01_axi_arready        ;
////    wire                     m01_axi_awready        ;
////    wire                     m01_axi_bvalid         ;
////    wire [phit_size-1:0]     m01_axi_rdata          ;
////    wire                     m01_axi_rlast          ;
////    wire                     m01_axi_rvalid         ;
////    wire                     m01_axi_wready         ;
////    //output                               
////    wire [dwidth_aximm-1:0]  m01_axi_araddr         ;
////    wire [7:0]               m01_axi_arlen          ;
////    wire                     m01_axi_arvalid        ;
////    wire [dwidth_aximm-1:0]  m01_axi_awaddr         ;
////    wire [7:0]               m01_axi_awlen          ;
////    wire                     m01_axi_awvalid        ;
////    wire                     m01_axi_bready         ;
////    wire                     m01_axi_rready         ;
////    wire                     m01_axi_wvalid         ;
////    wire [phit_size-1:0]     m01_axi_wdata          ;
////    wire                     m01_axi_wlast          ;
////    wire [(phit_size/8)-1:0] m01_axi_wstrb          ;
                                         
////    // AXI Col 2                             
////    //input                              
////    wire                     m02_axi_arready        ;
////    wire                     m02_axi_awready        ;
////    wire                     m02_axi_bvalid         ;
////    wire [phit_size-1:0]     m02_axi_rdata          ;
////    wire                     m02_axi_rlast          ;
////    wire                     m02_axi_rvalid         ;
////    wire                     m02_axi_wready         ;
////    //output                              
////    wire [dwidth_aximm-1:0]  m02_axi_araddr         ;
////    wire [7:0]               m02_axi_arlen          ;
////    wire                     m02_axi_arvalid        ;
////    wire [dwidth_aximm-1:0]  m02_axi_awaddr         ;
////    wire [7:0]               m02_axi_awlen          ;
////    wire                     m02_axi_awvalid        ;
////    wire                     m02_axi_bready         ;
////    wire                     m02_axi_rready         ;
////    wire                     m02_axi_wvalid         ;
////    wire [phit_size-1:0]     m02_axi_wdata          ;
////    wire                     m02_axi_wlast          ;
////    wire [(phit_size/8)-1:0] m02_axi_wstrb          ;
//     logic [phit_size-1:0]                tdata_stream_in;
//     logic                                tvalid_stream_in;
//     logic                                tready_stream_in;
//     logic                                tlast_stream_in;
//     logic [phit_size/8-1:0]              tkeep_stream_in;
////    eam_out
//     logic [phit_size-1:0]                tdata_stream_out;
//     logic                                tvalid_stream_out;
//     logic                                tready_stream_out;
//     logic                                tlast_stream_out;
//     logic [phit_size/8-1:0]              tkeep_stream_out;
////     read
//     logic [(dwidth_aximm*num_col)-1:0]   araddr_HBM;
//     logic [num_col-1:0]                  arready_HBM;
//     logic [num_col-1:0]                  rvalid_HBM;
//     logic [(phit_size*num_col)-1:0]      rdata_HBM;
//     logic [num_col-1:0]                  rready_HBM;
//     logic [num_col-1:0]                  arvalid_HBM;
//     logic [(8*num_col)-1:0]              arlen_HBM;
//     logic [num_col-1:0]                  rlast_HBM;
////     write
//     logic [num_col-1:0]                  wvalid_HBM;
//     logic [num_col-1:0]                  wready_HBM;
//     logic [num_col-1:0]                  awvalid_HBM;
//     logic [(num_col*8)-1:0]              awlen_HBM;
//     logic [(num_col*phit_size)-1:0]      wdata_HBM;
//     logic [(num_col*(phit_size/8))-1:0]  wstrb_HBM;
//     logic [num_col-1:0]                  wlast_HBM;
//     logic [num_col-1:0]                  bvalid_HBM;
//     logic [num_col-1:0]                  bready_HBM;
//     logic [(dwidth_aximm*num_col)-1:0]   awaddr_HBM;
//     logic [num_col-1:0]                  awready_HBM;
    
    
//    wire [(num_col*dwidth_RFadd)-1:0] AXI_vlen;
//    wire ap_done_o;
    
//    top top_inst0(.*);    
    
////    emulate_HBM emulate_HBM_inst0(
////        .ap_clk     (ap_clk         ),
////        .ap_rst_n   (ap_rst_n       ),
////        .axi_arready(m01_axi_arready), 
////        .axi_awready(m01_axi_awready), 
////        .axi_bvalid (m01_axi_bvalid ), 
////        .axi_rdata  (m01_axi_rdata  ), 
////        .axi_rlast  (m01_axi_rlast  ), 
////        .axi_rvalid (m01_axi_rvalid ), 
////        .axi_wready (m01_axi_wready ), 
////        .axi_araddr (m01_axi_araddr ), 
////        .axi_arlen  (m01_axi_arlen  ), 
////        .axi_arvalid(m01_axi_arvalid), 
////        .axi_awaddr (m01_axi_awaddr ), 
////        .axi_awlen  (m01_axi_awlen  ), 
////        .axi_awvalid(m01_axi_awvalid), 
////        .axi_bready (m01_axi_bready ), 
////        .axi_rready (m01_axi_rready ), 
////        .axi_wvalid (m01_axi_wvalid ), 
////        .axi_wdata  (m01_axi_wdata  ), 
////        .axi_wlast  (m01_axi_wlast  ), 
////        .axi_wstrb  (m01_axi_wstrb  ),
////        .AXI_vlen   (AXI_vlen[dwidth_RFadd-1:0]) 
////    );
    
////    emulate_HBM emulate_HBM_inst1(
////        .ap_clk     (ap_clk         ),
////        .ap_rst_n   (ap_rst_n       ),
////        .axi_arready(m02_axi_arready), 
////        .axi_awready(m02_axi_awready), 
////        .axi_bvalid (m02_axi_bvalid ), 
////        .axi_rdata  (m02_axi_rdata  ), 
////        .axi_rlast  (m02_axi_rlast  ), 
////        .axi_rvalid (m02_axi_rvalid ), 
////        .axi_wready (m02_axi_wready ), 
////        .axi_araddr (m02_axi_araddr ), 
////        .axi_arlen  (m02_axi_arlen  ), 
////        .axi_arvalid(m02_axi_arvalid), 
////        .axi_awaddr (m02_axi_awaddr ), 
////        .axi_awlen  (m02_axi_awlen  ), 
////        .axi_awvalid(m02_axi_awvalid), 
////        .axi_bready (m02_axi_bready ), 
////        .axi_rready (m02_axi_rready ), 
////        .axi_wvalid (m02_axi_wvalid ), 
////        .axi_wdata  (m02_axi_wdata  ), 
////        .axi_wlast  (m02_axi_wlast  ), 
////        .axi_wstrb  (m02_axi_wstrb  ),
////        .AXI_vlen(AXI_vlen[(2*dwidth_RFadd)-1:dwidth_RFadd])
////    );
    
//    genvar j;
//    generate 
//    for (j=0; j<num_col; j++) begin
//        emulate_HBM emulate_HBM_inst0(
//        .ap_clk     (ap_clk         ),
//        .ap_rst_n   (ap_rst_n       ),
//        .axi_arready(arready_HBM[j]), 
//        .axi_awready(awready_HBM[j]), 
//        .axi_bvalid (bvalid_HBM[j] ), 
//        .axi_rdata  (rdata_HBM[(phit_size*(j+1))-1:phit_size*j]), 
//        .axi_rlast  (rlast_HBM[j]  ), 
//        .axi_rvalid (rvalid_HBM[j] ), 
//        .axi_wready (wready_HBM[j] ), 
//        .axi_araddr (araddr_HBM[(dwidth_aximm*(j+1))-1:dwidth_aximm*j] ), 
//        .axi_arlen  (arlen_HBM[((j+1)*8)-1:j*8]  ), 
//        .axi_arvalid(arvalid_HBM[j]), 
//        .axi_awaddr (awaddr_HBM[((j+1)*dwidth_aximm)-1:dwidth_aximm*j] ), 
//        .axi_awlen  (awlen_HBM[((j+1)*8)-1:j*8]  ), 
//        .axi_awvalid(awvalid_HBM[j]), 
//        .axi_bready (bready_HBM[j] ), 
//        .axi_rready (rready_HBM[j] ), 
//        .axi_wvalid (wvalid_HBM[j] ), 
//        .axi_wdata  (wdata_HBM[((j+1)*phit_size)-1:phit_size*j]  ), 
//        .axi_wlast  (wlast_HBM[j]  ), 
//        .axi_wstrb  (wstrb_HBM[((j+1)*(phit_size/8))-1:(phit_size/8)*j]  ),
//        .AXI_vlen   (AXI_vlen[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]) 
//        );
        
//    end
//    endgenerate
    
//    emulate_stream_in emulate_stream_in_inst(
//    .ap_clk(ap_clk),
//    .ap_rst_n(ap_rst_n),
//    .axis00_tdata(tdata_stream_in),
//    .axis00_tvalid(tvalid_stream_in),
//    .axis00_tready(tready_stream_in),
//    .axis00_tlast(tlast_stream_in),
//    .axis00_tkeep(tkeep_stream_in),
    
//    .axis01_tdata(tdata_stream_out),
//    .axis01_tvalid(tvalid_stream_out),
//    .axis01_tready(tready_stream_out),
//    .axis01_tlast(tlast_stream_out),
//    .axis01_tkeep(tkeep_stream_out)
//    );

    
//    always begin
//        #(clk_pd/2);
//        ap_clk = !ap_clk;      
//    end
    
//    time time_pos_in_stream, time_neg_in_stream;
//    time time_pos_out_stream, time_neg_out_stream;
//    time time_pos_ap_done, time_neg_ap_done;
    
//    always @(posedge tvalid_stream_in) begin
//        time_pos_in_stream <= $time;
//    end
//    always @(negedge tvalid_stream_in) begin
//        time_neg_in_stream <= $time;
//    end
    
//    always @(posedge tvalid_stream_out) begin
//        time_pos_out_stream <= $time;
//    end
//    always @(negedge tvalid_stream_out) begin
//        time_neg_out_stream <= $time;
//    end
    
//    always @(posedge ap_done_o) begin
//        time_pos_ap_done <= $time;
//    end
//    always @(negedge ap_done_o) begin
//        time_neg_ap_done <= $time;
//    end
////    always @(posedge ap_done_o) begin
////        time_pos_ap_done <= $time;
////    end
    
//    // Load instructions
//    logic [phit_size-1:0] instructions[0:depth_config-1];
//    logic [dwidth_int-1:0] mem[0:num_col-1][0:(depth_config)-1];
    
//    genvar c;
//    generate
//    for (c=0;c<num_col;c++) begin
//        logic [dwidth_int-1:0] read_inst[0:depth_config-1];
//        string s, path;
//        initial begin
//            s.itoa(c);
////            path = {"/home/pouya/github/G-FPin_HW_old/G-FPin_HW/NetFPGA-PLUS/hw/lib/std/CGRA_v1_0_0/test/instructions/Cora/12/collective_",s,".bin"};
////            path = {"/home/pouya/github/G-FPin_HW_old/G-FPin_HW/NetFPGA-PLUS/hw/lib/std/CGRA_v1_0_0/test/instructions/Cora/12/gcn_xv_",s,".bin"};
//            path = {"/home/pouya/Documents/CGRA_binaries/gcn_xv_",s,".bin"};
//            $readmemb(path,read_inst);
//            #1;
//            mem[c] = read_inst;
//        end
//    end
//    endgenerate
    
//    genvar i;
//    generate
//    for (i=0;i<num_col;i++) begin
//        for (j=0;j<depth_config;j++) begin
//            assign instructions[j][dwidth_int*(i+1)-1:dwidth_int*i] = mem[i][j];
//        end
//    end 
//    for (i=num_col;i<16-num_col;i++) begin
//        for (j=0;j<depth_config;j++) begin
//            assign instructions[j][dwidth_int*(i+1)-1:dwidth_int*i] = '0;
//        end
//    end 
//    endgenerate   
    
//    int k;
//    time t_sin_local, t_sin_tot;
//    time t_sout_local, t_sout_tot;
//    time t_ap_done;
//    integer tk=23;
//    integer tm=1;
//    genvar y, z;
    
//    initial begin
//    integer z;
//            t_sout_tot = 0;
//       for (z=0; z<tm; z++) begin
//            wait(tvalid_stream_out);
//            wait(!tvalid_stream_out);
//            #2;
//    //        $display("time is: %t", $time);
//            t_sout_local = time_neg_out_stream-time_pos_out_stream;
//            $display("stream_out_tvalid took: %t", t_sout_local);
//            t_sout_tot += t_sout_local;
//        end
//         $display("total_time sout: %t", t_sout_tot); 
////         wait(ap_done_o); 
////         #2;
////         $display("time_app: %t", time_pos_ap_done);
////         $display("sout_BW: %t", t_sout_tot/(time_pos_ap_done-696));
//    end
    
//    initial begin
//    integer y;
//        t_sin_tot = 0;

//        for (y=0; y<tk+1; y++) begin
//            wait(tvalid_stream_in);
//            wait(!tvalid_stream_in);
//            #2;
//    //        $display("time is: %t", $time);
//            t_sin_local = time_neg_in_stream-time_pos_in_stream;
//            $display("stream_in_tvalid took: %t", t_sin_local);
//            t_sin_tot += t_sin_local;
//        end
        
//        $display("total_time sin: %t", t_sin_tot); 

//    end
    
//    initial begin
//    integer y;
//            wait(ap_done_o);
////            wait(!ap_done_o);
//            #2;
//    //        $display("time is: %t", $time);
//            t_ap_done = time_neg_ap_done-time_pos_ap_done;
//            $display("ap_done took: %t", time_pos_ap_done);
        

//    end
    
////    initial begin
////         wait(ap_done_o); 
////         #2;
////         $display("time_app: %t", time_pos_ap_done);
//////         $display("sin_BW: %t", t_sin_tot/(time_pos_ap_done-696)); 
//////         $display("sout_BW: %t", t_sout_tot/(time_pos_ap_done-696));
////    end
    
    
    
//    initial begin
////        instructions = '{default:0};
        
//        // Reset
//        ap_clk                       = 1'b1;
//        ap_rst_n                     = 1'b0; 
        
//        s_axi_control_araddr    <= 5'b0;
//        s_axi_control_arvalid   <= 1'b0;
//        s_axi_control_awaddr    <= 5'b0;
//        s_axi_control_awvalid   <= 1'b0;
//        s_axi_control_bready    <= 1'b0;
//        s_axi_control_rready    <= 1'b0;
//        s_axi_control_wdata     <= 32'b0;
//        s_axi_control_wstrb     <= 4'b0;
//        s_axi_control_wvalid    <= 1'b0;
//        m00_axi_arready         <= 1'b0;
//        m00_axi_rdata           <= 512'b0;
//        m00_axi_rlast           <= 1'b0;
//        m00_axi_rvalid          <= 1'b0;
////        axis00_tdata            <= 512'b0;
////        axis00_tvalid           <= 1'b0;
////        axis01_tready           <= 1'b0;
////        axis00_tlast            <= 1'b0;
////        axis00_tkeep            <= 64'b0;
////        m01_axi_arready         <= 1'b0;
////        m01_axi_awready         <= 1'b0;
////        m01_axi_bvalid          <= 1'b0;
////        m01_axi_rdata           <= 512'b0;
////        m01_axi_rlast           <= 1'b0;
////        m01_axi_rvalid          <= 1'b0;
////        m01_axi_wready          <= 1'b0;
////        m02_axi_arready         <= 1'b0;
////        m02_axi_awready         <= 1'b0;
////        m02_axi_bvalid          <= 1'b0;
////        m02_axi_rdata           <= 512'b0;
////        m02_axi_rlast           <= 1'b0;
////        m02_axi_rvalid          <= 1'b0;
////        m02_axi_wready          <= 1'b0;
                
        
//        #(depth_config*clk_pd); ap_rst_n = 1'b1;
        
//        // trigger ap_start
//        s_axi_control_awaddr <= 5'b0;
//        s_axi_control_awvalid <= 1'b1;
//        #80;
//        s_axi_control_awvalid <= 1'b0;
//        s_axi_control_wstrb[0] <= 1'b1;
//        s_axi_control_wdata[0] <= 1'b1;
//        s_axi_control_wvalid <= 1'b1;
//        #40;
//        // de-assert signals to release ctrl_start
//        s_axi_control_wstrb[0] <= 1'b0;
//        s_axi_control_wdata[0] <= 1'b0;
//        s_axi_control_wvalid <= 1'b0;
        
//        #60; //ctrl start goes high and sample offset and size, arready is high, HBM latency
        
//        // Start instructions write
//        m00_axi_rvalid <= 1'b1; 
        
//        //start instructions
//        for (k=0; k<depth_config; k++) begin
//            m00_axi_rdata <= instructions[k];
//            $display("Instruction %d: %b",k,m00_axi_rdata);
//            if (k==(depth_config-1))
//                m00_axi_rlast <= 1'b1;
//            #clk_pd;
//            m00_axi_rlast <= 1'b0;
//        end
//        // stop loading
//        m00_axi_rvalid <= 1'b0;
//        #clk_pd;
        
        
        
//        #10000;

        
////////////////// Start hard coded TB /////////////////////
////        //      Scalar            // column 2                                       // column 1
////        m00_axi_rdata <= {448'b0, 20'h12345, 5'h1, 7'h37                          , 20'h12345, 5'h1, 7'h37                            }; #clk_pd; //lui
////        m00_axi_rdata <= {448'b0, 12'h678, 5'h1, 3'b000, 5'h1, 7'h13              , 12'h678, 5'h1, 3'b000, 5'h1, 7'h13                }; #clk_pd; //addi, out=12345567
////        m00_axi_rdata <= {448'b0, 7'h0, 5'h1, 5'h1, 3'b000, 5'h2, 7'h33           , 7'h0, 5'h1, 5'h1, 3'b000, 5'h2, 7'h33             }; #clk_pd; //add, out=2468ACF0
////        //      Vector 
////        m00_axi_rdata <= {448'b0, 2'b11, 12'b1000, 3'b100, 3'h7, 5'b0, 7'h57      , 2'b11, 12'b1000, 3'b100, 3'h7, 5'b0, 7'h57        }; #clk_pd; //vsetivli
////        m00_axi_rdata <= {448'b0, 12'b0, 5'b00010 , 3'b0, 5'h1, 7'h07             , 12'b0, 5'b00010 , 3'b0, 5'h1, 7'h07               }; #clk_pd; // vle32.vv
////        m00_axi_rdata <= {448'b0, 6'b101100, 1'b0, 5'd1, 5'h1 , 3'b0, 5'd1, 7'h57 , 6'b101100, 1'b0, 5'd1, 5'h1 , 3'b0, 5'd1, 7'h57   }; #clk_pd; // vfmacc.xv
////        m00_axi_rdata <= {448'b0, 12'b0, 5'b00010 , 3'b0, 5'd1, 7'h27             , 12'b0, 5'b00010 , 3'b0, 5'd1, 7'h27               }; #clk_pd; // vse32.vv
        
////        m00_axi_rdata <= {448'b0, 32'b0001000_00101_00000_000_00000_1110011       , 32'b0001000_00101_00000_000_00000_1110011         }; #clk_pd; //wfi
////        m00_axi_rlast <= 1'b1;
////        m00_axi_rdata <= {448'b0, 32'b0001000_00101_00000_000_00000_1110011       , 32'b0001000_00101_00000_000_00000_1110011         }; #clk_pd; //wfi
        
////        // stop loading
////        m00_axi_rlast <= 1'b0;
////        m00_axi_rvalid <= 1'b0;
////        #clk_pd;
        
////        // wait for scalar instr
////        #(clk_pd*4); 
        
////        // HBM response time
////        #(clk_pd*delay_HBM);        
        
////        // HBM read for vle
////        m01_axi_arready <= 1'b1;         m02_axi_arready <= 1'b1;                             
////        #clk_pd;                                                                          
////        m01_axi_arready <= 1'b0;         m02_axi_arready <= 1'b0;                             
                                                                                          
////        m01_axi_rvalid <= 1'b1;          m02_axi_rvalid <= 1'b1;                              
                                                                                          
////        m01_axi_rdata <= 512'h40000000;  m02_axi_rdata <= 512'h40000000;  #clk_pd;//2         
////        m01_axi_rdata <= 512'h40400000;  m02_axi_rdata <= 512'h40400000;  #clk_pd;//3         
////        m01_axi_rdata <= 512'h40800000;  m02_axi_rdata <= 512'h40800000;  #clk_pd;//4         
////        m01_axi_rdata <= 512'h40a00000;  m02_axi_rdata <= 512'h40a00000;  #clk_pd;//5         
////        m01_axi_rdata <= 512'h40c00000;  m02_axi_rdata <= 512'h40c00000;  #clk_pd;//6         
////        m01_axi_rdata <= 512'h40e00000;  m02_axi_rdata <= 512'h40e00000;  #clk_pd;//7         
////        m01_axi_rdata <= 512'h41000000;  m02_axi_rdata <= 512'h41000000;  #clk_pd;//8         
////        m01_axi_rlast <= 1'b1;           m02_axi_rlast <= 1'b1;                               
////        m01_axi_rdata <= 512'h41100000;  m02_axi_rdata <= 512'h41100000;  #clk_pd;//9         
                                                                                          
////        m01_axi_rvalid <= 1'b0;          m02_axi_rvalid <= 1'b0;                              
////        m01_axi_rlast <= 1'b0;           m02_axi_rlast <= 1'b0;                               
       
////        // Wait a little
////        #(clk_pd*2);
        
////        // Stream in for vmacc
////        axis00_tvalid <= 1'h1;
////        axis00_tkeep <= 64'hFFFFFFFFFFFFFFFF;
        
////        axis00_tdata <= 512'h40000000; #clk_pd;//2 
////        axis00_tdata <= 512'h40400000; #clk_pd;//3 
////        axis00_tdata <= 512'h40800000; #clk_pd;//4 
////        axis00_tdata <= 512'h40a00000; #clk_pd;//5 
////        axis00_tdata <= 512'h40c00000; #clk_pd;//6 
////        axis00_tdata <= 512'h40e00000; #clk_pd;//7 
////        axis00_tdata <= 512'h41000000; #clk_pd;//8 
////        axis00_tlast <= 1'b1;
////        axis00_tdata <= 512'h41100000; #clk_pd;//9 
         
////        axis00_tvalid <= 1'h0;
////        axis00_tlast <= 1'b0;
////        axis00_tkeep <= 64'b0;

////        // Wait to process
////        #(clk_pd*latencyPEC+2);
        
////        // HBM response time
////        #(clk_pd*delay_HBM);
        
////        // Write out vse
////        m01_axi_awready <= 1'b1;   m02_axi_awready <= 1'b1;
////        m01_axi_wready <= 1'b1;    m02_axi_wready <= 1'b1; 
////        m01_axi_bvalid <= 1'b1;    m02_axi_bvalid <= 1'b1; 
////        #(clk_pd*8);
////        m01_axi_awready <= 1'b0;   m02_axi_awready <= 1'b0;
////        m01_axi_wready <= 1'b0;    m02_axi_wready <= 1'b0; 
////        m01_axi_bvalid <= 1'b0;    m02_axi_bvalid <= 1'b0; 
////////////////// End hard coded TB /////////////////////
        
        
        
////        #(clk_pd*(128+5)*32*16);
//        #(clk_pd*2000000);
//    $finish;
//    end
//endmodule

`timescale 1ns / 1ps
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module test_top;
    
    // General I/O                                                           
    reg                      ap_clk                    ;
    reg                      ap_rst_n                    ;
    // --------- Control Plane --------- //
    // Other                          
    wire                     interrupt              ;                                      
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

    // AXI MM Control Plane                         
    //input                                         
    reg                      m00_axi_arready  ;
    reg                      m00_axi_awready  ;
    reg                      m00_axi_bvalid   ;
    reg  [phit_size-1:0]     m00_axi_rdata    ;
    reg                      m00_axi_rlast    ;
    reg                      m00_axi_rvalid   ;
    reg                      m00_axi_wready   ;
    //output                                          ,
    wire [C_M_AXI_ADDR_WIDTH-1:0] m00_axi_araddr   ;
    wire [8-1:0]             m00_axi_arlen    ;
    wire                     m00_axi_arvalid  ;
    wire [dwidth_aximm-1:0]  m00_axi_awaddr   ;
    wire [7:0]               m00_axi_awlen    ;
    wire                     m00_axi_awvalid  ;
    wire                     m00_axi_bready   ;
    wire                     m00_axi_rready   ;
    wire                     m00_axi_wvalid   ;
    wire [phit_size-1:0]     m00_axi_wdata    ;
    wire                     m00_axi_wlast    ;
    wire [(phit_size/8)-1:0] m00_axi_wstrb    ;
    
    reg [phit_size-1:0]     axis00_tdata      ;
    reg                     axis00_tvalid     ;
    reg                     axis00_tlast      ;
    wire                     axis00_tready     ;
    reg [phit_size/8-1:0]   axis00_tkeep      ;
    // Stream out
    wire [phit_size-1:0]     axis01_tdata      ;
    wire                     axis01_tvalid     ;
    wire                     axis01_tlast      ;
    reg                     axis01_tready     ;
    wire [phit_size/8-1:0]   axis01_tkeep      ;
    // Col 1
    //input
    reg                     m01_axi_arready  ;
    reg                     m01_axi_awready  ;
    reg                     m01_axi_bvalid   ;
    reg [phit_size-1:0]     m01_axi_rdata    ;
    reg                     m01_axi_rlast    ;
    reg                     m01_axi_rvalid   ;
    reg                     m01_axi_wready   ;
    //output                        
    wire [dwidth_aximm-1:0]  m01_axi_araddr   ;
    wire [7:0]               m01_axi_arlen    ;
    wire                     m01_axi_arvalid  ;
    wire [dwidth_aximm-1:0]  m01_axi_awaddr   ;
    wire [7:0]               m01_axi_awlen    ;
    wire                     m01_axi_awvalid  ;
    wire                     m01_axi_bready   ;
    wire                     m01_axi_rready   ;
    wire                     m01_axi_wvalid   ;
    wire [phit_size-1:0]     m01_axi_wdata    ;
    wire                     m01_axi_wlast    ;
    wire [(phit_size/8)-1:0] m01_axi_wstrb    ;
    // Col 2
    //input
    reg                     m02_axi_arready  ;
    reg                     m02_axi_awready  ;
    reg                     m02_axi_bvalid   ;
    reg [phit_size-1:0]     m02_axi_rdata    ;
    reg                     m02_axi_rlast    ;
    reg                     m02_axi_rvalid   ;
    reg                     m02_axi_wready   ;
    //output                           
    wire [dwidth_aximm-1:0]  m02_axi_araddr   ;
    wire [7:0]               m02_axi_arlen    ;
    wire                     m02_axi_arvalid  ;
    wire [dwidth_aximm-1:0]  m02_axi_awaddr   ;
    wire [7:0]               m02_axi_awlen    ;
    wire                     m02_axi_awvalid  ;
    wire                     m02_axi_bready   ;
    wire                     m02_axi_rready   ;
    wire                     m02_axi_wvalid   ;
    wire [phit_size-1:0]     m02_axi_wdata    ;
    wire                     m02_axi_wlast    ;
    wire [(phit_size/8)-1:0] m02_axi_wstrb    ;
    
    // only for simulation
    wire [(num_col*dwidth_RFadd)-1:0] AXI_vlen;
    wire ap_done_o;

    
    top top_inst0(
//     ap_clk,
//     ap_rst_n,
//     interrupt,                                              
//     s_axi_control_araddr  ,
//     s_axi_control_arvalid ,
//     s_axi_control_awaddr  ,
//     s_axi_control_awvalid ,
//     s_axi_control_bready  ,
//     s_axi_control_rready  ,
//     s_axi_control_wdata   ,
//     s_axi_control_wstrb   ,
//     s_axi_control_wvalid  ,           
//     s_axi_control_arready ,
//     s_axi_control_awready ,
//     s_axi_control_bresp   ,
//     s_axi_control_bvalid  ,
//     s_axi_control_rdata   ,
//     s_axi_control_rvalid  ,
//     s_axi_control_rresp   ,
//     s_axi_control_wready  ,                                      
//     m00_axi_arready  ,
//     m00_axi_awready  ,
//     m00_axi_bvalid   ,
//     m00_axi_rdata    ,
//     m00_axi_rlast    ,
//     m00_axi_rvalid   ,
//     m00_axi_wready   ,
//     m00_axi_araddr   ,
//     m00_axi_arlen    ,
//     m00_axi_arvalid  ,
//     m00_axi_awaddr   ,
//     m00_axi_awlen    ,
//     m00_axi_awvalid  ,
//     m00_axi_bready   ,
//     m00_axi_rready   ,
//     m00_axi_wvalid   ,
//     m00_axi_wdata    ,
//     m00_axi_wlast    ,
//     m00_axi_wstrb    ,
//     axis00_tdata      ,
//     axis00_tvalid     ,
//     axis00_tlast     ,
//     axis00_tready     ,
//     axis00_tkeep     ,
//     axis01_tdata      ,
//     axis01_tvalid     ,
//     axis01_tlast     ,
//     axis01_tready     ,
//     axis01_tkeep     ,
//     m01_axi_arready  ,
//     m01_axi_awready  ,
//     m01_axi_bvalid   ,
//     m01_axi_rdata    ,
//     m01_axi_rlast    ,
//     m01_axi_rvalid   ,
//     m01_axi_wready   ,
//     m01_axi_araddr   ,
//     m01_axi_arlen    ,
//     m01_axi_arvalid  ,
//     m01_axi_awaddr   ,
//     m01_axi_awlen    ,
//     m01_axi_awvalid  ,
//     m01_axi_bready   ,
//     m01_axi_rready   ,
//     m01_axi_wvalid   ,
//     m01_axi_wdata    ,
//     m01_axi_wlast    ,
//     m01_axi_wstrb    ,
//     m02_axi_arready  ,
//     m02_axi_awready  ,
//     m02_axi_bvalid   ,
//     m02_axi_rdata    ,
//     m02_axi_rlast    ,
//     m02_axi_rvalid   ,
//     m02_axi_wready   ,
//     m02_axi_araddr   ,
//     m02_axi_arlen    ,
//     m02_axi_arvalid  ,
//     m02_axi_awaddr   ,
//     m02_axi_awlen    ,
//     m02_axi_awvalid  ,
//     m02_axi_bready   ,
//     m02_axi_rready   ,
//     m02_axi_wvalid   ,
//     m02_axi_wdata    ,
//     m02_axi_wlast    ,
//     m02_axi_wstrb    ,
//     // only for simulation
//     AXI_vlen,
//     ap_done_o
     .*
     );    

        emulate_HBM emulate_HBM_inst0(
        .ap_clk     (ap_clk         ),
        .ap_rst_n   (ap_rst_n       ),
        .axi_arready(m01_axi_arready), 
        .axi_awready(m01_axi_awready), 
        .axi_bvalid (m01_axi_bvalid), 
        .axi_rdata  (m01_axi_rdata), 
        .axi_rlast  (m01_axi_rlast), 
        .axi_rvalid (m01_axi_rvalid), 
        .axi_wready (m01_axi_wready), 
        .axi_araddr (m01_axi_araddr ), 
        .axi_arlen  (m01_axi_arlen), 
        .axi_arvalid(m01_axi_arvalid), 
        .axi_awaddr (m01_axi_awaddr), 
        .axi_awlen  (m01_axi_awlen), 
        .axi_awvalid(m01_axi_awvalid), 
        .axi_bready (m01_axi_bready), 
        .axi_rready (m01_axi_rready), 
        .axi_wvalid (m01_axi_wvalid), 
        .axi_wdata  (m01_axi_wdata ), 
        .axi_wlast  (m01_axi_wlast), 
        .axi_wstrb  (m01_axi_wstrb ),
        .AXI_vlen   (AXI_vlen[(dwidth_RFadd)-1:0]) 
        );
        
         emulate_HBM emulate_HBM_inst1(
        .ap_clk     (ap_clk         ),
        .ap_rst_n   (ap_rst_n       ),
        .axi_arready(m02_axi_arready), 
        .axi_awready(m02_axi_awready), 
        .axi_bvalid (m02_axi_bvalid ), 
        .axi_rdata  (m02_axi_rdata), 
        .axi_rlast  (m02_axi_rlast  ), 
        .axi_rvalid (m02_axi_rvalid ), 
        .axi_wready (m02_axi_wready ), 
        .axi_araddr (m02_axi_araddr ), 
        .axi_arlen  (m02_axi_arlen  ), 
        .axi_arvalid(m02_axi_arvalid), 
        .axi_awaddr (m02_axi_awaddr ), 
        .axi_awlen  (m02_axi_awlen ), 
        .axi_awvalid(m02_axi_awvalid), 
        .axi_bready (m02_axi_bready ), 
        .axi_rready (m02_axi_rready ), 
        .axi_wvalid (m02_axi_wvalid ), 
        .axi_wdata  (m02_axi_wdata ), 
        .axi_wlast  (m02_axi_wlast ), 
        .axi_wstrb  (m02_axi_wstrb),
        .AXI_vlen   (AXI_vlen[(2*dwidth_RFadd)-1:dwidth_RFadd]) 
        );
    
    emulate_stream_in emulate_stream_in_inst(
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .axis00_tdata(axis00_tdata),
    .axis00_tvalid(axis00_tvalid),
    .axis00_tready(axis00_tready),
    .axis00_tlast(axis00_tlast),
    .axis00_tkeep(axis00_tkeep),
    .axis01_tdata(axis01_tdata),
    .axis01_tvalid(axis01_tvalid),
    .axis01_tready(axis01_tready),
    .axis01_tlast(axis01_tlast),
    .axis01_tkeep(axis01_tkeep)
    );

    
    always begin
        #(clk_pd/2);
        ap_clk = !ap_clk;      
    end
    
    time time_pos_in_stream, time_neg_in_stream;
    time time_pos_out_stream, time_neg_out_stream;
    time time_pos_ap_done, time_neg_ap_done;
    
    always @(posedge axis00_tvalid) begin
        time_pos_in_stream <= $time;
    end
    always @(negedge axis00_tvalid) begin
        time_neg_in_stream <= $time;
    end
    
    always @(posedge axis01_tvalid) begin
        time_pos_out_stream <= $time;
    end
    always @(negedge axis01_tvalid) begin
        time_neg_out_stream <= $time;
    end
    
    always @(posedge ap_done_o) begin
        time_pos_ap_done <= $time;
    end
    always @(negedge ap_done_o) begin
        time_neg_ap_done <= $time;
    end
//    always @(posedge ap_done_o) begin
//        time_pos_ap_done <= $time;
//    end
    
    // Load instructions
    reg [phit_size-1:0] instructions[0:depth_config-1];
    reg [dwidth_int-1:0] mem[0:num_col-1][0:(depth_config)-1];
    
    genvar c;
    generate
    for (c=0;c<num_col;c=c+1) begin
        reg [dwidth_int-1:0] read_inst[0:depth_config-1];
        string s, path;
        initial begin
            s.itoa(c);
//            path = {"/home/pouya/github/G-FPin_HW_old/G-FPin_HW/NetFPGA-PLUS/hw/lib/std/CGRA_v1_0_0/test/instructions/Cora/12/collective_",s,".bin"};
            // path = {"/home/pouya/Documents/CGRA_binaries/gcn_xv_",s,".bin"};
          path = {"../../../../../../toolchain/assembler/Assembly_code/gcn_xv_",s,".bin"};
            $readmemb(path,read_inst);
            #1;
            mem[c] = read_inst;
        end
    end
    endgenerate
    
    genvar i,j;
    generate
    for (i=0;i<num_col;i=i+1) begin
        for (j=0;j<depth_config;j=j+1) begin
            assign instructions[j][dwidth_int*(i+1)-1:dwidth_int*i] = mem[i][j];
        end
    end 
    for (i=num_col;i<16-num_col;i=i+1) begin
        for (j=0;j<depth_config;j=j+1) begin
            assign instructions[j][dwidth_int*(i+1)-1:dwidth_int*i] = '0;
        end
    end 
    endgenerate   
    
    integer k;
    time t_sin_local, t_sin_tot;
    time t_sout_local, t_sout_tot;
    time t_ap_done;
    integer tk=23;
    integer tm=1;
    genvar y, z;
    
    initial begin
    integer z;
            t_sout_tot = 0;
       for (z=0; z<tm; z=z+1) begin
            wait(axis01_tvalid);
            wait(!axis01_tvalid);
            #2;
    //        $display("time is: %t", $time);
            t_sout_local = time_neg_out_stream-time_pos_out_stream;
            $display("stream_out_tvalid took: %t", t_sout_local);
            t_sout_tot += t_sout_local;
        end
         $display("total_time sout: %t", t_sout_tot); 
//         wait(ap_done_o); 
//         #2;
//         $display("time_app: %t", time_pos_ap_done);
//         $display("sout_BW: %t", t_sout_tot/(time_pos_ap_done-696));
    end
    
    initial begin
    integer y;
        t_sin_tot = 0;

        for (y=0; y<tk+1; y=y+1) begin
            wait(axis00_tvalid);
            wait(!axis00_tvalid);
            #2;
    //        $display("time is: %t", $time);
            t_sin_local = time_neg_in_stream-time_pos_in_stream;
            $display("stream_in_tvalid took: %t", t_sin_local);
            t_sin_tot += t_sin_local;
        end
        
        $display("total_time sin: %t", t_sin_tot); 

    end
    
    initial begin
    integer y;
            wait(ap_done_o);
//            wait(!ap_done_o);
            #2;
    //        $display("time is: %t", $time);
            t_ap_done = time_neg_ap_done-time_pos_ap_done;
            $display("ap_done took: %t", time_pos_ap_done);
        

    end
    
//    initial begin
//         wait(ap_done_o); 
//         #2;
//         $display("time_app: %t", time_pos_ap_done);
////         $display("sin_BW: %t", t_sin_tot/(time_pos_ap_done-696)); 
////         $display("sout_BW: %t", t_sout_tot/(time_pos_ap_done-696));
//    end
    
    
    
    initial begin
//        instructions = '{default:0};
        
        // Reset
        ap_clk                       = 1'b1;
        ap_rst_n                     = 1'b0; 
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
        m00_axi_awready         <= 1'b0;
        m00_axi_bvalid          <= 1'b0;
        m00_axi_rdata           <= 512'b0;
        m00_axi_rlast           <= 1'b0;
        m00_axi_rvalid          <= 1'b0;
        m00_axi_wready          <= 1'b0;
        #(depth_config*clk_pd); ap_rst_n = 1'b1;
        // trigger ap_start
        s_axi_control_awaddr <= 5'b0;
        s_axi_control_awvalid <= 1'b1;
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
        
        #60; //ctrl start goes high and sample offset and size, arready is high, HBM latency
        
        // Start instructions write
        m00_axi_rvalid <= 1'b1; 
        
        //start instructions
        for (k=0; k<depth_config; k=k+1) begin
            m00_axi_rdata <= instructions[k];
            $display("Instruction %d: %b",k,m00_axi_rdata);
            if (k==(depth_config-1))
                m00_axi_rlast <= 1'b1;
            #clk_pd;
            m00_axi_rlast <= 1'b0;
        end
        // stop loading
        m00_axi_rvalid <= 1'b0;
        #clk_pd;
        
        
        
        #10000;

        
        #(clk_pd*2000000);
    $finish;
    end

endmodule


