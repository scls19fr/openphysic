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


from pylab import figure, plot, show, grid, title, xlabel, ylabel, subplot, bar, np, xticks # plot
from matplotlib.finance import quotes_historical_yahoo, candlestick
from datetime import date, datetime, timedelta

import csv
#filename = 'data_EURUSD_15.csv'
filename = 'data_EURUSD_43200.csv'
dataReader = csv.reader(open(filename, 'rb'), delimiter=',')

i = 0
DOCHLV = []
for row in dataReader:
    #print ', '.join(row)
    if i<>0:
        date=datetime.strptime(row[0]+" "+row[1], '%Y.%m.%d %H:%M')
        #time = row[1].split(':')
        #date.hour = time[0]
        #date.hour = time[0]
        openP=float(row[2])
        lowP=float(row[3])
        highP=float(row[4])
        closeP=float(row[5])
        volume=int(row[6])
        RSI=float(row[7])
        #print(date)
        DOCHLV.append((i, openP, closeP, highP, lowP, volume))

    i = i + 1

fig = figure()
fig.subplots_adjust(bottom=0.1)
#ax = fig.add_subplot(311)
ax = fig.add_subplot(111)
candlestick(ax, DOCHLV, width=0.6, colorup='g', colordown='r', alpha=1.0)
show()
