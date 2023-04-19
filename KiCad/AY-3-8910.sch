EESchema Schematic File Version 4
LIBS:AY-3-8910-cache
EELAYER 29 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 1
Title "AY-3-8910 Sound Generator"
Date "2023-04-02"
Rev "1"
Comp "Gadget Reboot"
Comment1 "https://www.youtube.com/gadgetreboot"
Comment2 "https://github.com/GadgetReboot/AY-3-8910"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L arduino:Arduino_Nano_Socket M2
U 1 1 63B7CE89
P 3475 3575
F 0 "M2" H 3475 4812 60  0000 C CNN
F 1 "Arduino_Nano_Socket" H 3475 4706 60  0000 C CNN
F 2 "Arduino:Arduino_Nano_Socket" H 5275 7325 60  0001 C CNN
F 3 "https://store.arduino.cc/arduino-nano" H 5275 7325 60  0001 C CNN
	1    3475 3575
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0101
U 1 1 63BA81DD
P 1975 4125
F 0 "#PWR0101" H 1975 3875 50  0001 C CNN
F 1 "GNDREF" H 1980 3952 50  0001 C CNN
F 2 "" H 1975 4125 50  0001 C CNN
F 3 "" H 1975 4125 50  0001 C CNN
	1    1975 4125
	1    0    0    -1  
$EndComp
Wire Wire Line
	1975 4125 1975 4075
Wire Wire Line
	1975 4075 2125 4075
Wire Wire Line
	2175 4175 2125 4175
Wire Wire Line
	2125 4175 2125 4075
Connection ~ 2125 4075
Wire Wire Line
	2125 4075 2175 4075
$Comp
L Device:CP1_Small C1
U 1 1 63BBB27F
P 1675 4600
F 0 "C1" H 1766 4646 50  0000 L CNN
F 1 "1uF" H 1766 4555 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 1675 4600 50  0001 C CNN
F 3 "~" H 1675 4600 50  0001 C CNN
	1    1675 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 63BBBD77
P 7075 2325
F 0 "C2" V 7125 2425 50  0000 L CNN
F 1 "100nF" V 7125 2025 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 7075 2325 50  0001 C CNN
F 3 "~" H 7075 2325 50  0001 C CNN
	1    7075 2325
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR0103
U 1 1 63BC071E
P 1675 4775
F 0 "#PWR0103" H 1675 4525 50  0001 C CNN
F 1 "GNDREF" H 1680 4602 50  0001 C CNN
F 2 "" H 1675 4775 50  0001 C CNN
F 3 "" H 1675 4775 50  0001 C CNN
	1    1675 4775
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0104
U 1 1 63BC1037
P 7375 2350
F 0 "#PWR0104" H 7375 2100 50  0001 C CNN
F 1 "GNDREF" H 7380 2177 50  0001 C CNN
F 2 "" H 7375 2350 50  0001 C CNN
F 3 "" H 7375 2350 50  0001 C CNN
	1    7375 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1675 4375 1675 4500
Wire Wire Line
	1675 4700 1675 4775
$Comp
L power:+5V #PWR01
U 1 1 64320E72
P 6775 2300
F 0 "#PWR01" H 6775 2150 50  0001 C CNN
F 1 "+5V" H 6790 2473 50  0000 C CNN
F 2 "" H 6775 2300 50  0001 C CNN
F 3 "" H 6775 2300 50  0001 C CNN
	1    6775 2300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J1
U 1 1 64343273
P 850 2775
F 0 "J1" H 850 2575 50  0000 C CNN
F 1 "UART" H 930 2726 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 850 2775 50  0001 C CNN
F 3 "~" H 850 2775 50  0001 C CNN
	1    850  2775
	-1   0    0    -1  
$EndComp
$Comp
L ay-3-8910:AY-3-8910 U1
U 1 1 643688EB
P 6775 3675
F 0 "U1" H 7250 4825 60  0000 C CNN
F 1 "AY-3-8910" H 6775 3750 60  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_LongPads" H 6450 2800 60  0001 C CNN
F 3 "" H 6450 2800 60  0001 C CNN
	1    6775 3675
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 3775 2175 3775
Wire Wire Line
	1800 3675 2175 3675
Wire Wire Line
	1800 3575 2175 3575
Wire Wire Line
	1800 3475 2175 3475
