#!/usr/bin/env python

import pandas as pd
import matplotlib.pyplot as plt

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

df = pd.read_csv('Trade_History_denganyouqianle_19850320_20120805.csv', parse_dates=[[5, 6]])

df_profit=df['Profit (Pips)']
df_profit = df_profit.cumsum()

print(df_profit)

df_profit.plot()

plt.show()