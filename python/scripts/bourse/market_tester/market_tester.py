#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pandas as pd
from datetime import date, datetime, timedelta


"""
Objet permettant de lire les données du marché
"""
class MarketPlayer:
  def __init__(self):
    pass
    
  def next(self):
    pass

  def eof(self):
    pass

"""
Objet permettant de lire l'historique des trades
"""
class TradesPlayer:
  def __init__(self):
    pass

  def next(self):
    pass

  def eof(self):
    pass

"""
Objet permettant de gérer les trades en cours
"""
class TradeBasket:
  def __init__(self):
    pass

"""
Objet permettant de gérer les trades cloturés
"""
class TradeHistory:
  def __init__(self):
    pass


"""
Objet gérant toute la logique de backtest
"""
class MarketBacktester:
  def __init__(self):
    self.pair = 'EURUSD'
    self.period_min=15

    # Market history
    
    self.dfMk = pd.read_csv('data/{0}{1}.csv'.format(self.pair, self.period_min), 
      names=['Date', 'Time', 'Open', 'High', 'Low', 'Close', 'Volume'], 
      index_col='Date_Time', parse_dates=[[0, 1]])
      
    #self.MkPeriod = self.dfMk.index[100]-self.dfMk.index[99]
    #self.MkPeriod = timedelta(0, 900) # ToFix : récupérer périodicité
    # M15 = 900s
    self.MkPeriod = timedelta(minutes=self.period_min)
    
    # Trades history (full)
    self.dfTrFull = pd.read_csv('data/Trade_History_denganyouqianle_19850320_20120805.csv',
      converters={'Date Open': self.conv_str_to_datetime, 'Date Close': self.conv_str_to_datetime, 'Currency': self.conv_str_to_pair})
      
    self.dfTr = self.dfTrFull[self.dfTrFull['Currency']==self.pair] # Filter for same pair
    self.dfTr = self.dfTr.sort(axis=0, ascending=False) # sort ascending date
    
    self.backtest()

  def conv_str_to_datetime(self, x):
    return(datetime.strptime(x, '%Y/%m/%d %H:%M:%S'))

  def conv_str_to_pair(self, x):
    x=x.split('/')
    return(x[0]+x[1])

  def print_market_candle(self, imk):
    print("MK{0}\t{1}\t{2}\t{3}\t{4}\t{5}\t{6}\t{7}".format(imk,
      self.dfMk.index[imk],
      self.dfMk.ix[imk]['Open'],
      self.dfMk.ix[imk]['High'],
      self.dfMk.ix[imk]['Low'],
      self.dfMk.ix[imk]['Close'],
      self.dfMk.ix[imk]['Volume'],
      self.dfMk.index[imk]+self.MkPeriod
    ))

  def print_trade(self, itr):
    itr0=self.dfTr.index[itr]
    print(" > TR{0}\t{1}\t{2}\t{3}\t{4}\t{5}".format(itr,
      itr0,
      self.dfTr.ix[itr0]['Date Open'],
      self.dfTr.ix[itr0]['Price Open'],
      self.dfTr.ix[itr0]['Date Close'],
      self.dfTr.ix[itr0]['Price Close'],
    ))


#  def next_trade(self):
#    self.itr=self.itr+1
#    self.itr0=self.dfTr.index[itr]

  def backtest(self):
    #imk=0 # indice market hist
    itr=0 # indice trades hist
    itr0=self.dfTr.index[itr]
    
    """
    print("Market History")
    for imk in range(0, len(self.dfMk)):
      self.print_market_candle(imk)
    """
    
    """
    print("Trades History")
    for itr in range(0, len(self.dfTr)):
      self.print_trade(itr)
    """

    print("Market History")
    for imk in range(0, len(self.dfMk)):
      if self.dfTr.ix[itr0]['Date Open']<
      #self.print_market_candle(imk)
    
    
 
if __name__ == '__main__':
  mkt=MarketBacktester()

