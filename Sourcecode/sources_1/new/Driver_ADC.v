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
input clk_100MHz, //时钟
input clk_system, //读取信号的时钟
input Rst, //复位信号,低电平复位
input[7:0]ADC_Data, //ADC 采样数据
input[17:0]Read_Addr, //读取信号地址
input[7:0]Trigger_Gate, //触发阈值
output[17:0]Period,//频率
output clk_ADC, //ADC 时钟
output ADC_En, //ADC 使能信号
output [7:0]ADC_Data_Out //存储信号输出
);
//采样数
parameter Sampling_Num=20000;
//ADC,地址计数器
reg [15:0]Addr_Cnt=0;
//实际读取地址
reg[15:0]Addr_Read_Real=0;
//ADC 使能信号连线
assign ADC_En=~Rst;
//分频产生 ADC 时钟
Clk_Division_0 Clk_Division_ADC(
.clk_100MHz(clk_100MHz), // input wire clk_100MHz
.clk_mode(200), // input wire [30 : 0] clk_mode
.clk_out(clk_ADC) // output wire clk_out
);
//ADC 地址计数
always@(posedge clk_ADC or negedge Rst)
begin
//低电平复位
if(!Rst)
Addr_Cnt<=0;
else if(Addr_Cnt==Sampling_Num-1)
Addr_Cnt<=0;
else
Addr_Cnt<=Addr_Cnt+1;
end
//频率计算
Wave_Freq_Cal Freq_Cal(
.clk_100MHz(clk_100MHz),
.Rst(Rst),
.ADC_Data(ADC_Data),
.F_Gate(Trigger_Gate),
.Period(Period)
);
//波形信号存储
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
