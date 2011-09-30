#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Utilisation d'une petite base de données acceptant les requêtes SQL

import gadfly
import os

chemin = os.getcwd()        # Obtention du répertoire courant

baseDonn = gadfly.gadfly("musique", chemin)
cur = baseDonn.cursor()
while 1:
    print "Veuillez entrer votre requête SQL (ou <Enter> pour terminer) :"
    requete = raw_input()
    if requete =="":
        break
    try:
        cur.execute(requete)        # exécution de la requête SQL
    except:
        print '*** Requête incorrecte ***'
    else:    
        print cur.pp()              # Affichage du résultat
    print

choix = raw_input("Confirmez-vous l'enregistrement (o/n) ? ")
if choix[0] == "o" or choix[0] == "O":
    baseDonn.commit()
else:
    baseDonn.close()

