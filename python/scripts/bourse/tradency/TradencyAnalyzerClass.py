#!/usr/bin/env python
# -*- coding: utf8 -*-

#    Tradency analyzer class
#
#       But : ce script permet d'analyser les performances de diverses stratégies utilisées
#       dans le système de trading automatique Tradency http://www.tradency.com/
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

from HTMLParser import HTMLParser # py2
#from html.parser import HTMLParser #py3
from datetime import date, datetime, timedelta
from ForexClass import *
from UsefulClass import *
from pylab import figure, plot, show, grid, title, xlabel, ylabel, subplot, bar, np, xticks # plot
from matplotlib.finance import quotes_historical_yahoo, candlestick

class HTMLTableParser(HTMLParser):
    def __init__(self, fh, types=[]):
        """
        {fh} must be an input stream returned by open() or urllib2.urlopen()
        """
        HTMLParser.__init__(self)
        self.header = []
        self.data = []
        self.state = 0 # 0:init 1:table 2:end of table
        self.rows = 0
        self.cels = 0
        self.cols = 0
        self.fh = fh
        #self.types = [str, str, float, int, float, float, int, float, float, float, float, strDate2date, float, strH2timedelta, float, float, float]
        #self.types = []
        self.types = types
        self.feed(fh.read())
    
    #def parse(self):
    #    self.feed(self.fh.read())

    def handle_starttag(self, tag, attrs):
        if tag == 'table':
            self.state = 1

        if self.state == 1:
            if tag == 'tr':
                self.rows = self.rows + 1
                self.cols = 0
                self.row = []
                #self.row = ()
        	
            if tag == 'td':
                self.cels = self.cels + 1
                self.cols = self.cols + 1

    def handle_endtag(self, tag):
    	#if tag == 'table':
    	#	self.state = 2

        if tag == 'tr':
            #print(self.row)

            if self.rows == 1:
            	self.header.append(self.row) # list
                #self.header.append(tuple(self.row)) # tuple
            else:
                self.data.append(self.row) # list
                #myPerformance = TradencyPerformance(self.header, self.row)
                #self.data.append(myPerformance) # list
                #self.data.append(tuple(self.row)) # tuple

    	#if tag == 'td':
    	#	print("a closing td")

    def handle_data(self, data):
        if self.rows == 1: # head
            data = data.strip() # remove white space in title (begin or end)
            if data in self.row:
                data = data + "_2" # to avoid same colon name
            self.row.append(data)
        else: # data
            try:
                self.row.append(self.types[self.cols-1](data)) # cast to float, int or other
            except IndexError: # Index out of range
                self.row.append(data) # string
            #except: # uncomment this to see in which colon is cast error, comment this to see error
            #    self.row.append('Err')

    def get_data(self):
        return self.data

    def get_header(self):
        return self.header[0]

    def print_data(self):
        print("rows = ", self.rows)
        print("cols = ", self.cols)
        print("cels = ", self.cels)
        print("state = ", self.state)
        #print("row = ", self.row)
        print("header = ", self.header)
        print("types = ", self.types)
        print("data = ", self.data)

    def strH2timedelta(self, data):
        data = data.split(':')
        return timedelta(hours=int(data[0]), minutes=int(data[1]), seconds=float(data[2]))

    def strDate2date(self, data):
        return datetime.strptime(data, '%m/%d/%Y').date()

    def strDatetime2datetime(self, data):
        return datetime.strptime(data, '%m/%d/%Y %H:%M:%S')

    #def strBuySell2BooleanBuy(self, data):
    #    if data=='Buy':
    #        return True
    #    elif data=='Sell':
    #        return False
    #    else:
    #        return None

    def strHighLow2HighLow(self, data):
        data = data.split('/')
        #data = float(data)
        data[0] = float(data[0])
        data[1] = float(data[1])
        return data


