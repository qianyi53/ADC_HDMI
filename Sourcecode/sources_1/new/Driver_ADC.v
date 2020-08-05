`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/27 11:15:55
// Design Name: 
// Module Name: Driver_ADC
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


module Driver_ADC(
input clk_100MHz, //ʱ��
input clk_system, //��ȡ�źŵ�ʱ��
input Rst, //��λ�ź�,�͵�ƽ��λ
input[7:0]ADC_Data, //ADC ��������
input[17:0]Read_Addr, //��ȡ�źŵ�ַ
input[7:0]Trigger_Gate, //������ֵ
output[17:0]Period,//Ƶ��
output clk_ADC, //ADC ʱ��
output ADC_En, //ADC ʹ���ź�
output [7:0]ADC_Data_Out //�洢�ź����
);
//������
parameter Sampling_Num=20000;
//ADC,��ַ������
reg [15:0]Addr_Cnt=0;
//ʵ�ʶ�ȡ��ַ
reg[15:0]Addr_Read_Real=0;
//ADC ʹ���ź�����
assign ADC_En=~Rst;
//��Ƶ���� ADC ʱ��
Clk_Division_0 Clk_Division_ADC(
.clk_100MHz(clk_100MHz), // input wire clk_100MHz
.clk_mode(200), // input wire [30 : 0] clk_mode
.clk_out(clk_ADC) // output wire clk_out
);
//ADC ��ַ����
always@(posedge clk_ADC or negedge Rst)
begin
//�͵�ƽ��λ
if(!Rst)
Addr_Cnt<=0;
else if(Addr_Cnt==Sampling_Num-1)
Addr_Cnt<=0;
else
Addr_Cnt<=Addr_Cnt+1;
end
//Ƶ�ʼ���
Wave_Freq_Cal Freq_Cal(
.clk_100MHz(clk_100MHz),
.Rst(Rst),
.ADC_Data(ADC_Data),
.F_Gate(Trigger_Gate),
.Period(Period)
);
//�����źŴ洢
Wave_Ram Sampling_38400_0(
.clka(clk_ADC), // input wire clka
.wea(Rst), // input wire [0 : 0] wea
.addra(Addr_Cnt), // input wire [9 : 0] addra
.dina(ADC_Data), // input wire [7 : 0] dina
.clkb(clk_system), // input wire clkb
.addrb(Read_Addr), // input wire [15 : 0] addrb
.doutb(ADC_Data_Out) // output wire [7 : 0] doutb
);
endmodule
