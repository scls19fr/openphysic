#!/usr/bin/env python
# -*- coding: utf8 -*-

#    Useful class test
#
#       But : ce fichier définit diverses fonctions pratiques
#
#    Copyright (C) 2011  "Sébastien CELLES" <s.celles@gmail.com>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>

from UsefulClass import *
from pylab import *
#import numpy
#print numpy.__file__

bounds = [1, 2, 3, 4]
vals = [0.5, 1.4, 1.5, 2.1, 2.3, 2.5, 3.1, 3.1, 4.1]
nb = inbound(bounds, vals, True, True)
print(vals)
print(bounds)
print(nb)

pips = [10, 20, 30, 40, -30, 10, -100, 50]
cum_pips = cumulative_sum(pips)
print(pips)
print(cum_pips)
x = range(0,len(pips))
print(x)
plot(x,cum_pips)
show()
# ToDo : ajouter couleur de tracé vert ou rouge si cum_pips augmente ou descend
# ToDo : ajouter couleur de remplissage vert ou rouge si cum_pips>0 ou <0

strategies = ['s1', 's2', 's3', 's4']
cum_pips_s = [10, 20, -10, 40]
N = len(strategies)
ind = np.arange(N)  # the x locations for the groups
width = 0.5       # the width of the bars
bar(ind+width/2, cum_pips_s, width)
xticks(ind+width, strategies )
show()


#Repartition en % paires -> camembert
labels = 'EURUSD', 'EURGBP', 'USDJPY', 'USDAUD'
fracs = [30,15,5, 10]
pie(fracs, explode=None, labels=labels, autopct='%1.2f%%', shadow=True)
title('Repartition', bbox={'facecolor':'0.8', 'pad':5})

show()
