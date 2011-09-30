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
import sys
#import tkMessageBox

import logging # /usr/lib/python2.5/site-packages/bike/logging.py # ToDo
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

# Logging
log = logging.getLogger("MyApp")
hdlr = logging.FileHandler('log_envoi_notes.log')
FORMAT='%(asctime)s\t%(levelname)s\t%(message)s'
formatter = logging.Formatter(FORMAT)
logging.basicConfig(format=FORMAT) # conf de base (log sur console)
hdlr.setFormatter(formatter)
log.addHandler(hdlr)
#hdlrConsole = logging.StreamHandler(sys.stderr)
#hdlrConsole.setFormatter(formatter)
#log.addHandler(hdlrConsole)
log.setLevel(logging.DEBUG) #set verbosity to show all messages of severity >= DEBUG CRITICAL

log.info("démarrage du script")


#from enum import Enum
#envoi=Enum('intranet', 'mail')
#fichier=Enum('txt', 'pdf')
# struct voir dict ou class


# Répertoire destination des notes
#repertoire="\\\\Andromede\\Comptes\\GTE\\dut"
# /home/scls/notes_iut/essai/login/notes
#repertoire="/home/scls/notes_iut/essai/"
#repertoire='C:\\Users\\scls\\Documents\\python\\scripts\\notes_iut\\trunk\\essai'
repertoire='essai'
repertoire_notes="notes"

# Envoi des mails
smtpserver = 'smtp.orange.fr' #'smtp.laposte.net'
AUTHREQUIRED = 0 # if you need to use SMTP AUTH set to 1
smtpuser = ''  # for SMTP AUTH, set SMTP username here
smtppass = ''  # for SMTP AUTH, set SMTP password here
#RECIPIENTS = ['s.cls@laposte.net']
SENDER = "Sebastien CELLES <sebastien.celles@univ-poitiers.fr>"


# Fonctions utiles
# ================
def ToDo():
	#print "ToDo"
	log.info("ToDo")

# Programme principal
# ===================

# Ouverture du fichier élèves
filecsv=open(filenamecsv,"rb")
filecsvreader = csv.reader(filecsv)
log.info('Fichier %(filenamecsv)s ouvert' % {"filenamecsv": filenamecsv})

#NOM PRENOM LOGIN MAIL NOTE1 ... NOTEn
nb_colonnes_hors_notes=4

# Vérification de l'existance du répertoire (et création si nécessaire)
REP=repertoire
if (not os.path.isdir(REP)):
	os.mkdir(REP)
else:
	log.info('le répertoire "%(REP)s" existe déjà' % {"REP": REP})


indice=0
for row in filecsvreader:
	if indice==0:
		log.info('lecture de l\'entête du fichier csv')
		nbnotes=len(row)-nb_colonnes_hors_notes
		print "Nb de notes = %(#)d" % {"#": nbnotes}
		matieres=[]
		for j in xrange(1,nbnotes+1):
			matieres.append(row[j+nb_colonnes_hors_notes-1])
		log.info(matieres)

	else:
		NOM=row[0]
		PRENOM=row[1]
		LOGIN=row[2]
		MAIL=row[3]
		log.info('Traitement du fichier de notes de NOM=%(NOM)s PRENOM=%(PRENOM)s LOGIN=%(LOGIN)s MAIL=%(MAIL)s' % {"NOM":NOM, "PRENOM":PRENOM, "LOGIN":LOGIN, "MAIL":MAIL})

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
Note %(#)d = %(MATIERE)s = %(NOTE)2.2f""" % {"#": j, "NOTE":NOTE, "MATIERE":MATIERE})


		# Fin du fichier à envoyer
		filenotes.write(r""" 

Fin du fichier de note
""")
		filenotes.close()
		log.info('fermeture du fichier de note')

		# Copie du fichier des notes de l'élève dans l'intranet
		if copie_intranet and LOGIN<>"":
			REP = os.path.join(repertoire,LOGIN)
			#print rep

			# creation repertoire eleves
			if (not os.path.isdir(REP)):
				os.mkdir(REP)
				log.info('création du répertoire "%(REP)s"' % {"REP": REP})
			else:
				log.info('le répertoire "%(REP)s" existe déjà' % {"REP": REP})

			# creation repertoire eleves/notes
			REP = os.path.join(REP,repertoire_notes)
			#print rep
			if (not os.path.isdir(REP)):
				os.mkdir(REP)
				log.info('création du répertoire "%(REP)s"' % {"REP": REP})
			else:
				log.info('le répertoire "%(REP)s" existe déjà' % {"REP": REP})

			# copie du fichier de notes
			try:
				#if (os.path.isdir(rep)): # ToDo : tester si risque d'écrasement du fichier
				filenamenotesDest=os.path.join(REP, filenamenotes)
				shutil.copy2(filenamenotes, filenamenotesDest)
				log.info('copie du fichier de notes "%(FROM)s" de l\'élève "%(LOGIN)s" vers "%(DEST)s"' % {"LOGIN": LOGIN, "FROM": filenamenotes, "DEST": filenamenotesDest})

				#else:
				#	print "Fichier existe déjà"
			except:
				ToDo()
				log.error('impossible de copier le fichier de notes "%(FROM)s" de l\'élève "%(LOGIN)s" vers "%(DEST)s"' % {"LOGIN": LOGIN, "FROM": filenamenotes, "DEST": filenamenotesDest})

		# Envoi par mail des notes
		if envoi_mail and MAIL<>"":
			log.info('envoi du fichier de notes "%(FROM)s" de l\'élève "%(LOGIN)s" à "%(MAIL)s"' % {"LOGIN": LOGIN, "FROM": filenamenotes, "MAIL": MAIL})
			filenotes = open(filenamenotes, 'r')
			NOMPRENOM=NOM+" "+PRENOM
			RECIPIENT="%s <%s>" % (NOMPRENOM, MAIL) # "User <user@example.com>"
			mssg = filenotes.read()

			mssg = """From: %(SENDER)s
To: %(RECIPIENT)s
Subject: Relevé de notes
""" % {"SENDER": SENDER, "RECIPIENT": RECIPIENT} + mssg
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
				log.error(strerr)
				raise smtplib.SMTPException, errstr

			filenotes.close() # fermeture du fichier de note (lecture pour envoi par mail
			session.quit()

		else:
			log.info('pas d\'envoi du fichier de notes par mail')

		# Suppression du fichier temporaire (fichier de note)
		os.remove(filenamenotes)
		log.info('suppression du fichier temporaire')
		
	
	indice=indice+1


# Fermeture du fichier élèves
filecsv.close()
log.info('fermeture de %(filenamecsv)s' % {"filenamecsv": filenamecsv})

# Visualisation des erreurs sur stdout et fermeture du fichier de log
#logging.show() # se fait au fur et à mesure de l'apparition de messages de log
#logging.close()
log.info("fin du script")
