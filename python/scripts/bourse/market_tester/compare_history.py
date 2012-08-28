#!/usr/bin/env python
# -*- coding: utf8 -*-

from datetime import *
import pandas as pd

filename1 = 'data/EURUSD15.csv'
filename2 = 'data/EURUSD15_AAAFX.csv'

dfMk1 = pd.read_csv(filename1, 
      names=['Date', 'Time', 'Open', 'High', 'Low', 'Close', 'Volume'], 
      index_col='Date_Time', parse_dates=[[0, 1]])

dfMk2 = pd.read_csv(filename2, 
      names=['Date', 'Time', 'Open', 'High', 'Low', 'Close', 'Volume'], 
      index_col='Date_Time', parse_dates=[[0, 1]])

