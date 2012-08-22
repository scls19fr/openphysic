#!/usr/bin/env python

import pandas as pd
from datetime import *
import sys
import csv

def conv_str_to_datetime(x):
  return(datetime.strptime(x, '%Y/%m/%d %H:%M:%S'))

def conv_str_to_pair(x):
  x=x.split('/')
  return(x[0]+x[1])

trade_history_filename_full = 'files/Trade_History_Full.csv'

df = pd.read_csv(trade_history_filename_full, converters={'Date Open': conv_str_to_datetime, 'Date Close': conv_str_to_datetime, 'Currency': conv_str_to_pair})

"""
Provider Ticket,Broker Ticket,Type,Currency,Standard Lots,Date Open,Date Close,Price Open,Price Close,Highest Profit (Pips),Worst Drawdown (Pips),Interest ($),Profit (Pips),Profit ($)
"""
df = df[['Type', 'Currency', 'Standard Lots', 'Date Open', 'Date Close', 'Price Open', 'Price Close']]

df = df.sort(axis=0, ascending=False) # sort DateOpen ascending

print(df)

# rename cols
"""
df.rename(columns={'Type': 'Type',
 'Currency': 'Currency',
 'Standard Lots': 'Lots',
 'Date Open': 'DateOpen',
 'Date Close': 'DateClose',
 'Price Open': 'PriceOpen',
 'Price Close': 'PriceClose'
}, copy=False)
""" 
print(df)

# list of symbols
symbols = df['Currency'].unique()

for symbol in symbols:
  #symbol = 'EURUSD'
  trade_history_filename_out = "files/Trade_History_out_{0}.csv".format(symbol)
  print("="*4+" Generating file {0} ".format(trade_history_filename_out)+"="*4)
  df_out = df[df['Currency']==symbol] # only one symbol

  df_out.to_csv(trade_history_filename_out, index=False)