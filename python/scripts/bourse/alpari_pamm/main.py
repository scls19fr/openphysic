#!/usr/bin/env python
# -*- coding: utf8 -*-

"""
    Tri des comptes PAMM Alpari

       But : ce script permet de trier les comptes PAMM Alpari

    Copyright (C) 2011  "Sébastien CELLES" <sebastien.celles@univ-poitiers.fr>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>
"""

import csv

# Lecture des entêtes de colonnes
fileHead = open('head.txt', 'r')
strHead = fileHead.read()
fileHead.close()
lstHead = strHead.split("\n")

#print(lstHead)

# Lecture du fichier classement PAMM
filePAMM = open('data.txt', 'r')

pammsReader = csv.reader(filePAMM, delimiter='\t')

pammsWriter = csv.writer(open('data_out.csv', 'w'), delimiter=';')
pammsWriter.writerow(lstHead)

i = 0
for line in pammsReader:
    if i % 3 == 0: # Nouveau compte toutes les 3 lignes
        pamm = []
    elif i % 3 == 1:
        pass

    pamm.extend(line)

    if i % 3 == 2:
        print(pamm)
        #print(len(pamm))
        pammsWriter.writerow(pamm)
    i = i + 1
    
# Critère Sharpe ratio (1 mois - 3 mois - 6 mois) proche et > 1