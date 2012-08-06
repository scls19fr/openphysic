#!/usr/bin/env python

import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from pylab import figure, plot, show, grid, title, xlabel, ylabel, subplot, bar, np, xticks # plot
from matplotlib.finance import candlestick
from datetime import *
from scipy import optimize # http://docs.scipy.org/doc/scipy/reference/tutorial/optimize.html

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

def invert_trades(df):
  df['Profit (Pips)'] = -df['Profit (Pips)']
  df['temp'] = df['Highest Profit (Pips)']
  df['Highest Profit (Pips)'] = -df['Worst Drawdown (Pips)']
  df['Worst Drawdown (Pips)'] = -df['temp']
  del df['temp']

def conv_str_to_datetime(x):
  return(datetime.strptime(x, '%Y/%m/%d %H:%M:%S'))

def apply_strategy(df, SL, TP, mode=None):
  # optimistic : SL code and TP code
  # pessimistic : TP code and SL code

  #b_hit_sl=
  #b_hit_tp=

  b_hit_tp = df['Highest Profit (Pips)']>TP
  b_hit_sl = df['Worst Drawdown (Pips)']<-SL
  b_hit_sl_AND_tp = b_hit_tp & b_hit_sl
  b_hit_sl_OR_tp = b_hit_tp | b_hit_sl
  
  b_clip_profit_tp = df['Profit (Pips)']>TP
  b_clip_profit_sl = df['Profit (Pips)']<-SL

  df['New Profit (Pips)']=df['Profit (Pips)']

  if mode=='pessimistic' or mode=='optimistic':
    df['New Profit (Pips)']=np.where(b_clip_profit_tp,TP,df['New Profit (Pips)'])
    df['New Profit (Pips)']=np.where(b_clip_profit_sl,-SL,df['New Profit (Pips)'])


  if mode=='pessimistic':
    print("mode = pessimistic")
    # Apply TP Take Profit
    df['New Profit (Pips)']=np.where(b_hit_tp,TP,df['New Profit (Pips)'])

    # Apply SL Stop Loss
    df['New Profit (Pips)']=np.where(b_hit_sl,-SL,df['New Profit (Pips)'])

    #df['New Profit (Pips)']=np.where(b_clip_profit_sl,-SL,df['New Profit (Pips)'])
    #df['New Profit (Pips)']=np.where(b_clip_profit_tp,TP,df['New Profit (Pips)'])
    

    
  elif mode=='optimistic':
    print("mode = optimistic")
    # Apply SL Stop Loss
    df['New Profit (Pips)']=np.where(b_hit_sl,-SL,df['New Profit (Pips)'])

    # Apply TP Take Profit
    df['New Profit (Pips)']=np.where(b_hit_tp,TP,df['New Profit (Pips)'])

    #df['New Profit (Pips)']=np.where(b_clip_profit_sl,-SL,df['New Profit (Pips)'])
    #df['New Profit (Pips)']=np.where(b_clip_profit_tp,TP,df['New Profit (Pips)'])
    
  else:
    print("mode = Undef")
  

  #df_profit_pips_cum = df['New Profit (Pips)'].cumsum()
  
  df['New Cumsum Profit (Pips)'] = df['New Profit (Pips)'].cumsum()

  #print("idxmax={0}".format(df_profit_pips_cum.idxmax()))
  ##print("date close={0}".format(df.irow(df_profit_pips_cum.idxmax())['Date Close']))
  #print("max={0}".format(df_profit_pips_cum.max()))

  #df_profit_pips_cum_max = df_profit_pips_cum.max()
  df_profit_pips_cum_max = df['New Cumsum Profit (Pips)'].max()

  print("""SL={0}
TP={1}
profit_pips_cum_max={2}
===""".format(SL,TP,df_profit_pips_cum_max))

  #return((df_profit_pips_cum, df_profit_pips_cum_max))
  return(df_profit_pips_cum_max)

#df = pd.read_csv('Trade_History_denganyouqianle_19850320_20120805.csv')
df = pd.read_csv('Trade_History_denganyouqianle_19850320_20120805.csv', converters={'Date Open': conv_str_to_datetime, 'Date Close': conv_str_to_datetime})

#df = pd.read_csv('Trade_History_denganyouqianle_19850320_20120805.csv', parse_dates=6, index_col=6)

