#!/usr/bin/python
# -*- coding: utf8 -*-

"""
    Bitcoin rates from http://bitcoincharts.com/

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
    f = urllib.urlopen("http://bitcoincharts.com/t/weighted_prices.json")
    json_data = f.read()

    # Value for test 2011/06/30 @ 19:09
    #json_data = json.dumps(d)
    #d = {"USD": {"7d": "16.5804", "30d": "18.2981", "24h": "16.8153"}, "RUB": {"7d": "440.0000", "30d": "417.1429"}, "GAU": {"30d": "0.4000"}, "BGN": {"7d": "20.8225", "30d": "20.9231"}, "CNY": {"7d": "102.5801", "30d": "108.3122", "24h": "104.6367"}, "SLL": {"7d": "4588.2658", "30d": "5317.3599", "24h": "4558.3356"}, "INR": {"7d": "500.0000", "30d": "936.6812"}, "GBP": {"7d": "10.4257", "30d": "11.7746", "24h": "10.7869"}, "SAR": {"30d": "68.5145"}, "PLN": {"7d": "47.0368", "30d": "56.5338", "24h": "46.0541"}, "CLP": {"7d": "7711.0890", "30d": "9206.5827", "24h": "7711.6762"}, "EUR": {"7d": "12.1422", "30d": "14.1566", "24h": "12.0659"}}

    data = json.loads(json_data)
    #print(data['ticker']['sell'])

    clear_screen()
    #print(json_data)
    #print(data)
    
    print("""Bitcoin weighted prices from http://bitcoincharts.com/ @ {0}
    
          24h\t7d\t30d
""".format(datetime.datetime.now()))  #.strftime('%Y/%m/%d %H:%M:%s'),

    for currency in data:
        #print(key)
        try:
            dC24h = data[currency]['24h']
        except:
            dC24h = '-' 
        try:
            dC7d = data[currency]['7d']
        except:
            dC7d = '-'
        try:
            dC30d = data[currency]['30d']
        except:
            dC30d = '-'
        print("BTC/{0} : {1}\t{2}\t{3}".format(currency, dC24h, dC7d, dC30d))

    f.close()

while(True):
    update()
    time.sleep(60) # wait 60 seconds
