#!/usr/bin/env python
# -*- coding: utf8 -*-

#import unittest
from trading_classes import *

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

tr = Trade(ticket=-1, opentime=None, operation=OperationType('BUY'), lots=0.01, symbol='', openprice=None, stoploss=0.0, takeprofit=0.0, closetime=None, commission=0.0, swap=0.0, profit=0.0, comment="", magicnumber=0, pendingorderexpirationdate=None)

print(tr)
