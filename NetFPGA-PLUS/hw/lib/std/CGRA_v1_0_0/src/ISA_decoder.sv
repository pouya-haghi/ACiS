`timescale 1ns / 1ps

`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

module ISA_decoder(
    input logic [dwidth_inst-1:0] instr, // vector instruction
    input logic clk,
    input logic rst,
//    input logic [dwidth_inst-1:0] instr_cfg,// config instruction
    output logic ctrl_i_mux2_tvalid,
//    output logic [2:0] ctrl_din_RF,
//    output logic [2:0] ctrl_wen_RF,
    output logic [4:0] rs1, // source register 1
    output logic [4:0] rs2, // source register 2
    output logic [4:0] rd, // dest register
    output logic [dwidth_RFadd-1:0] ITR,
    output logic wen_ITR,
    output logic is_vle32_vv,
    output logic is_vse32_vv,
    output logic is_vmacc_vv,
    output logic is_vmv_vi,
    output logic is_beq,
    output logic is_csr,
    output logic [dwidth_RFadd-1:0] vr_addr, // vector register file
    output logic [dwidth_RFadd-1:0] vw_addr, // vector register file
    output logic is_not_vect, // used to inform us about stall (if it is zero we should stall)
    output logic [11:0] branch_immediate,
    output logic [dwidth_int-1:0] R_immediate,
    output logic [2:0] op,
    output logic [2:0] op_scalar,
    output logic wen_RF_scalar
//    output logic [dwidth_RFadd-1:0] VLEN_phy // to get the chunk size 
    // if it is v2 and VLEN_phy=32 then the correct base address is: 2*VLEN_phy
    );
    
    logic [4:0] vs2, vd;
    logic is_vsetivli; // configuration
    logic is_addi, is_lui; // integer scalar
    logic [dwidth_int-1:0] lui_immediate, addi_immediate;
    logic is_vect;
    logic [2:0] VLEN;

    // ***********************  decode ***************************
    assign is_vmacc_vv = (instr[6:0]==7'h57 && instr[14:12]==3'h0)?1'b1:1'b0;
    assign is_vle32_vv = (instr[6:0]==7'h07)?1'b1:1'b0;
    assign is_vse32_vv = (instr[6:0]==7'h27)?1'b1:1'b0;
    assign is_vmv_vi = (instr[6:0]==7'h57 && instr[14:12]==3'h5)?1'b1:1'b0;
    assign is_vsetivli = (instr[6:0]==7'h57 && instr[14:12]==3'h7)?1'b1:1'b0;
    assign is_beq = (instr[6:0]==7'b1100011 && instr[14:12]==3'b000)?1'b1:1'b0;
    assign is_addi = (instr[6:0]==7'b0010011 && instr[14:12]==3'b000)?1'b1:1'b0; 
    assign is_lui = (instr[6:0]==7'b0110111)?1'b1:1'b0;
    assign is_csr = (instr[6:0]==7'b0000011 && instr[31:20]==12'hC00)? 1'b1: 1'b0;
    
    // ******************   configuration instructions *********************
    assign ITR = instr[29:18];
    assign wen_ITR = is_vsetivli;
    
    // for vsetivli
    reg_enr #(3) reg_enr_inst0 
    (
    .d(instr[17:15]),
    .clk(clk),
    .rst(rst),
    .en(is_vsetivli),
    .q(VLEN)
    );
    
    // ****************** scalar instructions ****************************
    // beq instruction
    assign branch_immediate = {instr[31], instr[7], instr[30:25], instr[11:8]};
    assign rs1 = instr[19:15];
    assign rs2 = instr[24:20];
    // addi 
    assign addi_immediate = {{20{instr[31]}}, instr[31:20]};
    assign rd = instr[11:7];
    // LUI
    assign lui_immediate = {instr[31:12], {12{1'b0}}};
    
    assign R_immediate = (is_addi)? addi_immediate: lui_immediate;
    assign wen_RF_scalar = (is_addi || is_lui || is_csr)? 1'b1: 1'b0;
    // ************************  vectorized instructions *************************
    assign op = (is_vmacc_vv)? 3'b011: 3'b100; //else: NoP 
    assign is_vect = |{is_vmacc_vv, is_vle32_vv, is_vse32_vv, is_vmv_vi};
    assign is_not_vect = !is_vect;
    // vs1 is hardwire to O1 or O2 (no matter what you put in)
    assign vs2 = instr[24:20]; // vs2
    assign vd = instr[11:7]; // vd
    // again rs1 is the base address
    
        //    always_comb begin
//        case(VLEN)
//            3'b000: VLEN_phy = (depth_RF/2);
//            3'b001: VLEN_phy = (depth_RF/4);
//            3'b010: VLEN_phy = (depth_RF/8);
//            3'b011: VLEN_phy = (depth_RF/16);
//            3'b100: VLEN_phy = (depth_RF/32);
//            3'b101: VLEN_phy = (depth_RF/64);
//            3'b110: VLEN_phy = (depth_RF/128);
//            3'b111: VLEN_phy = (depth_RF/256);
//            default: VLEN_phy = (depth_RF/2);
//        endcase
//    end
    always_comb begin
        case(VLEN)
            3'b000: begin 
                        vr_addr = {vs2[0], {(dwidth_RFadd-1){1'b0}}}; 
                        vw_addr = {vd[0], {(dwidth_RFadd-1){1'b0}}};
                    end
            3'b001: begin
                        vr_addr = {vs2[1:0], {(dwidth_RFadd-2){1'b0}}}; 
                        vw_addr = {vd[1:0],  {(dwidth_RFadd-2){1'b0}}};
                    end
            3'b010: begin
                        vr_addr = {vs2[2:0], {(dwidth_RFadd-3){1'b0}}}; 
                        vw_addr = {vd[2:0],  {(dwidth_RFadd-3){1'b0}}};    
                    end
            3'b011: begin
                        vr_addr = {vs2[3:0], {(dwidth_RFadd-4){1'b0}}}; 
                        vw_addr = {vd[3:0],  {(dwidth_RFadd-4){1'b0}}};    
                    end
            3'b100: begin
                        vr_addr = {vs2[4:0], {(dwidth_RFadd-5){1'b0}}}; 
                        vw_addr = {vd[4:0],  {(dwidth_RFadd-5){1'b0}}};    
                    end
            3'b101: begin 
                        vr_addr = {1'b0, vs2[4:0], {(dwidth_RFadd-6){1'b0}}}; 
                        vw_addr = {1'b0, vd[4:0], {(dwidth_RFadd-6){1'b0}}};
                    end
            3'b110: begin 
                        vr_addr = {2'b0, vs2[4:0], {(dwidth_RFadd-7){1'b0}}}; 
                        vw_addr = {2'b0, vd[4:0], {(dwidth_RFadd-7){1'b0}}};
                    end
            3'b111: begin 
                        vr_addr = {3'b0, vs2[4:0], {(dwidth_RFadd-8){1'b0}}}; 
                        vw_addr = {3'b0, vd[4:0], {(dwidth_RFadd-8){1'b0}}};
                    end
            default: begin 
                        vr_addr = {vs2[0], {(dwidth_RFadd-1){1'b0}}}; 
                        vw_addr = {vd[0], {(dwidth_RFadd-1){1'b0}}};
                    end
        endcase
    end
    
//    assign ctrl_din_RF = (is_vmv_vi)? 3'b001:((is_vmacc_vv)? 3'b010: ((is_vle32_vv)? 3'b100: 3'b100)); // default: 3'b100
//    assign ctrl_wen_RF = (is_vmv_vi)? 3'b001:((is_vmacc_vv)? 3'b010: ((is_vle32_vv)? 3'b100: 3'b000)); // default: 3'b000
    assign op_scalar = (is_lui)? 3'b000: ((is_addi)?3'b001:(is_beq)?3'b010:3'b011);
    assign ctrl_i_mux2_tvalid = (is_vmacc_vv)? 1'b1: 1'b0;
//    assign sel_mux2 = 
   
endmodule
