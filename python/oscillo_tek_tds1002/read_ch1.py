#!/usr/bin/env python

import numpy
from pylab import *
from visa import *
from string import * # split string

hw = instrument("ASRL1")
#hw = instrument("COM1")

# Clear status
hw.write("*CLS")

# Identification
hw.write("*IDN?") # no \n
print hw.read()

# Short ident
#hw.write("ID?")
#print hw.read()

# Acquire Mode
hw.write("ACQuire:MODe AVErage")
#print hw.read()

#hw.write("ACQuire:MODe?")         
#print hw.read()

#
#hw.write("ACQuire:STATE STOP")

#hw.write("ACQuire:STATE RUN")
#hw.write("AUTOSet EXECute")

#hw.write("acquire:stopafter sequence")
#hw.write("acquire:state on")
#hw.write("*opc?")

hw.write("CH1:SCA?")
scale1 = hw.read()
#print scale1

hw.write("data:encdg ascii")
hw.write("curve?")

#raw_data = ''

tmp1_data = hw.read()
tmp2_data = hw.read()
raw_data = tmp1_data + tmp2_data
data = split(raw_data, ',')

plot(data)
show()

# Close hardware
#hw.close()
