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

class MT4StatementParser():
    def __init__(self, filename):
        self.filename = filename
        
        self.account = None
        self.name = None
        self.currency = None
        self.datetime = None
        
        datasource = open(filename)
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
                        self.account = data
                    elif j==1:
                        self.name = data
                    elif j==2:
                        self.currency = data
                    elif j==3:
                        self.datetime = data
                    
                    j = j + 1
            else:
                pass
            i = i + 1

    def show(self):
        print("""Analyzing {filename}

Account: {account}
Name: {name}
Currency: {currency}
Datetime: {datetime}
""".format(filename=self.filename, account=self.account, name=self.name, currency=self.currency, datetime=self.datetime))


        
#statement_relative_file = 'Statement.htm' # Généré manuellement par MT4
statement_relative_file = 'DetailedStatement.htm' # Généré manuellement par MT4

# ToDo : faire un EA qui génère automatiquement un statement

statement = MT4StatementParser(statement_relative_file)
statement.show()
