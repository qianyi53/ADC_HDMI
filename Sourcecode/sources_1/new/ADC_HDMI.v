`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/26 17:37:30
// Design Name: 
// Module Name: ADC_HDMI
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ADC_HDMI(
input clk_100MHz,
input [7:0]ADC_Data,
output clk_ADC,
output ADC_En,
output TMDS_Tx_Clk_N,
output TMDS_Tx_Clk_P,
output [2:0]TMDS_Tx_Data_N,
output [2:0]TMDS_Tx_Data_P
   );
wire clk_100MHz_system;
wire clk_system;
wire [23:0]RGB_Data;
wire [23:0]RGB_In;
wire RGB_HSync;
wire RGB_VSync;
wire RGB_VDE;
wire [11:0]Set_X;
wire [11:0]Set_Y;  
 //ADC
wire[17:0]Read_Addr; //读取信号地址
wire[7:0]ADC_Data_Out; //存储信号输出
//偏移
wire [20:0]Offset;
clk_wiz_0 clk_10(.clk_out1(clk_system),.clk_out2(clk_100MHz_system),.clk_in1(clk_100MHz));
//RGBToDvi 实例化
rgb2dvi_0 rgb2dvi(
.TMDS_Clk_p(TMDS_Tx_Clk_P),
.TMDS_Clk_n(TMDS_Tx_Clk_N),
.TMDS_Data_p(TMDS_Tx_Data_P),
.TMDS_Data_n(TMDS_Tx_Data_N),
.aRst_n(1),
.vid_pData(RGB_Data),
.vid_pVDE(RGB_VDE),
.vid_pHSync(RGB_HSync),
.vid_pVSync(RGB_VSync),
.PixelClk(clk_system));
//视频产生
Driver_HDMI_0 Driver_HDMI0(
.clk(clk_system), //时钟
.Rst(1), //复位信号,低电平复位
.Video_Mode(0), //视频格式
.RGB_In(RGB_In), //输入数据
.RGB_Data(RGB_Data), //输出数据
.RGB_HSync(RGB_HSync), //行信号
.RGB_VSync(RGB_VSync), //场信号
.RGB_VDE(RGB_VDE), //数据有效信号
.Set_X(Set_X), //图像坐标 X
.Set_Y(Set_Y) //图像坐标 Y
);
//ADC 驱动
Driver_ADC Driver_ADC0(
.clk_100MHz(clk_100MHz_system), //系统时钟
.clk_system(clk_system), //读取信号的时钟
.Rst(1), //复位信号,低电平复位
.ADC_Data(ADC_Data), //ADC 采样数据
.Read_Addr(Read_Addr), //读取信号地址
.Trigger_Gate(128), //触发阈值
.Period(Offset),
.clk_ADC(clk_ADC), //ADC 时钟
.ADC_En(ADC_En), //ADC 使能信号
.ADC_Data_Out(ADC_Data_Out) //存储信号输出
);
Wave_Generator Wave_Generator0(
.RGB_VDE(RGB_VDE),
.Offset(Offset),
.Set_X(Set_X),
.Set_Y(Set_Y),
.ADC_Data_Out(ADC_Data_Out),
.Read_Addr(Read_Addr),
.RGB_Data(RGB_In) //RBG
);

endmodule
