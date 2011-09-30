v 20040111 1
C 5700 9200 1 0 0 resistor-2.sym
{
T 5900 9500 5 10 1 1 0 0 1
refdes=R1
T 6100 9100 5 10 1 1 270 0 1
value=1K
T 5700 9200 5 10 0 1 270 0 1
footprint=R0w4
}
C 5700 9400 1 180 0 led-2.sym
{
T 5600 9000 5 10 1 1 180 0 1
refdes=D1
T 5700 9400 5 10 0 1 180 0 1
footprint=LED 3
}
C 2000 9300 1 90 0 resistor-2.sym
{
T 1700 9500 5 10 1 1 90 0 1
refdes=R2
T 1400 9900 5 10 1 1 0 0 1
value=10K
T 2000 9300 5 10 0 1 0 0 1
footprint=R0w8
}
C 7300 6200 1 180 0 connector5-1.sym
{
T 7200 4500 5 10 1 1 180 0 1
refdes=CONN1
T 7700 4900 5 10 1 1 90 0 1
value=PROG_LOAD
T 7300 6200 5 10 0 1 0 0 1
footprint=CONNECTOR 5 1
}
C 5300 6100 1 270 0 gnd-1.sym
C 2200 3900 1 0 0 ATMEGA-8DIP_ph.sym
{
T 4500 9800 5 10 1 1 0 6 1
refdes=U1
T 2200 3900 5 10 0 1 0 0 1
footprint=DIP28N
}
N 1900 9300 2200 9300 4
C 5100 6800 1 90 0 gnd-1.sym
C 1700 6200 1 0 0 gnd-1.sym
N 1800 6900 2200 6900 4
N 1800 6500 2200 6500 4
N 8000 4300 8000 10300 4
N 8000 10300 2200 10300 4
N 2200 10300 2200 9300 4
C 1700 6900 1 0 0 vccarrow-1.sym
{
T 1500 6900 5 10 1 1 0 0 1
value=5V
}
C 6600 9600 1 0 0 vccarrow-1.sym
{
T 6400 9600 5 10 1 1 0 0 1
value=5V
}
C 1800 10200 1 0 0 vccarrow-1.sym
{
T 1600 10200 5 10 1 1 0 0 1
value=5V
}
C 7500 1300 1 90 0 connector10-1.sym
{
T 4300 1400 5 10 1 1 90 0 1
refdes=CONN2
T 7600 1400 5 10 1 1 0 0 1
value=LCD
T 7500 1300 5 10 0 1 0 0 1
footprint=CONNECTOR 10 1
}
C 6900 3000 1 0 0 vccarrow-1.sym
{
T 7200 3200 5 10 1 1 0 0 1
value=5V
}
C 7500 2700 1 0 0 gnd-1.sym
C 7600 3600 1 180 0 resistor-2.sym
{
T 8200 3500 5 10 1 1 180 0 1
refdes=R3
T 7300 3800 5 10 1 1 180 0 1
value=470
T 7600 3600 5 10 0 1 180 0 1
footprint=R0w4
}
N 7600 3500 7600 3000 4
N 7600 3000 7300 3000 4
N 6100 3000 6100 4000 4
N 5200 3000 5200 4100 4
N 5500 3000 5500 3200 4
N 5500 3200 2200 3200 4
N 2200 3200 2200 4100 4
N 2200 7300 400 7300 4
N 400 3300 400 7300 4
N 400 3300 5800 3300 4
N 5800 3300 5800 3000 4
N 4900 3000 4900 4500 4
N 4900 4500 4800 4500 4
N 5300 4900 4800 4900 4
N 5200 4100 4800 4100 4
N 8000 4300 5600 4300 4
N 5600 4300 5600 4800 4
N 5600 5700 4800 5700 4
N 4800 5300 4800 5400 4
N 4800 5400 5600 5400 4
N 5600 5100 5300 5100 4
N 5400 4000 6100 4000 4
N 5400 4000 5400 5400 4
T 7300 2500 9 12 1 0 0 0 1
gnd
T 7000 2700 9 12 1 0 0 0 1
vcc
T 6700 2500 9 12 1 0 0 0 1
con
T 6400 2700 9 12 1 0 0 0 1
rs
T 6100 2500 9 12 1 0 0 0 1
rw
T 5800 2700 9 12 1 0 0 0 1
E
T 5500 2500 9 10 1 0 0 0 1
d4
T 5200 2700 9 10 1 0 0 0 1
d5
T 4900 2500 9 10 1 0 0 0 1
d6
T 4600 2700 9 10 1 0 0 0 1
d7
N 6600 9300 6700 9300 4
N 6700 9300 6700 9600 4
N 6700 3500 6700 3000 4
T 5700 7900 9 10 1 0 0 0 2
LCD test circuit 
(c) Guido Socher
B 4400 100 3200 400 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 4700 200 9 10 1 0 0 0 1
HD44780 LCD DISPLAY
L 4900 1400 4900 500 3 0 0 0 -1 -1
L 5200 1400 5200 500 3 0 0 0 -1 -1
L 5500 1400 5500 500 3 0 0 0 -1 -1
L 5800 1400 5800 500 3 0 0 0 -1 -1
L 6100 1400 6100 500 3 0 0 0 -1 -1
L 6700 1400 6700 500 3 0 0 0 -1 -1
L 7000 1400 7000 500 3 0 0 0 -1 -1
L 7300 1400 7300 500 3 0 0 0 -1 -1
N 5300 5100 5300 4900 4
N 2200 4500 1900 4500 4
N 1900 4500 1900 3000 4
N 1900 3000 4600 3000 4
N 6400 3000 6400 3400 4
N 6400 3400 1600 3400 4
N 1600 3400 1600 4900 4
N 1600 4900 2200 4900 4
L 6400 1400 6400 500 3 0 0 0 -1 -1
L 4600 1400 4600 500 3 0 0 0 -1 -1