Text Label 1800 3475 0    50   ~ 0
DA7
Text Label 1800 3575 0    50   ~ 0
BDIR
Text Label 1800 3675 0    50   ~ 0
BC2
Text Label 1800 3775 0    50   ~ 0
BC1
Text Label 5300 3375 0    50   ~ 0
CLK
Wire Wire Line
	4775 3375 4875 3375
$Comp
L Device:R_Small_US R4
U 1 1 64381D1D
P 4975 3375
F 0 "R4" V 4925 3200 50  0000 C CNN
F 1 "75r" V 4925 3525 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 4975 3375 50  0001 C CNN
F 3 "~" H 4975 3375 50  0001 C CNN
	1    4975 3375
	0    1    1    0   
$EndComp
Wire Wire Line
	6025 3975 5525 3975
Wire Wire Line
	5525 3975 5525 3375
Wire Wire Line
	5075 3375 5525 3375
Wire Wire Line
	4775 3275 6025 3275
Wire Wire Line
	4775 3175 6025 3175
Wire Wire Line
	4775 3075 6025 3075
Wire Wire Line
	4775 2975 6025 2975
Wire Wire Line
	4775 2875 6025 2875
Wire Wire Line
	4775 2775 6025 2775
Wire Wire Line
	4775 2675 6025 2675
Text Label 5300 3275 0    50   ~ 0
DA6
Text Label 5300 3175 0    50   ~ 0
DA5
Text Label 5300 3075 0    50   ~ 0
DA4
Text Label 5300 2975 0    50   ~ 0
DA3
Text Label 5300 2875 0    50   ~ 0
DA2
Text Label 5300 2775 0    50   ~ 0
DA1
Text Label 5300 2675 0    50   ~ 0
DA0
Wire Wire Line
	5650 3625 6025 3625
Wire Wire Line
	5650 3725 6025 3725
Wire Wire Line
	5650 3525 6025 3525
Wire Wire Line
	5650 3375 6025 3375
Text Label 5650 3375 0    50   ~ 0
DA7
Text Label 5650 3525 0    50   ~ 0
BDIR
Text Label 5650 3725 0    50   ~ 0
BC2
Text Label 5650 3625 0    50   ~ 0
BC1
Text Label 4775 3475 0    50   ~ 0
~CS
Text Label 4775 3575 0    50   ~ 0
MOSI
Text Label 4775 3675 0    50   ~ 0
MISO
Text Label 4775 3775 0    50   ~ 0
SCK
Wire Wire Line
	6775 2300 6775 2325
$Comp
L power:+5V #PWR08
U 1 1 643DC955
P 1675 4275
F 0 "#PWR08" H 1675 4125 50  0001 C CNN
F 1 "+5V" H 1690 4448 50  0000 C CNN
F 2 "" H 1675 4275 50  0001 C CNN
F 3 "" H 1675 4275 50  0001 C CNN
	1    1675 4275
	1    0    0    -1  
$EndComp
Wire Wire Line
	2175 4375 1675 4375
Wire Wire Line
	1675 4375 1675 4275
$Comp
L power:GNDREF #PWR09
U 1 1 643EA75D
P 6775 5025
F 0 "#PWR09" H 6775 4775 50  0001 C CNN
F 1 "GNDREF" H 6780 4852 50  0001 C CNN
F 2 "" H 6775 5025 50  0001 C CNN
F 3 "" H 6775 5025 50  0001 C CNN
	1    6775 5025
	1    0    0    -1  
$EndComp
Wire Wire Line
	6775 5025 6775 4975
$Comp
L Device:R_Small_US R2
U 1 1 643EFA05
P 8025 2900
F 0 "R2" H 7900 2850 50  0000 C CNN
F 1 "1K" H 7900 2950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 8025 2900 50  0001 C CNN
F 3 "~" H 8025 2900 50  0001 C CNN
	1    8025 2900
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR03
U 1 1 643F0FF6
P 8025 3050
F 0 "#PWR03" H 8025 2800 50  0001 C CNN
F 1 "GNDREF" H 8030 2877 50  0001 C CNN
F 2 "" H 8025 3050 50  0001 C CNN
F 3 "" H 8025 3050 50  0001 C CNN
	1    8025 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8025 3050 8025 3000
Wire Wire Line
	7525 2875 7600 2875
Wire Wire Line
	7600 2875 7600 2775
Wire Wire Line
	7600 2675 7525 2675
Wire Wire Line
	7525 2775 7600 2775
