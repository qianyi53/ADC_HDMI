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
wire[17:0]Read_Addr; //��ȡ�źŵ�ַ
wire[7:0]ADC_Data_Out; //�洢�ź����
//ƫ��
wire [20:0]Offset;
clk_wiz_0 clk_10(.clk_out1(clk_system),.clk_out2(clk_100MHz_system),.clk_in1(clk_100MHz));
//RGBToDvi ʵ����
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
//��Ƶ����
Driver_HDMI_0 Driver_HDMI0(
.clk(clk_system), //ʱ��
.Rst(1), //��λ�ź�,�͵�ƽ��λ
.Video_Mode(0), //��Ƶ��ʽ
.RGB_In(RGB_In), //��������
.RGB_Data(RGB_Data), //�������
.RGB_HSync(RGB_HSync), //���ź�
.RGB_VSync(RGB_VSync), //���ź�
.RGB_VDE(RGB_VDE), //������Ч�ź�
.Set_X(Set_X), //ͼ������ X
.Set_Y(Set_Y) //ͼ������ Y
);
//ADC ����
Driver_ADC Driver_ADC0(
.clk_100MHz(clk_100MHz_system), //ϵͳʱ��
.clk_system(clk_system), //��ȡ�źŵ�ʱ��
.Rst(1), //��λ�ź�,�͵�ƽ��λ
.ADC_Data(ADC_Data), //ADC ��������
.Read_Addr(Read_Addr), //��ȡ�źŵ�ַ
.Trigger_Gate(128), //������ֵ
.Period(Offset),
.clk_ADC(clk_ADC), //ADC ʱ��
.ADC_En(ADC_En), //ADC ʹ���ź�
.ADC_Data_Out(ADC_Data_Out) //�洢�ź����
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
