#!/usr/bin/env python
# -*- coding: utf8 -*-

"""
    ZuluTrade Analyzer for My History

       But : ce script permet d'analyser les trades effectués
       dans le système de trading automatique ZuluTrade http://www.zulutrade.com/
       selon les signaux envoyés par divers providers

    Copyright (C) 2011  "Sébastien CELLES" <s.celles@gmail.com>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>
"""

from ZuluTradeAnalyzerClass import *

#  ###########################################
#  # Parse HTML file        
#  ###########################################

#filename = 'ZuluTrade-TradeHistory.html' # v1 05/2011
filename = 'ZuluTrade-TradeHistory-latest.xls' #v2 12/06/2011
myparser = ZuluTradeMyHistoryParser(filename)

header = myparser.get_header()
data = myparser.get_data()


#print(myparser.MoveFirst)
#print(myparser.MoveNext)
#print(myparser.EOF)
#print(myparser.get('Profit', 2)) #
#print(myparser.getAll('Fournisseur'))
#print(myparser.getAll('Profit', 0)) # liste des profits en pips

#  ###########################################
#  # convert list of list to list of objects
#  ###########################################

dataObj = []
for row in data:
    myHistory = ZuluTradeMyHistory(header, row)
    dataObj.append(myHistory)

#for row in dataObj:
    #print("Fournisseur {0}".format(row['Stratégie']))
#    row.display()
#    print("-"*10)


#  ###########################################
#  # filter by date
#  ###########################################
filter = False
if filter:
    dataObjSelected = []
    for row in dataObj:
        #if row.__dict__['Stratégie']=='FOREXTECHNO - [EURUSD_LT]':
        #if row.__dict__['Stratégie'].find('FOREXTEC')!=-1:
        #if row.__dict__['Fermer Heure']>=datetime(year=2011, month=5, day=1):
        if row.__dict__['Fermer Heure']>=datetime(year=2011, month=5, day=20):
        #dtref = datetime.now()
        #dtref = datetime(year=2011, month=5, day=30)
        #if dtref-row.__dict__['Fermer Heure'] <= timedelta(days=10):
            dataObjSelected.append(row)
else:
    dataObjSelected = dataObj

#  ###########################################
#  # display data (selected and sorted)
#  ###########################################
descending = True
criterion = 'Fermer Heure'
dataObjSorted = sorted(dataObjSelected, key=lambda dataObjSelected: dataObjSelected.__dict__[criterion], reverse=not descending)


i = 1
t = []
pips = []
profit = []
pipsTot = 0
profitTot = 0
bilanStrateg = dict()
cum_H = []
cum_L = []
DOCHLV = []

for row in dataObjSorted:
    t.append(row.__dict__['Fermer Heure'])
    pips.append(row.__dict__['Pips'])
    profit.append(row.__dict__['Profit'])
    cum_H.append(row.__dict__['Haut'])
    cum_L.append(row.__dict__['Bas'])
    DOCHLV.append((i, 0, row.__dict__['Pips'], row.__dict__['Haut'], row.__dict__['Bas'], 0))
    
    print("=== Trade {0}/{1}/{2} : {3} ({4})===".format(i, len(dataObjSorted), len(dataObj), row.__dict__['Stratégie'], row.__dict__['Symbole']))
    row.display()
    i = i + 1
    pipsTot = pipsTot + row.__dict__['Pips']
    profitTot = profitTot + row.__dict__['Profit']

    #key = row.__dict__['Stratégie']+' ('+row.__dict__['Symbole']+')' # cumul par stratégie(symbole)
    key = row.__dict__['Stratégie'] # cumul par fournisseur
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

#print("="*20)

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


# Classement des stratégies
lstBilanStrateg = sorted(bilanStrateg.items(), key=lambda lstBilanStrateg: lstBilanStrateg[1]['Pips total'])
#lstBilanStrateg = sorted(bilanStrateg.items(), key=lambda lstBilanStrateg: lstBilanStrateg[1]['Profit total'])

strategies = []
cum_pips_s = []
cum_profits_s = []
for key in lstBilanStrateg:
    strStrategie = "{0} ({1})".format(key[1]['Stratégie'],'*')
    strategies.append(strStrategie)
    NbC = 20
    strStrategie = strStrategie[0:NbC].ljust(NbC, ' ')
    strPipsTotal = key[1]['Pips total']
    cum_pips_s.append(strPipsTotal)
    cum_profits_s.append(key[1]['Profit total'])
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
fig = figure()
fig.subplots_adjust(bottom=0.1)
ax = fig.add_subplot(311)
candlestick(ax, DOCHLV, width=0.6, colorup='g', colordown='r', alpha=1.0)
grid(True)
#plot(x, cum_H, 'g.', x, cum_L, 'r.', x, pips, 'b.')
subplot(312)
plot(t, cum_pips, 'b.', t, cum_pips, 'k--')
title('Accumulated pips')
xlabel('date') #'trade #')
ylabel('pips')
grid(True)
subplot(313)
plot(t, cum_profit, 'r.', t, cum_profit, 'k--')
title('Accumulated profit')
xlabel('date') #'trade #')
ylabel('profit')
grid(True)
show()

# Bargraph pips cumulé par stratégie
fig = figure()
fig.subplots_adjust(bottom=0.3)
subplot(211)
N = len(strategies)
empty_strategies=["" for i in range(0,N+1)]
ind = np.arange(N)  # the x locations for the groups
width = 0.5       # the width of the bars
bar(ind+width/2, cum_pips_s, width)
xticks(ind+width, [], rotation=-90 )
title('Accumulated pips by each strategy')
#xlabel('strategies')
ylabel('pips')
grid(True)
subplot(212)
bar(ind+width/2, cum_profits_s, width)
xticks(ind+width, strategies, rotation=-90 )
title('Accumulated profits by each strategy')
xlabel('strategies')
ylabel('profits')
grid(True)
show()

#print(lstBilanStrateg)
#print(items[1])