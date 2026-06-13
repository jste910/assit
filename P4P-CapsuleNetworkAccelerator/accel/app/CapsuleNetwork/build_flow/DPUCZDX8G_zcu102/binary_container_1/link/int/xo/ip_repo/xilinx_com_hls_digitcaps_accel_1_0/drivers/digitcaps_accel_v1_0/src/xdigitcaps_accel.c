// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xdigitcaps_accel.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XDigitcaps_accel_CfgInitialize(XDigitcaps_accel *InstancePtr, XDigitcaps_accel_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XDigitcaps_accel_Start(XDigitcaps_accel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDigitcaps_accel_ReadReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XDigitcaps_accel_WriteReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XDigitcaps_accel_IsDone(XDigitcaps_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDigitcaps_accel_ReadReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XDigitcaps_accel_IsIdle(XDigitcaps_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDigitcaps_accel_ReadReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XDigitcaps_accel_IsReady(XDigitcaps_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDigitcaps_accel_ReadReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XDigitcaps_accel_Continue(XDigitcaps_accel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDigitcaps_accel_ReadReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XDigitcaps_accel_WriteReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XDigitcaps_accel_EnableAutoRestart(XDigitcaps_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDigitcaps_accel_WriteReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XDigitcaps_accel_DisableAutoRestart(XDigitcaps_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDigitcaps_accel_WriteReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_AP_CTRL, 0);
}

void XDigitcaps_accel_Set_input_r(XDigitcaps_accel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDigitcaps_accel_WriteReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_INPUT_R_DATA, (u32)(Data));
    XDigitcaps_accel_WriteReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_INPUT_R_DATA + 4, (u32)(Data >> 32));
}

u64 XDigitcaps_accel_Get_input_r(XDigitcaps_accel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDigitcaps_accel_ReadReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_INPUT_R_DATA);
    Data += (u64)XDigitcaps_accel_ReadReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_INPUT_R_DATA + 4) << 32;
    return Data;
}

void XDigitcaps_accel_Set_weights(XDigitcaps_accel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDigitcaps_accel_WriteReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_WEIGHTS_DATA, (u32)(Data));
    XDigitcaps_accel_WriteReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_WEIGHTS_DATA + 4, (u32)(Data >> 32));
}

u64 XDigitcaps_accel_Get_weights(XDigitcaps_accel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDigitcaps_accel_ReadReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_WEIGHTS_DATA);
    Data += (u64)XDigitcaps_accel_ReadReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_WEIGHTS_DATA + 4) << 32;
    return Data;
}

void XDigitcaps_accel_Set_prediction(XDigitcaps_accel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDigitcaps_accel_WriteReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_PREDICTION_DATA, (u32)(Data));
    XDigitcaps_accel_WriteReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_PREDICTION_DATA + 4, (u32)(Data >> 32));
}

u64 XDigitcaps_accel_Get_prediction(XDigitcaps_accel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDigitcaps_accel_ReadReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_PREDICTION_DATA);
    Data += (u64)XDigitcaps_accel_ReadReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_PREDICTION_DATA + 4) << 32;
    return Data;
}

void XDigitcaps_accel_InterruptGlobalEnable(XDigitcaps_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDigitcaps_accel_WriteReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_GIE, 1);
}

void XDigitcaps_accel_InterruptGlobalDisable(XDigitcaps_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDigitcaps_accel_WriteReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_GIE, 0);
}

void XDigitcaps_accel_InterruptEnable(XDigitcaps_accel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDigitcaps_accel_ReadReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_IER);
    XDigitcaps_accel_WriteReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_IER, Register | Mask);
}

void XDigitcaps_accel_InterruptDisable(XDigitcaps_accel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XDigitcaps_accel_ReadReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_IER);
    XDigitcaps_accel_WriteReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_IER, Register & (~Mask));
}

void XDigitcaps_accel_InterruptClear(XDigitcaps_accel *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDigitcaps_accel_WriteReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_ISR, Mask);
}

u32 XDigitcaps_accel_InterruptGetEnabled(XDigitcaps_accel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDigitcaps_accel_ReadReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_IER);
}

u32 XDigitcaps_accel_InterruptGetStatus(XDigitcaps_accel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XDigitcaps_accel_ReadReg(InstancePtr->Control_BaseAddress, XDIGITCAPS_ACCEL_CONTROL_ADDR_ISR);
}

