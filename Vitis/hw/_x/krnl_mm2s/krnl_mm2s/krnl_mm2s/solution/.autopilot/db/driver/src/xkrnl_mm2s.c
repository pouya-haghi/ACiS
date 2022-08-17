// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xkrnl_mm2s.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XKrnl_mm2s_CfgInitialize(XKrnl_mm2s *InstancePtr, XKrnl_mm2s_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XKrnl_mm2s_Start(XKrnl_mm2s *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_mm2s_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_AP_CTRL) & 0x80;
    XKrnl_mm2s_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XKrnl_mm2s_IsDone(XKrnl_mm2s *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_mm2s_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XKrnl_mm2s_IsIdle(XKrnl_mm2s *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_mm2s_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XKrnl_mm2s_IsReady(XKrnl_mm2s *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_mm2s_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XKrnl_mm2s_Continue(XKrnl_mm2s *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_mm2s_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_AP_CTRL) & 0x80;
    XKrnl_mm2s_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XKrnl_mm2s_EnableAutoRestart(XKrnl_mm2s *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_mm2s_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XKrnl_mm2s_DisableAutoRestart(XKrnl_mm2s *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_mm2s_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_AP_CTRL, 0);
}

void XKrnl_mm2s_Set_in_r(XKrnl_mm2s *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_mm2s_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_IN_R_DATA, (u32)(Data));
    XKrnl_mm2s_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_IN_R_DATA + 4, (u32)(Data >> 32));
}

u64 XKrnl_mm2s_Get_in_r(XKrnl_mm2s *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_mm2s_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_IN_R_DATA);
    Data += (u64)XKrnl_mm2s_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_IN_R_DATA + 4) << 32;
    return Data;
}

void XKrnl_mm2s_Set_size(XKrnl_mm2s *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_mm2s_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_SIZE_DATA, Data);
}

u32 XKrnl_mm2s_Get_size(XKrnl_mm2s *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_mm2s_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_SIZE_DATA);
    return Data;
}

void XKrnl_mm2s_Set_dest(XKrnl_mm2s *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_mm2s_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_DEST_DATA, Data);
}

u32 XKrnl_mm2s_Get_dest(XKrnl_mm2s *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XKrnl_mm2s_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_DEST_DATA);
    return Data;
}

void XKrnl_mm2s_InterruptGlobalEnable(XKrnl_mm2s *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_mm2s_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_GIE, 1);
}

void XKrnl_mm2s_InterruptGlobalDisable(XKrnl_mm2s *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_mm2s_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_GIE, 0);
}

void XKrnl_mm2s_InterruptEnable(XKrnl_mm2s *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XKrnl_mm2s_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_IER);
    XKrnl_mm2s_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_IER, Register | Mask);
}

void XKrnl_mm2s_InterruptDisable(XKrnl_mm2s *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XKrnl_mm2s_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_IER);
    XKrnl_mm2s_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_IER, Register & (~Mask));
}

void XKrnl_mm2s_InterruptClear(XKrnl_mm2s *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XKrnl_mm2s_WriteReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_ISR, Mask);
}

u32 XKrnl_mm2s_InterruptGetEnabled(XKrnl_mm2s *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKrnl_mm2s_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_IER);
}

u32 XKrnl_mm2s_InterruptGetStatus(XKrnl_mm2s *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XKrnl_mm2s_ReadReg(InstancePtr->Control_BaseAddress, XKRNL_MM2S_CONTROL_ADDR_ISR);
}

