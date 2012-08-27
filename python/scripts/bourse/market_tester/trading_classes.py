#!/usr/bin/env python
# -*- coding: utf8 -*-

"""
Trading classes

Copyright (C) 2012  "Femto Trader" <femto.trader@gmail.com>

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

class OperationType:
    def __init__(self, cmd = 'BUY'):
        cmd = cmd.upper()
        self.__i = -1
        self.__operations = {'BUY': 0, 'SELL':1, 'BUYLIMIT':2, 'SELLLIMIT':3, 'BUYSTOP':4, 'SELLSTOP':5}
        self.__arr_op = ['BUY', 'SELL', 'BUYLIMIT', 'SELLLIMIT', 'BUYSTOP', 'SELLSTOP']
        self.__dir = [1, -1, 1, -1, 1, -1]        

        if cmd in self.__operations:
            self.__i = self.__operations[cmd]
        else:
            raise Exception("cmd must be 'BUY' or 'SELL' or 'BUYLIMIT' or 'SELLLIMIT' or 'BUYSTOP' or 'SELLSTOP'")

    def __repr__(self):
        return(self.__arr_op[self.__i])

    def __eq__(self, other):
        return self.__i == other.__i

    def __ne__(self, other):
        return self.__i != other.__i
        
    def getDir(self):
        return self.__dir[self.__i]
        
    def isPending(self):
        if (self.__i>1):
            return(True)
        else:
            return(False)

class Trade:
    def __init__(self, ticketnumber=-1, opentime=None, operation=OperationType('BUY'), lots=0.01, symbol='', openprice=None, stoploss=0.0, takeprofit=0.0, closetime=None, closeprice=0.0, commission=0.0, swap=0.0, profit=0.0, comment="", magicnumber=0, pendingorderexpirationdate=None):
        self.ticketnumber = ticketnumber
        
        self.opentime = opentime # datetime()
        self.operation = operation # OperationType
        self.lots = lots # float
        self.symbol = symbol
        self.openprice = openprice # float
        self.stoploss = stoploss
        self.takeprofit = takeprofit
        
        self.closetime = closetime
        self.closeprice = closeprice
        self.commission = commission
        self.swap = swap
        self.profit = profit
        
        self.comment = comment
        self.magicnumber = magicnumber
        
        self.pendingorderexpirationdate = pendingorderexpirationdate
                
    def __repr__(self):
        return("""{ticketnumber}; {opentime}; {operation}; {lots}; {symbol}; {openprice}; {stoploss}; {takeprofit}; {closetime}; {closeprice}; {commission}; {swap}; {profit}; {comment}; {magicnumber}; {pendingorderexpirationdate}
"""+"{ticketnumber}; {opentime}; {operation}; {lots}; {symbol}; {openprice}; {stoploss}; {takeprofit}; {closetime}; {closeprice}; {commission}; {swap}; {profit}; {comment}; {magicnumber}; {pendingorderexpirationdate}".format(ticketnumber=self.ticket, opentime=self.opentime, operation=self.operation, lots=self.lots, symbol=self.symbol, openprice=self.openprice, stoploss=self.stoploss, takeprofit=self.takeprofit, closetime=self.closetime, closeprice=self.closeprice, commission=self.commission, swap=self.swap, profit=self.profit, comment=self.comment, magicnumber=self.magicnumber, pendingorderexpirationdate=self.pendingorderexpirationdate))

    def getTuple(self):
        return( (self.ticketnumber, self.opentime, self.operation, self.lots, self.symbol, self.openprice, self.stoploss, self.takeprofit, self.closetime, self.closeprice, self.commission, self.swap, self.profit, self.comment, self.magicnumber, self.pendingorderexpirationdate) )

    def fromTuple(self, t):
        self.ticketnumber = t[0]
        
        self.opentime = t[1]
        self.operation = t[2]
        self.lots = t[3]
        self.symbol = t[4]
        self.openprice = t[5]
        self.stoploss = t[6]
        self.takeprofit = t[7]
        
        self.closetime = t[8]
        self.closeprice = t[9]
        self.commission = t[10]
        self.swap = t[11]
        self.profit = t[12]
        
        self.comment = t[13]
        self.magicnumber = t[14]
        
        self.pendingorderexpirationdate = t[15]
        
        #self.flagHistory = False # True=History False=Trade
    

"""MODE_TRADES or MODE_HISTORY"""
class Trades:
    def __init__(self):
        self.lst = []
        
    def append(self, tr):
        self.lst.append(tr)

    def getTradeByPosition(self, pos):
        return(self.lst[pos])
        
    def getTradeByTicket(self, ticket):
        pass # dict ?

    def getDataFrame(self):
        pass
        
class Broker:
    def __init__(self):
        pass
        #self.tr = Trades()

    def OrderSend(self):
        pass
        #int OrderSend( 	string symbol, int cmd, double volume, double price, int slippage, double stoploss, double takeprofit, string comment=NULL, int magic=0, datetime expiration=0, color arrow_color=CLR_NONE)
    
    def OrderClose(self):
        pass
        #bool OrderClose( 	int ticket, double lots, double price, int slippage, color Color=CLR_NONE)
        
    def OrderDelete(self):
        pass