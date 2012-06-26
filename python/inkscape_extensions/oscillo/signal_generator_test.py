#!/usr/bin/env python

'''
Copyright 2012 Sebastien Celles <s.celles@gmail.com>

This file is part of Oscillo Extension for Inkscape.

Oscillo Extension for Inkscape is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

Oscillo Extension for Inkscape is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with Oscillo Extension for Inkscape. If not, see http://www.gnu.org/licenses/.
'''

from signal_generator import *


# Execute la fonction "effect" de la classe "CHello"
siggen = CSignalGenerator()

#print(siggen)
siggen.display()

#print(siggen.getPeriod())

#t = arange(0.0, 2.0, 0.01)
#s = sin(2*pi*t)
#s = siggen.getSignal(t)
#plot(t, s, linewidth=1.0)

#xlabel('time (s)')
#ylabel('voltage (V)')
#title('About as simple as it gets, folks')
#grid(True)
#show()