#!/usr/bin/env python

import pandas as pd
import numpy as np
from datetime import *

def conv_str_to_datetime(x):
  return(datetime.strptime(x, '%Y/%m/%d %H:%M:%S'))

def conv_str_to_pair(x):
  x=x.split('/')
  return(x[0]+x[1])

def view_df(df):
  j = 0
  #outp = ''
  outp = 'i Index' + '\t|'
  for col in df.columns:
    if j<>0:
      outp = outp + '\t|' + col
    else:
      outp = outp + col
    j = j + 1
    
  outp = outp + '\n'
  
  for i in range(0, len(df)):
    outp = outp + str(i) + '\t|'
    for j in range(0, len(df.columns)):
      outp = outp + str(df.iget_value(i, j)) + '\t|'
    if i<>len(df):
      outp = outp + '\n'
    
  print(outp)

df = pd.read_csv('Trade_History_denganyouqianle_19850320_20120805.csv', converters={'Date Open': conv_str_to_datetime, 'Date Close': conv_str_to_datetime, 'Currency': conv_str_to_pair})

view_df(df[0:20])