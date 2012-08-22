#!/usr/bin/env python

from datetime import *
import numpy as np
import pandas as pd

def conv_str_to_datetime(x):
  return(datetime.strptime(x, '%Y/%m/%d %H:%M:%S'))

def conv_str_to_pair(x):
  x=x.split('/')
  return(x[0]+x[1])

def conv_strBuySell_to_int(x):
  if x.upper()=='BUY':
    return(1)
  elif x.upper()=='SELL':
    return(-1)
  else:
    return(0)

trade_history_filename_full = 'files/Trade_History_Full.csv'
trade_history_filename_symbols_list = 'files/Trade_History_Symbols_List.txt'
trade_history_filename_out_model = "files/Trade_History_out_{symbol}.csv"

df = pd.read_csv(trade_history_filename_full, converters={'Type': conv_strBuySell_to_int, 'Date Open': conv_str_to_datetime, 'Date Close': conv_str_to_datetime, 'Currency': conv_str_to_pair})

"""
Provider Ticket,Broker Ticket,Type,Currency,Standard Lots,Date Open,Date Close,Price Open,Price Close,Highest Profit (Pips),Worst Drawdown (Pips),Interest ($),Profit (Pips),Profit ($)
"""
# take only useful columns
df = df[['Type', 'Currency', 'Standard Lots', 'Date Open', 'Date Close', 'Price Open', 'Price Close']]

# sort DateOpen ascending
df = df.sort(axis=0, ascending=False)

print(df)

# rename cols
df = df.rename(columns={'Type': 'Type',
 'Currency': 'Symbol',
 'Standard Lots': 'Lots',
 'Date Open': 'DateOpen',
 'Date Close': 'DateClose',
 'Price Open': 'PriceOpen',
 'Price Close': 'PriceClose'
})

# reorder cols
df = df.reindex_axis(['Type', 'Symbol', 'Lots', 'DateOpen', 'PriceOpen', 'DateClose', 'PriceClose'], axis=1)

print(df)

# list of symbols
symbols = df['Symbol'].unique()

# write list of symbols in a file
f_sl = open(trade_history_filename_symbols_list, 'w')
for symbol in symbols:
  f_sl.write("{0}\n".format(symbol))
f_sl.close()

# for each symbol write a CSV file of trade
for symbol in symbols:
  #symbol = 'EURUSD'
  trade_history_filename_out = trade_history_filename_out_model.format(symbol=symbol)
  print("="*4+" Generating file {0} ".format(trade_history_filename_out)+"="*4)
  df_out = df[df['Symbol']==symbol] # only one symbol

  df_out.to_csv(trade_history_filename_out, index=False)