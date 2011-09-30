#!/usr/bin/env python
# -*- coding: latin1 -*-
# -*- compile-command: "python fieldeb.py" -*-

from wxPython.wx import *

from fieldeb_charge import * # define an draw a charge "Charge"
from fieldeb_vector import * # define and draw vectors
from fieldeb_grain import * # define and draw grains
from fieldeb_grid import * # define and draw Grid
from fieldeb_colour import * # color scale
from fieldeb_window_main import *


app = wxPySimpleApp()
frame = MainWindow(None, -1, "fieldEB... an electrostatic and magnetostatic simulator")
frame.Show(1)    # lauch __init__ and OnPaint
app.MainLoop()
