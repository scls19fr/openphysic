#!/usr/bin/env python
# -*- coding: utf8 -*-

"""
    ZuluTrade Analyzer for History of a signal provider (strategy)

       But : ce script permet d'analyser les trades effectués
       dans le système de trading automatique ZuluTrade http://www.zulutrade.com/
       pour 1 signal provider donné

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
#  # Parse XLS (XML) file        
#  ###########################################

from BeautifulSoup import BeautifulSoup

filename = 'Zulutrade_Forex_Cruise_Control_Performance_2011-06-15.xls'
#filename = 'Zulutrade_BBSqueeze_Performance_2011-06-13.xls'
#filename = 'Zulutrade_SenshFX-(R-System)_Performance_2011-06-13.xls'
#filename = 'Zulutrade_MayfairSwing_Performance_2011-06-14.xls'
myparser = ZuluTradeHistoryParser(filename)

header = myparser.get_header()
data = myparser.get_data()
#print(header)
#print(data)
#print(header)

#  ###########################################
#  # convert list of list to list of objects
#  ###########################################

dataObj = []
for row in data:
    myHistory = ZuluTradeHistory(header, row)
    dataObj.append(myHistory)

#i = 1
#for row in dataObj:
    #print("Fournisseur {0}".format(row['Stratégie']))
#    row.display()
#    print("-"*10)
#    i = i + 1
   

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
        if row.__dict__['Fermer Heure']>=datetime(year=2010, month=10, day=1) and row.__dict__['Fermer Heure']>=datetime(year=2010, month=12, day=1):
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
lstPips = []
lstProfit = []
pipsTot = 0
profitTot = 0
bilanStrateg = dict()
lstPipsHaut = []
lstPipsBas = []
DOCHLV = []
DureeTotaleTrades = timedelta()

#for row in dataObjSorted:

for row in dataObjSorted:
    SL = 200
    LIMIT = 0
    
    if SL == 0:
        strSL = "No Stop Loss"
    else:
        strSL = "SL={0}".format(SL)
    row.apply_stop_loss(SL)
    
    if LIMIT == 0:
        strLIMIT = "No Limit"
    else:
        strLIMIT = "LIMIT={0}".format(LIMIT)
    row.apply_take_profit(LIMIT)
    

    row.__dict__['Stratégie'] = filename
    t.append(row.__dict__['Fermer Heure'])
    lstPips.append(row.__dict__['Pips'])
    lstProfit.append(row.__dict__['Profit'])
    lstPipsHaut.append(row.__dict__['Haut'])
    lstPipsBas.append(row.__dict__['Bas'])
    DOCHLV.append((i, 0, row.__dict__['Pips'], row.__dict__['Haut'], row.__dict__['Bas'], 0))
    DureeTotaleTrades = DureeTotaleTrades + row.__dict__['Durée Trade']
    
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

print("="*20)

#print(bilanStrateg)

print("Bilan {0} \t\t Pips total = {1}".format(key, bilanStrateg[key]['Pips total']))
for key2 in bilanStrateg[key]:
    print("\t{0} = {1}".format(key2, bilanStrateg[key][key2]))
    #lstBilanStrateg.append([key, bilanStrateg[key]])
    #lstBilanStrateg.append({'Stratégie (Symbole)'=key, 'Pips total'=bilanStrateg[key]})

print(strSL + " - " + strLIMIT)

print("="*20)

#print("Pips total = {0}".format(pipsTot))
#print("Profit total = {0}".format(profitTot))
#lstPips = myparser.getAll('Pips')
PipsMin = min(lstPips)
PipsMax = max(lstPips)
print("Pips Min = {0}".format(PipsMin))
print("Pips Max = {0}".format(PipsMax))
#lstPipsHaut = myparser.getAll('Haut')
PipsHautMax = max(lstPipsHaut)
#lstPipsBas = myparser.getAll('Bas')
PipsBasMin = min(lstPipsBas)
print("Pips Haut Max = {0}".format(PipsHautMax))
print("Pips Bas Min = {0}".format(PipsBasMin))
stat=get_pips_stat(lstPips)
for key in stat:
    print("\t{0} = {1}".format(key,stat[key]))
print("="*20)


# Graph pips&profit cumulé
cum_pips = cumulative_sum(lstPips)
cum_profit = cumulative_sum(lstProfit)
x = range(0,len(lstPips))
fig = figure()
fig.subplots_adjust(bottom=0.1)
ax = fig.add_subplot(311)
candlestick(ax, DOCHLV, width=0.6, colorup='g', colordown='r', alpha=1.0)
# ToDo : ajouter lignes avec pips moyen / trade ; pipsWin moy ; pipLost moy
grid(True)
#plot(x, lstHaut, 'g.', x, lstBas, 'r.', x, lstPips, 'b.')
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
