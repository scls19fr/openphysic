#!/usr/bin/python
# -*- coding: utf8 -*-

"""
    Rates from Yahoo Finance
    	YQL Yahoo! Query Language
    	Open Data Tables http://www.datatables.org/

    Copyright (C) 2011 "Sébastien Celles" <s.celles@gmail.com>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>
"""

# http://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20%28%22YHOO%22,%22AAPL%22,%22GOOG%22,%22MSFT%22%29&env=http://datatables.org/alltables.env

import yql
import datetime
import os
import time

def clear_screen():
    if os.name == "posix":
    # Unix/Linux/MacOS/BSD/etc
        os.system('clear')
    elif os.name in ("nt", "dos", "ce"):
    # DOS/Windows
        os.system('CLS')
    else:
        # Fallback for other operating systems.
        print("="*10)
        #print '\n' * numlines

def update():
    y = yql.Public()
    symbol = 'EURUSD'
    query = 'select * from yahoo.finance.quotes where symbol="{0}=X" limit 1'.format(symbol);
    result = y.execute(query, env='http://datatables.org/alltables.env')
    # ToFix : No definition found for Table yahoo.finance.quotes => env

    #print(result)
    #for row in result.rows:
    #    print repr(row)

    data = result.rows[0]
    #print(data)

    clear_screen()
    print("""{0} rates from Yahoo! Finance YQL @ {1}
Bid : {2}
Ask : {3}""".format(
    symbol,
    datetime.datetime.now(), #.strftime('%Y/%m/%d %H:%M:%s'),
    data['Bid'],
    data['Ask']
))

while(True):
    update()
    time.sleep(60) # wait 60 seconds
