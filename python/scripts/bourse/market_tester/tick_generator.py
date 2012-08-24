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

  def start(self, t, Symbol, Bid, Ask, tickComment=''):
    pass
    #print("t={t} Symbol={Symbol} Bid={Bid} Ask={Ask} {Comment}".format(t=t, Symbol=Symbol, Bid=Bid, Ask=Ask, Comment=tickComment))

  def deinit(self):
    print("Deinitialize strategy '{name}'".format(name=self.name))

def generate_pseudo_ticks(i, df, symbol, strategy):
  # mode='OHLC'
  # 1:O 2:H 3:L 4:C
  t = df.index[i]
  Bid = df.irow(i)['Open']
  Spread = df.irow(i)['Spread']
  Ask = Bid + Spread
  strategy.start(t, symbol, Bid, Ask, 'Open')

  t = df.index[i] + timedelta(minutes=period/3.0)
  Bid = df.irow(i)['Low']
  Spread = df.irow(i)['Spread']
  Ask = Bid + Spread
  strategy.start(t, symbol, Bid, Ask, 'Low')

  t = df.index[i] + timedelta(minutes=(period/3.0)*2.0)
  Bid = df.irow(i)['High']
  Spread = df.irow(i)['Spread']
  Ask = Bid + Spread
  strategy.start(t, symbol, Bid, Ask, 'High')

  t = df.index[i] + (timedelta(minutes=period) - timedelta(seconds=1)) #timedelta(seconds=0.001)
  Bid = df.irow(i)['Close']
  Spread = df.irow(i)['Spread']
  Ask = Bid + Spread
  strategy.start(t, symbol, Bid, Ask, 'Close')

  # mode='OLHC'
  # 1:O 2:L 3:H 4:C
  
  # mode= use lower timeframe (if possible)


def backtest(df):
  print("Starting backtest")
  strategy = Strategy()
  strategy.init()
  for i in range(len(dfMB)):
    generate_pseudo_ticks(i, df, symbol, strategy)
  strategy.deinit()
  print("End of backtest")

"""====================================================================================="""

symbol = 'EURUSD'
period_string = 'M15'
PipPosition = 4 # 0.0001 (so 4 because 10^(-4)) for most pairs but for xxxJPY PipPosition=2
Period = periods_dict[period_string] # min

filename = "data/{symbol}{period}.csv".format(symbol=symbol, period=period)

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

backtest(dfMB)