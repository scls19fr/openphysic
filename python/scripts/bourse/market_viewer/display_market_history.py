#!/usr/bin/env python

import pandas as pd
import matplotlib.pyplot as plt
from matplotlib.finance import *
from matplotlib.dates import date2num
import sys
from datetime import date, datetime, timedelta

class MarketViewer:
  def __init__(self):
    self.pair = 'EURUSD'

    self.df = pd.read_csv('data/{0}15.csv'.format(self.pair), 
      names=['Date', 'Time', 'Open', 'High', 'Low', 'Close', 'Volume'], 
      index_col='Date_Time', parse_dates=[[0, 1]])

    #imax = len(self.df)-1

    self.fig = plt.figure()
    
    self.fig.canvas.mpl_connect('key_press_event', self.on_press)

    self.page = 0
    
    #self.show_page()

    self.N = 200 # nb points
    self.inc = 0.25 # increment page

    #self.goto_page(0)    
    self.goto_page_end(0)
    
    #dt = datetime(2012, 3, 8)
    #self.goto_datetime(dt)

    self.show_page()
  
  def next_page(self):
    self.page = self.page + self.inc
    
    if self.page>=float(len(self.df))/self.N:
      self.page=0
    
  def previous_page(self):
    self.page = self.page - self.inc
    
    if self.page<0:
      self.page=len(self.df)/self.N

  def goto_page(self, page):
    if page>=0 and page<float(len(self.df))/self.N:
      self.page = page
    else:
      self.page = 0

  def goto_page_end(self, page):
    self.page = len(self.df)/self.N-page

  def goto_datetime(self, dt):
    print(dt)
    x = dt-min(self.df.index)
    y = max(self.df.index)-min(self.df.index)
    p = (x.total_seconds()/y.total_seconds())*len(self.df)/self.N
    p=int(p/self.inc)*self.inc
    self.goto_page(p)
  
  def show_page(self):
    
    #print("nb pages = {0}".format(float(len(df))/N))

    iwmin=self.page*self.N
    iwmax=(self.page+1)*self.N
  
    v_df = self.df[iwmin:iwmax]

    print("page={0}/{1} - N={2}".format(self.page, len(self.df)/self.N, len(v_df)))

    #print(v_df)
    self.fig.subplots_adjust(bottom=0.1)
    self.ax = self.fig.add_subplot(111)


    Date = range(1,len(v_df)+1)
    #Date = date2num(v_df.index)
    Open = v_df['Open'].values
    High = v_df['High'].values
    Low = v_df['Low'].values
    Close = v_df['Close'].values
    Volume = v_df['Volume'].values
    DOCHLV = zip(Date, Open, Close, High, Low, Volume)
    
    # [(1, 0, 12.0, 12.0, -16.0, 0), ... (Date,Open,Close,High,Low,Volume)]
    plt.title("{0} from {1} to {2}".format(self.pair, min(v_df.index), max(v_df.index)))
    #plt.title("{0} from {1} to {2}".format(self.pair, v_df.index[iwmin], v_df.index[iwmax]))
    #ax.xaxis.set_major_locator(mondays)
    #ax.xaxis.set_minor_locator(alldays)
    #ax.xaxis.set_major_formatter(weekFormatter)
    #ax.xaxis.set_minor_formatter(dayFormatter)
    candlestick(self.ax, DOCHLV, width=0.6, colorup='g', colordown='r', alpha=1.0)

    #plt.show()

    self.fig.canvas.draw()

  def on_press(self, event):
    'define some key press events'
    #if self.lastind is None: return

    if event.key in ('q','Q'): sys.exit()

    if event.key not in ('k', 'j', 'g', 'd'): return
    
    if event.key=='k':
      #print("next")
      self.next_page()
      
    elif event.key=='j':
      #print("previous")
      self.previous_page()
    
    elif event.key=='g':
      print("goto page ?")
      p = input()
      self.goto_page(p)
      
      
    elif event.key=='d':
      print("goto datetime yyyymmddHHMM ?")
      d = input()
      #...
      self.goto_datetime(d)
    
    # goto datetime
    
    self.fig.clf()
    
    self.show_page()
 
if __name__ == '__main__':
  mkv=MarketViewer()

plt.show()