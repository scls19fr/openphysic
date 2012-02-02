#!/usr/bin/env python
# -*- coding: utf8 -*-

#    Draw data
#
#       But : ce script permet de visualiser avec Python des cours
#    Copyright (C) 2012  "Sébastien CELLES" <s.celles@gmail.com>
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


from pylab import *
import csv

filename = 'FindLevels_43200.csv'
dataReader = csv.reader(open(filename, 'rb'), delimiter=',')

i = 0

prices = []
numbars = []
for row in dataReader:
    #print ', '.join(row)
    if i<>0:
        prices.append(float(row[0]))
        numbars.append(int(row[1]))

    i = i + 1


plot(numbars,prices)
show()
