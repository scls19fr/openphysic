#!/usr/bin/python
# -*- coding: utf8 -*-

import urllib 
from BeautifulSoup import BeautifulSoup

#f = urllib.urlopen("http://www.oanda.com/currency/real-time-rates") # online (test on 2011/06/06)
f = open('oanda-real-time-rates.html') # offline

html = f.read()

soup = BeautifulSoup(html)

#print soup.prettify() # display all the web page

table = soup.find('table')

#print(table.prettify()) # display the table


dat = [ map(str, row.findAll("td")) for row in table.findAll("tr") ]
#print(dat)

# ligne 0 header

#print(dat[0])

# ligne 1 currency_first
# denière ligne currency_last

for row in dat[2:-1]:
    for col in row:
        minisoup = BeautifulSoup(col)
        print(minisoup.td.string)
        #print(minisoup.contents[0])
    print("="*10)
    #print(row)

f.close()