#!/usr/bin/env python

from xml.dom.minidom import *
import base64

#filename = 'GTE1.htm'
#fd = open(filename, 'r')

fd = open('base64.txt', 'r')
fd_out = open('out.gif', 'wb')

b64encoded = bytes(fd.read(), encoding='iso-8859-1')
decoded = base64.b64decode(b64encoded)

fd_out.write(decoded)
#print(decoded)

fd.close()
fd_out.close()
