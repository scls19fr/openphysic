#!/usr/bin/env python

import pandas as pd
from datetime import date, datetime, timedelta

class MarketTester:
  def __init__(self):
    self.pair = 'EURUSD'

    # Market history
    self.dfMk = pd.read_csv('data/{0}15.csv'.format(self.pair), 
      names=['Date', 'Time', 'Open', 'High', 'Low', 'Close', 'Volume'], 
      index_col='Date_Time', parse_dates=[[0, 1]])
    
    # Trades history (full)
    self.dfTrFull = pd.read_csv('data/Trade_History_denganyouqianle_19850320_20120805.csv',
      converters={'Date Open': self.conv_str_to_datetime, 'Date Close': self.conv_str_to_datetime, 'Currency': self.conv_str_to_pair})
      
    self.dfTr = self.dfTrFull[self.dfTrFull['Currency']==self.pair]
    
    self.backtest()

  def conv_str_to_datetime(self, x):
    return(datetime.strptime(x, '%Y/%m/%d %H:%M:%S'))

  def conv_str_to_pair(self, x):
    x=x.split('/')
    return(x[0]+x[1])

  def print_market_candle(self, imk):
    print("{0} {1} {2} {3} {4} {5} {6}".format(imk,
      self.dfMk.index[imk],
      self.dfMk.ix[imk]['Open'],
      self.dfMk.ix[imk]['High'],
      self.dfMk.ix[imk]['Low'],
      self.dfMk.ix[imk]['Close'],
      self.dfMk.ix[imk]['Volume']
    ))

  def backtest(self):
    imk=0 # indice market hist
    itr=0 # indice trades hist
    
    for imk in range(0, len(self.dfMk)):
      self.print_market_candle(imk)

 
if __name__ == '__main__':
  mkt=MarketTester()

