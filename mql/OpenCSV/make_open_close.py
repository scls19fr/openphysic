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

"""
def orderOpenClose(s1, s2):
  if ( not ( (s1=='OPEN' or s1=='CLOSE') and (s2=='OPEN' or s2=='CLOSE') ) ):
    raise(Exception('OPEN/CLOSE error'))

  if s1=='OPEN' and s2=='CLOSE':
    return(True)
  elif s1=='CLOSE' and s2=='OPEN':
    return(False)
"""

def dfOpenClose2mql(df, filename):
  code = """//+------------------------------------------------------------------+
//|{filename}
//|                                 Copyright (c) 2012, Femto Trader |
//|                        http://sites.google.com/site/femtotrader/ |
//+------------------------------------------------------------------+
#property copyright "Copyright (c) 2012, Femto Trader"
#property link      "http://sites.google.com/site/femtotrader/"

int NbOrdersInFile = {NbOrdersInFile};

int aPseudoTicket[{NbOrdersInFile}];
int aAction[{NbOrdersInFile}]; // 1=OPEN 0=CLOSE
int aType[{NbOrdersInFile}];  // OP_BUY or OP_SELL
string aSymbol[{NbOrdersInFile}];
double aLots[{NbOrdersInFile}];
datetime aDate[{NbOrdersInFile}];
double aPrice[{NbOrdersInFile}];

int time_offset = 3;
""".format(filename=filename, NbOrdersInFile=len(df))
  code = code + '\n';

  code = code + 'void init_tab() {\n';

  for i in range(len(df)):
    index =  df.index[i]
    #print(df.get_value(index, 'Type'))
    code = code + '\n   // ' + '='*10 + ' {0} ===== {1} '.format(i, index) + '='*10 + '\n'
  
    code = code + '   {var}[{tab_index}] = {value};\n'.format(var='aPseudoTicket', tab_index=i, value=df.irow(i)['PseudoTicket'])

    if df.irow(i)['Action']=='OPEN':
      code = code + '   {var}[{tab_index}] = {value};\n'.format(var='aAction', tab_index=i, value=1)
    elif df.irow(i)['Action']=='CLOSE':
      code = code + '   {var}[{tab_index}] = {value};\n'.format(var='aAction', tab_index=i, value=0)

    if df.irow(i)['Type']=='BUY':
      code = code + "   {var}[{tab_index}] = {value};\n".format(var='aType', tab_index=i, value='OP_BUY')
    elif df.irow(i)['Type']=='SELL':
      code = code + "   {var}[{tab_index}] = {value};\n".format(var='aType', tab_index=i, value='OP_SELL')
    

    code = code + '   {var}[{tab_index}] = "{value}";\n'.format(var='aSymbol', tab_index=i, value=df.irow(i)['Symbol'])
    code = code + "   {var}[{tab_index}] = {value};\n".format(var='aLots', tab_index=i, value=df.irow(i)['Lots'])
    code = code + "   {var}[{tab_index}] = D'{value}'+time_offset*3600;\n".format(var='aDate', tab_index=i, value=df.irow(i)['Date'].strftime("%Y.%m.%d %H:%M:%S"))
    code = code + "   {var}[{tab_index}] = {value};\n".format(var='aPrice', tab_index=i, value=df.irow(i)['Price'])

  code = code + '}\n'
  
  return(code)

"""
Write file
"""
def generate_mql_code_openclose(df_out, filename):
  f = open(filename, 'w')

  code = dfOpenClose2mql(df_out, filename)
  #print(code)

  f.write(code)
  f.close()

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

# Remove trade when DateOpen=DateClose
#df = df[df['DateOpen']!=df['DateClose']]

# list of symbols
symbols = df['Symbol'].unique()

# Add PseudoTicket col
df['PseudoTicket'] = np.arange(1, len(df)+1)
#df['PseudoTicket'] = np.arange(len(df),0,-1)

print("="*4+" DataFrame "+"="*4)
#print(df)

print("="*4+" DataFrame Open "+"="*4)
dfOpen = df.copy()
dfOpen = dfOpen[['Type', 'Symbol', 'Lots', 'DateOpen', 'PriceOpen', 'PseudoTicket']]
dfOpen['Date'] = dfOpen['DateOpen']
dfOpen['Price'] = dfOpen['PriceOpen']
dfOpen['Action'] = 'OPEN'
#print(dfOpen)

#print("="*20+" Debug "+"="*20)
#print(df)

print("="*4+" DataFrame Close "+"="*4)
dfClose = df.copy()
dfClose = dfClose[['Type', 'Symbol', 'Lots', 'DateClose', 'PriceClose', 'PseudoTicket']]
dfClose['Date'] = dfClose['DateClose']
dfClose['Price'] = dfClose['PriceClose']
dfClose['Action'] = 'CLOSE'
#print(dfClose)

print("="*4+" DataFrame OpenClose "+"="*4)
#Generate new DataFrame with OPEN BUY/SELL and CLOSE (sort ascending Date)
dfOpenClose = pd.concat([dfOpen, dfClose])
#dfOpenClose = dfOpenClose.sort(columns='Action', ascending=False) # en cas d'egalite, mettre OPEN avant CLOSE
dfOpenClose = dfOpenClose.sort(columns='Date') # ToFix

dfOpenClose = dfOpenClose.reindex_axis(['PseudoTicket', 'Action', 'Type', 'Symbol', 'Lots', 'Date', 'Price'], axis=1)


#print(dfOpenClose)

#
#df.to_csv('files/df.csv', index=False)
#dfOpen.to_csv('files/dfOpen.csv', index=False)
#dfClose.to_csv('files/dfClose.csv', index=False)
dfOpenClose.to_csv('files/Trade_History_out_OpenClose_all_symbols.csv', index=True)

#print(df)

#print()

generate_mql_code_openclose(dfOpenClose, 'include/Trade_History_out_OpenClose_all_symbols.mqh')


