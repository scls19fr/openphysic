#!/usr/bin/env python

# Script Python de copie de fichiers depuis les comptes utilisateurs
# Sebastien CELLES
# 20/12/2007

import csv
import os
import shutil
import tkMessageBox

dirOrigine = "\\\\Andromede\Comptes\GTE\dut"
dirDestination =  "C:\Documents and Settings\scelles\Mes documents\copie"
liste = "C:\Documents and Settings\scelles\Mes documents\liste.csv"
listeFichiersErr = "C:\Documents and Settings\scelles\Mes documents\listeFichiersErr.csv"
listeElevesErr = "C:\Documents and Settings\scelles\Mes documents\listeElevesErr.csv"
matiere = "autocad"
extension = "*.dw?"
extensions = [".dwg",".dwt"]

def message_info(msg):
  #tkMessageBox.showinfo("Copie", msg)
  print msg

def message_erreur(msg):
  print msg

def erreur_copie(eleve, fichier):
  fileErr.writerow([eleve, os.path.join(depuis,matiere,file)])
  if (not error):
    eleveErr.writerow([eleve])
    message_erreur("Erreur inattendue pour "  + eleve)
    error = True  

rep = dirDestination
if (not os.path.isdir(rep)):
  os.mkdir(rep)

file = csv.reader(open(liste,"rb"))
fileErr = csv.writer(open(listeFichiersErr, "wb"))
eleveErr = csv.writer(open(listeElevesErr, "wb"))


message_info("Debut de la copie")

for row in file:
  error = False
  
  # recuperation du login de l'eleve
  eleve = row[0]
  print "*** Eleve = "+ eleve + " ***"

  #creation du repertoire utilisateur
  rep = os.path.join(dirDestination,eleve)
  if (not os.path.isdir(rep)):
    os.mkdir(rep)

  #creation du repertoire utilisateur\matiere
  rep = os.path.join(dirDestination,eleve,matiere)
  if (not os.path.isdir(rep)):
    os.mkdir(rep)

  #copie des fichiers
  depuis = os.path.join(dirOrigine,eleve)
  vers = os.path.join(dirDestination,eleve)

  root=''
  dirs=[]
  files=[]
  for root, dirs, files in os.walk(depuis, topdown=True):
    for file in files:
      (shortname, extension) = os.path.splitext(file)
      if (extension in extensions):
        try:
          #print os.path.join(root,file)
          shutil.copy2(os.path.join(root,file), os.path.join(vers,matiere))
        except:
          erreur_copie(eleve,file)
    


message_info("Fin de la copie")
