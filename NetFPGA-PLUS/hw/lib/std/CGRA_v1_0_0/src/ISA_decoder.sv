`timescale 1ns / 1ps

`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

module ISA_decoder(
    input logic [dwidth_inst-1:0] instr,
    input logic clk,
    input logic rst,
    input logic done_steady,
    output logic tvalid_RF,
    output logic [4:0] rs1, // source register 1
    output logic [4:0] rs2, // source register 2
    output logic [4:0] rd, // dest register
    output logic [dwidth_RFadd-1:0] ITR,
    output logic is_vle32_vv,
    output logic is_vse32_vv,
    output logic is_vmacc_vv,
    output logic is_vmv_vi,
    output logic is_vstreamout,
    output logic is_vsetivli,
    output logic is_bne,
    output logic is_csr,
    output logic is_lui,
    output logic is_spl,
    output logic is_spvacc_xv, // added
    output logic [dwidth_RFadd-1:0] vr_addr, // vector register file
    output logic [dwidth_RFadd-1:0] vw_addr, // vector register file
    output logic is_not_vect, // used to inform us about stall (if it is zero we should stall)
    output logic [11:0] branch_immediate,
    output logic [dwidth_int-1:0] R_immediate,
    output logic [2:0] op,
    output logic [2:0] op_scalar,
    output logic wen_RF_scalar,
    output logic [15:0] CSR,
    output logic ap_done
//    output logic [dwidth_RFadd-1:0] VLEN_phy // to get the chunk size 
    // if it is v2 and VLEN_phy=32 then the correct base address is: 2*VLEN_phy
    );
    
    localparam [2:0] ADD = 3'b000, ACC = 3'b001, MUL = 3'b010, MACC= 3'b011, NOP = 3'b100;

    logic [4:0] vs2, vd;
    logic [dwidth_RFadd-1:0] vr_addr_t,vw_addr_t;
