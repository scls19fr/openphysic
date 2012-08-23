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

"""
Return string
"""
def df2mql(df_out, filename):
  code = """//+------------------------------------------------------------------+
//|{filename}
//|                                 Copyright (c) 2012, Femto Trader |
//|                        http://sites.google.com/site/femtotrader/ |
//+------------------------------------------------------------------+
#property copyright "Copyright (c) 2012, Femto Trader"
#property link      "http://sites.google.com/site/femtotrader/"

int NbOrdersInFile = {NbOrdersInFile};

int aType[{NbOrdersInFile}];
string aSymbol[{NbOrdersInFile}];
double aLots[{NbOrdersInFile}];
datetime aDateOpen[{NbOrdersInFile}];
double aPriceOpen[{NbOrdersInFile}];
datetime aDateClose[{NbOrdersInFile}];
double aPriceClose[{NbOrdersInFile}];

int time_offset = 3;
""".format(filename=filename, NbOrdersInFile=len(df_out))
  code = code + '\n';

  code = code + 'void init_tab() {\n';

  for i in range(len(df_out)):
    index =  df_out.index[i]
    #print(df_out.get_value(index, 'Type'))
    code = code + '\n   // ' + '='*10 + ' {0} ===== {1} '.format(i, index) + '='*10 + '\n'
  
    if df_out.get_value(index, 'Type')==1:
      code = code + "   {var}[{tab_index}] = {value};\n".format(var='aType', tab_index=i, value='OP_BUY')
    elif df_out.get_value(index, 'Type')==-1:
      code = code + "   {var}[{tab_index}] = {value};\n".format(var='aType', tab_index=i, value='OP_SELL')
  
    code = code + '   {var}[{tab_index}] = "{value}";\n'.format(var='aSymbol', tab_index=i, value=df_out.get_value(index, 'Symbol'))
    code = code + "   {var}[{tab_index}] = {value};\n".format(var='aLots', tab_index=i, value=df_out.get_value(index, 'Lots'))
    #code = code + "   {var}[{tab_index}] = D'{value}';\n".format(var='aDateOpen', tab_index=i, value=df_out.get_value(index, 'DateOpen')) # D'1980.07.19 12:30:27'
    code = code + "   {var}[{tab_index}] = D'{value}'+time_offset*3600;\n".format(var='aDateOpen', tab_index=i, value=df_out.get_value(index, 'DateOpen').strftime("%Y.%m.%d %H:%M:%S"))
    code = code + "   {var}[{tab_index}] = {value};\n".format(var='aPriceOpen', tab_index=i, value=df_out.get_value(index, 'PriceOpen'))
    #code = code + "   {var}[{tab_index}] = D'{value}';\n".format(var='aDateClose', tab_index=i, value=df_out.get_value(index, 'DateClose'))
    code = code + "   {var}[{tab_index}] = D'{value}'+time_offset*3600;\n".format(var='aDateClose', tab_index=i, value=df_out.get_value(index, 'DateClose').strftime("%Y.%m.%d %H:%M:%S"))
    code = code + "   {var}[{tab_index}] = {value};\n".format(var='aPriceClose', tab_index=i, value=df_out.get_value(index, 'PriceClose'))

  code = code + '}\n'
  
  return(code)
  
"""
Write file
"""
def generate_mql_code(df_out, filename):
  f = open(filename, 'w')

  code = df2mql(df_out, filename)
  #print(code)

  f.write(code)
  f.close()

trade_history_filename_full = 'files/Trade_History_Full.csv'

trade_history_filename_symbols_list = 'files/Trade_History_out__Symbols_List.txt'

trade_history_filename_out_clean = 'files/Trade_History_out_History__all_symbols.csv'
trade_history_filename_out_model = "files/Trade_History_out_History_{symbol}.csv"

trade_history_filename_out_code_all_symbols = 'include/Trade_History_out_History__all_symbols.mqh'
trade_history_filename_out_code_symbol_model = "include/Trade_History_out_History_{symbol}.mqh"

df = pd.read_csv(trade_history_filename_full, converters={'Type': conv_strBuySell_to_int, 'Date Open': conv_str_to_datetime, 'Date Close': conv_str_to_datetime, 'Currency': conv_str_to_pair})

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
df = df.reindex_axis(['Type', 'Symbol', 'Lots', 'DateOpen', 'PriceOpen', 'DateClose', 'PriceClose'], axis=1)

# sort DateOpen ascending
#df = df.sort(axis=0, ascending=False)
df = df.sort(columns='DateOpen')

# list of symbols
symbols = df['Symbol'].unique()

# write list of symbols in a file
f_sl = open(trade_history_filename_symbols_list, 'w')
for symbol in symbols:
  f_sl.write("{0}\n".format(symbol))
f_sl.close()


print("="*4+" Generating CSV file {0} ".format(trade_history_filename_out_clean)+"="*4)
df.to_csv(trade_history_filename_out_clean, index=False)
#print(df)
print("="*4+" Generating MQL file {0} ".format(trade_history_filename_out_code_all_symbols)+"="*4)
generate_mql_code(df, trade_history_filename_out_code_all_symbols)

for symbol in symbols:
  #symbol = 'EURUSD'
  df_out = df[df['Symbol']==symbol] # only one symbol

  # for each symbol write a CSV file of trade
  trade_history_filename_out = trade_history_filename_out_model.format(symbol=symbol)
  print("="*4+" Generating CSV file {0} ".format(trade_history_filename_out)+"="*4)
  df_out = df[df['Symbol']==symbol] # only one symbol
  #print(df_out)
  df_out.to_csv(trade_history_filename_out, index=False)

  # for each symbol write a MQL file of trade
  trade_history_filename_out_code_symbol = trade_history_filename_out_code_symbol_model.format(symbol=symbol)
  print("="*4+" Generating MQL file {0} ".format(trade_history_filename_out_code_symbol)+"="*4)
  #print(df_out)
  generate_mql_code(df_out, trade_history_filename_out_code_symbol)
