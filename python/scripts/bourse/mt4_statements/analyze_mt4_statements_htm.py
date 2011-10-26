#!/usr/bin/env python
# -*- coding: utf8 -*-

"""
    Analyzer of MT4 statements

       But : ce script permet d'analyser les trades effectués
       dans le système de trading MetaTrader 4 http://www.metaquotes.net/

    Copyright (C) 2011  "Sébastien CELLES" <s.celles@gmail.com>

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

from BeautifulSoup import BeautifulSoup
from datetime import date, datetime, timedelta

class Trade():
    def __init__(self):
        self.Ticket = None
        self.OpenTime = None
        self.Type = None
        self.Size = None
        self.Item = None
        self.Price = None
        self.SL = None
        self.TP = None
        self.CloseTime = None
        self.Price = None
        self.Commission = None
        self.Taxes = None
        self.Swap = None
        self.Profit = None

        self.MagicNumber = None
        self.Comment = None

    def show(self):
        print("{0};{1};{2};{3};{4};{5};{6};{7};{8};{9};{10};{11};{12};{13};{14};{15}".format(self.Ticket,
            self.OpenTime, self.Type, self.Size, self.Item,
            self.Price, self.SL, self.TP, self.CloseTime,
            self.Price, self.Commission, self.Taxes, self.Swap, self.Profit,
            self.MagicNumber, self.Comment
        ))

class MT4StatementParser():
    def __init__(self, filename):
        self.filename = filename
        
        self.account = None
        self.name = None
        self.currency = None
        self.datetime_generated = None
        
        datasource = open(self.filename)
        html = datasource.read()
        soup = BeautifulSoup(html)
        table = soup.find('table')

        rows = table.findAll('tr')

        #for col in row:
        #    print(col)

        i = 0
        for row in rows:
            j = 0
            if i==0:
                cols = row.findAll('td')
                for col in cols:
                    data = col.find('b')
                    if j==0:
                        self.account = data.next.split(':')[1].strip()
                    elif j==1:
                        self.name = str(data.next).split(':')[1].strip()
                    elif j==2:
                        self.currency = data.next.split(':')[1].strip()
                    elif j==3:
                        #2011 October 13, 21:33
                        self.datetime_generated = data.next #datetime.strptime(data, '%Y')
                        #data.next.split(' ')
                    
                    j = j + 1
            elif i==1 or i==2:
                """
<tr align="left"><td colspan="13"><b>Closed Transactions:</b></td></tr>
<tr align="center" bgcolor="#C0C0C0">
<td>Ticket</td><td nowrap="nowrap">Open Time</td><td>Type</td><td>Size</td><td>Item</td>
<td>Price</td><td>S / L</td><td>T / P</td><td nowrap="nowrap">Close Time</td>
<td>Price</td><td>Commission</td><td>Taxes</td><td>Swap</td><td>Profit</td></tr>
"""
                pass
            
            elif i<10:
                if (i%2)==1:
                    print('='*3+' Trade '+'='*3)
                else:
                    pass
                print(i)
                print(row)

            else:
                pass
            i = i + 1

    def show(self):
        print("""Analyzing {filename}

Account: {account}
Name: {name}
Currency: {currency}
Datetime: {datetime_generated}
""".format(filename=self.filename, account=self.account, name=self.name, currency=self.currency, datetime_generated=self.datetime_generated))


        
#statement_relative_file = 'Statement.htm' # Généré manuellement par MT4
statement_relative_file = 'DetailedStatement.htm' # Généré manuellement par MT4

# ToDo : faire un EA qui génère automatiquement un statement

statement = MT4StatementParser(statement_relative_file)
statement.show()

t = Trade()
t.show()
