#!/usr/bin/env python

import pandas as pd
from datetime import date, datetime, timedelta
import numpy as np

print("Tick generator")

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

symbol = 'EURUSD'
period_string = 'M15'
PipPosition = 4 # 0.0001 (so 4 because 10^(-4)) for most pairs but for xxxJPY PipPosition=2

filename = "data/{symbol}{period}.csv".format(symbol=symbol, period=periods_dict['M15'])

print("Reading {filename}".format(filename=filename))

    
dfMk = pd.read_csv(filename, 
      names=['Date', 'Time', 'Open', 'High', 'Low', 'Close', 'Volume'], 
      index_col='Date_Time', parse_dates=[[0, 1]])

print("End of reading {filename}".format(filename=filename))

