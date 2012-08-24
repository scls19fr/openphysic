#!/usr/bin/env python

import pandas as pd
from datetime import date, datetime, timedelta
import numpy as np

print("""Tick generator
a little framework to backtest strategies""")

print("="*40)

periods_dict = dict({
  'M1': 1,
  'M5': 5,
  'M15': 15,
  'M30': 30,
  'H1': 60,
  'H4': 240,
  'D1': 1440,
  'W1': 10080,
  'MN': 43200
})


periods_list = [('M1', 1),
 ('M5', 5),
 ('M15', 15),
 ('M30', 30),
 ('H1', 60),
 ('H4', 240),
 ('D1', 1440),
 ('W1', 10080),
 ('MN', 43200)]

class Strategy:
  def __init__(self, name="New Strategy"):
    self.name = name
  
  def init(self):
    print("Initialize strategy '{name}'".format(name=self.name))

  def start(self, t, df, Symbol, Period, Bid, Ask, tickComment=''):
    #pass
    print("t={t} Symbol={Symbol} Bid={Bid} Ask={Ask} {Comment}".format(t=t, Symbol=Symbol, Bid=Bid, Ask=Ask, Comment=tickComment))
    #print(df.irow(0))

  def deinit(self):
    print("Deinitialize strategy '{name}'".format(name=self.name))

def generate_pseudo_ticks(i, df, symbol, period, strategy):
  # restrict df to past and current
  df2 = df.copy() # tofix
  df2 = df2.sort(ascending=False) # should be done before and passed as argument (to avoid to do it several time)
  df2 = df2[len(df2)-i-1:len(df2)]

  #df2.irow(len(df2)-i-1)['Open'] = df.irow(i)['Open']

  # mode='OHLC'
  # 1:O 2:H 3:L 4:C
  #   OHLC=OOOO
  df2.irow(len(df2)-i-1)['High'] = df.irow(i)['Open'] # tofix
  df2.irow(len(df2)-i-1)['Low'] = df.irow(i)['Open']
  df2.irow(len(df2)-i-1)['Close'] = df.irow(i)['Open']
  
  print(df2.irow(len(df2)-i-1))
  
  print(df.irow(i))
  
  t = df.index[i]
  bid = df.irow(i)['Open']
  spread = df.irow(i)['Spread']
  ask = bid + spread
  strategy.start(t, df2, symbol, period, bid, ask, 'Open')

  #   OHLC=OOLL
  df2.irow(len(df2)-i-1)['High'] = df.irow(i)['Open']
  df2.irow(len(df2)-i-1)['Low'] = df.irow(i)['Low']
  df2.irow(len(df2)-i-1)['Close'] = df.irow(i)['Low']

  t = df.index[i] + timedelta(minutes=period/3.0)
  bid = df.irow(i)['Low']
  spread = df.irow(i)['Spread']
  ask = bid + spread
  strategy.start(t, df2, symbol, period, bid, ask, 'Low')

  #   OHLC=OHLH
  df2.irow(len(df2)-i-1)['High'] = df.irow(i)['High']
  df2.irow(len(df2)-i-1)['Low'] = df.irow(i)['Low']
  df2.irow(len(df2)-i-1)['Close'] = df.irow(i)['High']

  t = df.index[i] + timedelta(minutes=(period/3.0)*2.0)
  bid = df.irow(i)['High']
  spread = df.irow(i)['Spread']
  ask = bid + spread
  strategy.start(t, df2, symbol, period, bid, ask, 'High')

  #   OHLC=OHLC
  df2.irow(len(df2)-i-1)['High'] = df.irow(i)['High']
  df2.irow(len(df2)-i-1)['Low'] = df.irow(i)['Low']
  df2.irow(len(df2)-i-1)['Close'] = df.irow(i)['Close']

  t = df.index[i] + (timedelta(minutes=period) - timedelta(seconds=1)) #timedelta(seconds=0.001)
  bid = df.irow(i)['Close']
  spread = df.irow(i)['Spread']
  ask = bid + spread
  strategy.start(t, df2, symbol, period, bid, ask, 'Close')

  # mode='OLHC'
  # 1:O 2:L 3:H 4:C
  
  # mode= use lower timeframe (if possible)


def backtest(df, Symbol, Period):
  print("Starting backtest")
  strategy = Strategy()
  strategy.init()
  for i in range(len(dfMB)):
    generate_pseudo_ticks(i, df, Symbol, Period, strategy)
  strategy.deinit()
  print("End of backtest")

"""====================================================================================="""

Symbol = 'EURUSD'
period_string = 'M15'
PipPosition = 4 # 0.0001 (so 4 because 10^(-4)) for most pairs but for xxxJPY PipPosition=2
Period = periods_dict[period_string] # min

filename = "data/{symbol}{period}.csv".format(symbol=Symbol, period=Period)

print("Reading {filename}".format(filename=filename))

print(" it can be quite long !")
    
dfMk = pd.read_csv(filename, 
      names=['Date', 'Time', 'Open', 'High', 'Low', 'Close', 'Volume'], 
      index_col='Date_Time', parse_dates=[[0, 1]])

print("End of reading {filename}".format(filename=filename))

print("{pts} points in file".format(pts=len(dfMk)))

print("="*40)

dt_start = datetime(2011, 5, 16, 0, 0, 0)
dt_end = datetime(2011, 6, 16, 0, 0, 0)
SpreadPips = 2.1 # pips
dfMk['Spread'] = SpreadPips * 10.0**(-PipPosition)

b_select = (dfMk.index>=dt_start) & (dfMk.index<=dt_end)
dfMB = dfMk[b_select] # MB = market backtester from
print("Selecting {pts} points of data from {dt1} to {dt2}".format(pts=len(dfMB), dt1=dt_start, dt2=dt_end))

print("="*40)

backtest(dfMB, Symbol, Period)