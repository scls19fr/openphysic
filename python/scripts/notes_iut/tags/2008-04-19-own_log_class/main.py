#!/usr/bin/env python
# -*- coding: utf-8 -*-

# *****************************************************************
# * Script en Python permettant d'envoyer les notes aux étudiants *
# *  - Génération d'un fichier par élève comportant ses notes     *
# *  - Copie de ce fichier dans le répertoire de l'élève sur      *
# *    l'intranet (\\ANDROMEDE\Comptes\login)                     *
# *  - Envoi par mail
# *****************************************************************

# Copyright 2008 by Sebastien Celles. All Rights Reserved.
#
# Permission to use, copy, modify, and distribute this software and its
# documentation for any purpose and without fee is hereby granted,
# provided that the above copyright notice appear in all copies and that
# both that copyright notice and this permission notice appear in
# supporting documentation, and that the name of Sebastien Celles
# not be used in advertising or publicity pertaining to distribution
# of the software without specific, written prior permission.
# SEBASTIEN CELLES DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING
# ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL
# VINAY SAJIP BE LIABLE FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR
# ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER
# IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
# OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

import csv
import os
import shutil
import tkMessageBox

from log import *
#import logging # /usr/lib/python2.5/site-packages/bike/logging.py # ToDo
#http://www.red-dove.com/python_logging.html

import smtplib # ToDo

# Paramètrage
# ===========

# Fichiers
filenamecsv="main.csv" # fichier comportant les notes des élèves
filenamenotes="notes.txt" # fichier envoyé à chaque élève (fichier temporaire)

# Config
copie_intranet=True # copie des notes dans l'intranet (True ou False)
envoi_mail=False # envoi des notes par mail

#from enum import Enum
#envoi=Enum('intranet', 'mail')
#fichier=Enum('texte', 'pdf')
# struct voir dict ou class


# Répertoire destination des notes
#repertoire="\\\\Andromede\Comptes\GTE\dut"
# /home/scls/notes_iut/essai/login/notes
repertoire="/home/scls/notes_iut/essai/"
repertoire_notes="notes"

# Envoi des mails
smtpserver = 'smtp.laposte.net'
AUTHREQUIRED = 0 # if you need to use SMTP AUTH set to 1
smtpuser = 's.cls'  # for SMTP AUTH, set SMTP username here
smtppass = ''  # for SMTP AUTH, set SMTP password here
#RECIPIENTS = ['s.cls@laposte.net']
SENDER = 's.cls@laposte.net'


# Fonctions utiles
# ================
#def message_info(msg):
  #tkMessageBox.showinfo("Copie", msg)
#  print msg

#def message_erreur(msg):
#  print msg

#  fileErr.writerow([eleve, os.path.join(repertoire,eleve,repertoire_notes,fichier)])
#  if (not error):
#    eleveErr.writerow([eleve])
#    message_erreur("Erreur inattendue pour "  + eleve)
#    error = True  

def ToDo():
	print "ToDo"

# Programme principal
# ===================

# Ouverture du fichier élèves
filecsv=open(filenamecsv,"rb")
filecsvreader = csv.reader(filecsv)

#NOM PRENOM LOGIN MAIL NOTE1 ... NOTEn
nb_colonnes_hors_notes=4


# Vérification de l'existance du répertoire (et création si nécessaire)
if (not os.path.isdir(repertoire)):
	os.mkdir(repertoire)

myLog = log(log.verbosity.max,"log.csv")


indice=0
for row in filecsvreader:
	if indice==0:
		nbnotes=len(row)-nb_colonnes_hors_notes
		print "Nb de notes = %(#)d" % {"#": nbnotes}
		matieres=[]
		for j in xrange(1,nbnotes+1):
			matieres.append(row[j+nb_colonnes_hors_notes-1])
		print matieres

	else:
		NOM=row[0]
		PRENOM=row[1]
		LOGIN=row[2]
		MAIL=row[3]

		# Création du fichier de notes (pour un élève)
		filenotes = open(filenamenotes, 'w')

		# Début du fichier à envoyer
		filenotes.write(r"""Fichier de notes de %(NOM)s %(PRENOM)s
""" % {"NOM":NOM, "PRENOM":PRENOM})

		# Partie centrale du fichier à envoyer
		for j in xrange(1,nbnotes+1):
			#print j
			NOTE=float(row[j+nb_colonnes_hors_notes-1])
			MATIERE=matieres[j-1]
			filenotes.write(r"""
Note %(#)d = %(MATIERE)s = %(NOTE)f""" % {"#": j, "NOTE":NOTE, "MATIERE":MATIERE})


		# Fin du fichier à envoyer
		filenotes.write(r""" 

Fin du fichier de note
""")
		filenotes.close()

		# Copie du fichier des notes de l'élève dans l'intranet
		if copie_intranet and LOGIN<>"":
			REP = os.path.join(repertoire,LOGIN)
			#print rep

			# creation repertoire eleves
			if (not os.path.isdir(REP)):
				os.mkdir(REP)
				myLog.write(log.level.message,'création du répertoire "%(REP)s"' % {"REP": REP})

			# creation repertoire eleves/notes
			REP = os.path.join(REP,repertoire_notes)
			#print rep
			if (not os.path.isdir(REP)):
				os.mkdir(REP)
				myLog.write(log.level.message,'création du répertoire "%(REP)s"' % {"REP": REP})

			# copie du fichier de notes
		        try:
				#if (os.path.isdir(rep)): # ToDo : tester si risque d'écrasement du fichier
				filenamenotesDest=os.path.join(REP, filenamenotes)
				shutil.copy2(filenamenotes, filenamenotesDest)
          			myLog.write(log.level.message,'copie du fichier de notes "%(FROM)s" de l\'élève "%(LOGIN)s" vers "%(DEST)s"' % {"LOGIN": LOGIN, "FROM": filenamenotes, "DEST": filenamenotesDest})

				#else:
				#	print "Fichier existe déjà"
		        except:
				ToDo()
				myLog.write(log.level.error,'impossible de copier le fichier de notes "%(FROM)s" de l\'élève "%(LOGIN)s" vers "%(DEST)s"' % {"LOGIN": LOGIN, "FROM": filenamenotes, "DEST": filenamenotesDest})

		# Envoi par mail des notes
		if envoi_mail and MAIL<>"":
			ToDo()
			myLog.write(log.level.message,'envoi du fichier de notes "%(FROM)s" de l\'élève "%(LOGIN)s" à "%(MAIL)s"' % {"LOGIN": LOGIN, "FROM": filenamenotes, "MAIL": MAIL})

			mssg = open(filenamenotes, 'r').read()
			
			RECIPIENTS = [MAIL] #RECIPIENTS = ['user@example.com']
			session = smtplib.SMTP(smtpserver)
			if AUTHREQUIRED:
			    session.login(smtpuser, smtppass)
			smtpresult = session.sendmail(SENDER, RECIPIENTS, mssg)

			if smtpresult:
				errstr = ""
				for recip in smtpresult.keys():
					errstr = """Could not delivery mail to: %s

Server said: %s
%s

%s""" % (recip, smtpresult[recip][0], smtpresult[recip][1], errstr)
    				raise smtplib.SMTPException, errstr

		# Suppression du fichier temporaire (fichier de note)
		os.remove(filenamenotes)
		
	
	indice=indice+1


# Fermeture du fichier élèves
filecsv.close()

# Visualisation des erreurs sur stdout et fermeture du fichier de log
myLog.show()
myLog.close()
