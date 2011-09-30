#!/usr/bin/python
# -*- coding: utf8 -*-

from BeautifulSoup import BeautifulSoup

datasource = open('ZuluTrade-TradeHistory.html')

html = datasource.read()

soup = BeautifulSoup(''.join(html))
 
print soup.prettify()