#df = pd.read_csv('Trade_History_denganyouqianle_19850320_20120805.csv', parse_dates=[[5, 6]], index_col=0)
#df = pd.read_csv('Trade_History_denganyouqianle_19850320_20120805.csv', parse_dates=6, index_col=6)
# todo : il faudrait que les dates open et close soient parsees
#df['Duration']=df['Date Close']-df['Date Open']

#print(df.to_string(columns=['Currency', 'Date Open', 'Date Close', 'Profit (Pips)'],index=True))

#print(df.to_string())

#df=df[df['Date Close']<datetime(2011,9,1)]


#df=df[df['Profit (Pips)']>100] # filter

#for row in df:
#	print row

df=df.sort(axis=0, ascending=False)
#df=df.reindex(index=['Date Close'])

df['Cumsum Profit (Pips)'] = df['Profit (Pips)'].cumsum()


#invert_trades(df)

#df=df.sort(axis=0, ascending=True, columns='Date Close')
#df=df.sort(axis=0, ascending=False)
#df=df.sort(axis=0, ascending=False, column='Date Close')
#df=df.sort(axis=0, ascending=True)

#df=df[1:100]
#df=df[df['Date Open']>datetime(2012,1,1)] # tofix
#df=df[len(df)-100:len(df)] # derniers trades


#pd.set_printoptions(precision=2)

#df_resume = df.describe()
#for key in df_resume:
#  print("="*3+" {0} ".format(key) + "="*3)
#  print(df.describe()[key])
#  print("")



#print(df)

mode=None
#mode='optimistic'
#mode='pessimistic'
#1462.5

#SL=100
#TP=50

SL=70
TP=50


#results = apply_strategy(df, SL, TP, mode)
#df_profit_pips_cum = results[0]
#df_profit_pips_cum_max = results[1]

df_profit_pips_cum_max = apply_strategy(df, SL, TP, mode)

"""
df_profit_pips_cum_max_max=0
SLmax=0
TPmax=0

for SL in range(1,200,1):
  for TP in range(1,200,1):
    df_profit_pips_cum_max = apply_strategy(df, SL, TP, mode)
    if df_profit_pips_cum_max>df_profit_pips_cum_max_max:
      df_profit_pips_cum_max_max=df_profit_pips_cum_max
      SLmax=SL
      TPmax=TP

print("!!! MAX !!!")
df_profit_pips_cum_max = apply_strategy(df, SLmax, TPmax, mode)
"""


"""
for SL in range(50,200,1):
  for TP in range(50,200,1):
!!! MAX !!!
mode = pessimistic
SL=86
TP=50
profit_pips_cum_max=1505.8

"""


# ToDo : optimize ; Panel ? ; colormap
# optimization de l'ecart quadratique (ecart type - ratio de Sharpe) et de la pente

#Date = df.index # TypeError: unsupported operand type(s) for -: 'Timestamp' and 'float'
Date = range(1,len(df)+1)
#Date = range(len(df)+1,1,-1)
Open = np.zeros(len(df))
High = df['Highest Profit (Pips)'].values
Low = df['Worst Drawdown (Pips)'].values
Close = df['Profit (Pips)'].values
newClose = df['New Profit (Pips)'].values
Volume = np.zeros(len(df))
DOCHLV = zip(Date, Open, Close, High, Low, Volume)
newDOCHLV = zip(Date, Open, newClose, High, Low, Volume)

#print(DOCHLV)

fig = figure()
fig.subplots_adjust(bottom=0.1)

ax = fig.add_subplot(221)
# [(1, 0, 12.0, 12.0, -16.0, 0), ... (Date,Open,Close,High,Low,Volume)]
candlestick(ax, DOCHLV, width=0.6, colorup='g', colordown='r', alpha=1.0)

ax = fig.add_subplot(222)
# [(1, 0, 12.0, 12.0, -16.0, 0), ... (Date,Open,Close,High,Low,Volume)]
candlestick(ax, newDOCHLV, width=0.6, colorup='g', colordown='r', alpha=1.0)

subplot(223)
#df_profit_pips_cum.plot()
df['Cumsum Profit (Pips)'].plot()

subplot(224)
#df_profit_pips_cum.plot()
df['New Cumsum Profit (Pips)'].plot()

show()

#print(df['Duration'])

#fig2 = figure()
#df[['Duration', 'Profit (Pips)']].plot() #?

#show()