// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xkrnl_mm2s.h"

extern XKrnl_mm2s_Config XKrnl_mm2s_ConfigTable[];

XKrnl_mm2s_Config *XKrnl_mm2s_LookupConfig(u16 DeviceId) {
	XKrnl_mm2s_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XKRNL_MM2S_NUM_INSTANCES; Index++) {
		if (XKrnl_mm2s_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XKrnl_mm2s_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XKrnl_mm2s_Initialize(XKrnl_mm2s *InstancePtr, u16 DeviceId) {
	XKrnl_mm2s_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XKrnl_mm2s_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XKrnl_mm2s_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