//    logic is_vsetivli; // configuration
    logic is_addi, is_add; // integer scalar
    logic [dwidth_int-1:0] lui_immediate, addi_immediate;
    logic is_vect;
    logic [2:0] VLEN;
    logic t_is_vstreamout, t_is_vsetivli;
    assign is_vstreamout = t_is_vstreamout;
    logic is_wfi;

    // ***********************  decode ***************************
    assign is_vmacc_vv = (instr[6:0]==7'h57 && instr[14:12]==3'h0)?1'b1:1'b0;
    assign is_vle32_vv = (instr[6:0]==7'h07)?1'b1:1'b0;
    assign is_vse32_vv = (instr[6:0]==7'h27)?1'b1:1'b0;
    assign is_vmv_vi = (instr[6:0]==7'h57 && instr[14:12]==3'h5)?1'b1:1'b0;
    assign t_is_vsetivli = (instr[6:0]==7'h57 && instr[14:12]==3'h7)?1'b1:1'b0;
    assign t_is_vstreamout = (instr[6:0]==7'b1111111)?1'b1:1'b0; // based on ISA extension
    assign is_bne = (instr[6:0]==7'b1100011 && instr[14:12]==3'b001)?1'b1:1'b0;
    assign is_addi = (instr[6:0]==7'b0010011 && instr[14:12]==3'b000)?1'b1:1'b0; 
    assign is_lui = (instr[6:0]==7'b0110111)?1'b1:1'b0;
    assign is_csr = (instr[6:0]==7'b0000011 && instr[31:20]==12'hC00)? 1'b1: 1'b0;
    assign is_add = (instr[6:0]==7'b0110011 && instr[14:12]==3'b000 && instr[31:25]==7'b0000000)?1'b1:1'b0;
    assign is_spl = (instr[6:0]==7'b1110011 && instr[11:7] == 5'b0  && instr[14:12] == 3'b001)?1'b1:1'b0;   // CSRRW, based on ISA extension. rd must be x0, rs is source, and csr can be anything
    assign is_wfi = (instr == 32'b0001000_00101_00000_000_00000_1110011)?1'b1:1'b0;
    assign is_spvacc_xv = (instr[6:0]==7'h55 && instr[14:12]==3'h0)?1'b1:1'b0; // ISA extension ([1:0]='01')
    
    
    // ******************   AP done *********************
    
    assign ap_done = (is_wfi & done_steady) ? 1'b1 : 1'b0;
        
    // ******************   configuration instructions *********************
    assign ITR = instr[29:18];
    
    // for vsetivli
    reg_enr #(3) reg_enr_inst0 
    (
    .d(instr[17:15]),
    .clk(clk),
    .rst(rst),
    .en(t_is_vsetivli),
    .q(VLEN)
    );
    assign is_vsetivli = t_is_vsetivli;
    
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
    assign wen_RF_scalar = (is_addi || is_lui || is_csr || is_add)? 1'b1: 1'b0;
    assign op_scalar = (is_lui)? 3'b000: ((is_addi)?3'b001:(is_bne)?3'b010:(is_add)?3'b011:3'b100);
    
    // ************************  vectorized instructions *************************
    assign op = (is_vmacc_vv)? MACC: ((is_spvacc_xv) ? ACC : NOP); //else: NoP 
    assign is_vect = |{is_vmacc_vv, is_vle32_vv, is_vse32_vv, is_vmv_vi, is_vstreamout};
    assign is_not_vect = !is_vect;
    // vs1 is hardwire to O1 or O2 (no matter what you put in)
    assign vs2 = (is_vse32_vv || is_vstreamout)? instr[11:7]: instr[24:20]; // vs2
    assign vd = instr[11:7]; // vd
   
    always_comb begin
        case(VLEN)
            3'b000: begin 
                        vr_addr_t = {vs2[0], {(dwidth_RFadd-1){1'b0}}}; 
                        vw_addr_t = {vd[0], {(dwidth_RFadd-1){1'b0}}};
                    end
            3'b001: begin
                        vr_addr_t = {vs2[1:0], {(dwidth_RFadd-2){1'b0}}}; 
                        vw_addr_t = {vd[1:0],  {(dwidth_RFadd-2){1'b0}}};
                    end
            3'b010: begin
                        vr_addr_t = {vs2[2:0], {(dwidth_RFadd-3){1'b0}}}; 
                        vw_addr_t = {vd[2:0],  {(dwidth_RFadd-3){1'b0}}};    
                    end
            3'b011: begin
                        vr_addr_t = {vs2[3:0], {(dwidth_RFadd-4){1'b0}}}; 
                        vw_addr_t = {vd[3:0],  {(dwidth_RFadd-4){1'b0}}};    
                    end
            3'b100: begin
                        vr_addr_t = {vs2[4:0], {(dwidth_RFadd-5){1'b0}}}; 
                        vw_addr_t = {vd[4:0],  {(dwidth_RFadd-5){1'b0}}};    
                    end
            3'b101: begin 
                        vr_addr_t = {1'b0, vs2[4:0], {(dwidth_RFadd-6){1'b0}}}; 
                        vw_addr_t = {1'b0, vd[4:0], {(dwidth_RFadd-6){1'b0}}};
                    end
            3'b110: begin 
                        vr_addr_t = {2'b0, vs2[4:0], {(dwidth_RFadd-7){1'b0}}}; 
                        vw_addr_t = {2'b0, vd[4:0], {(dwidth_RFadd-7){1'b0}}};
                    end
            3'b111: begin 
                        vr_addr_t = {3'b0, vs2[4:0], {(dwidth_RFadd-8){1'b0}}}; 
                        vw_addr_t = {3'b0, vd[4:0], {(dwidth_RFadd-8){1'b0}}};
                    end
            default: begin 
                        vr_addr_t = {vs2[0], {(dwidth_RFadd-1){1'b0}}}; 
                        vw_addr_t = {vd[0], {(dwidth_RFadd-1){1'b0}}};
                    end
        endcase
    end
    
    assign vr_addr = (is_vmacc_vv)? {{(dwidth_RFadd-5){1'b0}}, vs2}: vr_addr_t; // if vmacc: no need to concatenate (always mapped to first group)
    assign vw_addr = (is_spvacc_xv)? {{(dwidth_RFadd-5){1'b0}}, vd}: vw_addr_t; // if spvacc: no need to concatenate (always mapped to first group)
    
    assign tvalid_RF = (t_is_vstreamout | is_addi | is_add | is_bne | is_vmacc_vv)? 1'b1: 1'b0;
   
endmodule
