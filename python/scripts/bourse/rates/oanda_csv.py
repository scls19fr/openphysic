#!/usr/bin/python
# -*- coding: utf8 -*-

from BeautifulSoup import BeautifulSoup
import urllib # urlopen
import sys # stdout
from copy import *

#f = urllib.urlopen("http://www.oanda.com/currency/real-time-rates") # online (test on 2011/06/06)
f = open('oanda-real-time-rates.html', 'r') # offline


#g = open('oanda-rates.csv', 'w')
g = sys.stdout

html = f.read()

soup = BeautifulSoup(html)

#print soup.prettify() # display all the web page

t = soup.findAll('table')


lstTables = []
for table in t:
    lstData = []
    rows = table.findAll('tr')
    for tr in rows:
        lstRow = []
        cols = tr.findAll('td')
        for td in cols:
            val = str(td.find(text=True))
            val2 = val
            lstRow.append(val2)
            g.write(val)
            g.write(";")
        g.write("\n")
        lstData.append(lstRow)
    lstTables.append(lstData)

nbcols = len(lstTables[0][:][0])

trTable = map(list, zip(*lstTables[0])) # transposée

nblignes = len(trTable[0]) # ???

#print(lstTables)
#print(trTable)


print(lstTables[0][:][3])
print(trTable[0])

#print("nbcols={0}".format(nbcols))
print("nbcols={0} nblignes={1}".format(nbcols, nblignes))
f.close()
g.close()

#print(lstTables) # ValueError: I/O operation on closed file