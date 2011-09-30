EESchema Schematic File Version 1
LIBS:power,L_FTDI,contrib_atmega16,device,transistors,conn,linear,regul,74xx,cmos4000,adc-dac,memory,xilinx,special,microcontrollers,dsp,microchip,analog_switches,motorola,texas,intel,audio,interface,digital-audio,philips,display,cypress,siliconi,contrib,valves,.\commande_turbo.cache
EELAYER 23  0
EELAYER END
$Descr A4 11700 8267
Sheet 1 1
Title "Commande d'un turboréacteur de modelisme"
Date "2 jul 2008"
Rev "1"
Comp "IUT Poitiers"
Comment1 "Pôle EEII"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Kmarq B 3950 1900 "Warning Pin power_in non pilotée (Net 7)" F=1
Kmarq B 2600 3950 "Warning Pin power_in non pilotée (Net 1)" F=1
Connection ~ 6250 5800
Wire Wire Line
	6250 5900 6250 5800
Wire Wire Line
	8000 6200 7300 6200
Wire Wire Line
	7550 6800 7550 6900
Wire Wire Line
	7300 5550 7300 5450
Wire Wire Line
	6550 5800 5900 5800
Wire Wire Line
	5950 6100 5950 6000
Wire Wire Line
	5950 6000 5900 6000
Connection ~ 4100 2000
Wire Wire Line
	3650 2000 4300 2000
Wire Wire Line
	9750 4300 9750 4400
Wire Wire Line
	9750 4400 10150 4400
Wire Wire Line
	2600 3750 2600 3950
Wire Wire Line
	4200 3850 4200 3950
Wire Wire Line
	3550 5250 4250 5250
Wire Wire Line
	4250 5250 4250 6550
Wire Wire Line
	4250 6550 4500 6550
Wire Wire Line
	4500 6550 4500 6500
Wire Wire Line
	4500 5450 4500 5350
Wire Wire Line
	4850 5950 4850 6100
Wire Wire Line
	8750 6500 8750 6300
Wire Wire Line
	9100 6500 9100 6300
Wire Wire Line
	7950 4950 8750 4950
Wire Wire Line
	8750 5900 8750 5650
Wire Wire Line
	9600 3200 10100 3200
Wire Wire Line
	9600 3400 10100 3400
Wire Wire Line
	10100 3600 9950 3600
Wire Wire Line
	9950 3600 9950 3700
Wire Wire Line
	4200 3950 5200 3950
Wire Wire Line
	3550 4350 5200 4350
Wire Wire Line
	5200 3850 4650 3850
Wire Wire Line
	5200 3650 4650 3650
Wire Wire Line
	1700 2150 1300 2150
Wire Wire Line
	1300 2150 1300 4600
Wire Wire Line
	1300 4600 1550 4600
Wire Wire Line
	2500 3950 2500 3850
Wire Wire Line
	2500 3850 1400 3850
Connection ~ 1400 4400
Wire Wire Line
	1400 3850 1400 4400
Connection ~ 3950 2600
Wire Wire Line
	3950 2700 3950 2600
Connection ~ 3800 2000
Wire Wire Line
	3800 2150 3800 2000
Wire Wire Line
	2850 2500 2850 2700
Connection ~ 2850 2000
Wire Wire Line
	2850 2100 2850 2000
Connection ~ 2400 6200
Wire Wire Line
	1550 5600 1450 5600
Wire Wire Line
	1450 5600 1450 6200
Wire Wire Line
	1450 6200 2700 6200
Connection ~ 2600 6200
Wire Wire Line
	2600 6050 2600 6200
Wire Wire Line
	2500 6300 2500 6050
Connection ~ 750  4400
Wire Wire Line
	750  4550 750  4250
Wire Wire Line
	1550 4400 750  4400
Wire Wire Line
	750  4950 750  5100
Wire Wire Line
	2700 6200 2700 6050
Connection ~ 2500 6200
Wire Wire Line
	2400 6200 2400 6050
Wire Wire Line
	3050 2000 2450 2000
Wire Wire Line
	2450 2150 2600 2150
Wire Wire Line
	2600 2150 2600 2300
