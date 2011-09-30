#!/usr/bin/env python
# -*- coding: utf-8 -*-

# ****************************************************************
# * Classe permettant de loguer les actions faites par le script *
# ****************************************************************

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


# Remarque : il vaut mieux utiliser 
#  import logging # /usr/lib/python2.5/site-packages/bike/logging.py
#  http://www.red-dove.com/python_logging.html

import csv

class log(object):
	#lstMsg = [] # Liste des messages d'erreurs

	class level(object): # niveau de message
		min=0
		message=0
		error=1
		max=1

	class verbosity(object): # verbosité (niveau minimal d'erreur/de message à logguer)
		nolog=-1
		min=0
		max=1

	def __init__(self, verbosity, filename): # constructeur
		self.logmessage = []
		self.verb=verbosity
		self.filelog = open(filename, 'w') # w ou wb ?
		self.csvfilelog = csv.writer(self.filelog)

	def write(self, level, msg):
		if level>=self.level.max-self.verb:
			row=[level,msg]
			# Ecriture en mémoire
			self.logmessage.append(row)
			# Ecriture sur le fichier
			self.csvfilelog.writerow(row)

	def show(self): # afficher les messages stockés
		# Lecture à partir des données en mémoire
		for row in self.logmessage:
			LEVEL=row[0]
			MESSAGE=row[1]
			print "%(LEVEL)d\t%(MESSAGE)s" % {"LEVEL":LEVEL, "MESSAGE":MESSAGE}

	def close(self): # voir destructeur
		self.filelog.close()
