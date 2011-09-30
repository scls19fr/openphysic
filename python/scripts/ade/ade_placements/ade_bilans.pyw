#!/usr/bin/env python
# -*- coding: utf8 -*-

"""
    Bilan pour ADE - v 0.0.1 alpha

       But : ce script permet de générer des bilans à partir
       des données présentes dans l'onglet "Placement" d'ADE
        * Bilan matières
        * Bilan enseignants

       Remarque : modifier le fichier ade_entete.txt afin d'avoir
       une disposition des données convenables
       l'ordre des colonnes de l'onglet "Placement" doit être
       le même que l'ordre dans le fichier ade_entete.txt
       Il est nécessaire d'afficher les informations suivantes dans le client ADE
        - Type
        - Durée
        - Enseignants
        - Code
        - Activité
        - Semaine

    Copyright (C) 2011  "Sébastien CELLES" <sebastien.celles@univ-poitiers.fr>

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>
"""

import csv
from datetime import date, datetime, timedelta
import sys

class Placement():
    def __init__(self):
        pass

    def __repr__(self):
        return repr(self.__dict__)

class Bilan(dict):
    def __init__(self):
        self['CM'] = 0 #timedelta() # durée en minutes
        self['TD'] = 0 #timedelta()
        self['TP'] = 0 #timedelta()
        self['autres'] = 0 #timedelta()

    def __repr__(self):
        return repr(self.__dict__)

# Lecture des entêtes de colonnes
fileHead = open('ade_entete.txt', 'r', encoding='latin-1')
strHead = fileHead.read()
fileHead.close()
lstHead = strHead.split("\n")

#print(lstHead)

# Lecture du fichier ade_onglet_placement.txt
filePlacements = open('ade_onglet_placement.txt', 'r', encoding='latin-1')
compter_seances_non_planifiees = False

placements = csv.reader(filePlacements, delimiter='\t')

lstPlacements = []
for placement in placements:
    p = Placement()
    #seance_planifiee = True
    for i in range(0, len(placement)):
        strP = placement[i]
        #try:
        if lstHead[i] == 'Durée (h)':
            val = strP.split('h')
            #print(val)
            #val = timedelta(hours=int(val[0]), minutes=int(val[1])) # conversion de la chaine en heure Python
            #val = float(val[0]) + float(val[1])/60 # numérique (heures)
            val = int(val[0])*60 + int(val[1]) # numérique (minutes)
        elif lstHead[i] == 'Ressources verouillées' or lstHead[i] == 'Date verrouillée':
            val = bool(strP) # conversion de la chaine en booléen
        elif lstHead[i] == 'Type': # tout ce qui n'est pas de type CM TD TP est de type autre
            if strP!='CM' and strP!='TD' and strP!='TP':
                val = 'autres'
            else:
                val = strP
        elif lstHead[i] == 'Semaine':
            val = strP
            seance_planifiee = (strP!='') # ajouter pour bilan uniquement si la séance a été placée dans le planning
        else:
            val = strP
        #except:
        #    val = strP
        p.__dict__[lstHead[i]] = val
    #if seance_planifiee or compter_seances_non_planifiees:
    #print(p)
    if seance_planifiee or compter_seances_non_planifiees:
        lstPlacements.append(p)
    
#print(lstPlacements)
#for placement in lstPlacements:
#    print(placement)

# Création des bilans

#print(lstPlacements[0]) # voir une ligne de l'onglet placement pour test

bilan = dict()
bilan['total'] = Bilan()
bilan['enseignants'] = dict()
bilan['matieres'] = dict()

"""Structure : "nested dictionary" pour les bilans
Ref :
http://stackoverflow.com/questions/635483/what-is-the-best-way-to-implement-nested-dictionaries-in-python
http://stackoverflow.com/questions/651794/whats-the-best-way-to-initialize-a-dict-of-dicts-in-python

total
  CM
  TD
  TP
  autres
matieres
  matiere1 (code Apogée)
    nom (nom d'une des activités de ce code) ? ToDo
    total
      CM
      TD
      TP
      autres
    enseignants
      nom1
        CM
        TD
        TP
        autres
      nom2
        CM
        TD
        TP
        autres
enseignants
  nom1
    total
      CM
      TD
      TP
      autres
    matieres
      matiere1
        CM
        TD
        TP
        autres
"""

