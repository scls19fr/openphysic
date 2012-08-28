#!/usr/bin/env python
# -*- coding: utf8 -*-

from datetime import *
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.finance import candlestick

filename1 = 'data/EURUSD15_ALPNZ2.csv'
zone1 = 3

filename2 = 'data/EURUSD15_AAAFX2.csv'
zone2 = 0

dfMk1 = pd.read_csv(filename1, 
      names=['Date', 'Time', 'Open', 'High', 'Low', 'Close', 'Volume'], 
      index_col='Date_Time', parse_dates=[[0, 1]])

dfMk2 = pd.read_csv(filename2, 
      names=['Date', 'Time', 'Open', 'High', 'Low', 'Close', 'Volume'], 
      index_col='Date_Time', parse_dates=[[0, 1]])

# zone: The zone specifies the offset from Coordinated Universal Time (UTC, formerly referred to as "Greenwich Mean Time") 
dfMk1.index = dfMk1.index - timedelta(hours=zone1)
dfMk2.index = dfMk2.index - timedelta(hours=zone2)

"""zone1=3 zone2=2"""
"""
dt1 = datetime(year=2011, month=1, day=1)
dt2 = datetime(year=2011, month=1, day=5)
df1 = dfMk1[(dfMk1.index>=dt1) & (dfMk1.index<dt2)]
df2 = dfMk2[(dfMk2.index>=dt1) & (dfMk2.index<dt2)]
"""

"""zone1=3 zone2=0"""
dt1 = datetime(year=2012, month=8, day=1)
dt2 = datetime(year=2012, month=8, day=5)
df1 = dfMk1[(dfMk1.index>=dt1) & (dfMk1.index<dt2)]
df2 = dfMk2[(dfMk2.index>=dt1) & (dfMk2.index<dt2)]

df1['Close'].plot()
df2['Close'].plot()

plt.show()