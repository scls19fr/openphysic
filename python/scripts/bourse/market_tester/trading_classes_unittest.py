#!/usr/bin/env python
# -*- coding: utf8 -*-

#import unittest
from trading_classes import *
from datetime import date, datetime, timedelta

types = ['BUY', 'SELL', 'BUYLIMIT', 'SELLLIMIT', 'BUYSTOP', 'SELLSTOP']

for type in types:
    x = OperationType(type)
    print(x)

print('='*20)

types = ['BuY', 'SelL', 'BUylIMIT', 'SELllIMIT', 'BUysTOP', 'SELlsTOP']

for type in types:
    x = OperationType(type)
    print(x)

print('='*20)

x = OperationType('BUY')
y = OperationType('SELL')
z = OperationType('BUYLIMIT')

print("""x = {0}
y = {1}
z = {2}""".format(x, y, z))

print("x == x : {0}".format(x==x))
print("x != x : {0}".format(x!=x))
print("x == y : {0}".format(x==y))

print('='*20)

print("x = {0} = {1}".format(x, x.getDir()))
print("y = {0} = {1}".format(y, y.getDir()))

print('='*20)

tr = Trade(ticketnumber=-9, opentime=datetime(2009,9,9), operation=OperationType('BUY'), lots=0.09, symbol='NEUFRA',
  openprice=1.9, stoploss=0.9, takeprofit=2.9, closetime=datetime(2009,10,9), closeprice=2.9, commission=0.9,
  swap=0.9, profit=0.9, comment="", magicnumber=999, pendingorderexpirationdate=None)

print(tr)
