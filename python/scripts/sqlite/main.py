#!/usr/bin/env python

import sqlite3

#from pysqlite2 import dbapi2 as sqlite
connection = sqlite3.connect('my.db')
#memoryConnection = sqlite.connect(':memory:')
cursor = connection.cursor()
#cursor.execute('INSERT INTO names VALUES (null, "John Doe", "jdoe@jdoe.zz")')
#connection.commit()
#connection.rollback()

#SELECT columns
#FROM tables
#WHERE predicates
#ORDER BY column ASC/DESC;

#cursor.execute('SELECT * FROM etudiants')
#cursor.execute('SELECT * FROM etudiants WHERE TP=1 ORDER BY NOM')
#cursor.execute('SELECT TP FROM etudiants')

cursor.execute('SELECT DISTINCT(TP) FROM etudiants')


print cursor.fetchall()
#for row in cursor:
#  print '-'*10
#  print 'TP:', row[0]
#  print 'Nom:', row[1]
#  print 'Prenom:', row[1]
#  print '-'*10

