#!/usr/bin/env python

import pandas as pd
import sqlite3

df = pd.DataFrame([[1,2,3],[4,5,6],[7,8,9],[10,11,12]], columns=['a', 'b', 'c'])

print(df)
print(df.dtypes)

db_path = 'database.sqlite'
cnx = sqlite3.connect(db_path)
#cnx = sqlite3.connect(':memory:')

cur = cnx.cursor()    
cur.execute('SELECT SQLITE_VERSION()')
data = cur.fetchone()
print("SQLite version: %s" % data)

pd.io.sql.write_frame(df, 'table_dataframe', cnx, flavor='sqlite', if_exists='replace')