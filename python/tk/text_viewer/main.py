#!/usr/bin/python

# Name     : Python/Tk Text Viewer
# Author   : Terrence Ma
# Email    : terrence@terrence.com
# Web      : http://www.terrence.com
# Date     : 09/01/2001
# License  : GNU GPL - http://www.gnu.org/copyleft/gpl.html
# Warranty : No Warranty

# import lib
import os
from Tkinter import *

# procedure get file
def getfile(filename):
  filehandle   = open(filename, "r")
  filecontents = filehandle.read()
  textview.delete("1.0", "end")
  textview.insert("end", filecontents)
  filehandle.close()

# set top window
top = Tk()

# set widgets
# configure textview(yscrollcommand) at the end to avoid lookahead error
# no "" in (*command = "") to avoid error
textview   = Text(top, bg = "white")
scrollview = Scrollbar(top, command = textview.yview)

# check argument, get filename
# check filename, see Learning Python p.254
if ((len(sys.argv) == 2) and (sys.argv[1] in os.listdir(os.curdir))):
  top.title("Python/Tk Text Viewer")
  textview.pack(side = "left")
  scrollview.pack(side = "right", fill = "y")
  textview.configure(yscrollcommand = scrollview.set)
  getfile(sys.argv[1])
  top.mainloop()

else:
  print "Usage: viewer.py filename"
