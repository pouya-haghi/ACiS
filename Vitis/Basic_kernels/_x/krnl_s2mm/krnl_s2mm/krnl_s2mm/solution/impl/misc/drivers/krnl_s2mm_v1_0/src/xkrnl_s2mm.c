// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xkrnl_s2mm.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XKrnl_s2mm_CfgInitialize(XKrnl_s2mm *InstancePtr, XKrnl_s2mm_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XKrnl_s2mm_Start(XKrnl_s2mm *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_s2mm_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_AP_CTRL) & 0x80;
    XKrnl_s2mm_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XKrnl_s2mm_IsDone(XKrnl_s2mm *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_s2mm_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XKrnl_s2mm_IsIdle(XKrnl_s2mm *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_s2mm_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XKrnl_s2mm_IsReady(XKrnl_s2mm *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_s2mm_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XKrnl_s2mm_Continue(XKrnl_s2mm *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_s2mm_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_AP_CTRL) & 0x80;
    XKrnl_s2mm_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XKrnl_s2mm_EnableAutoRestart(XKrnl_s2mm *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_s2mm_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XKrnl_s2mm_DisableAutoRestart(XKrnl_s2mm *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_s2mm_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_AP_CTRL, 0);
}

void XKrnl_s2mm_Set_out_r(XKrnl_s2mm *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_s2mm_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_OUT_R_DATA, (u32)(Data));
    XKrnl_s2mm_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_OUT_R_DATA + 4, (u32)(Data >> 32));
}

u64 XKrnl_s2mm_Get_out_r(XKrnl_s2mm *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_s2mm_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_OUT_R_DATA);
    Data += (u64)XKrnl_s2mm_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_OUT_R_DATA + 4) << 32;
    return Data;
}

void XKrnl_s2mm_Set_size(XKrnl_s2mm *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_s2mm_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_SIZE_DATA, Data);
}

u32 XKrnl_s2mm_Get_size(XKrnl_s2mm *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_s2mm_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_SIZE_DATA);
    return Data;
}

void XKrnl_s2mm_InterruptGlobalEnable(XKrnl_s2mm *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_s2mm_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_GIE, 1);
}

void XKrnl_s2mm_InterruptGlobalDisable(XKrnl_s2mm *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_s2mm_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_GIE, 0);
}

void XKrnl_s2mm_InterruptEnable(XKrnl_s2mm *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XKrnl_s2mm_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_IER);
    XKrnl_s2mm_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_IER, Register | Mask);
}

void XKrnl_s2mm_InterruptDisable(XKrnl_s2mm *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XKrnl_s2mm_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_IER);
    XKrnl_s2mm_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_IER, Register & (~Mask));
}

void XKrnl_s2mm_InterruptClear(XKrnl_s2mm *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_s2mm_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_ISR, Mask);
}

u32 XKrnl_s2mm_InterruptGetEnabled(XKrnl_s2mm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKrnl_s2mm_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_IER);
}

u32 XKrnl_s2mm_InterruptGetStatus(XKrnl_s2mm *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKrnl_s2mm_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_S2MM_CONTROL_ADDR_ISR);
}