Connection ~ 7600 2775
Wire Wire Line
	7600 2775 7600 2675
Wire Wire Line
	7600 2675 8025 2675
Wire Wire Line
	8025 2675 8025 2800
Connection ~ 7600 2675
$Comp
L Device:CP1_Small C3
U 1 1 64403729
P 8725 2675
F 0 "C3" V 8775 2750 50  0000 L CNN
F 1 "1uF" V 8775 2450 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 8725 2675 50  0001 C CNN
F 3 "~" H 8725 2675 50  0001 C CNN
	1    8725 2675
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C4
U 1 1 64403BB8
P 8450 2900
F 0 "C4" H 8542 2946 50  0000 L CNN
F 1 "4.7nF" H 8542 2855 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 8450 2900 50  0001 C CNN
F 3 "~" H 8450 2900 50  0001 C CNN
	1    8450 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R1
U 1 1 64409D52
P 8225 2675
F 0 "R1" V 8150 2525 50  0000 C CNN
F 1 "4.7K" V 8150 2825 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 8225 2675 50  0001 C CNN
F 3 "~" H 8225 2675 50  0001 C CNN
	1    8225 2675
	0    1    1    0   
$EndComp
$Comp
L power:GNDREF #PWR04
U 1 1 6440BA1A
P 8450 3050
F 0 "#PWR04" H 8450 2800 50  0001 C CNN
F 1 "GNDREF" H 8455 2877 50  0001 C CNN
F 2 "" H 8450 3050 50  0001 C CNN
F 3 "" H 8450 3050 50  0001 C CNN
	1    8450 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 3050 8450 3000
Wire Wire Line
	8125 2675 8025 2675
Connection ~ 8025 2675
Wire Wire Line
	8325 2675 8450 2675
Wire Wire Line
	8450 2675 8450 2800
Wire Wire Line
	8625 2675 8450 2675
Connection ~ 8450 2675
$Comp
L Device:R_Small_US R3
U 1 1 6441F4C4
P 8950 2900
F 0 "R3" H 8825 2850 50  0000 C CNN
F 1 "470r" H 8775 2950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 8950 2900 50  0001 C CNN
F 3 "~" H 8950 2900 50  0001 C CNN
	1    8950 2900
	-1   0    0    1   
$EndComp
$Comp
L power:GNDREF #PWR05
U 1 1 6441F4CE
P 8950 3050
F 0 "#PWR05" H 8950 2800 50  0001 C CNN
F 1 "GNDREF" H 8955 2877 50  0001 C CNN
F 2 "" H 8950 3050 50  0001 C CNN
F 3 "" H 8950 3050 50  0001 C CNN
	1    8950 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 3050 8950 3000
Wire Wire Line
	8950 2675 8950 2800
Wire Wire Line
	8825 2675 8950 2675
Connection ~ 8950 2675
$Comp
L Connector:AudioJack4 J2
U 1 1 644332A8
P 9775 2875
F 0 "J2" H 9732 3200 50  0000 C CNN
F 1 "AudioJack4" H 9700 3100 50  0000 C CNN
F 2 "footprints:Jack_3.5mm_PJ320A_Horizontal" H 9775 2875 50  0001 C CNN
F 3 "~" H 9775 2875 50  0001 C CNN
	1    9775 2875
	-1   0    0    1   
$EndComp
Wire Wire Line
	8950 2675 9475 2675
Wire Wire Line
	9575 2775 9475 2775
Wire Wire Line
	9475 2775 9475 2675
Connection ~ 9475 2675
Wire Wire Line
	9475 2675 9575 2675
$Comp
L power:GNDREF #PWR06
U 1 1 644497B0
P 9500 3050
F 0 "#PWR06" H 9500 2800 50  0001 C CNN
F 1 "GNDREF" H 9505 2877 50  0001 C CNN
F 2 "" H 9500 3050 50  0001 C CNN
F 3 "" H 9500 3050 50  0001 C CNN
	1    9500 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9500 3050 9500 2975
Wire Wire Line
	9500 2975 9575 2975
Wire Wire Line
	7375 2325 7375 2350
Wire Wire Line
	7175 2325 7375 2325
Wire Wire Line
	6775 2325 6975 2325
Connection ~ 6775 2325
Wire Wire Line
	6775 2325 6775 2375