for placement in lstPlacements:
    enseignant = placement.__dict__['Enseignants'] # ToFix : double encadrement
    typeAct = placement.__dict__['Type']
    duree = placement.__dict__['Durée (h)']
    code = placement.__dict__['Code'] # ToFix : code Apogée ou Activité

    # - Total CM TD TP autres de l'ensemble des enseignants    
    bilan['total'][typeAct] = bilan['total'][typeAct] + duree
    
    # - Total CM TD TP autres pour chaque enseignant
    if enseignant not in bilan['enseignants']:
        bilan['enseignants'][enseignant] = dict()
        bilan['enseignants'][enseignant]['total'] = Bilan() #{'CM': timedelta(), 'TD': timedelta(), 'TP': timedelta(), 'autres': timedelta()}
        bilan['enseignants'][enseignant]['matieres'] = dict()
        
    bilan['enseignants'][enseignant]['total'][typeAct] = bilan['enseignants'][enseignant]['total'][typeAct] + duree

    # -- Total CM TD TP autres pour chaque matière pour un enseignant donné
    if code not in bilan['enseignants'][enseignant]['matieres']:
        bilan['enseignants'][enseignant]['matieres'][code] = Bilan()

    bilan['enseignants'][enseignant]['matieres'][code][typeAct] = bilan['enseignants'][enseignant]['matieres'][code][typeAct] + duree

    # ###########################################################

    # - Total CM TD TP autres pour chaque matiere (regroupement par code Apogée)
    if code not in bilan['matieres']:
        bilan['matieres'][code] = dict()
        bilan['matieres'][code]['total'] = Bilan()
        bilan['matieres'][code]['enseignants'] = dict()
    
    bilan['matieres'][code]['total'][typeAct] = bilan['matieres'][code]['total'][typeAct] + duree
        
    #print(bilanMatiere)

    # -- Total CM TP TP autres pour chaque enseignant dans une matière donnée
    if enseignant not in bilan['matieres'][code]['enseignants']:
        bilan['matieres'][code]['enseignants'][enseignant] = Bilan()
            
    bilan['matieres'][code]['enseignants'][enseignant][typeAct] = bilan['matieres'][code]['enseignants'][enseignant][typeAct] + duree

def affichage_info_h_eq_td(file):
    file.write("""(*) Les heures équivalents TD sont calculées à titre indicatif
sans prendre en compte le prorata (dépend du statut) avec les coefficients suivants :
CM=1.5 ; TD=1 ; TP=1
""")

def affichage_TXT_bilan_total(bilan, file = sys.stdout):
    file.write("Nb de séances : {0}".format(len(lstPlacements)))
    file.write('\n\n')

    title = 'total'
    CM = bilan['total']['CM']/60
    TD = bilan['total']['TD']/60
    TP = bilan['total']['TP']/60
    autres = bilan['total']['autres']/60
    file.write("""Bilan {0}
CM     : {1}
TD     : {2}
TP     : {3}
autres : {4}

H eq TD(*) : {5}

Total h : {6}
""".format(title, CM, TD, TP, autres, CM*1.5 + TD + TP, CM + TD + TP + autres))
    file.write('\n')
    affichage_info_h_eq_td(file)

def point2virgule(val):
    return str(val).replace('.',',',1)

