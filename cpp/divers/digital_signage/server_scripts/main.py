#!/usr/bin/env python

from datetime import *

def getCurrentWeekId(date1=date.today()):
	date0 = date(2012, 8, 6) # date du premier lundi du projet
	week = ((date1-date0)/7).days
	return(week)