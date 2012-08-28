#!/usr/bin/env python
# -*- coding: utf8 -*-

from pyalgotrade import strategy
from pyalgotrade.barfeed import metatraderfeed
from datetime import *
import pandas as pd
from math import *

class MyStrategy(strategy.Strategy):
    def __init__(self, feed):
        strategy.Strategy.__init__(self, feed)
        
        filename = 'data/Trade_History_out_OpenClose0_EURUSD.csv'
        self.dfTr = pd.read_csv(filename, index_col='Date', parse_dates=[6])
        print("Trades : {0}".format(len(self.dfTr)))

        self.i_tr = 0
        
        #print(self.dfTr)
        
        self.price_error = 0
        self.missing_history = 0
        
    #def EOF(self):
    #    return( not (self.i_tr<len(self.dfTr)) )
    
    def next(self):
        if self.i_tr<len(self.dfTr):
            self.i_tr = self.i_tr + 1
        else:
            return(len(self.dfTr))

    def onStart(self):
        #self.getBroker().setCash(1000.0)
        #print("Initial portfolio value: $%.2f" % self.getBroker().getCash())
        print("Initial portfolio value: ${:.2f}".format(self.getBroker().getCash()))


    def onBars(self, bars):
        symbol = 'EURUSD'
        bar = bars.getBar(symbol)
        #print "%s: %s" % (bar.getDateTime(), bar.getClose())
        dt1 = bar.getDateTime()
        dt2 = bar.getDateTime() + timedelta(minutes=15)
        #print("{0}-{1} O={open} H={high} L={low} C={close}".format(dt1, dt2, open=bar.getOpen(), high=bar.getHigh(), low=bar.getLow(), close=bar.getClose()))
        
        ## ToFix : à reprendre complètement
        # utiliser une boucle while(True) avec break

        if (self.i_tr<len(self.dfTr)):
            order_open_time = self.dfTr.index[self.i_tr]
            if (order_open_time>=dt1 and order_open_time<dt2):
                print("Bar from {0} to {1} O={open} H={high} L={low} C={close}".format(dt1, dt2, open=bar.getOpen(), high=bar.getHigh(), low=bar.getLow(), close=bar.getClose()))
        
        while (self.i_tr<len(self.dfTr)):
            order_symbol = self.dfTr.irow(self.i_tr)['Symbol']
            
            if (symbol==order_symbol):
                order_open_time = self.dfTr.index[self.i_tr]
                order_open_price = self.dfTr.irow(self.i_tr)['Price']
                order_action = self.dfTr.irow(self.i_tr)['Action'] # OPEN/CLOSE
                order_type = self.dfTr.irow(self.i_tr)['Type'] # BUY/SELL
                order_pseudoticket = self.dfTr.irow(self.i_tr)['PseudoTicket'] # to know what order to close
            
                if (order_open_time<dt1):
                    print(" Error: history missing for tr #{0}\t{1}\t{2}\t{3}\t{4}\t{5}".format(self.i_tr, order_open_time, order_open_price, order_action, order_type, order_symbol))
                    self.missing_history = self.missing_history + 1
                    self.i_tr = self.i_tr + 1
                
                elif (order_open_time>=dt1 and order_open_time<dt2):
                    print(" Tr #{0}\t{1}\t{2}\t{3}\t{4}\t{5}".format(self.i_tr, order_open_time, order_open_price, order_action, order_type, order_symbol))
                
                    b_in_price = (order_open_price>=bar.getLow()) and (order_open_price<=bar.getHigh())
                    if (not b_in_price):
                        pdiff = min(abs(order_open_price-bar.getLow()), abs(bar.getHigh()-order_open_price))
                        if (pdiff>0.0010):
                            print("  pdiff={0}".format(pdiff))
                            self.price_error = self.price_error + 1
                    else:
                        if (order_action=='OPEN'):
                            if (order_type=='BUY'):
                                print("OPEN BUY")
                            elif (order_type=='SELL'):
                                print("OPEN SELL")
                        elif (order_action=='CLOSE'):
                            if (order_type=='BUY'):
                                print("CLOSE BUY")
                            elif (order_type=='SELL'):
                                print("CLOSE SELL")

                    self.i_tr = self.i_tr + 1
                
                else: # order_open_time>=dt2
                    #print("dt_tr>=dt2")
                    return

            else: # symbol!=order_symbol
                print("symbol!=order_symbol")
                self.i_tr = self.i_tr + 1

    def stop(self):
        #print("end of strategy")
        print("{0} price errors".format(myStrategy.price_error))
        print("missing_history={0}".format(self.missing_history))


# Load the MetaTrader feed from the CSV file
feed = metatraderfeed.Feed()
#feed.addBarsFromCSV("EURUSD", "data/EURUSD15_AAAFX.csv", 1) # 0 ou 1 ?
feed.addBarsFromCSV("EURUSD", "data/EURUSD15_ALPNZ2.csv", 3) # 0 ou 1 ?

# Evaluate the strategy with the feed's bars.
myStrategy = MyStrategy(feed)
myStrategy.run()
myStrategy.stop()
