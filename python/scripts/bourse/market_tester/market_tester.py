#!/usr/bin/env python

import pandas as pd
from datetime import date, datetime, timedelta

class MarketTester:
  def __init__(self):
    self.pair = 'EURUSD'

    self.dfMarketHistory = pd.read_csv('data/{0}15.csv'.format(self.pair), 
      names=['Date', 'Time', 'Open', 'High', 'Low', 'Close', 'Volume'], 
      index_col='Date_Time', parse_dates=[[0, 1]])
    
    self.dfTradesHistory = pd.read_csv('data/Trade_History_denganyouqianle_19850320_20120805.csv',
      converters={'Date Open': self.conv_str_to_datetime, 'Date Close': self.conv_str_to_datetime, 'Currency': self.conv_str_to_pair})

    def conv_str_to_datetime(self, x):
      return(datetime.strptime(x, '%Y/%m/%d %H:%M:%S'))

    def conv_str_to_pair(self, x):
      x=x.split('/')
      return(x[0]+x[1])

 
if __name__ == '__main__':
  mkt=MarketTester()

