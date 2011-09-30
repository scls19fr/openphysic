#!/usr/bin/env python
# -*- coding: utf8 -*-

#    FOREX class
#
#       But : ces classes définissent divers objets utilisés dans le marché des devises (FOREX=FOReign EXchange)
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


import csv
from datetime import datetime

class Direction:
    def __init__(self, dir = 'Buy'):
        self.__buy__ = None
        if dir == 'Buy':
            self.__buy__ = True
        elif dir == 'Sell':
            self.__buy__ = False
        else:
            raise Exception("'Buy' or 'Sell'")

    def __repr__(self):
    	if self.__buy__ == True:
    	    return 'Buy'
    	elif self.__buy__ == False:
    	    return 'Sell'
    	#else:
    	#    return 'Undef'

    def __eq__(self, other):
        return self.__buy__ == other.__buy__

    def __ne__(self, other):
        return self.__buy__ != other.__buy__


class Currency:
# cf ISO_4217 http://en.wikipedia.org/wiki/ISO_4217
    def __init__(self, code = '', name = '', num = 0, digits = 0, locations = []):
        if len(code)!=3:
            raise(Exception('Currency code must be 3 letters long. ex: EUR'))    	

        self.code = code # Symbol
        self.name = name
        self.num = num
        self.digits = digits # ex USD 1.23 => 2 digits
        self.locations = locations

    def __repr__(self):
        return(repr(self.__dict__))
        #return self.code
    
    def display(self):
    	print(self.__dict__)
        #print(repr(self.__dict__))
        

class Currencies(dict):
    def __init__(self):
        #pass
        reader = csv.reader(open("currencies.csv"), delimiter='\t')
        i = 0
        for row in reader:
            if i!=0:
                try:
                    self.__dict__[row[0]] = Currency(row[0], row[3], row[1], int(row[2]))
                except:
                    #pass
                    print("Currency {0} not imported".format(row[0]))
            i = i + 1
        
    def __repr__(self):
        return repr(self.__dict__)


class Pair:
    #def __init__(self, fromC = None, toC = None):
    	# ex EURUSD 1.5767/1.5769 bid/ask sell/buy
        #self.fromC = fromC # ex EUR
        #self.toC = toC # ex USD
        #self.Symbol = ''
        #self.Bid = 0
        #self.Ask = 0
        #self.update()

    def __init__(self, currencies = None, symbol = ''):
    	# currencies = list of currencies
    	# symbol = EURUSD ...
    	# ex EURUSD 1.5767/1.5769 bid/ask sell/buy 1EUR=1.58$
        self.currencies = currencies
        if len(symbol)!=6:
            raise(Exception('Pair symbol must be 6 letters long. ex: EURUSD'))    	
        #self.fromC = Currency(symbol[:3]) # ex EUR
        #self.toC = Currency(symbol[3:]) # ex USD
        try:
            self.fromC = self.currencies.__dict__[symbol[:3]] # ex EUR - base currency
        except:
            raise(Exception("The xxx currency in xxx/yyy pair doesn't exist"))
        try:
            self.toC = self.currencies.__dict__[symbol[3:]] # ex USD - quote currency
        except:
            raise(Exception("The yyy currency in xxx/yyy pair doesn't exist"))
        self.Digits = 5
        self.__Bid = 0
        self.__Ask = 0
        self.PipPosition = 4 # 0.0001 (so 4 because 10^(-4)) for most pairs but for xxxJPY PipPosition=2
        self.date = datetime.now()
        self.update()
        
    def setBid(self, val):
        self.__Bid = round(val, self.Digits) #val
    
    def setAsk(self, val):
        self.__Ask = round(val, self.Digits) #val

    def getBid(self):
        return(round(self.__Bid, self.Digits))
    
    def getAsk(self):
        return(round(self.__Ask, self.Digits))
        
    def getQuote(self):
        return (self.getAsk()+self.getBid())/2
        
    def getSpread(self):
        return round((self.getAsk() - self.getBid())*10**(self.PipPosition), self.Digits-self.PipPosition)
        
    def update(self):
        self.symbol = self.fromC.code + self.toC.code
        self.spread = round((self.getAsk() - self.getBid())*10**(self.PipPosition), self.Digits-self.PipPosition)
        #self.spread = (round(self.__Ask - self.__Bid, self.Digits))*10**(self.PipPosition)

    def __repr__(self):
        self.update()
        #return self.Symbol
        return repr(self.__dict__)
    	
    def invert(self):
        #print(self.symbol[3:] + self.symbol[:3])
        invPair = Pair(self.currencies, self.symbol[3:] + self.symbol[:3])
        #del invPair.__dict__['currencies']
        invPair.Digits = self.Digits
        invPair.setBid(1/self.getAsk())
        invPair.setAsk(1/self.getBid())
        invPair.PipPosition = 4
        invPair.date = self.date
        return invPair