Wire Wire Line
	4100 2000 4100 2150
Wire Wire Line
	3800 2550 3800 2600
Wire Wire Line
	3800 2600 4100 2600
Wire Wire Line
	4100 2600 4100 2550
Wire Wire Line
	3950 2000 3950 1900
Connection ~ 3950 2000
Wire Wire Line
	1700 2000 1200 2000
Wire Wire Line
	1200 2000 1200 4800
Wire Wire Line
	1200 4800 1550 4800
Wire Wire Line
	4650 3550 5200 3550
Wire Wire Line
	4650 3750 5200 3750
Wire Bus Line
	4550 3800 4550 3250
Wire Wire Line
	5200 4450 3550 4450
Wire Wire Line
	5200 4050 4200 4050
Wire Wire Line
	4200 4050 4200 4150
Wire Wire Line
	10100 3500 9600 3500
Wire Wire Line
	9600 3300 10100 3300
Wire Bus Line
	9500 3450 9500 2750
Wire Wire Line
	9100 5650 9100 5900
Wire Wire Line
	8750 4950 8750 5150
Wire Wire Line
	5200 4850 4850 4850
Wire Wire Line
	10050 4650 10050 4500
Wire Wire Line
	10050 4500 10150 4500
Wire Wire Line
	7950 4850 9100 4850
Wire Wire Line
	9100 4850 9100 5150
Wire Wire Line
	4500 6100 4500 5950
Wire Wire Line
	4850 5350 4850 5450
Wire Wire Line
	3550 5350 4150 5350
Wire Wire Line
	4150 5350 4150 6650
Wire Wire Line
	4150 6650 4850 6650
Wire Wire Line
	4850 6650 4850 6500
Wire Wire Line
	9850 4300 10150 4300
Wire Wire Line
	5300 2000 5600 2000
Wire Wire Line
	5600 2000 5600 1900
Wire Wire Line
	5200 4550 4850 4550
Wire Wire Line
	7300 6700 7300 6900
Wire Wire Line
	7300 6300 7300 6050
Connection ~ 7300 6200
Connection ~ 7550 6200
Wire Wire Line
	6550 6000 6550 6100
$Comp
L GND #PWR01
U 1 1 486B2BF5
P 6550 6100
F 0 "#PWR01" H 6550 6100 30  0001 C C
F 1 "GND" H 6550 6030 30  0001 C C
	1    6550 6100
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 P3
U 1 1 486B2BC7
P 6900 5900
F 0 "P3" V 6850 5900 40  0000 C C
F 1 "CONN_2" V 6950 5900 40  0000 C C
	1    6900 5900
	1    0    0    -1  
$EndComp
Text Label 7600 6200 0    60   ~
!RESET
$Comp
L GND #PWR02
U 1 1 486A50E1
P 7550 6900
F 0 "#PWR02" H 7550 6900 30  0001 C C
F 1 "GND" H 7550 6830 30  0001 C C
	1    7550 6900
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW2
U 1 1 486A50A8
P 7550 6500
F 0 "SW2" H 7700 6610 50  0000 C C
F 1 "SW_PUSH" H 7600 6700 50  0000 C C
	1    7550 6500
	0    1    1    0   
$EndComp
$Comp
L VDD #PWR03
U 1 1 486A503C
P 7300 5450
F 0 "#PWR03" H 7300 5550 30  0001 C C
F 1 "VDD" H 7300 5560 30  0000 C C
	1    7300 5450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 486A5033
P 7300 6900
F 0 "#PWR04" H 7300 6900 30  0001 C C
F 1 "GND" H 7300 6830 30  0001 C C
	1    7300 6900
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 486A5028
P 7300 6500
F 0 "C6" H 7100 6600 50  0000 L C
F 1 "100nF" H 7000 6400 50  0000 L C
	1    7300 6500
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 486A5023
P 7300 5800
F 0 "R5" V 7380 5800 50  0000 C C
F 1 "10k" V 7200 5800 50  0000 C C
	1    7300 5800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 486A4EB5
