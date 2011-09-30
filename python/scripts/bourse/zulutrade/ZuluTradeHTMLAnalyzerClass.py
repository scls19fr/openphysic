#!/usr/bin/env python
# -*- coding: utf8 -*-

#    ZuluTrade analyzer class
#
#       But : ce script permet d'analyser les performances de diverses stratégies utilisées
#       dans le système de trading automatique ZuluTrade http://www.zulutrade.com/
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

#from HTMLParser import HTMLParser # py2
from html.parser import HTMLParser #py3
from datetime import date, datetime, timedelta

class HTMLTableWithHeadParser(HTMLParser):
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
        str = fh.read()
        str = str.replace('<br/>','__br__')
        str = str.replace('<br />','__br__')
        str = str.replace('&lt;','<')
        self.feed(str)
    
    #def parse(self):
    #    self.feed(self.fh.read())

    def handle_starttag(self, tag, attrs):
        print("  start "+tag)
        if tag == 'table':
            self.state = 1

        if self.state == 1:
            if tag == 'tr':
                self.rows = self.rows + 1
                self.cols = 0
                self.row = []
                #self.row = ()
        	
            if tag == 'td' or tag == 'th':
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
        data = data.strip() # remove white space in title (begin or end)
        #data.encode('iso8859-9')
        #print(data)
        if self.rows == 0:
            pass
        elif self.rows == 1: # head
            print(data)

            #data = data.strip() # remove white space in title (begin or end)
            if data in self.row:
                data = data + "_2" # to avoid same colon name
            self.row.append(data)
        else: # data
            print(data)

            try:
                #print(data)
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


class ZuluTradeMyHistoryReader(HTMLTableWithHeadParser):
    def __init__(self, fh, types=[]):
        #pass
        types = [str, str, str, int]
        HTMLTableWithHeadParser.__init__(self, fh, types)
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


class ZuluTradeMyHistory(Dict2Obj):
    def __init__(self, format, value):
        Dict2Obj.__init__(self, format, value)

        # add specials indicators
        #self.__dict__['Durée Trade'] = self.__dict__['Fermer Heure'] - self.__dict__['Ouvrir Heure']

