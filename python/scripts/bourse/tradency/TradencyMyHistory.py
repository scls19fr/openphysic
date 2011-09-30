#!/usr/bin/env python
# -*- coding: utf8 -*-

#    Tradency Analyzer for MyHistory
#
#       But : ce script permet d'analyser les trades effectués sur le compte
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

#  ###########################################
#  # parse HTML file        
#  ###########################################

datasource = open('MyHistory.html')
myparser = TradencyMyHistoryParser(datasource)

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
    myHistory = TradencyHistory(header, row)
    dataObj.append(myHistory)


#  ###########################################
#  # filter by date
#  ###########################################


#  ###########################################
#  # display data (selected and sorted)
#  ###########################################
descending = True
criterion = 'Fermer Heure'
dataObjSorted = sorted(dataObj, key=lambda dataObj: dataObj.__dict__[criterion], reverse=not descending)


i = 1
t = []
pips = []
profit = []
pipsTot = 0
profitTot = 0
bilanStrateg = dict()

for row in dataObjSorted:
    t.append(row.__dict__['Fermer Heure'])
    pips.append(row.__dict__['Pips'])
    profit.append(row.__dict__['Profit'])
    
    print("=== Trade {0}/{1} : {2} ({3})===".format(i, len(dataObj), row.__dict__['Stratégie'], row.__dict__['Symbole']))
    row.display()
    i = i + 1
    pipsTot = pipsTot + row.__dict__['Pips']
    profitTot = profitTot + row.__dict__['Profit']

    key = row.__dict__['Stratégie']+' ('+row.__dict__['Symbole']+')' # cumul par stratégie(symbole)
    try:
        #bilanStrateg[key] = bilanStrateg[key] + row.__dict__['Pips']
        bilanStrateg[key]['Pips total'] = bilanStrateg[key]['Pips total'] + row.__dict__['Pips']
        bilanStrateg[key]['Profit total'] = bilanStrateg[key]['Profit total'] + row.__dict__['Profit']
        bilanStrateg[key]['Nb Trades'] = bilanStrateg[key]['Nb Trades'] + 1
        bilanStrateg[key]['Montant (k) total'] = bilanStrateg[key]['Montant (k) total'] + row.__dict__['Montant (k)']
        bilanStrateg[key]['Durée Trade total'] = bilanStrateg[key]['Durée Trade total'] + row.__dict__['Durée Trade']

        bilanStrateg[key]['Pips moyen / trade'] = bilanStrateg[key]['Pips total']/bilanStrateg[key]['Nb Trades']
        bilanStrateg[key]['Profit moyen / trade'] = bilanStrateg[key]['Profit total']/bilanStrateg[key]['Nb Trades']
        bilanStrateg[key]['Durée moyen / trade'] = bilanStrateg[key]['Durée Trade total']//bilanStrateg[key]['Nb Trades'] # // is not a bug... deltatime/integer
        bilanStrateg[key]['Montant (k) moyen'] = bilanStrateg[key]['Montant (k) total']/bilanStrateg[key]['Nb Trades']

        bilanStrateg[key]['Date/Heure Dernier Trade'] = row.__dict__['Fermer Heure']
		
    except:
        #bilanStrateg[key] = row.__dict__['Pips']
        bilanStrateg[key] = dict()
        bilanStrateg[key]['Stratégie'] = row.__dict__['Stratégie']
        bilanStrateg[key]['Symbole'] = row.__dict__['Symbole']
        bilanStrateg[key]['Nb Trades'] = 1
        bilanStrateg[key]['Pips total'] = row.__dict__['Pips']
        bilanStrateg[key]['Profit total'] = row.__dict__['Profit']
        bilanStrateg[key]['Montant (k) total'] = row.__dict__['Montant (k)']
        bilanStrateg[key]['Durée Trade total'] = row.__dict__['Durée Trade']
        bilanStrateg[key]['Date/Heure Premier Trade'] = row.__dict__['Ouvrir Heure']

print("="*20)

#print(bilanStrateg)

#lstBilanStrateg = [] # to sort bilan
#for key in bilanStrateg:
#    print("Bilan {0} \t\t Pips total = {1}".format(key, bilanStrateg[key]['Pips total']))
#    for key2 in bilanStrateg[key]:
#        print("\t{0} = {1}".format(key2, bilanStrateg[key][key2]))
#	#lstBilanStrateg.append([key, bilanStrateg[key]])
##	lstBilanStrateg.append({'Stratégie (Symbole)'=key, 'Pips total'=bilanStrateg[key]})


print("="*20)

print("Pips total = {0}".format(pipsTot))
print("Profit total = {0}".format(profitTot))

print("="*20)


#v=bilanStrateg.items()
#lstBilanStrateg = sorted(bilanStrateg.items())
lstBilanStrateg = sorted(bilanStrateg.items(), key=lambda lstBilanStrateg: lstBilanStrateg[1]['Pips total'])
#dataObjSorted = sorted(dataObjSelected, key=lambda dataObjSelected: dataObjSelected.__dict__[criterion], reverse=not descending)

strategies = []
cum_pips_s = []
for key in lstBilanStrateg:
    strStrategie = "{0} ({1})".format(key[1]['Stratégie'],key[1]['Symbole'])
    strategies.append(strStrategie)
    NbC = 20
    strStrategie = strStrategie[0:NbC].ljust(NbC, ' ')
    strPipsTotal = key[1]['Pips total']
    cum_pips_s.append(strPipsTotal)
    # ToDo : align decimal points
    #if strPipsTotal<0:
    #    strPipsTotal = str(strPipsTotal).zfill(5)
    #else:
    #    strPipsTotal = str(strPipsTotal).zfill(6)
    
    print("Bilan {0} ({1}) \t Pips total = {2}".format(strStrategie, key[1]['Symbole'], strPipsTotal))
    for key2 in key[1]:
        print("\t{0} = {1}".format(key2, key[1][key2]))

# Graph pips&profit cumulé
cum_pips = cumulative_sum(pips)
cum_profit = cumulative_sum(profit)
x = range(0,len(pips))
subplot(211)
plot(t, cum_pips, 'b.', t, cum_pips, 'k--')
title('Accumulated pips')
xlabel('date') #'trade #')
ylabel('pips')
grid(True)
subplot(212)
plot(t, cum_profit, 'r.', t, cum_profit, 'k--')
title('Accumulated profit')
xlabel('date') #'trade #')
ylabel('profit')
grid(True)
show()

# Bargraph pips cumulé par stratégie
fig = figure()
fig.subplots_adjust(bottom=0.3)
N = len(strategies)
ind = np.arange(N)  # the x locations for the groups
width = 0.5       # the width of the bars
bar(ind+width/2, cum_pips_s, width)
xticks(ind+width, strategies, rotation=-90 )
title('Accumulated pips by each strategy')
xlabel('strategies')
ylabel('pips')
grid(True)
show()

#print(lstBilanStrateg)
#print(items[1])