P 6250 6300
F 0 "#PWR05" H 6250 6300 30  0001 C C
F 1 "GND" H 6250 6230 30  0001 C C
	1    6250 6300
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 486A4EAA
P 6250 6100
F 0 "C5" H 6300 6200 50  0000 L C
F 1 "100nF" H 6150 6000 50  0000 L C
	1    6250 6100
	1    0    0    -1  
$EndComp
Text Label 4950 4550 0    60   ~
AU
Text Label 6350 5800 0    60   ~
AU
$Comp
L GND #PWR06
U 1 1 4868E316
P 5950 6100
F 0 "#PWR06" H 5950 6100 30  0001 C C
F 1 "GND" H 5950 6030 30  0001 C C
	1    5950 6100
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 P2
U 1 1 4868E2F1
P 5550 5900
F 0 "P2" V 5500 5900 40  0000 C C
F 1 "CONN_2" V 5600 5900 40  0000 C C
	1    5550 5900
	-1   0    0    -1  
$EndComp
$Comp
L VDD #PWR07
U 1 1 4868E1DF
P 2600 3750
F 0 "#PWR07" H 2600 3850 30  0001 C C
F 1 "VDD" H 2600 3860 30  0000 C C
	1    2600 3750
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR08
U 1 1 4868E1D2
P 4500 5350
F 0 "#PWR08" H 4500 5450 30  0001 C C
F 1 "VDD" H 4500 5460 30  0000 C C
	1    4500 5350
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR09
U 1 1 4868E1CC
P 4850 5350
F 0 "#PWR09" H 4850 5450 30  0001 C C
F 1 "VDD" H 4850 5460 30  0000 C C
	1    4850 5350
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR010
U 1 1 4858FB63
P 4200 3850
F 0 "#PWR010" H 4200 3950 30  0001 C C
F 1 "VDD" H 4200 3960 30  0000 C C
	1    4200 3850
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR011
U 1 1 4858FB5B
P 9750 4300
F 0 "#PWR011" H 9750 4400 30  0001 C C
F 1 "VDD" H 9750 4410 30  0000 C C
	1    9750 4300
	1    0    0    -1  
$EndComp
$Comp
L VDD #PWR012
U 1 1 4858FAEB
P 5600 1900
F 0 "#PWR012" H 5600 2000 30  0001 C C
F 1 "VDD" H 5600 2010 30  0000 C C
	1    5600 1900
	1    0    0    -1  
$EndComp
$Comp
L SPST SW1
U 1 1 4858FAD1
P 4800 2000
F 0 "SW1" H 4800 2100 70  0000 C C
F 1 "SPST" H 4800 1900 70  0000 C C
	1    4800 2000
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 48521468
P 4500 5700
F 0 "R3" V 4580 5700 50  0000 C C
F 1 "R" V 4500 5700 50  0000 C C
	1    4500 5700
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 48521461
P 4850 5700
F 0 "R4" V 4930 5700 50  0000 C C
F 1 "R" V 4850 5700 50  0000 C C
	1    4850 5700
	1    0    0    -1  
$EndComp
$Comp
L LED D4
U 1 1 48521452
P 4850 6300
F 0 "D4" H 4850 6400 50  0000 C C
F 1 "LED" H 4850 6200 50  0000 C C
	1    4850 6300
	0    1    1    0   
$EndComp
$Comp
L LED D3
U 1 1 48521443
P 4500 6300
F 0 "D3" H 4500 6400 50  0000 C C
F 1 "LED" H 4500 6200 50  0000 C C
	1    4500 6300
	0    1    1    0   
$EndComp
$Comp
L FT232RL U1
U 1 1 482152C3
P 2550 3950
F 0 "U1" H 1950 4150 60  0000 C C
F 1 "FT232RL" H 2150 4050 60  0000 C C
	1    2550 3950
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR013
U 1 1 4816EC7F
P 3950 1900
F 0 "#PWR013" H 3950 2000 30  0001 C C
F 1 "VCC" H 3950 2000 30  0000 C C
	1    3950 1900
	1    0    0    -1  
