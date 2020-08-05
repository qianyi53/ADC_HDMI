## Clock signal 100 MHz
set_property -dict {PACKAGE_PIN H4 IOSTANDARD LVCMOS33} [get_ports clk_100MHz]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk_100MHz]

#HDMI
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_Tx_Data_P[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_Tx_Data_N[2]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_Tx_Data_P[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_Tx_Data_N[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_Tx_Data_P[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {TMDS_Tx_Data_N[0]}]
set_property IOSTANDARD TMDS_33 [get_ports TMDS_Tx_Clk_N]
set_property IOSTANDARD TMDS_33 [get_ports TMDS_Tx_Clk_P]
set_property PACKAGE_PIN G4 [get_ports TMDS_Tx_Clk_P]
set_property PACKAGE_PIN F4 [get_ports TMDS_Tx_Clk_N]
set_property PACKAGE_PIN G1 [get_ports {TMDS_Tx_Data_P[0]}]
set_property PACKAGE_PIN F1 [get_ports {TMDS_Tx_Data_N[0]}]
set_property PACKAGE_PIN E2 [get_ports {TMDS_Tx_Data_P[1]}]
set_property PACKAGE_PIN D2 [get_ports {TMDS_Tx_Data_N[1]}]
set_property PACKAGE_PIN D1 [get_ports {TMDS_Tx_Data_P[2]}]
set_property PACKAGE_PIN C1 [get_ports {TMDS_Tx_Data_N[2]}]

#ADC
set_property PACKAGE_PIN J4 [get_ports ADC_En]
set_property PACKAGE_PIN C5 [get_ports clk_ADC]
set_property PACKAGE_PIN J3 [get_ports {ADC_Data[0]}]
set_property PACKAGE_PIN J2 [get_ports {ADC_Data[1]}]
set_property PACKAGE_PIN D12 [get_ports {ADC_Data[2]}]
set_property PACKAGE_PIN E12 [get_ports {ADC_Data[3]}]
set_property PACKAGE_PIN F12 [get_ports {ADC_Data[4]}]
set_property PACKAGE_PIN C11 [get_ports {ADC_Data[5]}]
set_property PACKAGE_PIN H11 [get_ports {ADC_Data[6]}]
set_property PACKAGE_PIN H12 [get_ports {ADC_Data[7]}]

set_property IOSTANDARD LVCMOS33 [get_ports ADC_En]
set_property IOSTANDARD LVCMOS33 [get_ports clk_ADC]
set_property IOSTANDARD LVCMOS33 [get_ports {ADC_Data[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ADC_Data[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ADC_Data[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ADC_Data[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ADC_Data[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ADC_Data[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ADC_Data[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {ADC_Data[7]}]




