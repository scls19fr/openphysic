#!/usr/bin/env python

import pandas as pd
from datetime import date, datetime, timedelta

"""
Objet permettant de lire les donnees du marche
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
Objet permettant de gerer les trades en cours
"""
class TradeBasket:
  def __init__(self):
    pass

"""
Objet permettant de gerer les trades clotures
"""
class TradeHistory:
  def __init__(self):
    pass


"""
Objet gerant toute la logique de backtest
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
    #self.MkPeriod = timedelta(0, 900) # ToFix : recuperer periodicite (WE??)
    # M15 = 900s
    self.MkPeriod = timedelta(minutes=self.period_min)
    
    # Trades history (full)
    self.dfTrFull = pd.read_csv('data/Trade_History_denganyouqianle_19850320_20120805.csv',
      converters={'Date Open': self.conv_str_to_datetime, 'Date Close': self.conv_str_to_datetime, 'Currency': self.conv_str_to_pair})
      
    self.dfTr = self.dfTrFull[self.dfTrFull['Currency']==self.pair] # Filter for same pair
    #self.dfTr = self.dfTr.sort(axis=0, ascending=False) # sort descending index
    self.dfTr = self.dfTr.sort(axis=0, ascending=True, columns='Date Open') # sort ascending date open
    
    # ajuster temps (garder uniquement partie commune)
    #intersection
    tr_min = min(self.dfTr['Date Open'])
    tr_max = max(self.dfTr['Date Close'])
    mk_min = min(self.dfMk.index)
    mk_max = max(self.dfMk.index)    
    dt_min = max(tr_min, mk_min)
    dt_max = min(tr_max, mk_max)
    #print(tr_min, tr_max, mk_min, mk_max, dt_min, dt_max)

    #self.dfTr = self.dfTr[self.dfTr['Date Open']>=dt_min & self.dfTr['Date Close']<=dt_max]
    self.dfTr = self.dfTr[self.dfTr['Date Open']>=dt_min]
    self.dfTr = self.dfTr[self.dfTr['Date Close']<=dt_max]
    self.dfMk = self.dfMk[self.dfMk.index>=dt_min]
    self.dfMk = self.dfMk[self.dfMk.index<=dt_max]
    
    print("=== Market history ===")
    print(self.dfMk)
    
    print("")
    
    print("=== Trades history ===")
    print(self.dfTr)

    print("")

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
    print(" > TR{0}\t{1}\t{2}\t{3}\t{4}\t{5}\t{6}".format(itr,
      itr0,
      self.dfTr.ix[itr0]['Type'],
      self.dfTr.ix[itr0]['Date Open'],
      self.dfTr.ix[itr0]['Price Open'],
      self.dfTr.ix[itr0]['Date Close'],
      self.dfTr.ix[itr0]['Price Close'],
    ))


  def next_trade(self):
    if self.itr<len(self.dfTr)-1:
      self.itr=self.itr+1
      self.itr0=self.dfTr.index[self.itr]
      return(True)
    else:
       self.itr = len(self.dfTr)-1
       return(False)

  def backtest(self):
    #imk=0 # indice market hist
    self.itr=0 # indice trades hist
    self.itr0=self.dfTr.index[self.itr]
    
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

    print("=== Backtesting ===")
    for self.imk in range(0, len(self.dfMk)):
      mk_dt_open = self.dfMk.index[self.imk]
      mk_dt_close = self.dfMk.index[self.imk]+self.MkPeriod
      tr_dt_open = self.dfTr.ix[self.itr0]['Date Open']
      tr_dt_close = self.dfTr.ix[self.itr0]['Date Close']


      if tr_dt_open>=mk_dt_open and tr_dt_open<=mk_dt_close:
        self.print_market_candle(self.imk)
      
      while tr_dt_open>=mk_dt_open and tr_dt_open<=mk_dt_close:
        #print("open trade {0}".format(self.itr))
        self.print_trade(self.itr)
        
        
        if self.dfTr.ix[self.itr0]['Price Open']<self.dfMk.ix[self.imk]['Low'] or self.dfTr.ix[self.itr0]['Price Open']>self.dfMk.ix[self.imk]['High']:
          print("  *** open out of price range ***")
        
        if self.next_trade():
          tr_dt_open = self.dfTr.ix[self.itr0]['Date Open']
          tr_dt_close = self.dfTr.ix[self.itr0]['Date Close']
        else:
          print(">>> no more trades <<<")
          break

      """
      while True:
        do_something()
        if condition():
          break
      """

    """
      if tr_dt_open<mk_dt_open:
        print(">>> Error : no market history for this trade <<<")
        self.print_market_candle(self.imk)
        self.print_trade(self.itr)
        #return()
        #self.next_trade()
        #imk = imk - 1
      #else:
    """
      
      #if self.dfTr.ix[itr0]['Date Open']<
      #self.print_market_candle(imk)
    
    
 
if __name__ == '__main__':
  mkt=MarketBacktester()

