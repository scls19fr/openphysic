#!/usr/bin/env python
# -*- coding: utf-8 -*-

from datetime import *

def weekdayToStr(d):
	if (d==0):
		return "lundi"
	elif (d==1):
		return "mardi"
	elif (d==2):
		return "mercredi"
	elif (d==3):
		return "jeudi"
	elif (d==4):
		return "vendredi"
	elif (d==5):
		return "samedi"
	elif (d==6):
		return "dimanche"
	else:
		return "undef"

def monthToStr(m):
	if (m==1):
		return "janvier"
	elif (m==2):
		return "février"
	elif (m==3):
		return "mars"
	elif (m==4):
		return "avril"
	elif (m==5):
		return "mai"
	elif (m==6):
		return "juin"
	elif (m==7):
		return "juillet"
	elif (m==8):
		return "août"
	elif (m==9):
		return "septembre"
	elif (m==10):
		return "octobre"
	elif (m==11):
		return "novembre"
	elif (m==12):
		return "décembre"
	else:
		return "undef"
		
def dayToStr(d):
	if (d==1):
		return "1er"
	else:
		return "%s" % (d)

# obtenir le premier lundi (ou autre start_weekday) suivant la date t1
def first_day(t, start_weekday):
	while t.weekday() <> start_weekday: 
		t = t + timedelta(1)
	return t
	#t2 = t1
	#while t2.weekday() <> start_weekday: 
	#	t2 = t2 + timedelta(1)
	#return t2
	
def saints(m, d):
	if m==1 and d==1:
		return "nouvel an"
	elif m==8 and d==15:
		return "toto"
	else:
		return ""