Connection ~ 1675 4375
$Comp
L Connector_Generic:Conn_01x06 J4
U 1 1 6448772E
P 5550 5125
F 0 "J4" H 5500 4700 50  0000 L CNN
F 1 "Conn_01x06" H 5630 5026 50  0001 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 5550 5125 50  0001 C CNN
F 3 "~" H 5550 5125 50  0001 C CNN
	1    5550 5125
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4925 5300 4925
Wire Wire Line
	5300 4925 5300 3475
Wire Wire Line
	4775 3475 5300 3475
Wire Wire Line
	5350 5025 5200 5025
Wire Wire Line
	5200 5025 5200 3775
Wire Wire Line
	4775 3775 5200 3775
Wire Wire Line
	5350 5125 5075 5125
Wire Wire Line
	5075 5125 5075 3575
Wire Wire Line
	5350 5225 4950 5225
Wire Wire Line
	4950 5225 4950 3675
$Comp
L power:GNDREF #PWR011
U 1 1 64493847
P 5275 5525
F 0 "#PWR011" H 5275 5275 50  0001 C CNN
F 1 "GNDREF" H 5280 5352 50  0001 C CNN
F 2 "" H 5275 5525 50  0001 C CNN
F 3 "" H 5275 5525 50  0001 C CNN
	1    5275 5525
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR010
U 1 1 64493FD9
P 4800 5225
F 0 "#PWR010" H 4800 5075 50  0001 C CNN
F 1 "+5V" H 4815 5398 50  0000 C CNN
F 2 "" H 4800 5225 50  0001 C CNN
F 3 "" H 4800 5225 50  0001 C CNN
	1    4800 5225
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 5325 4800 5325
Wire Wire Line
	4800 5325 4800 5225
Wire Wire Line
	5350 5425 5275 5425
Wire Wire Line
	5275 5425 5275 5525
Text Notes 5625 4950 0    50   ~ 0
~CS
Text Notes 5625 5050 0    50   ~ 0
SCK
Text Notes 5625 5150 0    50   ~ 0
MOSI
Text Notes 5625 5250 0    50   ~ 0
MISO
Text Notes 5625 5350 0    50   ~ 0
VCC
Text Notes 5625 5450 0    50   ~ 0
GND
Text Notes 5875 5175 0    50   ~ 0
Micro SD Card\n
Text Notes 5875 5375 0    50   ~ 0
use module with \n3V3 level shifter
$Comp
L power:GNDREF #PWR02
U 1 1 6449BDC6
P 1125 2900
F 0 "#PWR02" H 1125 2650 50  0001 C CNN
F 1 "GNDREF" H 1130 2727 50  0001 C CNN
F 2 "" H 1125 2900 50  0001 C CNN
F 3 "" H 1125 2900 50  0001 C CNN
	1    1125 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 2875 1125 2875
Wire Wire Line
	1125 2875 1125 2900
Wire Wire Line
	1050 2775 2175 2775
Wire Wire Line
	1050 2675 2175 2675
Text Notes 650  2700 0    50   ~ 0
Rx
Text Notes 650  2800 0    50   ~ 0
Tx
Text Notes 650  2900 0    50   ~ 0
Gnd
Text Label 1800 2675 0    50   ~ 0
RxD
Text Label 1800 2775 0    50   ~ 0
TxD
$Comp
L Device:LED_Small_ALT D1
U 1 1 644C6F1F
P 1225 4625
F 0 "D1" V 1225 4557 50  0000 R CNN
F 1 "LED_Small_ALT" V 1180 4557 50  0001 R CNN
F 2 "LED_THT:LED_D5.0mm" V 1225 4625 50  0001 C CNN
F 3 "~" V 1225 4625 50  0001 C CNN
	1    1225 4625
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR0102
U 1 1 644C8B2D
P 1225 4775
F 0 "#PWR0102" H 1225 4525 50  0001 C CNN
F 1 "GNDREF" H 1230 4602 50  0001 C CNN
F 2 "" H 1225 4775 50  0001 C CNN
F 3 "" H 1225 4775 50  0001 C CNN
	1    1225 4775
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small_US R5
U 1 1 644C9318
P 1350 4375
F 0 "R5" V 1300 4250 50  0000 C CNN
F 1 "300r" V 1300 4525 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" H 1350 4375 50  0001 C CNN
F 3 "~" H 1350 4375 50  0001 C CNN
	1    1350 4375
	0    1    1    0   
