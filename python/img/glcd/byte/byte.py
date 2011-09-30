#!/usr/bin/env python

def int2bin(n, count=8):
  """returns the binary of integer n, using count number of digits"""
  return "".join([str((n >> y) & 1) for y in range(count-1, -1, -1)])

print "Dec \t Hex \t Bin"
for i in range(0, 2**8):
  iDec = "%#3i" % i
  
  iHex = "0x%02X" % i
  
  sbin = int2bin(i)# "00000000"
  iBin = "%s %s" % (sbin[0:4], sbin[4:8]) # "0000 0000"
  
  print "%s\t%s\t%s" % (iDec, iHex, iBin)