# Pip calculator
    def pipcalculate(self, pairs, units, quoteCurrency=None):
        if quoteCurrency==None:
            quoteCurrency = self.toC
        val = Value(units, self.fromC)
        #print(val)
        #new_val=val.convert(quoteCurrency, pairs) # montant investi en quoteCurrency
        #print(new_val)
        pipValue = Value(units * 0.0001, self.toC, pairs)
        pipValue = pipValue.convert(quoteCurrency)
        return pipValue
#	print(units, pair, quoteCurrency) 
# Compte en EUR
#Parité 	Montant investit en devise 	Montant investi en Euros 	Position du pip 	Valeur du pip en devise cotée à l'incertain 	Valeur du pip en Euros
#GBP/USD 	10000 GBP 	10000*(GBP/EUR) 	0.0001 	10000*0.0001=1 USD 	1 / (EUR/USD)


#class Lot
MicroLot = 1000
MiniLot = 10000
Lot = 100000

class Pairs:

# ToDo : 
# au lieu d'utiliser __dict__['EURUSD']
# il est peut-être préférable d'utiliser
# __dict__['EUR'].__dict__['USD']
# ça permet de facilement construire un graphe (orienté)


    def __init__(self, currencies = None):
    	#pass
        reader = csv.reader(open("pairs.csv"), delimiter='\t')
        i = 0
        for row in reader:
            if i!=0:
                pair = Pair(currencies, row[0])
                pair.PipPosition = int(row[1])
                if float(row[2])!=0:
                    pair.setBid(float(row[2]))
                else:
                    pair.setBid(float(row[3])) # si Bid est à 0 on met le prix Ask (spread=0)
                if float(row[3])!=0:
                    pair.setAsk(float(row[3])) 
                else:
                    pair.setAsk(float(row[2])) # si Ask est à 0 on met le prix Bid (spread=0)
                pair.date = datetime.now() #row[4]
                self.__dict__[row[0]] = pair
            i = i + 1
        
    def __repr__(self):
        return repr(self.__dict__)
    
    def getByPairSymbol(self, pairSymbol):
        try:
            pair = self.__dict__[pairSymbol]
            return pair
        except:
            try:
                inv_pairSymbol = pairSymbol[3:] + pairSymbol[:3]
                invPair = self.__dict__[inv_pairSymbol]
                return invPair.invert()
            except:
                #print(pairSymbol)
                #if pairSymbol[3:]==pairSymbol[:3]: ### paire USDUSD => quote=1
                #    pair = Pair()
                #    return pair
            	# ToDo : combiner plusieurs paires
            	# (cf théorie des graphes / pb du voyageur de commerce / algorithme de Dijkstra)
            	# ex : EURJPY = EURUSD * USDJPY
            	# ex2 : EURAUD = EURUSD * 1/AUDUSD
                raise Exception("This pair doesn't exists")
    
    def getByCurrencies(self, fromC, toC):
        return self.getByPairSymbol(fromC.code+toC.code)


class Value(): # ToDo dériver de float afin de pouvoir faire opé avec devise
    def __init__(self, amount, currency, pairs=None):
        self.pairs = pairs
        self.amount = float(amount)
        self.currency = currency

    def __repr__(self):
        #return repr(self.__dict__)
        #return(self.currency.code+"{:03.2f}".format(round(self.amount, self.currency.digits)))
        return(self.currency.code+"{0}".format(round(self.amount, self.currency.digits)))
        
    def convert(self, to_currency):
    	#find pair self.currency/to_currency and get quote
    	#if it doesn't exists look for currency/self.currency quote=1/x
    	#if it doesn't exists raise an exception
        if self.currency!=to_currency:
            pair = self.pairs.getByCurrencies(self.currency, to_currency)
            quote = pair.getQuote() #1/1.58 # EURUSD=1.58 1.00EUR = $1.58 => USDEUR=1/1.58
        else:
            quote = 1
        return Value(self.amount*quote, to_currency)
        # ToDo
        
    def __add__(self,other):
        other2 = other.convert(self.currency)
        return Value(self.amount + other2.amount, self.currency)

    def __sub__(self,other):
        other2 = other.convert(self.currency)
        return Value(self.amount - other2.amount, self.currency)

    #def __mul__(self,other):
    #    other2 = other.convert(self.currency)
    #    return Value(self.amount * other2.amount, self.currency)

    #__div__ __rmul__ __rdiv__

# Candelstick
# OHLC = Open High Low Close