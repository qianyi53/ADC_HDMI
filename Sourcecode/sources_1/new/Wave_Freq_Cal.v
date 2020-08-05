`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/27 11:09:53
// Design Name: 
// Module Name: Wave_Freq_Cal
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


module Wave_Freq_Cal(
input clk_100MHz,
input Rst,
input [7:0]ADC_Data,
input [7:0]F_Gate,
output reg[20:0]Period=1
);
parameter Measure_Num=5;
//测量信号
wire Signal_Pulse=ADC_Data>F_Gate?1:0; //定义脉冲,超过阈值为 1,反之为 0
//测量参数
reg [31:0]Measure_Cnt=0; //测量计数
reg [19:0]Measure_Num_Cnt=0; //脉冲数计数
reg [31:0]Measure_Delta_Cnt=0; //相邻间隔计数
reg Measure_Delta_Clear=0; //相邻测量清空
reg Delta_Clear_Flag=0; //间隔清零标志
//相邻脉冲间隔计数
always@(posedge clk_100MHz or negedge Rst)
begin
//低电平复位
if(!Rst)
begin
Measure_Delta_Cnt<=0;
Delta_Clear_Flag<=0;
end
//如果清零
else if(Measure_Delta_Clear)
begin
Measure_Delta_Cnt<=0;
Delta_Clear_Flag<=1;
end
else
begin
Measure_Delta_Cnt<=Measure_Delta_Cnt+1;
Delta_Clear_Flag<=0;
end
end
//脉冲计数
always@(posedge Signal_Pulse or negedge Rst or posedge Delta_Clear_Flag)
begin
//低电平复位
if(!Rst)
begin
Measure_Num_Cnt<=0;
Measure_Delta_Clear<=0;
Measure_Cnt<=0;
Period<=0;
end
//如果清零完成,则关闭清零
else if(Delta_Clear_Flag)
Measure_Delta_Clear<=0;
else
begin
if(Measure_Num_Cnt==Measure_Num-1)
begin
if(Measure_Cnt<200)
Period<=1;
else if(Measure_Cnt>1000000)
Period<=5000;
else
Period<=Measure_Cnt/200;
Measure_Num_Cnt<=0;
Measure_Delta_Clear<=1;
Measure_Cnt<=0;
end
else
begin
Measure_Num_Cnt<=Measure_Num_Cnt+1;
Measure_Cnt<=Measure_Cnt+Measure_Delta_Cnt;
end
end
end
endmodule
