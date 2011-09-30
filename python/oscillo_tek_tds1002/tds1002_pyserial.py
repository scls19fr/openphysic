#!/usr/bin/env python

# Communication serie avec
# Oscilloscope Tektronix TDS 1002
# Sebastien CELLES

# L'oscillo est branche sur le port serie COM1
# necessite
#  Python
#  pySerial (pyWin32 ?)

import serial

# Initial serial port setting
port  = "com1"   # Default serial port
baudrate = 9600
echo = 0
rtscts = 0
xonxoff = 0
repr_mode = 1

# buffer
buff_size = 64

print s.portstr       #check which port was realy used
s = serial.Serial(port, baudrate, rtscts=rtscts, xonxoff=xonxoff, timeout=1)

s.write("*IDN?\n")      #write a string on the oscillo

buff = s.read(buff_size) #read a string from the oscillo
print buff

# it should show
# TEKTRONIX,TDS 1002,0,CF:91.1CT FV:v2.06 TDS2CM:CMV

s.close()
