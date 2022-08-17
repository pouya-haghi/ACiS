// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XKRNL_S2MM_H
#define XKRNL_S2MM_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xkrnl_s2mm_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XKrnl_s2mm_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XKrnl_s2mm;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XKrnl_s2mm_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XKrnl_s2mm_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XKrnl_s2mm_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XKrnl_s2mm_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XKrnl_s2mm_Initialize(XKrnl_s2mm *InstancePtr, u16 DeviceId);
XKrnl_s2mm_Config* XKrnl_s2mm_LookupConfig(u16 DeviceId);
int XKrnl_s2mm_CfgInitialize(XKrnl_s2mm *InstancePtr, XKrnl_s2mm_Config *ConfigPtr);
#else
int XKrnl_s2mm_Initialize(XKrnl_s2mm *InstancePtr, const char* InstanceName);
int XKrnl_s2mm_Release(XKrnl_s2mm *InstancePtr);
#endif

void XKrnl_s2mm_Start(XKrnl_s2mm *InstancePtr);
u32 XKrnl_s2mm_IsDone(XKrnl_s2mm *InstancePtr);
u32 XKrnl_s2mm_IsIdle(XKrnl_s2mm *InstancePtr);
u32 XKrnl_s2mm_IsReady(XKrnl_s2mm *InstancePtr);
void XKrnl_s2mm_Continue(XKrnl_s2mm *InstancePtr);
void XKrnl_s2mm_EnableAutoRestart(XKrnl_s2mm *InstancePtr);
void XKrnl_s2mm_DisableAutoRestart(XKrnl_s2mm *InstancePtr);

void XKrnl_s2mm_Set_out_r(XKrnl_s2mm *InstancePtr, u64 Data);
u64 XKrnl_s2mm_Get_out_r(XKrnl_s2mm *InstancePtr);
void XKrnl_s2mm_Set_size(XKrnl_s2mm *InstancePtr, u32 Data);
u32 XKrnl_s2mm_Get_size(XKrnl_s2mm *InstancePtr);

void XKrnl_s2mm_InterruptGlobalEnable(XKrnl_s2mm *InstancePtr);
void XKrnl_s2mm_InterruptGlobalDisable(XKrnl_s2mm *InstancePtr);
void XKrnl_s2mm_InterruptEnable(XKrnl_s2mm *InstancePtr, u32 Mask);
void XKrnl_s2mm_InterruptDisable(XKrnl_s2mm *InstancePtr, u32 Mask);
void XKrnl_s2mm_InterruptClear(XKrnl_s2mm *InstancePtr, u32 Mask);
u32 XKrnl_s2mm_InterruptGetEnabled(XKrnl_s2mm *InstancePtr);
u32 XKrnl_s2mm_InterruptGetStatus(XKrnl_s2mm *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