$EndComp
Wire Wire Line
	1225 4775 1225 4725
Wire Wire Line
	1225 4525 1225 4375
Wire Wire Line
	1225 4375 1250 4375
Wire Wire Line
	1450 4375 1675 4375
Text Notes 900  4675 0    50   ~ 0
Power
$Comp
L Mechanical:MountingHole MH1
U 1 1 644E2CAA
P 5200 7125
F 0 "MH1" H 5300 7125 50  0000 L CNN
F 1 "MountingHole" H 5300 7080 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 5200 7125 50  0001 C CNN
F 3 "~" H 5200 7125 50  0001 C CNN
	1    5200 7125
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH3
U 1 1 644E306B
P 5200 7325
F 0 "MH3" H 5300 7325 50  0000 L CNN
F 1 "MountingHole" H 5300 7280 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 5200 7325 50  0001 C CNN
F 3 "~" H 5200 7325 50  0001 C CNN
	1    5200 7325
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH2
U 1 1 644E38E8
P 5550 7125
F 0 "MH2" H 5650 7125 50  0000 L CNN
F 1 "MountingHole" H 5650 7080 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 5550 7125 50  0001 C CNN
F 3 "~" H 5550 7125 50  0001 C CNN
	1    5550 7125
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole MH4
U 1 1 644E38F2
P 5550 7325
F 0 "MH4" H 5650 7325 50  0000 L CNN
F 1 "MountingHole" H 5650 7280 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 5550 7325 50  0001 C CNN
F 3 "~" H 5550 7325 50  0001 C CNN
	1    5550 7325
	1    0    0    -1  
$EndComp
Text Notes 5150 7550 0    50   ~ 0
Mount Holes
Wire Wire Line
	4775 3675 4950 3675
Wire Wire Line
	4775 3575 5075 3575
Wire Wire Line
	5650 3875 6025 3875
Text Label 5650 3875 0    50   ~ 0
~RESET
Wire Wire Line
	1800 3375 2175 3375
Text Label 1800 3375 0    50   ~ 0
~RESET
$Comp
L dk_Tactile-Switches:1825910-6 S1
U 1 1 643EEA49
P 975 3575
F 0 "S1" H 975 3922 60  0000 C CNN
F 1 "1825910-6" H 975 3816 60  0000 C CNN
F 2 "digikey-footprints:Switch_Tactile_THT_6x6mm" H 1175 3775 60  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1825910&DocType=Customer+Drawing&DocLang=English" H 1175 3875 60  0001 L CNN
F 4 "450-1650-ND" H 1175 3975 60  0001 L CNN "Digi-Key_PN"
F 5 "1825910-6" H 1175 4075 60  0001 L CNN "MPN"
F 6 "Switches" H 1175 4175 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 1175 4275 60  0001 L CNN "Family"
F 8 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1825910&DocType=Customer+Drawing&DocLang=English" H 1175 4375 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/te-connectivity-alcoswitch-switches/1825910-6/450-1650-ND/1632536" H 1175 4475 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 24V" H 1175 4575 60  0001 L CNN "Description"
F 11 "TE Connectivity ALCOSWITCH Switches" H 1175 4675 60  0001 L CNN "Manufacturer"
F 12 "Active" H 1175 4775 60  0001 L CNN "Status"
	1    975  3575
	1    0    0    -1  
$EndComp
$Comp
L power:GNDREF #PWR0105
U 1 1 643F1393
P 675 3825
F 0 "#PWR0105" H 675 3575 50  0001 C CNN
F 1 "GNDREF" H 680 3652 50  0001 C CNN
F 2 "" H 675 3825 50  0001 C CNN
F 3 "" H 675 3825 50  0001 C CNN
	1    675  3825
	1    0    0    -1  
$EndComp
Wire Wire Line
	675  3825 675  3675
Wire Wire Line
	675  3475 775  3475
Wire Wire Line
	775  3675 675  3675
Connection ~ 675  3675
Wire Wire Line
	675  3675 675  3475
Wire Wire Line
	2175 3275 1375 3275
Wire Wire Line
	1375 3275 1375 3475
Wire Wire Line
	1375 3475 1175 3475
Wire Wire Line
	1175 3675 1375 3675
Wire Wire Line
	1375 3675 1375 3475
Connection ~ 1375 3475
Text Notes 775  3825 0    50   ~ 0
Misc. Button
$EndSCHEMATC