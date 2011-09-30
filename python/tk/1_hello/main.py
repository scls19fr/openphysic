#! /usr/bin/env python
# Premier programme avec interface graphique Tkinter
# File: hello1.py

from Tkinter import *

root = Tk()

w = Label(root, text="Hello, world!")
w.pack()

root.mainloop()
