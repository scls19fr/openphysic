#!/usr/bin/env python

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from pylab import figure, plot, show, grid, title, xlabel, ylabel, subplot, bar, np, xticks # plot
from matplotlib.finance import candlestick

print("Trade history")

"""
Provider Ticket
Broker Ticket
Type
Currency
Standard Lots
Date Open
Date Close
Price Open
Price Close
Highest Profit (Pips)
Worst Drawdown (Pips)
Interest ($)
Profit (Pips)
Profit ($)
"""

#df = pd.read_csv('Trade_History_denganyouqianle_19850320_20120805.csv')
#df = pd.read_csv('Trade_History_denganyouqianle_19850320_20120805.csv', parse_dates=[[5, 6]], index_col=0)
df = pd.read_csv('Trade_History_denganyouqianle_19850320_20120805.csv', parse_dates=6, index_col=6)
df=df.sort(axis=0, ascending=True)
#df=df.sort(axis=0, ascending=False, column='Date Close')

#print(df['Profit (Pips)'])

#print(df.head())

df_profit_pips_cum = df['Profit (Pips)'].cumsum()

df_profit_pips_cum.plot()
#df_profit_pips.plot()

#plt.show()

#val = df.values
#print(val[0][0])

#print(df['Profit (Pips),Profit ($)'])

#print(df.values)

Date = range(1,len(df)+1)
Open = np.zeros(len(df))
High = df['Highest Profit (Pips)'].values
Low = df['Worst Drawdown (Pips)'].values
Close = df['Profit (Pips)'].values
Volume = np.zeros(len(df))
#OHLC = [Open,High,Low,Close]

#print(Date)
#print(Open)
#print(High)
#print(Low)
#print(Close)
#print(Volume)
#print(OHLC)

DOCHLV = []
for i in range(len(df)):
  DOCHLV.append((i+1, Open[i], Close[i], High[i], Low[i], Volume[i]))

#print(DOCHLV)

fig = figure()
fig.subplots_adjust(bottom=0.1)
ax = fig.add_subplot(111)
# [(1, 0, 12.0, 12.0, -16.0, 0), ... (Date,Open,Close,High,Low,Volume)]
candlestick(ax, DOCHLV, width=0.6, colorup='g', colordown='r', alpha=1.0)

show()
