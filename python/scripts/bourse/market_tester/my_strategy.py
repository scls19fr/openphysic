#!/usr/bin/env python
# -*- coding: utf8 -*-

from pyalgotrade import strategy
from pyalgotrade.barfeed import metatraderfeed
from datetime import *
import pandas as pd

class MyStrategy(strategy.Strategy):
    def __init__(self, feed):
        strategy.Strategy.__init__(self, feed)
        
        filename = 'data/Trade_History_out_OpenClose0_EURUSD.csv'
        self.dfTr = pd.read_csv(filename, index_col='Date', parse_dates=[6])
        print("Trades : {0}".format(len(self.dfTr)))

        self.i_tr = 0
        
        #print(self.dfTr)

    def onBars(self, bars):
        bar = bars.getBar("EURUSD")
        #print "%s: %s" % (bar.getDateTime(), bar.getClose())
        dt1 = bar.getDateTime()
        dt2 = bar.getDateTime() + timedelta(minutes=15)
        #print("{0}-{1} O={open} H={high} L={low} C={close}".format(dt1, dt2, open=bar.getOpen(), high=bar.getHigh(), low=bar.getLow(), close=bar.getClose()))
        
        if self.i_tr<len(self.dfTr):
            dt_tr = self.dfTr.index[self.i_tr]

            if (dt1<=dt_tr and dt_tr<dt2):
                print("tr #{0}".format(self.i_tr, len(self.dfTr)))

                #print("  Bar {0}-{1} O={open} H={high} L={low} C={close}".format(dt1, dt2, open=bar.getOpen(), high=bar.getHigh(), low=bar.getLow(), close=bar.getClose()))
                
                price_tr = self.dfTr.irow(self.i_tr)['Price']
                
                #print(" O={open} H={high} L={low} C={close}".format(open=bar.getOpen(), high=bar.getHigh(), low=bar.getLow(), close=bar.getClose()))
                #print(" dt_tr={dt} price_tr={price}".format(dt=dt_tr, price=price_tr))
                
                b_in_price = (price_tr>=bar.getLow()) and (price_tr<=bar.getHigh())
                
                print(b_in_price)

                self.i_tr = self.i_tr + 1
                
        else:
            return


# Load the MetaTrader feed from the CSV file
feed = metatraderfeed.Feed()
feed.addBarsFromCSV("EURUSD", "data/EURUSD15.csv", 3)

# Evaluate the strategy with the feed's bars.
myStrategy = MyStrategy(feed)
myStrategy.run()