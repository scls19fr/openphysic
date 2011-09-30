#!/usr/bin/env python
# -*- coding: utf8 -*-

"""
    Currensee Analyzer for History of a trader

       But : ce script permet d'analyser les trades effectués
       dans le système de trading http://www.currensee.com/

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

from CurrenseeAnalyzerClass import *

#  ###########################################
#  # Open XLS file
#  ###########################################

#from sqlalchemy.ext.declarative import declarative_base
#Base = declarative_base()
class Trade(object): # (Base): #(object):
#    __tablename__ = 'trades_table'
    
#    trade_id = Column(Integer, primary_key=True)
#    open_date = Column(String)
#    close_date = Column(String)
#    type = Column(Integer)
#    currency = Column(String)
#    open_price = Column(REAL)
#    close_price = Column(REAL)
#    pip = Column(REAL)
    
    def __init__(self, trade_id, open_date, close_date, type, currency, open_price, close_price, pip):
        self.trade_id = trade_id
        self.open_date = open_date
        self.close_date = close_date
        self.type = type
        self.currency = currency
        self.open_price = open_price
        self.close_price = close_price
        self.pip = pip
        
    def __repr__(self):
        return "{0}\t{1}\t{2}\t{3}\t{4}\t{5}\t{6}\t{7}".format(self.trade_id, self.open_date, self.close_date, self.type, self.currency, self.open_price, self.close_price, self.pip)
        
import xlrd
from sqlalchemy import *
from sqlalchemy.orm import mapper

book = xlrd.open_workbook("Closed+Trades.xls")
sh = book.sheet_by_index(0)

connectionURI = 'sqlite:///history.sqlite'
#connectionURI = 'sqlite:///:memory:'
engine = create_engine(connectionURI, echo = False) # 'sqlite:///:memory:' # 'sqlite:///history.db'

metadata = MetaData(engine) # MetaData # BoundMetaData

""" Head of xls file
Open Date
Close Date
Type
Currency
Open Price
Close Price
Pip G/L
"""

trades_table = Table('trades', metadata,
    Column('trade_id', Integer, primary_key=True),
    Column('open_date', String),
    Column('close_date', String),
    Column('type', Integer), # BOOLEAN or Integer
    Column('currency', String),
    Column('open_price', REAL),
    Column('close_price', REAL),
    Column('pip', REAL),
)
trades_table.create()

import datetime

for r in range(sh.nrows)[1:]: #[1:] pour éviter la ligne d'entête
    #print(sh.row(r)[:7])
    i = trades_table.insert()
    date = sh.row(r)[0].value.split('/')
    new_open_date = date[2]+'-'+date[0]+'-'+date[1]
    date = sh.row(r)[1].value.split('/')
    new_close_date = date[2]+'-'+date[0]+'-'+date[1]
    if sh.row(r)[2].value=='LONG': # 'LONG' # 'BUY'
        new_type = 1
    elif sh.row(r)[2].value=='SHORT': # 'SHORT' # 'SELL'
        new_type = 0
    else: # Error
    	new_type = None #-1
    # boolean
    i.execute(open_date=new_open_date, close_date=new_close_date,
        type=new_type, currency=sh.row(r)[3].value,
        open_price=sh.row(r)[4].value, close_price=sh.row(r)[5].value, pip=sh.row(r)[6].value)

mapper(Trade, trades_table)
#trade = Trade()
#print(trade)

s = trades_table.select(trades_table.c.trade_id<10) # trades_table.c.pip>0 # trades_table.c.trade_id<10 # order_by=trades_table.c.pip
rs = s.execute()
#row = rs.fetchone()
#print(row)
rows = rs.fetchall()
print("trade_id\topen_date\tclose_date\ttype\tcurrency\topen_price\tclose_price\tpip")
for row in rows:
    trade = Trade(row[0],row[1],row[2],row[3],row[4],row[5],row[6],row[7])
    print(trade)
    #print("{0}\t{1}\t{2}\t{3}\t{4}\t{5}\t{6}\t{7}".format(row[0],row[1],row[2],row[3],row[4],row[5],row[6],row[7]))

"""
cf SQLAlchemy + SQLSoup
SQLAlchemy tuto http://www.rmunn.com/sqlalchemy-tutorial/tutorial.html
http://www.sqlalchemy.org/trac/wiki/SqlSoup

voir aussi declarative_base
http://www.sqlalchemy.org/docs/orm/tutorial.html#introduction
"""