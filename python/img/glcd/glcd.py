#!/usr/bin/env python
# -*- coding: utf8 -*-

# =====================================================================
# = convert a picture to data for T6963 or KS0108B graphic controller =
# =====================================================================
# = Sebastien Celles                                                  =
# = 2010/04/16                                                        =
# =====================================================================
# = using Python Imaging Library (PIL)                                =
# =  http://www.pythonware.com/products/pil/                          =
# =  http://www.pythonware.com/library/pil/handbook/index.htm         =
# =====================================================================

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

import Image
import sys
from datetime import datetime

from gcontroller import *

from writer import Writer
from writer_c import Writer_C
from writer_asm import Writer_ASM

from optparse import OptionParser

#def usage():
#	print("""Usage: glcd.py [options] arg1""")

def main():
	parser = OptionParser("usage: %prog picture [options]")

 	parser.add_option("-o", "--out", dest="output",
		default="", type="string",
		help="specify output filename")

 	parser.add_option("-g", "--gc", dest="gc",
		default="T6963", type="string",
		help="specify graphic controller (T6963, KS0108B)")

 	parser.add_option("-l", "--lang", dest="lang",
		default="DEFAULT", type="string",
		help="specify language (DEFAULT, C, ASM)")

 	parser.add_option("-B", "--bytesperline", dest="bytesperline",
		default=4, type="int",
		help="specify number of bytes per line")

	(options, args) = parser.parse_args()
	
	if len(args) != 1: #and len(args) != 0:
		parser.error("incorrect number of arguments")

	input = args[0]

	if options.output<>"":
		output = options.output
		f = open(output, 'w')
	else:
		output = "sys.stdout"
		f = sys.stdout
	
	gc = GController(options.gc)
	#gc = GController("T6963")
	#gc = GController("KS0108B")
	
	#gc.origin('TL')
	
	gc.display()

	im = Image.open(input)

	#im.show()
	data = list(im.getdata())
	#print data
	#print im.getpixel((239,127)) 

	w = im.size[0] # get image width
	h = im.size[1] # get image height
	px_nb = w * h # len(data)

	print """Input
	Filename: %s
	Format: %s
	Size: %s
	Mode: %s

Output
	Filename: %s
""" %  (input, im.format, im.size, im.mode, output)
	
	#i=0
	#for d in data:
	#  i=i+1
	  #mean = (d[0]+d[1]+d[2])/3.0 # si RGB
	#  mean = d # 
	#  print "%i : %s : %i" % (i, d, mean)
  
	  #if mean == 0:
	  #	pass
	    #print "%i : %s : false" % (i, d)
	  #else:
	  #  print "%i : %s : true" % (i, d)
	
	writer_params = {
		'output': output,
		'input': input,
		'format': im.format,
		'size': im.size,
		'mode': im.mode,
		'now': datetime.now(),
		'gcontroller': gc.name,
		'dsize': px_nb/gc.pixelsperbyte, 
	}
	
	if options.lang.upper()=="C":
		my_writer = Writer_C(f, writer_params)
	elif options.lang.upper()=="ASM":
		my_writer = Writer_ASM(f, writer_params)
	else: # DEFAULT
		my_writer = Writer(f, writer_params)

	my_writer.set_bytesperline(options.bytesperline)

	my_writer.header()


	if gc.name == "T6963":
		for i in range(0, px_nb/gc.pixelsperbyte):
			byte = 0
			for bit in range(0, gc.pixelsperbyte):
				offset = i*gc.pixelsperbyte
				if gc.msb.is_first: # msb_first
					px = offset + gc.pixelsperbyte - 1 - bit
				else:
					px = offset + bit
				byte = byte + data[px]*2**bit
			my_writer.append(byte)

	elif gc.name == "KS0108B":
		for i in range(0, h/gc.pixelsperbyte):
			for j in range(0, w):
				pixel = (j, i*gc.pixelsperbyte) # x, y
				byte = 0
				for bit in range(0, gc.pixelsperbyte):
					if gc.msb.is_first: # msb_first
						byte = byte + im.getpixel((pixel[0], pixel[1]+gc.pixelsperbyte - 1 - bit))*2**bit
					else:
						byte = byte + im.getpixel((pixel[0], pixel[1]+bit))*2**bit
				my_writer.append(byte)

	else:
		msg = 'Unsupported graphic controller'
		print msg
		#usage()
		exit
		#raise Exception, msg
		

	# End Of File
	
	my_writer.footer()
	
	my_writer.__del__()


if __name__ == "__main__":
    main()
