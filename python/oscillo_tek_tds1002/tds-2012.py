#!/usr/bin/python

# tds-2012.py
# version 0.1 -- 27 Jan 2004
#
# Plot display of Tektronix TDS-2012 (or other TDS-10xx or TDS-20xx DSO)
#
# Copyright 2004 by John R. Ackermann  N8UR (jra@febo.com)
# Licensed under the GPL version 2 or later; see the file COPYING
# included with this distribution.  I request, but do not require, that
# any modifications that correct bugs or errors, or increase the program's
# functionality, be sent via email to the author at the address above.
#
# Current status:
# Version 0.1 -- first version, and first ever Python program.  Note that
#   binary read requires updated linux-gpib python bindings (post version
#   3.1.99).  If you don't have that version, you can convert to use an
#   ASCII data read as commented below.  Assumes that "scope" is defined 
#   in /etc/gpib.conf.

# http://www.febo.com/geekworks/data-capture/tds-2012.html

from Gpib import *
from matplotlib.matlab import *
from string import *
from time import *
from struct import *

# how long to sleep after issuing a write
sleeptime = 0.01

# set up GPIB comms and clear device
scope = gpib.find('scope')
gpib.clear(scope)

# set SRQ operation
gpib.write(scope,'DESE 1')
gpib.write(scope,'*ESE 1')
gpib.write(scope,'*SRE 32')

# turn off response headers and set waveform output to default binary
# it seems like these need to be sent separately and not concatenated
gpib.write(scope,'head 0')

# for ASCII dump, send 'dat ASCII' instead
gpib.write(scope,'dat INIT')
sleep(sleeptime)

# get instrument settings
gpib.write(scope,'ch1:scale?')
sleep(sleeptime)
voltsdiv = float(gpib.read(scope,80))
if voltsdiv >= 1:
	volt_string = '%i V / div' % (voltsdiv)
else:
	volt_string = '%i mv / div' % (voltsdiv * 1000)

gpib.write(scope,'hor:mai:sca?')
sleep(sleeptime)
tmp = float(gpib.read(scope,80))
rawsweep = tmp
if tmp >= 1:
	sweep_val = tmp
	sweep_suf = "S"
if tmp < 1:
	sweep_val = tmp * 10e2
	sweep_suf = "mS"
	if tmp < 0.001:
		sweep_val = tmp * 10e5
		sweep_suf = "uS"
		if tmp < 0.000001:
			sweep_val = tmp * 10e8
			sweep_suf = "nS"
sweep_val = '%.f' % sweep_val
sweep_string = sweep_val + ' ' + (sweep_suf) + " / div"

# acquire
gpib.write(scope,'acquire:state on')
sleep(sleeptime)

# get the waveform preamble
gpib.write(scope,'wfmpre?')
sleep(sleeptime)
tmp = gpib.read(scope,256)
preamble = split(tmp,';')
# number of points in trace
points = int(preamble[5])
# volts per bit (-127 to +128)
voltsbit = float(preamble[12])

# get the curve
gpib.write(scope,'curv?')
sleep(sleeptime)

# binary data read and convert to list
tmp = gpib.readbin(scope,4096)

# for ASCII read, use 'gpib.read(scope,16384)' instead of the above, and 
# delete the next two lines.  You'll need to use 'split' to convert the 
# comma-delimited values returned in 'tmp' to a list of values called
# 'tmplist', and you may need to adjust the offsets used in the 'for' loop 
# to end up with the proper number of points

formatstring = '%ib' % (len(tmp))
tmplist = unpack(formatstring,tmp)

trace = []
# there's a newline at the end of the data, thus the strange slice
for x in tmplist[len(tmplist)-points-1:-1]:
	trace.append(int(x)*voltsbit)

# get some measurements, just for fun
tmp = 9.9E37
gpib.write(scope,'measu:imm:typ PK2;:measu:imm:sou CH1')
sleep(sleeptime)
gpib.write(scope,'measu:imm:val?')
sleep(sleeptime)
tmp = float(gpib.read(scope,80))
if tmp != 9.9E37:
	peak_string = 'Pk-Pk: %.3f V' % (tmp)
else: peak_string = ''

gpib.write(scope,'measu:imm:typ MEAN;:measu:imm:sou CH1')
sleep(sleeptime)
gpib.write(scope,'measu:imm:val?')
tmp = float(gpib.read(scope,80))
if tmp != 9.9E37:
	mean_string = 'Mean: %.3f V' % (tmp)
else: mean_string = ''

gpib.write(scope,'measu:imm:typ PERI;:measu:imm:sou CH1')
sleep(sleeptime)
gpib.write(scope,'measu:imm:val?')
tmp = float(gpib.read(scope,80))
if tmp >= 1:
	period_val = tmp
	period_suf = "S"
if tmp < 1:
	period_val = tmp * 10e2
	period_suf = "mS"
	if tmp < 0.001:
		sweep_val = tmp * 10e5
		sweep_suf = "uS"
		if tmp < 0.000001:
			period_val = tmp * 10e8
			period_suf = "nS"
if tmp != 9.9E37:
	period_string = 'Period: %.3f' % (period_val) + ' ' + period_suf
else: period_string = ''

gpib.write(scope,'measu:imm:typ FREQ;:measu:imm:sou CH1')
sleep(sleeptime)
gpib.write(scope,'measu:imm:val?')
tmp = float(gpib.read(scope,80))
if tmp < 1e3:
	freq_val = tmp
	freq_suf = "Hz"
if tmp < 1e6:
	freq_val = tmp / 10e2
	freq_suf = "kHz"
if tmp >= 1e6:
	freq_val = tmp / 10e5
	freq_suf = "MHz"

if tmp != 9.9E37:
	freq_string = 'Freq: %.3f' % (freq_val) + ' ' + freq_suf
else: freq_string = ''

# plot
plot(trace)
axis([0,points,-5*voltsdiv,5*voltsdiv])
xlabel(sweep_string)
ylabel(volt_string)
set(gca(), 'xticklabels', [])
if not gca().is_first_col():
	set(gca(), 'yticklabels', [])
if not gca().is_last_row():
	set(gca(), 'xticklabels', [])
grid(1)

text(0.03*points,-4.9*voltsdiv, peak_string)
text(0.03*points,-4.4*voltsdiv, mean_string)
text(0.72*points,-4.93*voltsdiv, freq_string)
text(0.72*points,-4.4*voltsdiv, period_string)

show()
