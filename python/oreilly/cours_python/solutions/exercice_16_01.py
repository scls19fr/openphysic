#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Création et Alimentation d'une petite base de données

import gadfly
import os

chemin = os.getcwd()        # obtention du répertoire courant

connex = gadfly.gadfly()
connex.startup("musique", chemin)
cur = connex.cursor()
requete = "create table compositeurs (comp varchar, a_naiss integer,\
           a_mort integer)" 
cur.execute(requete)
requete = "create table oeuvres (comp varchar, titre varchar,\
           duree integer, interpr varchar)" 
cur.execute(requete)

print "Entrée des enregistrements, table des compositeurs :"
while 1:
    nm = raw_input("Nom du compositeur (<Enter> pour terminer) : ")
    if nm =='':
        break
    an = raw_input("Année de naissance : ")
    am = raw_input("Année de mort : ")
    requete ="insert into compositeurs(comp, a_naiss, a_mort) values \
                 ('%s', %s, %s)" % (nm, an, am)
    cur.execute(requete)
# Affichage des données entrées, pour vérification :
cur.execute("select * from compositeurs")
print cur.pp()

print "Entrée des enregistrements, table des oeuvres musicales :"
while 1:
    nom = raw_input("Nom du compositeur (<Enter> pour terminer) : ")
    if nom =='':
        break
    tit = raw_input("Titre de l'oeuvre : ")
    dur = raw_input("durée (minutes) : ")
    int = raw_input("interprète principal : ")
    requete ="insert into oeuvres(comp, titre, duree, interpr) values \
                 ('%s', '%s', %s, '%s')" % (nom, tit, dur, int)
    cur.execute(requete)
# Affichage des données entrées, pour vérification :
cur.execute("select * from oeuvres")
print cur.pp()

connex.commit()
