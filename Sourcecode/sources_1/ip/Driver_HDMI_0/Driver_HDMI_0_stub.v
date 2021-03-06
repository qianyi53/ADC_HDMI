// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Sun Jul 26 19:30:20 2020
// Host        : DESKTOP-655U4SO running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/SDF/Desktop/ADC_HDMI/ADC_HDMI.srcs/sources_1/ip/Driver_HDMI_0/Driver_HDMI_0_stub.v
// Design      : Driver_HDMI_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7s6ftgb196-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "Driver_HDMI,Vivado 2018.3" *)
module Driver_HDMI_0(clk, Rst, Video_Mode, RGB_In, RGB_Data, RGB_HSync, 
  RGB_VSync, RGB_VDE, Set_X, Set_Y)
/* synthesis syn_black_box black_box_pad_pin="clk,Rst,Video_Mode,RGB_In[23:0],RGB_Data[23:0],RGB_HSync,RGB_VSync,RGB_VDE,Set_X[11:0],Set_Y[11:0]" */;
  input clk;
  input Rst;
  input Video_Mode;
  input [23:0]RGB_In;
  output [23:0]RGB_Data;
  output RGB_HSync;
  output RGB_VSync;
  output RGB_VDE;
  output [11:0]Set_X;
  output [11:0]Set_Y;
endmodule
