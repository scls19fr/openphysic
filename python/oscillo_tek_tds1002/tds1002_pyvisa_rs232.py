#!/usr/bin/env python
from visa import *
hw = instrument("COM1")
hw.write("*IDN?") # no \n
print hw.read()
hw.close()
