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


    def onBars(self, bars):
        bar = bars.getBar("EURUSD")
        #print "%s: %s" % (bar.getDateTime(), bar.getClose())
        dt1 = bar.getDateTime()
        dt2 = bar.getDateTime() + timedelta(minutes=15)
        #print("{0}-{1} O={open} H={high} L={low} C={close}".format(dt1, dt2, open=bar.getOpen(), high=bar.getHigh(), low=bar.getLow(), close=bar.getClose()))
        
        
        if self.i_tr<len(self.dfTr):
            dt_tr = self.dfTr.index[self.i_tr]
            
            if (dt_tr<dt1):
                print("  Error: history missing for tr #{0}\t{1}".format(self.i_tr, dt_tr))
                self.missing_history = self.missing_history + 1
                self.i_tr = self.i_tr + 1
                dt_tr = self.dfTr.index[self.i_tr]

            if (dt_tr>=dt1 and dt_tr<dt2):
                print("Bar from {0} to {1} O={open} H={high} L={low} C={close}".format(dt1, dt2, open=bar.getOpen(), high=bar.getHigh(), low=bar.getLow(), close=bar.getClose()))

                while (dt_tr>=dt1 and dt_tr<dt2):
                    price_tr = self.dfTr.irow(self.i_tr)['Price']

                    print(" tr #{0}\t{1}\t{2}\t{3}\t{4}\t{5}".format(self.i_tr, dt_tr, price_tr, self.dfTr.irow(self.i_tr)['Action'], self.dfTr.irow(self.i_tr)['Type'], self.dfTr.irow(self.i_tr)['Symbol']))

                
                
                    #print(" O={open} H={high} L={low} C={close}".format(open=bar.getOpen(), high=bar.getHigh(), low=bar.getLow(), close=bar.getClose()))
                    #print(" dt_tr={dt} price_tr={price}".format(dt=dt_tr, price=price_tr))
                
                    #spread = 0.0002
                    slippage = 0.00005
                    b_in_price = (price_tr>=bar.getLow()) and (price_tr<=bar.getHigh())
                
                    if (not b_in_price):
                        pdiff = min(abs(price_tr-bar.getLow()), abs(bar.getHigh()-price_tr))
                        #print(price_tr-bar.getLow())
                        #print(bar.getHigh()-price_tr)
                        if (pdiff>0.0010):
                            self.price_error = self.price_error + 1
                            #print("="*10)
                            print("  pdiff={0}".format(pdiff))
                
                    else:
                        #price is ok
                        pass
                                
                    #print(b_in_price)

                    self.i_tr = self.i_tr + 1
                    if self.i_tr<len(self.dfTr):
                        dt_tr = self.dfTr.index[self.i_tr]
                    else:
                        print("break")
                        break
            
            #if (dt_tr>=dt2):
            #    print("Error2:")
                    
            
                    
        else:
            return

    def stop(self):
        #print("end of strategy")
        print("{0} price errors".format(myStrategy.price_error))
        print("missing_history={0}".format(self.missing_history))


# Load the MetaTrader feed from the CSV file
feed = metatraderfeed.Feed()
feed.addBarsFromCSV("EURUSD", "data/EURUSD15_AAAFX.csv", 0)

# Evaluate the strategy with the feed's bars.
myStrategy = MyStrategy(feed)
myStrategy.run()
myStrategy.stop()
