import pandas as pd
from pandas.io.data import DataReader

symbols = ['MSFT', 'GOOG', 'AAPL']
data = dict((sym, DataReader(sym, "yahoo"))for sym in symbols)
panel = pd.Panel(data).swapaxes('items', 'minor')
close_px = panel['Close']
rets = close_px / close_px.shift(1) - 1
rets.corr()