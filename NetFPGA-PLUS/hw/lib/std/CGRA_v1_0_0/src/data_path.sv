`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
`ifndef MY_INTERFACE
    `define MY_INTERFACE
    `include "my_interface.vh"
`endif

module data_path(
    input logic done_loader,
    input logic [phit_size-1:0] tdata_stream_in,
    input logic [SIMD_degree-1:0] tvalid_stream_in,
    output logic [SIMD_degree-1:0] tready_stream_in,
    input logic [(dwidth_inst*num_col)-1:0] instr, // vector instruction
//    input logic [((num_col)*dwidth_float)-1:0] imm,
//    input logic [(phit_size*num_col)-1:0] rdata_config_table,
//    input logic [num_col-1:0] tvalid_config_table, // in future release it should be [(SIMD_degree*num_col)-1:0] (for now, I only support vector not scalar)
    input logic clk,
    input logic rst,
    input logic [(phit_size*num_col)-1:0] rdata_HBM,
    output logic [phit_size-1:0] stream_out,
    output logic [SIMD_degree-1:0] tvalid_stream_out,
    input logic [SIMD_degree-1:0] tready_stream_out,
    output logic [(dwidth_aximm*num_col)-1:0] araddr_HBM,
    input logic [num_col-1:0] arready_HBM,
    output logic [(dwidth_aximm*num_col)-1:0] awaddr_HBM,
    input logic [num_col-1:0] awready_HBM,
    input logic [num_col-1:0] rvalid_HBM,
    output logic [num_col-1:0] wvalid_HBM,
    input logic [num_col-1:0] wready_HBM,
    output logic [num_col-1:0] rready_HBM,
    output logic [num_col-1:0] arvalid_HBM,
    output logic [7:0] arlen_HBM,
    input logic [num_col-1:0] rlast_HBM,
    input logic t_stall
    );
    
    localparam phitplus = phit_size + SIMD_degree; // bundle {tvalid, tdata}

    logic [(2*num_col)-1:0] sel_mux2;
    logic [((num_col)*3)-1:0] op;
    logic [((num_col)*3)-1:0] op_scalar;
    logic [(phit_size*num_col)-1:0] o_RF;
    logic [(phit_size*num_col)-1:0] i1_PE_typeC, i2_PE_typeC, o1_PE_typeC, o2_PE_typeC; // the last bundle of SIMD_degree signals is for tvalid
    logic [(SIMD_degree*num_col)-1:0] i_tvalid1_PE_typeC, i_tvalid2_PE_typeC, o1_tvalid1_PE_typeC, o2_tvalid1_PE_typeC;
    logic [(5*num_col)-1:0] rs1, rs2, rd;
    logic [(dwidth_RFadd*num_col)-1:0] vr_addr;
    logic [(dwidth_RFadd*num_col)-1:0] vw_addr;
    logic [num_col-1:0] is_not_vect;
    logic [(12*num_col)-1:0] branch_immediate; 
    logic [(dwidth_int*num_col)-1:0] R_immediate;
    logic [num_col-1:0] stall;
    logic [(dwidth_int*num_col)-1:0] rddata1_RF_scalar;
    logic [(dwidth_int*num_col)-1:0] rddata2_RF_scalar;
    logic [(dwidth_int*num_col)-1:0] wdata_RF_scalar;
    logic [(dwidth_RFadd*num_col)-1:0] vr_addr_auto_incr;
    logic [(dwidth_RFadd*num_col)-1:0] vw_addr_auto_incr;
    logic [num_col-1:0] done_auto_incr;
    logic [phit_size-1:0] FIFO_out_tdata;
    logic [SIMD_degree-1:0] FIFO_out_tvalid;
    logic [SIMD_degree-1:0] FIFO_out_tvalid_t;
    logic [num_col-1:0] wen_RF_scalar;
//    logic [num_col-1:0] flag_eq;
    logic [num_col-1:0] is_vle32_vv;
    logic [num_col-1:0] is_vse32_vv;
    logic [num_col-1:0] is_vmacc_vv;
    logic [num_col-1:0] is_vmv_vi;
    logic [num_col-1:0] stall_HBM;
    logic [num_col-1:0] stall_auto_vect;
    logic [num_col-1:0] valid_RF_en;
    
    // This part is ISA-specific:
    logic [num_col-1:0] ctrl_i_mux2_tvalid; //generated internally based on op
    logic [(dwidth_RFadd*num_col)-1:0] ITR;
    logic [num_col-1:0] wen_ITR;
    logic [SIMD_degree-1:0] full, empty;
    
    
    genvar i;
    generate 
        for (i=0; i<SIMD_degree; i++) begin
            sync_FIFO sync_FIFO_inst0(
            .clk(clk),
            .rst(rst),
            .push(tvalid_stream_in[i] && !full[i]),
            .pop(!t_stall && !empty[i]), // correct me (t_stall)
            .din({tvalid_stream_in[i], tdata_stream_in[((i+1)*dwidth_float)-1:i*dwidth_float]}),
            .dout({FIFO_out_tvalid[i], FIFO_out_tdata[((i+1)*dwidth_float)-1:i*dwidth_float]}),
            .empty(empty[i]),
            .full(full[i])
            );
            
            assign tready_stream_in[i] = !full[i] & done_loader & !t_stall;
        end
    endgenerate
    
    // I can design the arch in a way that I have only one PC and one X registerfile but
    // in order to decrease the overhead of signal loading, routing its better to have one for ea. column
    assign t_stall = (|stall_HBM) || (|is_not_vect);
    
    genvar j;
    generate 
        for (j=0; j<num_col; j++) begin
            assign stall_HBM[j] = (is_vle32_vv[j] & (!(rvalid_HBM[j]&rready_HBM[j]))) || (is_vse32_vv[j] & (!(wready_HBM[j]&wvalid_HBM[j])));
            assign stall_auto_vect[j] = stall_HBM[j] || (is_vmacc_vv[j] & valid_RF_en[j]);
            // if it is vmacc and tvalids are zero then you should stall auto_vect but not input FIFO 
            assign valid_RF_en[j] = (&i_tvalid1_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j]) & (&i_tvalid2_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j]) & (&o1_tvalid1_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j]);
//            assign rready_HBM[j] = 1'b1;
            
            ISA_decoder ISA_decoder_inst
            (.instr(instr[((j+1)*dwidth_inst)-1:j*dwidth_inst]),
             .ctrl_i_mux2_tvalid(ctrl_i_mux2_tvalid[j]),
             .rs1(rs1[((j+1)*5)-1:j*5]),
             .rs2(rs2[((j+1)*5)-1:j*5]),
             .rd(rd[((j+1)*5)-1:j*5]),
             .ITR(ITR[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
             .wen_ITR(wen_ITR[j]),
             .vr_addr(vr_addr[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
             .vw_addr(vw_addr[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
             .is_not_vect(is_not_vect[j]),
             .is_vle32_vv(is_vle32_vv[j]),
             .is_vse32_vv(is_vse32_vv[j]),
             .is_vmacc_vv(is_vmacc_vv[j]),
             .is_vmv_vi(is_vmv_vi[j]),
             .branch_immediate(branch_immediate[((j+1)*12)-1:j*12]),
             .R_immediate(R_immediate[((j+1)*dwidth_int)-1:j*dwidth_int]),
             .op(op[((j+1)*3)-1:j*3]),
             .op_scalar(op_scalar[((j+1)*3)-1:j*3]),
             .wen_RF_scalar(wen_RF_scalar[j])
             );
             
             auto_incr_vect auto_incr_vect_inst(
             .clk(clk), 
             .rst(rst),
             .ITR(ITR[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
             .wen_ITR(wen_ITR[j]),
             .stall(stall_auto_vect[j]), // clk_en
             .vr_addr(vr_addr[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
             .vw_addr(vw_addr[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
             .rddata1_RF_scalar(rddata1_RF_scalar[((j+1)*dwidth_int)-1:j*dwidth_int]),
             .vr_addr_auto_incr(vr_addr_auto_incr[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
             .vw_addr_auto_incr(vw_addr_auto_incr[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd]),
             .araddr_HBM(araddr_HBM[((j+1)*dwidth_HBMadd)-1:j*dwidth_HBMadd]), //
             .awaddr_HBM(awaddr_HBM[((j+1)*dwidth_HBMadd)-1:j*dwidth_HBMadd]),
             .done(done_auto_incr[j]) // one clock pulse
             );
             
             // vectorized regFile
             regFile regFile_inst0(.d_in(is_vmv_vi[j]?{(phit_size){1'b0}}:(is_vmacc_vv[j]?o1_PE_typeC[(phit_size*(j+1))-1:phit_size*j]:rdata_HBM[(phit_size*(j+1))-1:phit_size*j])), // based on op I would choose wdata, o_RF or HBM. vmv.v.i is not supported: ctrl_din_RF[(j*3)+0]==1 :rdata_config_table[(phit_size*(j+1))-1:phit_size*j]
             .clk(clk),
             .rd_addr(vr_addr_auto_incr[(dwidth_RFadd*(j+1))-1:dwidth_RFadd*j]), // rd_addr_RF is one of the fields in tables (auto-increment address generator)
             .wr_addr(vw_addr_auto_incr[(dwidth_RFadd*(j+1))-1:dwidth_RFadd*j]),
             .wen(is_vmv_vi[j]?1'b0:(is_vmacc_vv[j]?valid_RF_en[j]:is_vle32_vv[j]?rvalid_HBM[j]:1'b0)), // based on op I would choose the correct tvalid_wdata or 1'b0 if it is a read. ctrl_din_RF[(j*3)+0]==1: tvalid_config_table[j]
             .d_out(o_RF[(phit_size*(j+1))-1:phit_size*j]));
             
             // scalar regFile   
             regFile_scalar regFile_scalar_inst0(
             .clk(clk),
             .we(wen_RF_scalar[j]),
             .rr1(rs1[((j+1)*5)-1:j*5]),
             .rr2(rs2[((j+1)*5)-1:j*5]),
             .wr(rd[((j+1)*5)-1:j*5]),
             .wd(wdata_RF_scalar[((j+1)*dwidth_int)-1:j*dwidth_int]),
             .dr1(rddata1_RF_scalar[((j+1)*dwidth_int)-1:j*dwidth_int]),
             .dr2(rddata2_RF_scalar[((j+1)*dwidth_int)-1:j*dwidth_int])
             );
             
             // HBM read master
             HBM_read_master HBM_read_master_inst0(
             .aclk(clk),
             .areset(rst),
             .ctrl_start(wen_ITR[j]),
             .ctrl_done(read_done_HBM[j]),    
             .ctrl_addr_offset(rddata1_RF_scalar[((j+1)*dwidth_int)-1:j*dwidth_int]),
             .ctrl_xfer_size_in_bytes({{(64-dwidth_RFadd-6){1'b0}}, ITR[((j+1)*dwidth_RFadd)-1:j*dwidth_RFadd], 6'b0}-64'd1), // 6'b0 because each VRF entry is 64 Bytes
             // -1'b0 because AXI is like this
             .m_axi_arvalid(arvalid_HBM[j]),
             .m_axi_arready(arready_HBM[j]),
             .m_axi_araddr(araddr_HBM[((j+1)*dwidth_aximm)-1:j*dwidth_aximm]),
             .m_axi_arlen(arlen_HBM[((j+1)*8)-1:j*8]),
             .m_axi_rvalid(rvalid_HBM[j]),
             .m_axi_rready(rready_HBM[j]),
             .m_axi_rdata(rdata_HBM[j]),
             .m_axi_rlast(rlast_HBM[j]),
             .is_vle32_vv(is_vle32_vv[j])
             );
             
             // vectorized PE
             vectorized_PE vectorized_PE_inst0(
             .i1_PE_typeC(i1_PE_typeC[(phit_size*(j+1))-1:phit_size*j]),
             .i2_PE_typeC(i2_PE_typeC[(phit_size*(j+1))-1:phit_size*j]),
             .i_tvalid1_PE_typeC(i_tvalid1_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j]),
             .i_tvalid2_PE_typeC(i_tvalid2_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j]),
             .clk(clk),
             .rst(rst),
             .op(op[((j+1)*3)-1:j*3]),
             .o1_PE_typeC(o1_PE_typeC[(phit_size*(j+1))-1:phit_size*j]),
             .o2_PE_typeC(o2_PE_typeC[(phit_size*(j+1))-1:phit_size*j]),
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
              .flag_eq(flag_eq[j]) // correct me
             );
             
             if (j == 0) begin
                 mux2 #(phitplus) mux2_inst0_if ({FIFO_out_tvalid, FIFO_out_tdata}, {(phitplus){1'b0}}, sel_mux2[(j*2)+0], {i_tvalid1_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j], i1_PE_typeC[(phit_size*(j+1))-1:phit_size*j]});
                 mux2 #(phitplus) mux2_inst1_if ({{(SIMD_degree){ctrl_i_mux2_tvalid[j]}}, o_RF[(phit_size*(j+1))-1:phit_size*j]}, {(phitplus){1'b0}}, sel_mux2[(j*2)+1], {i_tvalid2_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j], i2_PE_typeC[(phit_size*(j+1))-1:phit_size*j]});  // second input was considered for imm (but not yet supported b/c it is not in riscv): {{(SIMD_degree){tvalid_config_table[0]}}, {SIMD_degree{imm[(dwidth_float*1)-1:dwidth_float*0]}}}  
             end
             else begin
                 mux2 #(phitplus) mux2_inst0_else ({o1_tvalid1_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j], o1_PE_typeC[(phit_size*(j+1))-1:(phit_size*j)]}, {o2_tvalid1_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j], o2_PE_typeC[(phit_size*(j+1))-1:(phit_size*j)]}, sel_mux2[(j*2)+0], {i_tvalid1_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j], i1_PE_typeC[(phit_size*(j+1))-1:phit_size*j]});
                 mux2 #(phitplus) mux2_inst1_else ({{(SIMD_degree){ctrl_i_mux2_tvalid[j]}}, o_RF[(phit_size*(j+1))-1:phit_size*j]}, {(phitplus){1'b0}}, sel_mux2[(j*2)+1], {i_tvalid2_PE_typeC[(SIMD_degree*(j+1))-1:SIMD_degree*j], i2_PE_typeC[(phit_size*(j+1))-1:phit_size*j]});  // second input was considered for imm (but not yet supported): {{(SIMD_degree){tvalid_config_table[0]}}, {SIMD_degree{imm[(dwidth_float*1)-1:dwidth_float*0]}}}
             end
             
        end
    endgenerate

endmodule
