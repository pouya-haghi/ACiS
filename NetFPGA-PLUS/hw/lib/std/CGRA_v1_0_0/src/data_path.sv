`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module data_path(
    // misc
    input  logic [dwidth_int-1:0]               cycle_register,
    input  logic                                done_loader,
    input  logic [(dwidth_inst*num_col)-1:0]    instr, // vector, scalar, config
    input  logic                                clk,
    input  logic                                rst,
    output logic                                ap_done,
    output logic                                done_steady,
    // stream_in
    input  logic [phit_size-1:0]                tdata_stream_in,
    input  logic                                tvalid_stream_in,
    output logic                                tready_stream_in,
    input  logic                                tlast_stream_in,
    input  logic [phit_size/8-1:0]              tkeep_stream_in,
    // stream_out
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
    // PC
    output logic [num_col-1:0]                  clken_PC,
    output logic [num_col-1:0]                  load_PC,
    output logic [num_col-1:0]                  incr_PC,
    output logic [(num_col*12)-1:0]             load_value_PC
    );
    
    localparam phitplus = phit_size + SIMD_degree; // bundle {tvalid, tdata}
    localparam phitplusplus = phit_size + SIMD_degree*2; // bundle {tlast, tvalid, tdata}

    logic [((num_col)*3)-1:0] op;
//    logic clken_PC_vstreamout;
    logic [((num_col)*3)-1:0] op_scalar;
    logic [(phit_size*num_col)-1:0] o1_RF, o2_RF;
    logic [(phit_size*num_col)-1:0] o_PE_typeC; // the last bundle of SIMD_degree signals is for tvalid
    logic [(SIMD_degree*num_col)-1:0] o_tvalid_PE_typeC;
    logic [(SIMD_degree*num_col)-1:0] tlast1_RF, tlast2_RF;
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
    logic [phit_size-1:0] FIFO_in_tdata;
    logic [phit_size/8-1:0] FIFO_in_tkeep;
    logic FIFO_in_tvalid;
    logic FIFO_in_tlast;
    logic [phit_size-1:0] FIFO_out_tdata;
    logic [SIMD_degree-1:0] FIFO_out_tvalid;
    logic [SIMD_degree-1:0] FIFO_out_tlast;
    logic [phit_size-1:0] assembler_tdata;
    logic [SIMD_degree-1:0] assembler_tvalid;
    logic [SIMD_degree-1:0] assembler_tlast;
    logic [num_col-1:0] wen_RF_scalar;
    logic [num_col-1:0] is_vle32_vv, is_vse32_vv, is_vmacc_vv, is_vmv_vi, is_vstreamout, is_vsetivli, is_bne, is_csr, is_lui, is_spl;
    logic [num_col-1:0] stall_FIFO;
    logic [num_col-1:0] stall_rd_autovect, stall_wr_autovect;
    logic [num_col-1:0] read_done_HBM, write_done_HBM; 
    logic [num_col-1:0] flag_neq;
    logic t_stall;
    logic [(num_col*phit_size)-1:0] user_rdata_HBM;
    logic [num_col-1:0] user_rvalid_HBM, user_wready_HBM;
    logic [num_col-1:0] valid_PE_i, valid_PE_o;
    logic [num_col-1:0] ap_done_decoder;
    logic ap_done_t;
    
    // Internal Stream in/out
    logic [SIMD_degree-1:0] tvalid_stream_in_lane;
    logic [SIMD_degree-1:0] tready_stream_in_lane; 
    logic [SIMD_degree-1:0] tvalid_stream_out_lane; 
    logic [SIMD_degree-1:0] tlast_stream_out_lane; 
    logic [SIMD_degree*num_col-1:0] o_tlast_PE_typeC; 
    logic [(phit_size*num_col)-1:0] tdata_stream;
    logic [(SIMD_degree*num_col)-1:0] tvalid_stream;
    logic [(SIMD_degree*num_col)-1:0] tlast_stream;
    
    // This part is ISA-specific:
    logic [num_col-1:0] tvalid_RF; // generated internally based on op
    logic [(dwidth_RFadd*num_col)-1:0] ITR, ITR_delay;
    logic [num_col-1:0] wen_ITR;
    logic [SIMD_degree:0] full_FIFO_in, empty_FIFO_in, full_FIFO_out, empty_FIFO_out;

    // Stream out control
    logic is_vstreamout_global;
    logic [num_col-1:0] supplier;
    logic [num_col-1:0] sel_mux2;
    
    // FSM for done_loader
    logic done_steady_t;
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
            steady_on: next_state_done_loader = (ap_done_t) ? steady_off : steady_on;
            default: next_state_done_loader = steady_off;
        endcase
    end
    assign done_steady_t = curr_state_done_loader;
    assign done_steady = done_steady_t;
    
    assign t_stall = (|stall_FIFO) || (|is_not_vect);
    assign ap_done_t = &ap_done_decoder; // synchronization
    assign ap_done = ap_done_t;

    // Stream in concatination
    assign tready_stream_in = &tready_stream_in_lane;
    
    // Sync FIFO for stream in
    genvar i;
    generate 
        for (i=0; i<SIMD_degree; i++) begin             
            sync_FIFO #(dwidth_float+4, 16) sync_FIFO_inst0(
            .clk(clk),
            .rst(rst),
            .push((tvalid_stream_in && (&tkeep_stream_in[(i*4)+3:i*4])) && !full_FIFO_in[i]),
            .pop(!t_stall && !empty_FIFO_in[i]), 
            .din({tkeep_stream_in[(i*4)+3:i*4], tdata_stream_in[((i+1)*dwidth_float)-1:i*dwidth_float]}),
            .dout({FIFO_in_tkeep[(i*4)+3:i*4], FIFO_in_tdata[((i+1)*dwidth_float)-1:i*dwidth_float]}),
            .empty(empty_FIFO_in[i]),
            .full(full_FIFO_in[i])
            );
            
            assign tready_stream_in_lane[i] = !full_FIFO_in[i] & done_steady_t & !t_stall;
        end
    endgenerate
    sync_FIFO #(2, 16) sync_FIFO_inst1(
        .clk(clk),
        .rst(rst),
        .push(tvalid_stream_in && !full_FIFO_in[SIMD_degree]),
        .pop(!t_stall && !empty_FIFO_in[SIMD_degree]), 
        .din({tlast_stream_in, tlast_stream_in}),
        .dout({FIFO_in_tvalid, FIFO_in_tlast}),
        .empty(empty_FIFO_in[i]),
        .full(full_FIFO_in[i])
        );
    
    // Disassembler
    logic is_header;
    disassembler disassembler_inst0(
    .clk(clk),
    .rst(rst),
    .tready_in(tready_stream_in),
    .tdata_in(FIFO_in_tdata),
    .tkeep_in(FIFO_in_tkeep),
    .tlast_in(FIFO_in_tlast),
    .tvalid_in(FIFO_in_tvalid),
    .empty(empty_FIFO_in),
    .is_header(is_header),
    .tdata_out(tdata_stream),
    .tlast_out(tlast_stream)
    .tvalid_out(tvalid_stream));
    

    genvar j;
    generate 
        for (j = 0; j < num_col; j++) begin
            assign stall_FIFO[j] = (is_vle32_vv[j]) || (is_vse32_vv[j]);
            assign stall_rd_autovect[j] = (is_vse32_vv[j] & (!(user_wready_HBM[j]&wvalid_HBM[j]))) || (is_vmacc_vv[j] & !valid_PE_i[j]) || (is_vstreamout_global & !supplier[j]) || (!is_vstreamout_global & is_vstreamout[j]);
            assign stall_wr_autovect[j] = (is_vle32_vv[j] & (!(user_rvalid_HBM[j]&rready_HBM[j]))) || (is_vmacc_vv[j] & !valid_PE_o[j]);
            // if it is vmacc and tvalids are zero then you should stall auto_vect but not input FIFO 
            assign valid_PE_i[j] = (|tvalid_stream[(SIMD_degree*(j+1))-1:SIMD_degree*j]) & tvalid_RF[j]; // PH: changed from & to |
            assign valid_PE_o[j] = (|o_tvalid_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j]); // PH: changed from & to |
            
            // *********************************     Front End       *******************************
            ISA_decoder ISA_decoder_inst(
            .instr(instr[((j+1)*dwidth_inst)-1:j*dwidth_inst]),
            .clk(clk),
            .rst(rst),
            .tvalid_RF(tvalid_RF[j]),
            .rs1(rs1[((j+1)*5)-1:j*5]),
            .rs2(rs2[((j+1)*5)-1:j*5]),
            .rd(rd[((j+1)*5)-1:j*5]),
            .ITR(ITR[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
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
            .is_spl(is_spl[j]),
            .branch_immediate(branch_immediate[((j+1)*12)-1:j*12]),
            .R_immediate(R_immediate[((j+1)*dwidth_int)-1:j*dwidth_int]),
            .op(op[((j+1)*3)-1:j*3]),
            .op_scalar(op_scalar[((j+1)*3)-1:j*3]),
            .wen_RF_scalar(wen_RF_scalar[j]),
            .ap_done(ap_done_decoder[j]),
            .done_steady(done_steady_t)
            );
            
            // Register pipeline: delay VD into auto_incr_vect vw
            register_pipe #(dwidth_RFadd, latencyPEC) rp_inst0(
            .clk(clk), 
            .rst(rst), 
            .din(vw_addr[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]), 
            .dout(vw_addr_d[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd])
            );
            
            // auto increment vector
            auto_incr_vect auto_incr_vect_inst(
            .clk(clk), 
            .rst(rst),
            .ITR(ITR[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
            .stall_rd(stall_rd_autovect[j]), // clk_en
            .stall_wr(stall_wr_autovect[j]),
            .is_vmacc_vv(is_vmacc_vv[j]),
            .is_vle32_v(is_vle32_vv[j]),
            .is_vse32_v(is_vse32_vv[j]),
            .is_vstreamout(is_vstreamout_global),
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
            .ITR_delay(ITR_delay[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
            .done(done_auto_incr[j]) // one clock pulse
            );
            // PC logic
            PC_logic PC_logic_inst0(
            .is_not_vect(is_not_vect[j]),
            .done_auto_incr(done_auto_incr[j]),
            .is_bne(is_bne[j]),
            .is_vstreamout(is_vstreamout_global),
            .streamout_incr((done_auto_incr[num_col-1] && supplier[num_col-1])),
            .flag_neq(flag_neq[j]),
            .branch_immediate(branch_immediate[((j+1)*12)-1:j*12]),
            .done_steady(done_steady_t),
            .clken_PC(clken_PC[j]),
            .load_PC(load_PC[j]),
            .incr_PC(incr_PC[j]),
            .load_value_PC(load_value_PC[((j+1)*12)-1:j*12])
            );
            // *********************************     Back End       *******************************
            // scalar PE
            PE_scalar PE_scalar_inst0(
             .inp1(rddata1_RF_scalar[((j+1)*dwidth_int)-1:j*dwidth_int]),
             .inp2(rddata2_RF_scalar[((j+1)*dwidth_int)-1:j*dwidth_int]),
             .R_immediate(R_immediate[((j+1)*dwidth_int)-1:j*dwidth_int]),
             .op_scalar(op_scalar[((j+1)*3)-1:j*3]),
             .out1(wdata_RF_scalar[((j+1)*dwidth_int)-1:j*dwidth_int]),
             .flag_neq(flag_neq[j])
            );
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
            // vectorized PE
            vectorized_PE vectorized_PE_inst0(
            .i1_PE_typeC(tdata_stream[(phit_size*(j+1))-1:phit_size*j]),
            .i2_PE_typeC(o1_RF[(phit_size*(j+1))-1:phit_size*j]),
            .i3_PE_typeC(o2_RF[(phit_size*(j+1))-1:phit_size*j]),
            .i_tlast1_PE_typeC(tlast_stream[(SIMD_degree*(j+1))-1:SIMD_degree*j]),
            .i_tlast2_PE_typeC(tlast1_RF[(SIMD_degree*(j+1))-1:SIMD_degree*j]),
            .i_tvalid1_PE_typeC(tvalid_stream[(SIMD_degree*(j+1))-1:SIMD_degree*j]),
            .i_tvalid2_PE_typeC({(SIMD_degree){valid_PE_i[j]}}),
            .clk(clk),
            .rst(rst),
            .op(op[((j+1)*3)-1:j*3]),
            .o_PE_typeC(o_PE_typeC[(phit_size*(j+1))-1:phit_size*j]),
            .o_tlast_PE_typeC(o_tlast_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j]),
            .o_tvalid_PE_typeC(o_tvalid_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j])
            );
            
            // vectorized regFile
            regFile_mask regFile_inst0( // PH: modified wen
            .d_in(is_vmv_vi[j] ? {(phit_size){1'b0}} : (is_vmacc_vv[j] ? o_PE_typeC[(phit_size*(j+1))-1:phit_size*j] : user_rdata_HBM[(phit_size*(j+1))-1:phit_size*j])), // based on op I would choose wdata, o1_RF or HBM. vmv.v.i is not supported: ctrl_din_RF[(j*3)+0]==1 :rdata_config_table[(phit_size*(j+1))-1:phit_size*j]
            .clk(clk),
            .rd_addr1(vr_addr1_auto_incr[(dwidth_RFadd*(j+1))-1:dwidth_RFadd*j]), // rd_addr_RF is one of the fields in tables (auto-increment address generator)
            .rd_addr2(vr_addr2_auto_incr[(dwidth_RFadd*(j+1))-1:dwidth_RFadd*j]), // rd_addr_2 is ONLY for vmacc, is VD iterated 
            .wr_addr(vw_addr_auto_incr[(dwidth_RFadd*(j+1))-1:dwidth_RFadd*j]), // write addr, delayed only if not vse
            .tlast_in(is_vmv_vi[j] ? {(SIMD_degree){1'b0}} : (is_vmacc_vv[j] ? o_tlast_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j] : {(SIMD_degree){1'b0}})),
            /  .wen(is_vmv_vi[j]?1'b0:(is_vmacc_vv[j]?valid_PE_o[j]:is_vle32_vv[j]?user_rvalid_HBM[j]:1'b0)), // based on op I would choose the correct tvalid_wdata or 1'b0 if it is a read. ctrl_din_RF[(j*3)+0]==1: tvalid_config_table[j]
            .wen(is_vmv_vi[j] ? {(SIMD_degree){1'b0}} : (is_vmacc_vv[j] ? o_tvalid_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j] : is_vle32_vv[j] ? {(SIMD_degree){user_rvalid_HBM[j]}} : {(SIMD_degree){1'b0}})), // based on op I would choose the correct tvalid_wdata or 1'b0 if it is a read. ctrl_din_RF[(j*3)+0]==1: tvalid_config_table[j]
            .d_out1(o1_RF[(phit_size*(j+1))-1:phit_size*j]),
            .d_out2(o2_RF[(phit_size*(j+1))-1:phit_size*j]),
            .tlast_out1(tlast1_RF[(SIMD_degree*(j+1))-1:SIMD_degree*j]));
            
            // HBM read master
            HBM_read_master HBM_read_master_inst0(
            .aclk(clk),
            .areset(rst),
            .ctrl_start(wen_ITR[j]),
            .ctrl_done(read_done_HBM[j]),    
            .ctrl_addr_offset({32'b0, rddata1_RF_scalar[((j+1)*dwidth_int)-1:j*dwidth_int]}),
//            .ctrl_xfer_size_in_bytes({{(64-dwidth_RFadd-6){1'b0}}, ITR_delay[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd], 6'b0}-64'd64), // 6'b0 because each VRF entry is 64 Bytes
            .ctrl_xfer_size_in_bytes({{(64-dwidth_RFadd-6){1'b0}}, ITR_delay[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd], 6'b0}), // 6'b0 because each VRF entry is 64 Bytes. PH: no need to decrement as runtimeloadtable itself does it
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
            HBM_write_master HBM_write_master_inst0(
            .aclk(clk),
            .areset(rst),
            .ctrl_start(wen_ITR[j]),              // Pulse high for one cycle to begin reading
            .ctrl_done(write_done_HBM[j]),               // Pulses high for one cycle when transfer request is complete
            .ctrl_addr_offset({32'b0, rddata1_RF_scalar[((j+1)*dwidth_int)-1:j*dwidth_int]}),        // Starting Address offset
//            .ctrl_xfer_size_in_bytes({{(dwidth_aximm-dwidth_RFadd-6){1'b0}}, ITR_delay[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd], 6'b0}-64'd64), // Length in number of bytes, limited by the address width.
            .ctrl_xfer_size_in_bytes({{(dwidth_aximm-dwidth_RFadd-6){1'b0}}, ITR_delay[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd], 6'b0}), //PH: no need to decrement as runtimeloadtable itself does it
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
            .s_axis_tdata(o1_RF[(phit_size*(j+1))-1:phit_size*j]) 
            );
        
        // MUXes for PEs
        if (j == num_col-1) begin
//            mux2 #(phitplusplus) mux2_inst0 ({tlast_stream[(SIMD_degree*(j+1))-1:SIMD_degree*j], (is_vstreamout_global) ? tvalid_stream[(SIMD_degree*(j+1))-1:SIMD_degree*j] : {SIMD_degree{1'b0}}, tdata_stream[(phit_size*(j+1))-1:phit_size*j]}, 
            mux2 #(phitplusplus) mux2_inst0 ({tlast_stream[(SIMD_degree*(j+1))-1:SIMD_degree*j], tvalid_stream[(SIMD_degree*(j+1))-1:SIMD_degree*j], tdata_stream[(phit_size*(j+1))-1:phit_size*j]}, 
                                            {tlast1_RF[(SIMD_degree*(j+1))-1:SIMD_degree*j], {(SIMD_degree){is_vstreamout_global & supplier[j]}}, o1_RF[(phit_size*(j+1))-1:(phit_size*j)]}, 
                                            sel_mux2[j], 
//                                            {FIFO_out_tlast, FIFO_out_tvalid, FIFO_out_tdata});
                                            {assembler_tlast, assembler_tvalid, assembler_tdata});
        end
        else begin
//            mux2 #(phitplusplus) mux2_inst1 ({tlast_stream[(SIMD_degree*(j+1))-1:SIMD_degree*j], (is_vstreamout_global) ? tvalid_stream[(SIMD_degree*(j+1))-1:SIMD_degree*j] : {SIMD_degree{1'b0}}, tdata_stream[(phit_size*(j+1))-1:phit_size*j]},
            mux2 #(phitplusplus) mux2_inst1 ({tlast_stream[(SIMD_degree*(j+1))-1:SIMD_degree*j], tvalid_stream[(SIMD_degree*(j+1))-1:SIMD_degree*j], tdata_stream[(phit_size*(j+1))-1:phit_size*j]},
                                            {tlast1_RF[(SIMD_degree*(j+1))-1:SIMD_degree*j], {(SIMD_degree){is_vstreamout_global & supplier[j]}}, o1_RF[(phit_size*(j+1))-1:(phit_size*j)]}, 
                                            sel_mux2[j], 
                                            {tlast_stream[(SIMD_degree*(j+2))-1:SIMD_degree*(j+1)], tvalid_stream[(SIMD_degree*(j+2))-1:SIMD_degree*(j+1)], tdata_stream[(phit_size*(j+2))-1:phit_size*(j+1)]});
        end
             
        end
    endgenerate   

    // Stream out concatination
    assign tvalid_stream_out = |tvalid_stream_out_lane; // if any values in phit are valid, tvalid = 1 but some tkeep = 0;
    assign tlast_stream_out = &tlast_stream_out_lane;
    
    // Assembler unit
    assembler assembler_inst0(
        .clk(clk),
        .rst(rst),
        .is_vstreamout_global(is_vstreamout_global),
        .is_spl(is_spl[0]),
        .RF_in(rddata1_RF_scalar[dwidth_int-1:0]),
        .tdata_in(assembler_tdata),
        .tvalid_in(assembler_tvalid),
        .tlast_in(assembler_tlast),
        .tdata_out(FIFO_out_tdata),
        .tvalid_out(FIFO_out_tvalid),
        .tlast_out(FIFO_out_tlast));
        
    // Sync FIFO for stream out
    generate
        for (i=0; i<SIMD_degree; i++) begin            
            sync_FIFO #(dwidth_float+2, 16) sync_FIFO_inst1(
            .clk(clk),
            .rst(rst),
            .push(FIFO_out_tvalid[i] && is_vstreamout_global && !full_FIFO_out[i]), // fixing a bug: instead of tvalid_stream_in[i], we use last_PE valid signal
            .pop(tready_stream_out && !empty_FIFO_out[i]),
            .din({FIFO_out_tlast[i], FIFO_out_tvalid[i],FIFO_out_tdata[(dwidth_float*(i+1))-1:dwidth_float*i]}),
            .dout({tlast_stream_out_lane[i], tvalid_stream_out_lane[i], tdata_stream_out[((i+1)*dwidth_float)-1:i*dwidth_float]}),
            .empty(empty_FIFO_out[i]),
            .full(full_FIFO_out[i])
            );
            
            assign tkeep_stream_out[i*4+3:i*4] = {4{tvalid_stream_out_lane[i]}}; 
        end
    endgenerate

    // vstreamout_control
    vstreamout_control vstreamout_control_inst0(
    .clk(clk),
    .rst(rst),
    .is_vstreamout(is_vstreamout),
    .done(done_auto_incr),
    .supplier(supplier),
    .is_vstreamout_global(is_vstreamout_global),
    .mux_control(sel_mux2)
    );
        
endmodule