def affichage_CSV_bilan_total(bilan, file = sys.stdout):
    myCSV = csv.writer(file, delimiter=';', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    myCSV.writerow(["Nb de séances", len(lstPlacements)])
    title = 'total'
    CM = bilan['total']['CM']/60
    TD = bilan['total']['TD']/60
    TP = bilan['total']['TP']/60
    autres = bilan['total']['autres']/60
    myCSV.writerow(['CM', point2virgule(CM)])
    myCSV.writerow(['TD', point2virgule(TD)])
    myCSV.writerow(['TP', point2virgule(TP)])
    myCSV.writerow(['autres', point2virgule(autres)])
    myCSV.writerow(['H eq TD(*)', point2virgule(CM*1.5 + TD + TP)])
    myCSV.writerow(['Total', point2virgule(CM + TD + TP + autres)])
    
def affichage_TXT_bilan_enseignants(bilan, file = sys.stdout):
    for enseignant in bilan['enseignants']:
        #print(enseignant)
        title = 'enseignant {0}'.format(enseignant)
        CM = bilan['enseignants'][enseignant]['total']['CM']/60
        TD = bilan['enseignants'][enseignant]['total']['TD']/60
        TP = bilan['enseignants'][enseignant]['total']['TP']/60
        autres = bilan['enseignants'][enseignant]['total']['autres']/60
        file.write("""Bilan {0}
CM     : {1}
TD     : {2}
TP     : {3}
autres : {4}

H eq TD(*) : {5}
""".format(title, CM, TD, TP, autres, CM*1.5 + TD + TP))
        
        for matiere in bilan['enseignants'][enseignant]['matieres']:
            title = matiere
            CM = bilan['enseignants'][enseignant]['matieres'][matiere]['CM']/60
            TD = bilan['enseignants'][enseignant]['matieres'][matiere]['TD']/60
            TP = bilan['enseignants'][enseignant]['matieres'][matiere]['TP']/60
            autres = bilan['enseignants'][enseignant]['matieres'][matiere]['autres']/60
            file.write('\n')
            file.write("""    Bilan {0}
        CM     : {1}    TD     : {2}    TP     : {3}    autres : {4}    H eq TD(*) : {5}
""".format(title, CM, TD, TP, autres, CM*1.5 + TD + TP))

        file.write('\n')
        file.write('='*15)
        file.write('\n\n')
    affichage_info_h_eq_td(file)

def affichage_CSV_bilan_enseignants(bilan, file = sys.stdout):
    myCSV = csv.writer(file, delimiter=';', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    for enseignant in bilan['enseignants']:
        #print(enseignant)
        CM = bilan['enseignants'][enseignant]['total']['CM']/60
        TD = bilan['enseignants'][enseignant]['total']['TD']/60
        TP = bilan['enseignants'][enseignant]['total']['TP']/60
        autres = bilan['enseignants'][enseignant]['total']['autres']/60
        myCSV.writerow(['Bilan enseignant', '', enseignant])
        myCSV.writerow(['', 'CM', point2virgule(CM)])
        myCSV.writerow(['', 'TD', point2virgule(TD)])
        myCSV.writerow(['', 'TP', point2virgule(TP)])
        myCSV.writerow(['', 'autres', point2virgule(autres)])
        myCSV.writerow(['', '', '', '', 'CM', 'TD', 'TP', 'autres', 'H eq TD(*)', 'h tot'])
        for matiere in bilan['enseignants'][enseignant]['matieres']:
            title = matiere
            CM = bilan['enseignants'][enseignant]['matieres'][matiere]['CM']/60
            TD = bilan['enseignants'][enseignant]['matieres'][matiere]['TD']/60
            TP = bilan['enseignants'][enseignant]['matieres'][matiere]['TP']/60
            autres = bilan['enseignants'][enseignant]['matieres'][matiere]['autres']/60
            myCSV.writerow(['', '', 'Bilan', matiere, point2virgule(CM), point2virgule(TD), point2virgule(TP), point2virgule(autres), point2virgule(1.5*CM+TD+TP), point2virgule(CM+TD+TP+autres)])

def affichage_TXT_bilan_matieres(bilan, file = sys.stdout):
    for matiere in bilan['matieres']:
        #print(enseignant)
        title = 'matière {0}'.format(matiere)
        CM = bilan['matieres'][matiere]['total']['CM']/60
        TD = bilan['matieres'][matiere]['total']['TD']/60
        TP = bilan['matieres'][matiere]['total']['TP']/60
        autres = bilan['matieres'][matiere]['total']['autres']/60
        file.write("""Bilan {0}
CM     : {1}
TD     : {2}
TP     : {3}
autres : {4}

H eq TD(*) : {5}
""".format(title, CM, TD, TP, autres, CM*1.5 + TD + TP))

        for enseignant in bilan['matieres'][matiere]['enseignants']:
            title = enseignant
            CM = bilan['matieres'][matiere]['enseignants'][enseignant]['CM']/60
            TD = bilan['matieres'][matiere]['enseignants'][enseignant]['TD']/60
            TP = bilan['matieres'][matiere]['enseignants'][enseignant]['TP']/60
            autres = bilan['matieres'][matiere]['enseignants'][enseignant]['autres']/60
            file.write('\n')
            file.write("""    Bilan {0}
        CM     : {1}    TD     : {2}    TP     : {3}    autres : {4}    H eq TD(*) : {5}
""".format(title, CM, TD, TP, autres, CM*1.5 + TD + TP))

        file.write('\n')
        file.write('='*15)
        file.write('\n\n')
    affichage_info_h_eq_td(file)

def affichage_CSV_bilan_matieres(bilan, file = sys.stdout):
    myCSV = csv.writer(file, delimiter=';', quotechar='"', quoting=csv.QUOTE_MINIMAL)
    for matiere in bilan['matieres']:
        #print(enseignant)
        CM = bilan['matieres'][matiere]['total']['CM']/60
        TD = bilan['matieres'][matiere]['total']['TD']/60
        TP = bilan['matieres'][matiere]['total']['TP']/60
        autres = bilan['matieres'][matiere]['total']['autres']/60
        myCSV.writerow(['Bilan matière', '', matiere])
        myCSV.writerow(['', 'CM', point2virgule(CM)])
        myCSV.writerow(['', 'TD', point2virgule(TD)])
        myCSV.writerow(['', 'TP', point2virgule(TP)])
        myCSV.writerow(['', 'autres', point2virgule(autres)])
        myCSV.writerow(['', '', '', '', 'CM', 'TD', 'TP', 'autres', 'H eq TD(*)', 'h tot'])
        for enseignant in bilan['matieres'][matiere]['enseignants']:
            title = enseignant
            CM = bilan['matieres'][matiere]['enseignants'][enseignant]['CM']/60
            TD = bilan['matieres'][matiere]['enseignants'][enseignant]['TD']/60
            TP = bilan['matieres'][matiere]['enseignants'][enseignant]['TP']/60
            autres = bilan['matieres'][matiere]['enseignants'][enseignant]['autres']/60
            myCSV.writerow(['', '', 'Bilan', enseignant, point2virgule(CM), point2virgule(TD), point2virgule(TP), point2virgule(autres), point2virgule(1.5*CM+TD+TP), point2virgule(CM+TD+TP+autres)])

# Fichiers textes
#################
#file = sys.stdout # affichage sur la console
file = open('bilan_ade_total.txt', 'w')
affichage_TXT_bilan_total(bilan, file)
file.close()

#print('='*30)
#print()

#file = sys.stdout # affichage sur la console
file = open('bilan_ade_enseignants.txt', 'w')
affichage_TXT_bilan_enseignants(bilan, file)
file.close()

#print('='*30)
#print()

#file = sys.stdout # affichage sur la console
file = open('bilan_ade_matieres.txt', 'w')
affichage_TXT_bilan_matieres(bilan, file)
file.close()

#print('='*30)

# Fichiers csv
##############
file = open('bilan_ade_total.csv', 'w')
affichage_CSV_bilan_total(bilan, file)
file.close()

file = open('bilan_ade_enseignants.csv', 'w')
affichage_CSV_bilan_enseignants(bilan, file)
file.close()

file = open('bilan_ade_matieres.csv', 'w')
affichage_CSV_bilan_matieres(bilan, file)
file.close()

#print(bilan) # Debug

filePlacements.close()
