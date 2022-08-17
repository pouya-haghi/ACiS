// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xkrnl_s2mm.h"

extern XKrnl_s2mm_Config XKrnl_s2mm_ConfigTable[];

XKrnl_s2mm_Config *XKrnl_s2mm_LookupConfig(u16 DeviceId) {
	XKrnl_s2mm_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XKRNL_S2MM_NUM_INSTANCES; Index++) {
		if (XKrnl_s2mm_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XKrnl_s2mm_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XKrnl_s2mm_Initialize(XKrnl_s2mm *InstancePtr, u16 DeviceId) {
	XKrnl_s2mm_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XKrnl_s2mm_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XKrnl_s2mm_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

