`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module data_path(
    input  logic                                done_loader,
    input  logic [(dwidth_inst*num_col)-1:0]    instr, // vector instruction
    input  logic                                clk,
    input  logic                                rst,
    output logic                                ap_done,
    // stream
    input  logic [phit_size-1:0]                tdata_stream_in,
    input  logic                                tvalid_stream_in,
    output logic                                tready_stream_in,
    input  logic                                tlast_stream_in,
    input  logic [phit_size/8-1:0]              tkeep_stream_in,
    
    output logic [phit_size-1:0]                tdata_stream_out,
    output logic                                tvalid_stream_out,
    input  logic                                tready_stream_out,
    output logic                                tlast_stream_out,
    output logic [phit_size/8-1:0]              tkeep_stream_out,
    // AXI read
    output logic [(dwidth_aximm*num_col)-1:0]   araddr_HBM,
    input  logic [num_col-1:0]                  arready_HBM,
    input  logic [num_col-1:0]                  rvalid_HBM,
    input  logic [(phit_size*num_col)-1:0]      rdata_HBM,
    output logic [num_col-1:0]                  rready_HBM,
    output logic [num_col-1:0]                  arvalid_HBM,
    output logic [(8*num_col)-1:0]              arlen_HBM,
    input  logic [num_col-1:0]                  rlast_HBM,
    // AXI write
    output logic [num_col-1:0]                  wvalid_HBM,
    input  logic [num_col-1:0]                  wready_HBM,
    output logic [num_col-1:0]                  awvalid_HBM,
    output logic [(num_col*8)-1:0]              awlen_HBM,
    output logic [(num_col*phit_size)-1:0]      wdata_HBM,
    output logic [(num_col*(phit_size/8))-1:0]  wstrb_HBM,
    output logic [num_col-1:0]                  wlast_HBM,
    input  logic [num_col-1:0]                  bvalid_HBM,
    output logic [num_col-1:0]                  bready_HBM,
    output logic [(dwidth_aximm*num_col)-1:0]   awaddr_HBM,
    input  logic [num_col-1:0]                  awready_HBM,
    //PC
    output logic [num_col-1:0]                  clken_PC,
    output logic [num_col-1:0]                  load_PC,
    output logic [num_col-1:0]                  incr_PC,
    output logic [(num_col*12)-1:0]             load_value_PC,
    input  logic [dwidth_int-1:0]               cycle_register
    
    );
    
    localparam phitplus = phit_size + SIMD_degree; // bundle {tvalid, tdata}
    localparam phitplusplus = phit_size + SIMD_degree*2; // bundle {tlast, tvalid, tdata}

    logic [(2*num_col)-1:0] sel_mux2;
    logic [((num_col)*3)-1:0] op;
    logic [((num_col)*3)-1:0] op_scalar;
    logic [(phit_size*num_col)-1:0] o_RF;
    logic [(phit_size*num_col)-1:0] i1_PE_typeC, i2_PE_typeC, o1_PE_typeC, o2_PE_typeC; // the last bundle of SIMD_degree signals is for tvalid
    logic [(phit_size*num_col)-1:0] i3_PE_typeC; // this directly connects the RD output of the RF to the PE input 
    logic [(SIMD_degree*num_col)-1:0] i_tvalid1_PE_typeC, i_tvalid2_PE_typeC, o1_tvalid1_PE_typeC, o2_tvalid1_PE_typeC;
    logic [(5*num_col)-1:0] rs1, rs2, rd;
    logic [(dwidth_RFadd*num_col)-1:0] vr_addr;
    logic [(dwidth_RFadd*num_col)-1:0] vw_addr;
    logic [num_col-1:0] is_not_vect;
    logic [(12*num_col)-1:0] branch_immediate; 
    logic [(dwidth_int*num_col)-1:0] R_immediate;
    logic [(dwidth_int*num_col)-1:0] rddata1_RF_scalar;
    logic [(dwidth_int*num_col)-1:0] rddata2_RF_scalar;
    logic [(dwidth_int*num_col)-1:0] wdata_RF_scalar;
    logic [(dwidth_RFadd*num_col)-1:0] vr_addr1_auto_incr,vr_addr2_auto_incr;
    logic [(dwidth_RFadd*num_col)-1:0] vw_addr_auto_incr, vw_addr_d;
    logic [num_col-1:0] done_auto_incr;
    logic [phit_size-1:0] FIFO_out_tdata;
    logic [SIMD_degree-1:0] FIFO_out_tvalid;
    logic [SIMD_degree-1:0] FIFO_out_tlast;
    logic [num_col-1:0] wen_RF_scalar;
    logic [num_col-1:0] is_vle32_vv, is_vse32_vv, is_vmacc_vv, is_vmv_vi, is_vstreamout, is_vsetivli, is_bne, is_csr, is_lui;
    logic [num_col-1:0] stall_HBM;
    logic [num_col-1:0] stall_rd_autovect, stall_wr_autovect;
    logic [num_col-1:0] read_done_HBM, write_done_HBM; // I dont need them for now as done signal from auto_incr_vect module gives me the right answer
    logic [num_col-1:0] flag_neq;
    logic t_stall;
    logic [(num_col*phit_size)-1:0] user_rdata_HBM;
    logic [num_col-1:0] user_rvalid_HBM, user_wready_HBM;
    logic [num_col-1:0] valid_PE_i, valid_PE_o;
    
    // Internal Stream in/out
    logic [SIMD_degree-1:0] tvalid_stream_in_lane  ;
    logic [SIMD_degree-1:0] tready_stream_in_lane  ; 
    logic [SIMD_degree-1:0] tvalid_stream_out_lane ; 
    logic [SIMD_degree*num_col-1:0] tlast_stream_in_lane   ; 
    logic [SIMD_degree-1:0] tlast_stream_out_lane  ; 
    logic [SIMD_degree*num_col-1:0] tlast_stream_out_lane_1 ; 
    logic [SIMD_degree*num_col-1:0] tlast_stream_out_lane_2 ; 
    
    assign tready_stream_in = &tready_stream_in_lane;
    assign tvalid_stream_in = &tvalid_stream_in_lane;
    assign tlast_stream_out = &tlast_stream_out_lane;
    
    
    
    // This part is ISA-specific:
    logic [num_col-1:0] ctrl_i_mux2_tvalid; //generated internally based on op
    logic [(dwidth_RFadd*num_col)-1:0] ITR;
    logic [num_col-1:0] wen_ITR;
    logic [SIMD_degree-1:0] full_FIFO_in, empty_FIFO_in, full_FIFO_out, empty_FIFO_out;
    
    // FSM for done_loader
    logic done_steady;
    logic curr_state_done_loader, next_state_done_loader;
    localparam steady_off = 1'b0;
    localparam steady_on  = 1'b1;
    always_ff @(posedge clk) begin
        if (rst) begin
            curr_state_done_loader <= steady_off;
        end
        else begin
            curr_state_done_loader <= next_state_done_loader;
        end
    end

    always_comb begin
        case(curr_state_done_loader)
            steady_off: next_state_done_loader = (done_loader) ? steady_on : steady_off;
            steady_on: next_state_done_loader = (ap_done) ? steady_off : steady_on;
            default: next_state_done_loader = steady_off;
        endcase
    end
    assign done_steady = curr_state_done_loader;
    
    
    genvar i;
    generate 
        for (i=0; i<SIMD_degree; i++) begin
            // Stream in/out signals expansion and condensation
            assign tvalid_stream_in_lane[i] = &tkeep_stream_in[(i*4)+3:i*4]; 
             
            sync_FIFO #(dwidth_float+2, 16) sync_FIFO_inst0(
            .clk(clk),
            .rst(rst),
            .push(tvalid_stream_in_lane[i] && !full_FIFO_in[i]),
            .pop(!t_stall && !empty_FIFO_in[i]), 
            .din({tlast_stream_in, tvalid_stream_in_lane[i], tdata_stream_in[((i+1)*dwidth_float)-1:i*dwidth_float]}),
            .dout({FIFO_out_tlast[i], FIFO_out_tvalid[i], FIFO_out_tdata[((i+1)*dwidth_float)-1:i*dwidth_float]}),
            .empty(empty_FIFO_in[i]),
            .full(full_FIFO_in[i])
            );
            
            assign tready_stream_in_lane[i] = !full_FIFO_in[i] & done_steady & !t_stall;
        end
    endgenerate
    
    // I can design the arch in a way that I have only one PC and one X registerfile but
    // in order to decrease the overhead of signal loading, routing its better to have one for ea. column
    assign t_stall = (|stall_HBM) || (|is_not_vect);
    
    genvar j;
    generate 
        for (j=0; j<num_col; j++) begin
            assign stall_HBM[j] = (is_vle32_vv[j] & (!(user_rvalid_HBM[j]&rready_HBM[j]))) || (is_vse32_vv[j] & (!(user_wready_HBM[j]&wvalid_HBM[j])));
            assign stall_rd_autovect[j] = (is_vse32_vv[j] & (!(user_wready_HBM[j]&wvalid_HBM[j]))) || (is_vmacc_vv[j] & !valid_PE_i[j]);
            assign stall_wr_autovect[j] = (is_vle32_vv[j] & (!(user_rvalid_HBM[j]&rready_HBM[j]))) || (is_vmacc_vv[j] & !valid_PE_o[j]);
            // if it is vmacc and tvalids are zero then you should stall auto_vect but not input FIFO 
            assign valid_PE_i[j] = (&i_tvalid1_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j]) & (&i_tvalid2_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j]);
            assign valid_PE_o[j] = (&o1_tvalid1_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j]);
//            assign rready_HBM[j] = 1'b1;
            
            ISA_decoder ISA_decoder_inst
            (.instr(instr[((j+1)*dwidth_inst)-1:j*dwidth_inst]),
             .clk(clk),
             .rst(rst),
             .ctrl_i_mux2_tvalid(ctrl_i_mux2_tvalid[j]),
             .rs1(rs1[((j+1)*5)-1:j*5]),
             .rs2(rs2[((j+1)*5)-1:j*5]),
             .rd(rd[((j+1)*5)-1:j*5]),
             .ITR(ITR[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
//             .wen_ITR(wen_ITR[j]),
             .is_vsetivli(is_vsetivli[j]),
             .vr_addr(vr_addr[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
             .vw_addr(vw_addr[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
             .is_not_vect(is_not_vect[j]),
             .is_vle32_vv(is_vle32_vv[j]),
             .is_vse32_vv(is_vse32_vv[j]),
             .is_vmacc_vv(is_vmacc_vv[j]),
             .is_vmv_vi(is_vmv_vi[j]),
             .is_vstreamout(is_vstreamout[j]),
             .is_bne(is_bne[j]),
             .is_csr(is_csr[j]),
             .is_lui(is_lui[j]),
             .branch_immediate(branch_immediate[((j+1)*12)-1:j*12]),
             .R_immediate(R_immediate[((j+1)*dwidth_int)-1:j*dwidth_int]),
             .op(op[((j+1)*3)-1:j*3]),
             .op_scalar(op_scalar[((j+1)*3)-1:j*3]),
             .wen_RF_scalar(wen_RF_scalar[j]),
             .ap_done(ap_done),
             .done_steady(done_steady)
             );
             
             // Register pipeline - delay VD into auto_incr_vect vw
             register_pipe #(dwidth_RFadd*num_col, latencyPEC) rp_inst0(clk,rst, vw_addr,vw_addr_d);
             
             auto_incr_vect auto_incr_vect_inst(
             .clk(clk), 
             .rst(rst),
             .ITR(ITR[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
             .stall_rd(stall_rd_autovect[j]), // clk_en
             .stall_wr(stall_wr_autovect[j]),
             .is_vmacc_vv(is_vmacc_vv[j]),
             .is_vle32_v(is_vle32_vv[j]),
             .is_vse32_v(is_vse32_vv[j]),
             .is_streamout(is_vstreamout[j]),
             .is_vsetivli(is_vsetivli[j]),
             .vr_addr1(vr_addr[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
             .vr_addr2(vw_addr[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
             .vw_addr((is_vse32_vv || is_vle32_vv) ? vw_addr[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd] : vw_addr_d[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),  // if VSE or VLE, choose non-delayed VD. Else, use delayed VD
             .vr_addr1_auto_incr(vr_addr1_auto_incr[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
             .vr_addr2_auto_incr(vr_addr2_auto_incr[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
             .vw_addr_auto_incr(vw_addr_auto_incr[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
             .load_PC(load_PC[j]),
             .incr_PC(incr_PC[j]),
             .wen_ITR(wen_ITR[j]),
             .done(done_auto_incr[j]) // one clock pulse
             );
             
             // vectorized regFile
             regFile regFile_inst0(.d_in(is_vmv_vi[j]?{(phit_size){1'b0}}:(is_vmacc_vv[j]?o1_PE_typeC[(phit_size*(j+1))-1:phit_size*j]:user_rdata_HBM[(phit_size*(j+1))-1:phit_size*j])), // based on op I would choose wdata, o_RF or HBM. vmv.v.i is not supported: ctrl_din_RF[(j*3)+0]==1 :rdata_config_table[(phit_size*(j+1))-1:phit_size*j]
             .clk(clk),
             .rd_addr1(vr_addr1_auto_incr[(dwidth_RFadd*(j+1))-1:dwidth_RFadd*j]), // rd_addr_RF is one of the fields in tables (auto-increment address generator)
             .rd_addr2(vr_addr2_auto_incr[(dwidth_RFadd*(j+1))-1:dwidth_RFadd*j]), // rd_addr_2 is ONLY for vmacc, is VD iterated 
             .wr_addr(vw_addr_auto_incr[(dwidth_RFadd*(j+1))-1:dwidth_RFadd*j]), // write addr, delayed only if not vse
             .wen(is_vmv_vi[j]?1'b0:(is_vmacc_vv[j]?valid_PE_o[j]:is_vle32_vv[j]?user_rvalid_HBM[j]:1'b0)), // based on op I would choose the correct tvalid_wdata or 1'b0 if it is a read. ctrl_din_RF[(j*3)+0]==1: tvalid_config_table[j]
             .d_out1(o_RF[(phit_size*(j+1))-1:phit_size*j]),
             .d_out2(i3_PE_typeC[(phit_size*(j+1))-1:phit_size*j]));
             
             // scalar regFile   
             regFile_scalar regFile_scalar_inst0(
             .clk(clk),
             .we(wen_RF_scalar[j]),
             .rr1(rs1[((j+1)*5)-1:j*5]),
             .rr2(rs2[((j+1)*5)-1:j*5]),
             .wr(rd[((j+1)*5)-1:j*5]),
             .wd((is_csr[j])? cycle_register: ((is_lui[j])? R_immediate[((j+1)*dwidth_int)-1:j*dwidth_int]: wdata_RF_scalar[((j+1)*dwidth_int)-1:j*dwidth_int])),
             .dr1(rddata1_RF_scalar[((j+1)*dwidth_int)-1:j*dwidth_int]),
             .dr2(rddata2_RF_scalar[((j+1)*dwidth_int)-1:j*dwidth_int])
             );
             
             // HBM read master
             HBM_read_master HBM_read_master_inst0(
             .aclk(clk),
             .areset(rst),
             .ctrl_start(wen_ITR[j]),
             .ctrl_done(read_done_HBM[j]),    
             .ctrl_addr_offset({32'b0, rddata1_RF_scalar[((j+1)*dwidth_int)-1:j*dwidth_int]}),
             .ctrl_xfer_size_in_bytes({{(64-dwidth_RFadd-6){1'b0}}, ITR[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd], 6'b0}-64'd64), // 6'b0 because each VRF entry is 64 Bytes
             // -64 because AXI needs ITR-1 (length-1)
             .m_axi_arvalid(arvalid_HBM[j]),
             .m_axi_arready(arready_HBM[j]),
             .m_axi_araddr(araddr_HBM[((j+1)*dwidth_aximm)-1:j*dwidth_aximm]),
             .m_axi_arlen(arlen_HBM[((j+1)*8)-1:j*8]),
             .m_axi_rvalid(rvalid_HBM[j]),
             .m_axi_rready(rready_HBM[j]),
             .m_axi_rdata(rdata_HBM[((j+1)*phit_size)-1:j*phit_size]),
             .m_axi_rlast(rlast_HBM[j]),
             .m_axis_tvalid(user_rvalid_HBM[j]),
             .m_axis_tdata(user_rdata_HBM[((j+1)*phit_size)-1:j*phit_size]),
             .m_axis_tready(is_vle32_vv[j])
             );
             
             // HBM write master
             HBM_write_master HBM_write_master_inst0
             (
             .aclk(clk),
             .areset(rst),
             .ctrl_start(wen_ITR[j]),              // Pulse high for one cycle to begin reading
             .ctrl_done(write_done_HBM[j]),               // Pulses high for one cycle when transfer request is complete
             .ctrl_addr_offset({32'b0, rddata1_RF_scalar[((j+1)*dwidth_int)-1:j*dwidth_int]}),        // Starting Address offset
             .ctrl_xfer_size_in_bytes({{(dwidth_aximm-dwidth_RFadd-6){1'b0}}, ITR[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd], 6'b0}-64'd64), // Length in number of bytes, limited by the address width.
             .m_axi_awvalid(awvalid_HBM[j]),
             .m_axi_awready(awready_HBM[j]),
             .m_axi_awaddr(awaddr_HBM[((j+1)*dwidth_aximm)-1:j*dwidth_aximm]),
             .m_axi_awlen(awlen_HBM[((j+1)*8)-1:j*8]),
             .m_axi_wvalid(wvalid_HBM[j]),
             .m_axi_wready(wready_HBM[j]),
             .m_axi_wdata(wdata_HBM[((j+1)*phit_size)-1:j*phit_size]),
             .m_axi_wstrb(wstrb_HBM[((j+1)*phit_size/8)-1:j*phit_size/8]),
             .m_axi_wlast(wlast_HBM[j]),
             .m_axi_bvalid(bvalid_HBM[j]),
             .m_axi_bready(bready_HBM[j]),
             .s_axis_tvalid(is_vse32_vv[j]),
             .s_axis_tready(user_wready_HBM[j]),
             .s_axis_tdata(o_RF[(phit_size*(j+1))-1:phit_size*j]) 
             );
             
             // vectorized PE
             vectorized_PE vectorized_PE_inst0
             (
             .i1_PE_typeC(i1_PE_typeC[(phit_size*(j+1))-1:phit_size*j]),
             .i2_PE_typeC(i2_PE_typeC[(phit_size*(j+1))-1:phit_size*j]),
             .i3_PE_typeC(i3_PE_typeC[(phit_size*(j+1))-1:phit_size*j]),
             .i_tlast_PE_typeC(tlast_stream_in_lane[(SIMD_degree*(j+1))-1:SIMD_degree*j]),
             .i_tvalid1_PE_typeC(i_tvalid1_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j]),
             .i_tvalid2_PE_typeC(i_tvalid2_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j]),
//             .i_tvalid3_PE_typeC(i_tvalid3_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j]),
             .clk(clk),
             .rst(rst),
             .op(op[((j+1)*3)-1:j*3]),
             .o1_PE_typeC(o1_PE_typeC[(phit_size*(j+1))-1:phit_size*j]),
             .o2_PE_typeC(o2_PE_typeC[(phit_size*(j+1))-1:phit_size*j]),
             .o1_tlast_PE_typeC(tlast_stream_out_lane_1[(SIMD_degree*(j+1))-1:SIMD_degree*j]),
             .o2_tlast_PE_typeC(tlast_stream_out_lane_2[(SIMD_degree*(j+1))-1:SIMD_degree*j]),
             .o1_tvalid1_PE_typeC(o1_tvalid1_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j]),
             .o2_tvalid1_PE_typeC(o2_tvalid1_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j])            
             );
             
             // scalar PE
             PE_scalar PE_scalar_inst0
             (.inp1(rddata1_RF_scalar[((j+1)*dwidth_int)-1:j*dwidth_int]),
              .inp2(rddata2_RF_scalar[((j+1)*dwidth_int)-1:j*dwidth_int]),
              .R_immediate(R_immediate[((j+1)*dwidth_int)-1:j*dwidth_int]),
              .op_scalar(op_scalar[((j+1)*3)-1:j*3]),
              .out1(wdata_RF_scalar[((j+1)*dwidth_int)-1:j*dwidth_int]),
              .flag_neq(flag_neq[j]) // correct me
             );

             // PC logic
             PC_logic PC_logic_inst0
             (
              .is_not_vect(is_not_vect[j]),
              .done_auto_incr(done_auto_incr[j]),
              .is_bne(is_bne[j]),
              .flag_neq(flag_neq[j]),
              .branch_immediate(branch_immediate[((j+1)*12)-1:j*12]),
              .done_steady(done_steady),
              .clken_PC(clken_PC[j]),
              .load_PC(load_PC[j]),
              .incr_PC(incr_PC[j]),
              .load_value_PC(load_value_PC[((j+1)*12)-1:j*12])
             );
             
         if (j == 0) begin
             mux2 #(phitplusplus) mux2_inst0_if ({FIFO_out_tlast, FIFO_out_tvalid, FIFO_out_tdata}, 
                                                 {(phitplusplus){1'b0}}, 
                                                 sel_mux2[0], 
                                                 {tlast_stream_in_lane[(SIMD_degree*(j+1))-1:SIMD_degree*j], i_tvalid1_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j], i1_PE_typeC[(phit_size*(j+1))-1:phit_size*j]});
             
             mux2 #(phitplus) mux2_inst1_if ({{(SIMD_degree){ctrl_i_mux2_tvalid[j]}}, o_RF[(phit_size*(j+1))-1:phit_size*j]}, 
                                             {(phitplus){1'b0}}, 
                                             sel_mux2[1], 
                                             {i_tvalid2_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j], i2_PE_typeC[(phit_size*(j+1))-1:phit_size*j]});  // second input was considered for imm (but not yet supported b/c it is not in riscv): {{(SIMD_degree){tvalid_config_table[0]}}, {SIMD_degree{imm[(dwidth_float*1)-1:dwidth_float*0]}}}  
            assign sel_mux2[0] = 1'b0;
            assign sel_mux2[1] = 1'b0;
         end
         else begin
             mux2 #(phitplusplus) mux2_inst0_else ({tlast_stream_out_lane_1[(SIMD_degree*j)-1:SIMD_degree*(j-1)], o1_tvalid1_PE_typeC[(SIMD_degree*j)-1:SIMD_degree*(j-1)], o1_PE_typeC[(phit_size*j)-1:(phit_size*(j-1))]}, 
                                                   {tlast_stream_out_lane_2[(SIMD_degree*j)-1:SIMD_degree*(j-1)], o2_tvalid1_PE_typeC[(SIMD_degree*j)-1:SIMD_degree*(j-1)], o2_PE_typeC[(phit_size*j)-1:(phit_size*(j-1))]}, // need to add different last
                                                   sel_mux2[(j*2)+0], 
                                                   {tlast_stream_in_lane[(SIMD_degree*(j+1))-1:SIMD_degree*j], i_tvalid1_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j], i1_PE_typeC[(phit_size*(j+1))-1:phit_size*j]});
             mux2 #(phitplus) mux2_inst1_else ({{(SIMD_degree){ctrl_i_mux2_tvalid[j]}}, o_RF[(phit_size*(j+1))-1:phit_size*j]}, 
                                               {(phitplus){1'b0}}, 
                                               sel_mux2[(j*2)+1], 
                                               {i_tvalid2_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j], i2_PE_typeC[(phit_size*(j+1))-1:phit_size*j]});  // second input was considered for imm (but not yet supported): {{(SIMD_degree){tvalid_config_table[0]}}, {SIMD_degree{imm[(dwidth_float*1)-1:dwidth_float*0]}}}
             assign sel_mux2[(j*2)+0] = 1'b1;
             assign sel_mux2[(j*2)+1] = 1'b0;
         end
             
        end
    endgenerate

    generate
        for (i=0; i<SIMD_degree; i++) begin
            assign tkeep_stream_out[i*4  ] = tvalid_stream_out_lane[i];
            assign tkeep_stream_out[i*4+1] = tvalid_stream_out_lane[i];
            assign tkeep_stream_out[i*4+2] = tvalid_stream_out_lane[i];
            assign tkeep_stream_out[i*4+3] = tvalid_stream_out_lane[i];
            
            sync_FIFO #(dwidth_float+2, 16) sync_FIFO_inst1(
            .clk(clk),
            .rst(rst),
            .push(o2_tvalid1_PE_typeC[(SIMD_degree*(num_col-1))+i] && is_vstreamout[num_col-1] && !full_FIFO_out[i]), // fixing a bug: instead of tvalid_stream_in[i], we use last_PE valid signal
            .pop(tready_stream_out && !empty_FIFO_out[i]),
            .din({tlast_stream_out_lane_2[(SIMD_degree*(num_col-1))+i], o2_tvalid1_PE_typeC[(SIMD_degree*(num_col-1))+i], o2_PE_typeC[(phit_size*(num_col-1))+(dwidth_float*(i+1))-1:dwidth_float*i]}),
            .dout({tlast_stream_out_lane[i], tvalid_stream_out_lane[i], tdata_stream_out[((i+1)*dwidth_float)-1:i*dwidth_float]}),
            .empty(empty_FIFO_out[i]),
            .full(full_FIFO_out[i])
            );

        end
    endgenerate
    
endmodule
