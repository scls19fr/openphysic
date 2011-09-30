#!/usr/bin/env python
# -*- coding: utf8 -*-

#    Tradency analyzer for Performance
#
#       But : ce script permet d'analyser les performances de diverses stratégies utilisées
#       dans le système de trading automatique Tradency http://www.tradency.com/
#       utilisé par différents brokers sous le nom FXCM Forex System Selector, Alpari NZ Systematic ...
#
#       Technique : exportez depuis l'interface de Tradency le fichier Excel contenant les performances
#       (en réalité ça n'est pas un fichier Excel mais c'est un fichier HTML qui contient un tableau)
#       copiez ce fichier sous le nom TradencyPerformance.html
#       lancez le script via $ python3 TradencyPerformance.py
#       modifiez-le afin qu'il vous convienne en ajoutant des critères complémentaires
#       aucune garantie n'est apportée quand à l'utilisation de ce script
#       c'est vous qui tradez et qui devez respecter un money management !
#       pensez à observer l'historique de trading d'une stratégie afin de vraiment vous assurer
#       qu'elle vous aurait convenu (en espérant qu'elle vous convienne par la suite)
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

datasource = open('Performance.html')
#myparser = HTMLTableParser(datasource)
#myparser.parse()
myparser = TradencyPerformanceParser(datasource)
#myparser.print_data()

header = myparser.get_header()
#print(header)
data = myparser.get_data()

#print(data)
#print(header)


#  ###########################################
#  # convert list of list to list of objects
#  ###########################################

dataObj = []
for row in data:
    myPerformance = TradencyPerformance(header, row)
    dataObj.append(myPerformance)

#print(row)


#  ###########################################
#  # select data using a filter
#  ###########################################

filter = True
if filter:
    dataObjSelected = []
    for row in dataObj:
        #if row.__dict__['!!!!!!!! Erreur % !!!!!!!!']>1:
        #if row.__dict__['Stratégie']=='BreakoutMaster' and row.__dict__['Symbole']=='EURUSD':
        if row.__dict__['TradeDepuis']>timedelta(30) and row.__dict__['NumTrades']>30 and row.__dict__['Facteur de Profit']>1 and row.__dict__['Facteur de Profit']<3.5 and row.__dict__['Espérance']>10 and row.__dict__['Pips moyens par trade']>10 and row.__dict__['T-Score']>8.5:
            dataObjSelected.append(row)
else:
    dataObjSelected = dataObj

#  ###########################################
#  # sort data using a criterion
#  ###########################################

#['Stratégie', 'Symbole', 'T-Score', 'NumTrades', 'Max DD', 'Pips', 'Positions Max', '% gain', 'TAR', 'Profit', 'Facteur de Profit', 'Date', 'GMT (pips)', 'Temps de Trade Moyen', 'PMT (pips)', 'TPM (pips)', 'PMT (pips)_2']

criterion = 'T-Score' #'!!!!!!!! Erreur % !!!!!!!!' #'Pips moyens par trade' #'Temps de Trade Moyen' #'T-Score' #'Espérance' #'Pips moyens par trade' #'!!!!!!!! Erreur % !!!!!!!!'
descending = False
dataObjSorted = sorted(dataObjSelected, key=lambda dataObjSelected: dataObjSelected.__dict__[criterion], reverse=not descending)

# Rem (à vérifier) : 'Pips total' ne prend pas en compte les trades en cours (prend en compte uniquement les trades fermés)
#  alors que 'Pips moyen par trade' si
# Csq : si Espérance > Pips moyen par trade => il y a des trades perdants non fermés

#  ###########################################
#  # display data (selected and sorted)
#  ###########################################

i=1
val = []
strategies = []
for row in dataObjSorted:
    print("=== {4}/{5} : {0}\t\t{1}\t{2}={3} ===".format(row.__dict__['Stratégie'], row.__dict__['Symbole'], criterion, row.__dict__[criterion], i, len(dataObjSorted)))
    #print(row)
    row.display()
    print('')
    if i<30:
        val.append(row.__dict__[criterion])
        strategies.append("{0}/{1} {2}".format(i, len(dataObjSorted), row.__dict__['Stratégie']))
    i = i + 1


fig = figure()
fig.subplots_adjust(bottom=0.3)
N = len(strategies)
ind = np.arange(N)  # the x locations for the groups
width = 0.5       # the width of the bars
bar(ind+width/2, val, width)
xticks(ind+width, strategies, rotation=-90 )
title(criterion+' for each strategy')
xlabel('strategies')
ylabel(criterion)
grid(True)
show()