$EndComp
NoConn ~ 5200 3050
NoConn ~ 5200 3150
NoConn ~ 5200 3250
NoConn ~ 5200 3350
NoConn ~ 5200 3450
NoConn ~ 5200 4150
NoConn ~ 5200 4250
NoConn ~ 5200 4650
NoConn ~ 5200 4750
NoConn ~ 5200 4950
NoConn ~ 1700 2250
NoConn ~ 2450 2250
NoConn ~ 1550 5000
NoConn ~ 1550 5200
NoConn ~ 1550 5400
NoConn ~ 3550 5050
NoConn ~ 3550 5450
NoConn ~ 3550 5550
NoConn ~ 3550 5650
NoConn ~ 3550 4950
NoConn ~ 3550 4850
NoConn ~ 3550 4750
NoConn ~ 3550 4650
NoConn ~ 3550 4550
NoConn ~ 7950 3050
NoConn ~ 7950 3150
NoConn ~ 7950 3250
NoConn ~ 7950 3350
NoConn ~ 7950 3450
NoConn ~ 7950 3550
NoConn ~ 7950 3650
NoConn ~ 7950 3750
NoConn ~ 7950 3850
NoConn ~ 7950 3950
NoConn ~ 7950 4050
NoConn ~ 7950 4150
NoConn ~ 7950 4250
NoConn ~ 7950 4350
NoConn ~ 7950 4450
NoConn ~ 7950 4550
NoConn ~ 7950 4650
NoConn ~ 7950 4750
Text Label 8050 4950 0    60   ~
LED_Commande
Text Label 8050 4850 0    60   ~
LED_Marche
Text Label 2550 2000 0    60   ~
Vbus
Text Label 1350 2150 0    60   ~
D-
Text Label 1350 2000 0    60   ~
D+
Text Label 9850 4300 0    60   ~
Vout
$Comp
L GND #PWR014
U 1 1 4816E976
P 10050 4650
F 0 "#PWR014" H 10050 4650 30  0001 C C
F 1 "GND" H 10050 4580 30  0001 C C
	1    10050 4650
	1    0    0    -1  
$EndComp
Text Label 4900 4850 0    60   ~
Vout
$Comp
L GND #PWR015
U 1 1 4816E4A2
P 9100 6500
F 0 "#PWR015" H 9100 6500 30  0001 C C
F 1 "GND" H 9100 6430 30  0001 C C
	1    9100 6500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 4816E405
P 8750 6500
F 0 "#PWR016" H 8750 6500 30  0001 C C
F 1 "GND" H 8750 6430 30  0001 C C
	1    8750 6500
	1    0    0    -1  
$EndComp
$Comp
L LED D2
U 1 1 4816E1C5
P 9100 6100
F 0 "D2" H 9100 6200 50  0000 C C
F 1 "VERT" H 9100 6000 50  0000 C C
	1    9100 6100
	0    1    1    0   
$EndComp
$Comp
L LED D1
U 1 1 4816E1BD
P 8750 6100
F 0 "D1" H 8750 6200 50  0000 C C
F 1 "ROUGE" H 8750 6000 50  0000 C C
	1    8750 6100
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 4816E1A6
P 9100 5400
F 0 "R2" V 9180 5400 50  0000 C C
F 1 "470" V 9100 5400 50  0000 C C
	1    9100 5400
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 4816E1A1
P 8750 5400
F 0 "R1" V 8830 5400 50  0000 C C
F 1 "470" V 8750 5400 50  0000 C C
	1    8750 5400
	1    0    0    -1  
$EndComp
Text Label 9500 3000 1    60   ~
ISP
Entry Wire Line
	9500 3100 9600 3200
Entry Wire Line
	9500 3200 9600 3300
Entry Wire Line
	9500 3300 9600 3400
Entry Wire Line
	9500 3400 9600 3500
Text Label 9650 3500 0    60   ~
SCK
Text Label 9650 3400 0    60   ~
MISO
Text Label 9650 3300 0    60   ~
MOSI
Text Label 9650 3200 0    60   ~
!RESET
$Comp
L GND #PWR017
U 1 1 4816D6BB
P 9950 3700
F 0 "#PWR017" H 9950 3700 30  0001 C C
F 1 "GND" H 9950 3630 30  0001 C C
	1    9950 3700
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 K1
U 1 1 4816D687
P 10500 4400
F 0 "K1" V 10450 4400 50  0000 C C
F 1 "CONN_3" V 10550 4400 40  0000 C C
	1    10500 4400
	1    0    0    -1  
