#!/usr/bin/python
# -*- coding: utf8 -*-

"""
    Bitcoin rates from BitMarket.eu API

    Copyright (C) 2011 "NoOne" <noone@nowhere.com>
    You can donate @ 1MDzyfk4s2KzY1N5VybfDNRDQucrBZoMA5

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

import urllib
import json
import datetime
import time
import os

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
    f = urllib.urlopen("https://bitmarket.eu/api/ticker")
    json_data = f.read()

    # Value for test 2011/06/22 @ 17:00
    #d = {"vol":"1890.87","currencies":{"EUR":{"sell":"12.99","buy":"12.75","last":"13"},"PLN":{"sell":"58.98","buy":"41","last":"45"},"GBP":{"sell":"12.2","buy":"12","last":"11.9"},"USD":{"sell":"17.95","buy":"17.5","last":"17.99"},"AUD":{"sell":"17","buy":"13","last":"17"},"RUB":{"sell":"440","buy":"400","last":null}}}

    #print(json_data)

    data = json.loads(json_data)

    clear_screen()
    
    print("""Bitcoin BTC/USD rates from BitMarket.eu API @ {0}
  Buy : {1}
  Sell : {2}
  Last : {3}
  Vol : {4}""".format(
    datetime.datetime.now(), #.strftime('%Y/%m/%d %H:%M:%s'),
    data['currencies']['USD']['buy'],
    data['currencies']['USD']['sell'],
    data['currencies']['USD']['last'],
    data['vol']
))
    print('')
    print("""Bitcoin BTC/EUR rates from BitMarket.eu API @ {0}
  Buy : {1}
  Sell : {2}
  Last : {3}
  Vol : {4}""".format(
    datetime.datetime.now(), #.strftime('%Y/%m/%d %H:%M:%s'),
    data['currencies']['EUR']['buy'],
    data['currencies']['EUR']['sell'],
    data['currencies']['EUR']['last'],
    data['vol']
))
    f.close()

#update()

while(True):
    update()
    time.sleep(60) # wait 60 seconds
