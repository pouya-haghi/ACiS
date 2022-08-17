// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XKRNL_MM2S_H
#define XKRNL_MM2S_H

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
#include "xkrnl_mm2s_hw.h"

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
} XKrnl_mm2s_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XKrnl_mm2s;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XKrnl_mm2s_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XKrnl_mm2s_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XKrnl_mm2s_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XKrnl_mm2s_ReadReg(BaseAddress, RegOffset) \
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
int XKrnl_mm2s_Initialize(XKrnl_mm2s *InstancePtr, u16 DeviceId);
XKrnl_mm2s_Config* XKrnl_mm2s_LookupConfig(u16 DeviceId);
int XKrnl_mm2s_CfgInitialize(XKrnl_mm2s *InstancePtr, XKrnl_mm2s_Config *ConfigPtr);
#else
int XKrnl_mm2s_Initialize(XKrnl_mm2s *InstancePtr, const char* InstanceName);
int XKrnl_mm2s_Release(XKrnl_mm2s *InstancePtr);
#endif

void XKrnl_mm2s_Start(XKrnl_mm2s *InstancePtr);
u32 XKrnl_mm2s_IsDone(XKrnl_mm2s *InstancePtr);
u32 XKrnl_mm2s_IsIdle(XKrnl_mm2s *InstancePtr);
u32 XKrnl_mm2s_IsReady(XKrnl_mm2s *InstancePtr);
void XKrnl_mm2s_Continue(XKrnl_mm2s *InstancePtr);
void XKrnl_mm2s_EnableAutoRestart(XKrnl_mm2s *InstancePtr);
void XKrnl_mm2s_DisableAutoRestart(XKrnl_mm2s *InstancePtr);

void XKrnl_mm2s_Set_in_r(XKrnl_mm2s *InstancePtr, u64 Data);
u64 XKrnl_mm2s_Get_in_r(XKrnl_mm2s *InstancePtr);
void XKrnl_mm2s_Set_size(XKrnl_mm2s *InstancePtr, u32 Data);
u32 XKrnl_mm2s_Get_size(XKrnl_mm2s *InstancePtr);
void XKrnl_mm2s_Set_dest(XKrnl_mm2s *InstancePtr, u32 Data);
u32 XKrnl_mm2s_Get_dest(XKrnl_mm2s *InstancePtr);

void XKrnl_mm2s_InterruptGlobalEnable(XKrnl_mm2s *InstancePtr);
void XKrnl_mm2s_InterruptGlobalDisable(XKrnl_mm2s *InstancePtr);
void XKrnl_mm2s_InterruptEnable(XKrnl_mm2s *InstancePtr, u32 Mask);
void XKrnl_mm2s_InterruptDisable(XKrnl_mm2s *InstancePtr, u32 Mask);
void XKrnl_mm2s_InterruptClear(XKrnl_mm2s *InstancePtr, u32 Mask);
u32 XKrnl_mm2s_InterruptGetEnabled(XKrnl_mm2s *InstancePtr);
u32 XKrnl_mm2s_InterruptGetStatus(XKrnl_mm2s *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