$EndComp
$Comp
L CONN_5 P1
U 1 1 4816D66B
P 10500 3400
F 0 "P1" V 10450 3400 50  0000 C C
F 1 "CONN_5" V 10550 3400 50  0000 C C
	1    10500 3400
	1    0    0    1   
$EndComp
$Comp
L GND #PWR018
U 1 1 4816D534
P 4200 4150
F 0 "#PWR018" H 4200 4150 30  0001 C C
F 1 "GND" H 4200 4080 30  0001 C C
	1    4200 4150
	1    0    0    -1  
$EndComp
Text Label 4550 3400 1    60   ~
ISP
Text Label 4700 3850 0    60   ~
!RESET
Text Label 4700 3750 0    60   ~
SCK
Text Label 4700 3650 0    60   ~
MISO
Text Label 4700 3550 0    60   ~
MOSI
Entry Wire Line
	4550 3450 4650 3550
Entry Wire Line
	4550 3550 4650 3650
Entry Wire Line
	4550 3650 4650 3750
Entry Wire Line
	4550 3750 4650 3850
$Comp
L ATMEGA16 U2
U 1 1 4816D335
P 6650 4200
F 0 "U2" H 5850 5650 60  0000 C C
F 1 "ATMEGA16" H 6050 5550 60  0000 C C
	1    6650 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 4816C656
P 3950 2700
F 0 "#PWR019" H 3950 2700 30  0001 C C
F 1 "GND" H 3950 2630 30  0001 C C
	1    3950 2700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR020
U 1 1 4816C5F9
P 2850 2700
F 0 "#PWR020" H 2850 2700 30  0001 C C
F 1 "GND" H 2850 2630 30  0001 C C
	1    2850 2700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR021
U 1 1 4816C5F1
P 2600 2300
F 0 "#PWR021" H 2600 2300 30  0001 C C
F 1 "GND" H 2600 2230 30  0001 C C
	1    2600 2300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR022
U 1 1 4816C563
P 2500 6300
F 0 "#PWR022" H 2500 6300 30  0001 C C
F 1 "GND" H 2500 6230 30  0001 C C
	1    2500 6300
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR023
U 1 1 4816C50D
P 750 4250
F 0 "#PWR023" H 750 4210 30  0001 C C
F 1 "+3.3V" H 750 4360 30  0000 C C
	1    750  4250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 4816C4F5
P 750 5100
F 0 "#PWR024" H 750 5100 30  0001 C C
F 1 "GND" H 750 5030 30  0001 C C
	1    750  5100
	1    0    0    -1  
$EndComp
$Comp
L INDUCTOR L1
U 1 1 4815DDEF
P 3350 2000
F 0 "L1" V 3300 2000 40  0000 C C
F 1 "INDUCTOR" V 3450 2000 40  0000 C C
	1    3350 2000
	0    -1   -1   0   
$EndComp
$Comp
L CAPAPOL C4
U 1 1 4815DD6F
P 4100 2350
F 0 "C4" H 4150 2450 50  0000 L C
F 1 "10uF" H 4150 2250 50  0000 L C
	1    4100 2350
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 4815DD48
P 3800 2350
F 0 "C3" H 3650 2450 50  0000 L C
F 1 "100nF" H 3500 2250 50  0000 L C
	1    3800 2350
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 4815DD46
P 2850 2300
F 0 "C2" H 2900 2400 50  0000 L C
F 1 "10nF" H 2900 2200 50  0000 L C
	1    2850 2300
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 4815DD3D
P 750 4750
F 0 "C1" H 800 4850 50  0000 L C
F 1 "100nF" H 800 4650 50  0000 L C
	1    750  4750
	1    0    0    -1  
$EndComp
$Comp
L USB_CONN J1
U 1 1 4815DD01
P 2050 1800
F 0 "J1" H 2000 2200 60  0000 C C
F 1 "USB_CONN" V 1800 1950 60  0000 C C
	1    2050 1800
	-1   0    0    -1  
$EndComp
$EndSCHEMATC
