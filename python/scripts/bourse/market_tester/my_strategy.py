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


    def onBars(self, bars):
        bar = bars.getBar("EURUSD")
        #print "%s: %s" % (bar.getDateTime(), bar.getClose())
        dt1 = bar.getDateTime()
        dt2 = bar.getDateTime() + timedelta(minutes=15)
        #print("{0}-{1} O={open} H={high} L={low} C={close}".format(dt1, dt2, open=bar.getOpen(), high=bar.getHigh(), low=bar.getLow(), close=bar.getClose()))
        
        ## ToFix : à reprendre complètement
        # utiliser une boucle while(True) avec break

        if (self.i_tr<len(self.dfTr)):
            dt_tr = self.dfTr.index[self.i_tr]
            if (dt_tr>=dt1 and dt_tr<dt2):
                print("Bar from {0} to {1} O={open} H={high} L={low} C={close}".format(dt1, dt2, open=bar.getOpen(), high=bar.getHigh(), low=bar.getLow(), close=bar.getClose()))
        
        while (self.i_tr<len(self.dfTr)):
            dt_tr = self.dfTr.index[self.i_tr]
            price_tr = self.dfTr.irow(self.i_tr)['Price']
            action = self.dfTr.irow(self.i_tr)['Action']
            type = self.dfTr.irow(self.i_tr)['Type']
            symbol = self.dfTr.irow(self.i_tr)['Symbol']
            
            if (dt_tr<dt1):
                print("  Error: history missing for tr #{0}\t{1}\t{2}\t{3}\t{4}\t{5}".format(self.i_tr, dt_tr, price_tr, action, type, symbol))
                self.missing_history = self.missing_history + 1
                self.i_tr = self.i_tr + 1
                
            elif (dt_tr>=dt1 and dt_tr<dt2):
                print("  Tr #{0}\t{1}\t{2}\t{3}\t{4}\t{5}".format(self.i_tr, dt_tr, price_tr, action, type, symbol))
                
                b_in_price = (price_tr>=bar.getLow()) and (price_tr<=bar.getHigh())
                if (not b_in_price):
                    pdiff = min(abs(price_tr-bar.getLow()), abs(bar.getHigh()-price_tr))
                    if (pdiff>0.0003):
                        print("  pdiff={0}".format(pdiff))
                        self.price_error = self.price_error + 1

                self.i_tr = self.i_tr + 1
                
            else: # dt_tr>=dt2
                #print("dt_tr>=dt2")
                return

    def stop(self):
        #print("end of strategy")
        print("{0} price errors".format(myStrategy.price_error))
        print("missing_history={0}".format(self.missing_history))


# Load the MetaTrader feed from the CSV file
feed = metatraderfeed.Feed()
#feed.addBarsFromCSV("EURUSD", "data/EURUSD15_AAAFX.csv", 1) # 0 ou 1 ?
feed.addBarsFromCSV("EURUSD", "data/EURUSD15.csv", 3) # 0 ou 1 ?

# Evaluate the strategy with the feed's bars.
myStrategy = MyStrategy(feed)
myStrategy.run()
myStrategy.stop()