class TradencyPerformanceParser(HTMLTableParser):
    def __init__(self, fh, types=[]):
        types = [str, str, float, int, float, float, int, float, float, float, float, self.strDate2date, float, self.strH2timedelta, float, float, float]
        HTMLTableParser.__init__(self, fh, types)
        #self.feed(fh.read())


class Dict2Obj:
    def __init__(self, format, value):
        
        i = 0
        for key in format:
            self.__dict__[key] = value[i]
            i = i + 1
                
    def __repr__(self):
        return repr(self.__dict__)
        
    def display(self):
        for key in self.__dict__:
            print("\t{0} = {1}".format(key,self.__dict__[key]))


class TradencyPerformance(Dict2Obj):
    def __init__(self, format, value):
        Dict2Obj.__init__(self, format, value)

        # add specials indicators
        self.__dict__['Pips moyens par trade'] = self.__dict__['Pips']/float(self.__dict__['NumTrades'])
        self.__dict__['Espérance'] = (self.__dict__['% gain']/100)*self.__dict__['GMT (pips)'] + (1-self.__dict__['% gain']/100)*self.__dict__['PMT (pips)']
        # pq c'est différent ???? normalement Pips moy par trade = Espérance
        self.__dict__['!!!!!!!! Erreur % !!!!!!!!'] = 100*abs(self.__dict__['Espérance'] - self.__dict__['Pips moyens par trade'])/self.__dict__['Pips moyens par trade']
        # en fait il y a deux colonnes nommées PMT (pips)
        
        t = date.today()
        TradeDepuis = t - self.__dict__['Date']
        self.__dict__['TradeDepuis'] = t - self.__dict__['Date'] 
        self.__dict__['NbTradesParJour'] = float(self.__dict__['NumTrades'])/(TradeDepuis.days)


#  ###########################################


class TradencyHistoryParser(HTMLTableParser):
    def __init__(self, fh, types=[]):
        types = [int, str, str, Direction, float, self.strDatetime2datetime, float, self.strDatetime2datetime, float, self.strHighLow2HighLow, float, float, float]
        HTMLTableParser.__init__(self, fh, types)
        

class TradencyHistory(Dict2Obj):
    def __init__(self, format, value):
        Dict2Obj.__init__(self, format, value)

        # add specials indicators
        self.__dict__['Durée Trade'] = self.__dict__['Fermer Heure'] - self.__dict__['Ouvrir Heure']

#  ###########################################


class TradencyMyHistoryParser(HTMLTableParser):
    def __init__(self, fh, types=[]):
        types = [int, int, str, str, str, Direction, int, float, self.strDatetime2datetime, float, self.strDatetime2datetime, float, float, float, float, float, float]
        HTMLTableParser.__init__(self, fh, types)


class TradencyMyHistory(Dict2Obj):
    def __init__(self, format, value):
        Dict2Obj.__init__(self, format, value)
        

#  ###########################################


class TradencyOrdersParser(HTMLTableParser):
    def __init__(self, fh, types=[]):
        types = [int, int, str, str, Direction, float, float, float, float, float, self.strDatetime2datetime]
        HTMLTableParser.__init__(self, fh, types)


class TradencyOrders(Dict2Obj):
    def __init__(self, format, value):
        Dict2Obj.__init__(self, format, value)


#  ###########################################


class TradencyPortfolioParser(HTMLTableParser):
    def __init__(self, fh, types=[]):
        types = [boolean, int, str, str, float, int, int, str, float, float, float]
        HTMLTableParser.__init__(self, fh, types)


class TradencyPortfolio(Dict2Obj):
    def __init__(self, format, value):
        Dict2Obj.__init__(self, format, value)


#  ###########################################


class TradencyPositionsParser(HTMLTableParser):
    def __init__(self, fh, types=[]):
        types = [int, int, str, str, Direction, float, float, float, float, float, float, float, float, self.strDatetime2datetime]
        HTMLTableParser.__init__(self, fh, types)


class TradencyPositions(Dict2Obj):
    def __init__(self, format, value):
        Dict2Obj.__init__(self, format, value)
