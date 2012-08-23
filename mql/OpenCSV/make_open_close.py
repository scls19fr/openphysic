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

def conv_strBuySell_to_str(x):
  if x.upper()=='BUY':
    return('BUY')
  elif x.upper()=='SELL':
    return('SELL')
  else:
    return('UNDEF')

trade_history_filename_full = 'files/Trade_History_Full.csv'

df = pd.read_csv(trade_history_filename_full, converters={'Type': conv_strBuySell_to_str, 'Date Open': conv_str_to_datetime, 'Date Close': conv_str_to_datetime, 'Currency': conv_str_to_pair})

"""
Provider Ticket,Broker Ticket,Type,Currency,Standard Lots,Date Open,Date Close,Price Open,Price Close,Highest Profit (Pips),Worst Drawdown (Pips),Interest ($),Profit (Pips),Profit ($)
"""
# take only useful columns
df = df[['Type', 'Currency', 'Standard Lots', 'Date Open', 'Date Close', 'Price Open', 'Price Close']]


#print(df)

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
#df = df.reindex_axis(['Action', 'Type', 'Symbol', 'Lots', 'DateOpen', 'PriceOpen', 'DateClose', 'PriceClose'], axis=1)

# sort DateOpen ascending
#df = df.sort(axis=0, ascending=False)
df = df.sort(columns='DateOpen')

# list of symbols
symbols = df['Symbol'].unique()

# Add PseudoTicket col
df['PseudoTicket'] = np.arange(1, len(df)+1)

print("="*4+" DataFrame "+"="*4)
#print(df)

print("="*4+" DataFrame Open "+"="*4)
dfOpen = df[['Type', 'Symbol', 'Lots', 'DateOpen', 'PriceOpen']]
dfOpen['Action'] = 'OPEN'
dfOpen = dfOpen.rename(columns={
  'DateOpen': 'Date',
  'PriceOpen': 'Price'
})
#print(dfOpen)

#print("="*20+" Debug "+"="*20)
#print(df)

print("="*4+" DataFrame Close "+"="*4)
dfClose = df[['Type', 'Symbol', 'Lots', 'DateClose', 'PriceClose']]
dfClose['Action'] = 'CLOSE'
dfOpen = dfOpen.rename(columns={
  'DateClose': 'Date',
  'PriceClose': 'Price'
})
#print(dfClose)

#Generate new DataFrame with OPEN BUY/SELL and CLOSE (sort ascending Date)

#dfOpenClose = dfOpenClose.sort(columns='Date')


#
df.to_csv('files/df.csv', index=False)
dfOpen.to_csv('files/dfOpen.csv', index=False)
dfClose.to_csv('files/dfClose.csv', index=False)
#dfOpenClose.to_csv('files/dfOpenClose.csv', index=False)

#print(df)