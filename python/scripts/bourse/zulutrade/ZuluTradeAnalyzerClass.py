#!/usr/bin/env python
# -*- coding: utf8 -*-

"""
    ZuluTrade analyzer class

       But : ce script permet d'analyser les performances de diverses stratégies utilisées
       dans le système de trading automatique ZuluTrade http://www.zulutrade.com/

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

from BeautifulSoup import BeautifulSoup
import re
from datetime import date, datetime, timedelta
from UsefulClass import *
from pylab import figure, plot, show, grid, title, xlabel, ylabel, subplot, bar, np, xticks # plot
from matplotlib.finance import quotes_historical_yahoo, candlestick

class ZuluTradeMyHistoryParser():
    def __init__(self, filename):
        datasource = open(filename)
        html = datasource.read()
        soup = BeautifulSoup(html)
        table = soup.find('table')
        #print(table)
        self.lstData = []
        self.lstHead = []
        rows = table.findAll('tr')
        i = 0
        for tr in rows:
            lstRow = []
            if i==0:
                cols = tr.findAll('th')
                for td in cols:
                    val = td.findAll(text=True)    
                    lstRow.append(str(val[0]))
                self.lstHead = lstRow
            else:
                cols = tr.findAll('td')
                for td in cols:
                    val = td.findAll(text=True)
                    lstRow.append(val)
                self.lstData.append(lstRow)
            i = i + 1
        # 0..8
        # 9 # &lt;tr>&lt;td>Gross PnL:&lt;/td>&lt;td>-€12.49&lt;/td>&lt;/tr>&lt;tr>&lt;td>Interest:&lt;/td>&lt;td>€0.00&lt;/td>&lt;/tr>&lt;tr>&lt;td>Commision:&lt;/td>&lt;td>€0.00&lt;/td>&lt;/tr>&lt;tr>&lt;td>Net PnL:&lt;/td>&lt;td>-€12.49&lt;/td>&lt;/tr>&lt;/table>" style="background-color:#FFD2D2;">-15 pips
        # 10 # xxx pips / €xxx.yy


        for i in range(0, len(self.lstData)):
            for j in range(0, 10+1):
                val = self.lstData[i][j]
                if j==0 or j==1 or j==2:
                	val = str(val[0].strip())    
                elif j==3:
                    val = int(val[0]) # Montant en micro-lot (1Micro-Lot=1k ; 1Mini-Lot=10k ; 1Lot=100k)
                elif j==4 or j==5:
                    val = datetime.strptime(val[0].strip(), '%Y/%m/%d %H:%M:%S')
                elif j==6 or j==7:
                    val = float(val[0])
                elif j==8:
        	    	val = [int(val[0]), int(val[1])]
                elif j==9:
                    val[0] = val[0][val[0].find(';">')+3:len(val[0])] # nettoyer le code HTML
                    profitpips = float(val[0][0:val[0].find(" pips")]) # enlever _pips à la fin
                    val[1] = val[1].strip()
                    if val[1][0]=='-':
                        val[1] = val[1][1:len(val[1])]
                        profitcur = -float(val[1][1:(len(val[1]))]) # enlever le symb euro au début            
                    else:
                        profitcur = float(val[1][1:(len(val[1]))]) # enlever le symb euro au début
                    val = [profitpips, profitcur] # tofix
                elif j==10:
                    totalpips = float(val[0][0:val[0].find(" pips")]) # enlever _pips à la fin
                    val[1] = val[1].strip()
                    if val[1][0]=='-':
                        val[1] = val[1][1:len(val[1])]
                        totalcur = -float(val[1][1:(len(val[1]))]) # enlever le symb euro au début            
                    else:
                        totalcur = float(val[1][1:(len(val[1]))]) # enlever le symb euro au début
                    val = [totalpips, totalcur] # tofix
                else:
                	pass
                #print(val)
                self.lstData[i][j] = val
            #print(". "*10)

        #print("*"*10)

        #print(self.lstHead)
        # Rename head
        self.lstHead[0] = "Stratégie"
        self.lstHead[1] = "A/V"
        self.lstHead[2] = "Symbole"
        self.lstHead[3] = "Montant (k)"
        self.lstHead[4] = "Ouvrir Heure"
        self.lstHead[5] = "Fermer Heure"
        self.lstHead[6] = "Ouvrir Prix"
        self.lstHead[7] = "Fermer Prix"
        self.lstHead[8] = "Haut/Bas"
        #self.lstHead[9] = "Profit"
        #self.lstHead[10] = "Total"
        
        datasource.close()
            
    def get_header(self):
        return self.lstHead

    def get_data(self):
        return self.lstData
        
    def get(self, colname, index): #, lstindex = None):
        j =  self.lstHead.index(colname)
        return self.lstData[index][j]
        #if lstindex == None:
        #    return self.lstData[index][j]
        #else:
        #    return self.lstData[index][j][lstindex]

    def getAll(self, colname, lstindex = None):
        j =  self.lstHead.index(colname)
        lst = []
        for i in range(0, len(self.lstData)):
            if lstindex == None:
                lst.append(self.lstData[i][j])
            else:
                lst.append(self.lstData[i][j][lstindex])
        return lst

#  ###########################################

class ZuluTradeMyHistory:
    def __init__(self, format, value):
        i = 0
        for key in format:
            if key=="Profit":
                self.__dict__['Pips'] = value[i][0]
                self.__dict__['Profit'] = value[i][1]                
            elif key=="Total":
                self.__dict__['TotalPips'] = value[i][0]
                self.__dict__['TotalProfit'] = value[i][1]                
            elif key=="Haut/Bas":
                self.__dict__['Haut'] = value[i][0]
                self.__dict__['Bas'] = value[i][1]
            else:
                self.__dict__[key] = value[i]            
            i = i + 1

        # add specials indicators
        self.__dict__['Durée Trade'] = self.__dict__['Fermer Heure'] - self.__dict__['Ouvrir Heure']


    def __repr__(self):
        return repr(self.__dict__)
        
    def display(self):
        for key in self.__dict__:
            print("\t{0} = {1}".format(key,self.__dict__[key]))

#  ###########################################

class ZuluTradeHistoryParser():
    def __init__(self, filename):
        datasource = open(filename)

        xml = datasource.read()
        soup = BeautifulSoup(xml)
        #print(soup.prettify())
        table = soup.find('table')
        #print(table)
        rows = table.findAll('row')
        #print(rows)
        self.lstData = []
        self.lstHead = []
        i = 0
        for row in rows:
            #print(row)
            #print("-"*10)
            if i==0: # HEAD
                cols = row.findAll('cell')
                #print(cols)
                j = 0
                for cell in cols:
                    val = cell.find(text=True)
                    #print(val)
                    self.lstHead.append(str(val))
                    j = j + 1
            else: # DATA
                lstRow = []
                cols = row.findAll('cell')
                #print(cols)
                j = 0
                for cell in cols:
                    val = cell.find(text=True)
                    #print(val)
                    if j==0:
                        val = str(val) # ? ou float ?
                    elif j==1 or j==3:
                        val = str(val)
                    elif j==4 or j==5:
                        val = datetime.strptime(val, '%Y/%m/%d %H:%M:%S')
                    elif j==2 or j==6 or j==7 or j==8 or j==9 or j==10 or j==11 or j==12 or j==14 or j==15:
                        val = float(val)
                    elif j==13:
                        if val=='YES':
                            val = True
                        elif val=='NO':
                            val = False
                        else:
                            val = None
                    else:
                        pass # reste en string
                    lstRow.append(val)
                    j = j + 1
                self.lstData.append(lstRow)
            i = i + 1
            #print("-"*10)
        
        # Nom des entêtes par défaut
        #  0 : Provider Ticket
        #  1 : Type
        #  2 : Lots
        #  3 : Currency
        #  4 : Date Opened
        #  5 : Date Closed
        #  6 : Price Opened
        #  7 : Price Closed
        #  8 : Highest Profit
        #  9 : Worst Drawdown
        # 10 : Roll
        # 11 : Pips
        # 12 : Net Profit &amp; Loss
        # 13 : Live Trade?
        # 14 : Accumulated Pips
        # 15 : Accumulated Profit
        
        # Rename header
        self.lstHead[1] = 'A/V'
        self.lstHead[2] = 'Montant (k)'
        self.lstHead[3] = 'Symbole'
        self.lstHead[4] = 'Ouvrir Heure'
        self.lstHead[5] = 'Fermer Heure'
        self.lstHead[6] = 'Ouvrir Prix'
        self.lstHead[7] = 'Fermer Prix'
        self.lstHead[8] = 'Haut'
        self.lstHead[9] = 'Bas'
        self.lstHead[12] = 'Profit'

        datasource.close()
        
    def get_header(self):
        return self.lstHead

    def get_data(self):
        return self.lstData
        
    def get(self, colname, index): #, lstindex = None):
        j =  self.lstHead.index(colname)
        return self.lstData[index][j]
        #if lstindex == None:
        #    return self.lstData[index][j]
        #else:
        #    return self.lstData[index][j][lstindex]

    def getAll(self, colname, lstindex = None):
        j =  self.lstHead.index(colname)
        #print("j={0}".format(j))
        lst = []
        for i in range(0, len(self.lstData)):
            if lstindex == None:
                lst.append(self.lstData[i][j])
            else:
                lst.append(self.lstData[i][j][lstindex])
        return lst

#  ###########################################

class ZuluTradeHistory:
    def __init__(self, format, value):
        i = 0
        for key in format:
            self.__dict__[key] = value[i]            
            i = i + 1

        # add specials indicators
        self.__dict__['Durée Trade'] = self.__dict__['Fermer Heure'] - self.__dict__['Ouvrir Heure']


    def __repr__(self):
        return repr(self.__dict__)
        
    def display(self):
        for key in self.__dict__:
            print("\t{0} = {1}".format(key,self.__dict__[key]))
    
    # ToTest
    def apply_stop_loss(self, sl=0):
        #sl=10
        if sl<0:
            raise(Exception("Stop loss must be a positive value"))
        elif sl!=0:
            oldpips = self.__dict__['Pips']
            if self.__dict__['Pips']<=-sl or self.__dict__['Bas']<=-sl:
                self.__dict__['Pips'] = -sl
                self.__dict__['Bas'] = -sl
            # Calculer profit
        else:
            pass # no stop loss

    def apply_take_profit(self, limit=0):
        #limit=10
        if limit<0:
            raise(Exception("Limit must be a positive value"))
        elif limit!=0:
            oldpips = self.__dict__['Pips']
            if oldpips>=0:
                if oldpips>=limit or self.__dict__['Haut']>=limit:
                    self.__dict__['Pips'] = limit
                    # Calculer profit
        else:
            pass # no take profit