// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XDIGITCAPS_ACCEL_H
#define XDIGITCAPS_ACCEL_H

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
#include "xdigitcaps_accel_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XDigitcaps_accel_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XDigitcaps_accel;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XDigitcaps_accel_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XDigitcaps_accel_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XDigitcaps_accel_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XDigitcaps_accel_ReadReg(BaseAddress, RegOffset) \
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
#ifdef SDT
int XDigitcaps_accel_Initialize(XDigitcaps_accel *InstancePtr, UINTPTR BaseAddress);
XDigitcaps_accel_Config* XDigitcaps_accel_LookupConfig(UINTPTR BaseAddress);
#else
int XDigitcaps_accel_Initialize(XDigitcaps_accel *InstancePtr, u16 DeviceId);
XDigitcaps_accel_Config* XDigitcaps_accel_LookupConfig(u16 DeviceId);
#endif
int XDigitcaps_accel_CfgInitialize(XDigitcaps_accel *InstancePtr, XDigitcaps_accel_Config *ConfigPtr);
#else
int XDigitcaps_accel_Initialize(XDigitcaps_accel *InstancePtr, const char* InstanceName);
int XDigitcaps_accel_Release(XDigitcaps_accel *InstancePtr);
#endif

void XDigitcaps_accel_Start(XDigitcaps_accel *InstancePtr);
u32 XDigitcaps_accel_IsDone(XDigitcaps_accel *InstancePtr);
u32 XDigitcaps_accel_IsIdle(XDigitcaps_accel *InstancePtr);
u32 XDigitcaps_accel_IsReady(XDigitcaps_accel *InstancePtr);
void XDigitcaps_accel_Continue(XDigitcaps_accel *InstancePtr);
void XDigitcaps_accel_EnableAutoRestart(XDigitcaps_accel *InstancePtr);
void XDigitcaps_accel_DisableAutoRestart(XDigitcaps_accel *InstancePtr);

void XDigitcaps_accel_Set_input_r(XDigitcaps_accel *InstancePtr, u64 Data);
u64 XDigitcaps_accel_Get_input_r(XDigitcaps_accel *InstancePtr);
void XDigitcaps_accel_Set_weights(XDigitcaps_accel *InstancePtr, u64 Data);
u64 XDigitcaps_accel_Get_weights(XDigitcaps_accel *InstancePtr);
void XDigitcaps_accel_Set_prediction(XDigitcaps_accel *InstancePtr, u64 Data);
u64 XDigitcaps_accel_Get_prediction(XDigitcaps_accel *InstancePtr);

void XDigitcaps_accel_InterruptGlobalEnable(XDigitcaps_accel *InstancePtr);
void XDigitcaps_accel_InterruptGlobalDisable(XDigitcaps_accel *InstancePtr);
void XDigitcaps_accel_InterruptEnable(XDigitcaps_accel *InstancePtr, u32 Mask);
void XDigitcaps_accel_InterruptDisable(XDigitcaps_accel *InstancePtr, u32 Mask);
void XDigitcaps_accel_InterruptClear(XDigitcaps_accel *InstancePtr, u32 Mask);
u32 XDigitcaps_accel_InterruptGetEnabled(XDigitcaps_accel *InstancePtr);
u32 XDigitcaps_accel_InterruptGetStatus(XDigitcaps_accel *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
