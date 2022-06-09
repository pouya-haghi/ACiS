`timescale 1ns / 1ps

`ifndef MY_INTERFACE
  `define MY_INTERFACE
  `include "my_interface.vh"
`endif

module test_ISA_decoder;
    // **dwidth_inst = 32**
    reg [dwidth_inst-1:0] instr; // vector instruction
    reg clk;
    reg rst;
    wire ctrl_i_mux2_tvalid;
    wire [4:0] rs1; // source register 1
    wire [4:0] rs2; // source register 2
    wire [4:0] rd; // dest register
    wire [dwidth_RFadd-1:0] ITR;
    wire wen_ITR;
    wire is_vle32_vv;
    wire is_vse32_vv;
    wire is_vmacc_vv;
    wire is_vmv_vi;
    wire is_vstreamout;
    wire is_beq;
    wire is_csr;
    wire [dwidth_RFadd-1:0] vr_addr; // vector register file
    wire [dwidth_RFadd-1:0] vw_addr; // vector register file
    wire is_not_vect; // used to inform us about stall (if it is zero we should stall)
    wire [11:0] branch_immediate;
    wire [dwidth_int-1:0] R_immediate;
    wire [2:0] op;
    wire [2:0] op_scalar;
    wire wen_RF_scalar;
    
    ISA_decoder ISA_decoder_inst(
        .instr(instr),
        .clk(clk),
        .rst(rst),
        .ctrl_i_mux2_tvalid(ctrl_i_mux2_tvalid),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .ITR(ITR),
        .wen_ITR(wen_ITR),
        .vr_addr(vr_addr),
        .vw_addr(vw_addr),
        .is_not_vect(is_not_vect),
        .is_vle32_vv(is_vle32_vv),
        .is_vse32_vv(is_vse32_vv),
        .is_vmacc_vv(is_vmacc_vv),
        .is_vmv_vi(is_vmv_vi),
        .is_beq(is_beq),
        .is_csr(is_csr),
        .branch_immediate(branch_immediate),
        .R_immediate(R_immediate),
        .op(op),
        .op_scalar(op_scalar),
        .wen_RF_scalar(wen_RF_scalar)
        );
    always begin
        clk = 1;
        #5;
        clk = 0;
        #5;
    end

    initial begin
        rst = 1;
        instr <=0;
        
        #20
        
        // Vector Load, Store, Fused MAC (VMAC), vsetivli
        // Scalar LW, LUI, ADDI, BEQ --> https://github.com/riscv/riscv-isa-manual/releases/download/Ratified-IMAFDQC/riscv-spec-20191213.pdf   page 130
        
        rst = 0;
        // VSETAVLI              rd        uimm  zimm
        #5  instr <= 32'b1010111_11110_111_00001_0011001100_1_1;
        // VALU                  vd        vs1   vs2
        #10 instr <= 32'b1010111_11101_000_00010_00011_0_101100;
        // Vector Load           vd        rs1   
        #10 instr <= 32'b0000111_11011_000_00100_00000_0_00_0_000;
        // Vector Store          vd        rs1
        #10 instr <= 32'b0100111_10111_000_01000_00000_0_00_0_000;
        // Stream Out            ???
        #10 instr <= 32'b1111111_01111_000_10000_00000_0000000;
        
        // LW                    rd        rs1
        #10 instr <= 32'b1100000_00001_010_11110_001100110011;
        // LUI                   rd
        #10 instr <= 32'b1110110_00010_00110011001100110011;
        // ADDI                  rd        rs1
        #10 instr <= 32'b1100100_00100_000_11011_110011001100;
        // BEQ                   imm?      rd1   rs2   imm again
        #10 instr <= 32'b1100011_11001_000_10111_01000_0011001;
        #20
        
        
        
        
        
        $finish;
    end

endmodule
