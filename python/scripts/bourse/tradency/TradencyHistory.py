#!/usr/bin/env python
# -*- coding: utf8 -*-

#    Tradency Analyzer for History
#
#       But : ce script permet d'analyser les trades d'une stratégie utilisée
#       dans le système de trading automatique Tradency http://www.tradency.com/
#       utilisé par différents brokers sous le nom FXCM Forex System Selector, Alpari NZ Systematic ...
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

from TradencyAnalyzerClass import *
from UsefulClass import *
from numpy import * # variance

#  ###########################################
#  # parse HTML file        
#  ###########################################

datasource = open('History.html')
#myparser = HTMLTableParser(datasource)
#myparser.parse()
myparser = TradencyHistoryParser(datasource)
#myparser.print_data()

header = myparser.get_header()
data = myparser.get_data()

#print(data)
#for row in data:
#	print(row)
#print(header)

#  ###########################################
#  # convert list of list to list of objects
#  ###########################################

dataObj = []
for row in data:
    dataObj.append(TradencyHistory(header, row))


#  ###########################################
#  # display data (selected and sorted)
#  ###########################################
descending = True
criterion = 'Fermer Heure'
dataObjSorted = sorted(dataObj, key=lambda dataObj: dataObj.__dict__[criterion], reverse=not descending)

i = 1
NbTrades = len(dataObjSorted)
for row in dataObjSorted:
    print("=== {0}/{1} : {2}\t\t{3}\t{4}\t{5} ===".format(i, NbTrades, row.__dict__['Stratégie'], row.__dict__['A/V'], row.__dict__['Montant (k)'], row.__dict__['Symbole']))
    #print(row)
    row.display()
    print('')
    i = i + 1

#  ###########################################
#  # Calculate stats
#  ###########################################
t = []
pips = []
win = []
profit = []
DureeTotaleTrades = timedelta()
winTrades = 0
lostTrades = 0
winPips = 0
lostPips = 0
totalPips = 0
pipsMin = 0
IpipsMin = -1
pipsMax = 0
IpipsMax = -1
i = 1
lstPips = []
lstPipsWin = []
lstPipsLost = []
cum_H = []
cum_L = []

DOCHLV = [] # (date, open, close, high, low, volume)

for row in dataObj:
    t.append(row.__dict__['Fermer Heure'])
    pips.append(row.__dict__['Pips'])
    cum_H.append(row.__dict__['High/Low'][0])
    cum_L.append(row.__dict__['High/Low'][1])
    profit.append(row.__dict__['Profit'])
    
    DOCHLV.append((i, 0, row.__dict__['Pips'], row.__dict__['High/Low'][0], row.__dict__['High/Low'][1], 0))
    
    DureeTotaleTrades = DureeTotaleTrades + row.__dict__['Durée Trade']
    Pips = row.__dict__['Pips']
    lstPips.append(Pips)
    totalPips = totalPips + Pips
    if Pips >= 0:
        win.append(1)
        winTrades = winTrades + 1
        winPips = winPips + row.__dict__['Pips']
        lstPipsWin.append(row.__dict__['Pips'])
    else:
        win.append(0)
        lostTrades = lostTrades + 1
        lostPips = lostPips + row.__dict__['Pips']
        print(lostPips)
        lstPipsLost.append(row.__dict__['Pips'])
    if Pips > pipsMax:
        pipsMax = Pips
        IpipsMax = i
    if Pips < pipsMin:
        pipsMin = Pips
        IpipsMin = i
    i = i + 1
    	

totalPips = sum(lstPips) # cumul des pips
winTrades = len(lstPipsWin) # nb de trades gagnants
lostTrades = len(lstPipsLost) # nb de trades perdants
winPips = sum(lstPipsWin) # cumul pips gagnants
lostPips = sum(lstPipsLost) # cumul pips perdants

print("Nb total de trades = {0}".format(NbTrades))
print("Total pips = {0}".format(totalPips))
print("Pips moyen par trade = {0}".format(totalPips/NbTrades))
print("Trades gagnants\tNb = {0}/{1} ({2}%) ; Pips gagnés moy = {3}".format(winTrades, NbTrades, winTrades/NbTrades*100, winPips/winTrades))
print("Trades perdants\tNb = {0}/{1} ({2}%) ; Pips perdus moy = {3}".format(lostTrades, NbTrades, lostTrades/NbTrades*100, lostPips/lostTrades))
#print("Espérance (Pips) = {0}".format(winTrades/NbTrades * (winPips/winTrades) + lostTrades/NbTrades * (lostPips/lostTrades)))
#print("Durée totale des trades = {0}".format(DureeTotaleTrades))
print("Durée moyenne des trades = {0}".format(DureeTotaleTrades//NbTrades)) # tmdelta//n uniquement si n entier
print("Meilleur trade = {0} pips".format(pipsMax))
dataObj[IpipsMax].display()
print("Pire trade = {0} pips".format(pipsMin))
dataObj[IpipsMin].display()

print(lstPips)
print(lstPipsWin)

# indice de proximité de valeur en pips
#  0: trades avec des valeurs très différentes
#  1: trades avec des valeurs très proches (de la moy)
a = array(lstPipsWin)
print("Proximité de la moy des pips gagnants [0(loin) - 1(proche)] = {0}".format(1-2*a.std()/(a.max()))) # std=écart-type (standard deviation)

print(lstPipsLost)
a = array(lstPipsLost)
print("Proximité de la moy des pips perdants [0(loin) - 1(proche)] = {0}".format(1+2*a.std()/(a.min()))) # std=écart-type (standard deviation)

#bounds = [x for x in range(-100,101,10)]
#nb = inbound(bounds, lstPips, True, True)
#print(bounds)
#print(nb)
#for i in range(0,len(bounds)-1):
#    print("[{0};{1}[".format(bounds[i], bounds[i+1]))

# Graph pips&profit cumulé
cum_pips = cumulative_sum(pips)
cum_profit = cumulative_sum(profit)

#cum_win = cumulative_sum(win)
#pc_win = []
#for i in range(0, len(cum_win)):
#    pc_win.append(cum_win[i]/(i+1))
x = range(0,len(pips))

fig = figure()
fig.subplots_adjust(bottom=0.1)
ax = fig.add_subplot(311)
candlestick(ax, DOCHLV, width=0.6, colorup='g', colordown='r', alpha=1.0)
grid(True)
#plot(x, cum_H, 'g.', x, cum_L, 'r.', x, pips, 'b.')

#subplot(311)
#plot(x, cum_H, 'g.', x, cum_L, 'r.', x, pips, 'b.')
#title('pips')
#xlabel('date') #'trade #')
#ylabel('pips')
#grid(True)
subplot(312)
plot(t, cum_pips, 'b.', t, cum_pips, 'k--')
title('Accumulated pips')
xlabel('date') #'trade #')
ylabel('pips')
grid(True)
subplot(313)
plot(t, cum_profit, 'r.', t, cum_profit, 'k--')
#plot(t, pc_win, 'k--')
title('Accumulated profit')
xlabel('date') #'trade #')
ylabel('profit')
grid(True)
show()

#plot(t, pc_win)
#show()

#date1 = ( 2004, 2, 1)
#date2 = ( 2004, 4, 12 )
#quotes = quotes_historical_yahoo('INTC', date1, date2)
#print(quotes)