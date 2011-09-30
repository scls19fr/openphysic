#!/usr/bin/env python
# -*- coding: utf-8 -*-

from libagenda import *
from datetime import *
# import reportlab
#from array import *

# Genere un agenda
# ================

agenda_year = 2009
weeks_nb = 2
t1 = date(agenda_year, 8, 1) # yyyy mm dd
start_weekday = 0 # 0:Lu 1:Ma 2:Me 3:Je 4:Ve 5:Sa 6:Di

# obtenir le premier lundi (ou autre start_weekday) suivant la date t1
t = first_day(t1, start_weekday)

#saints=dict()
#saints['j0408']=["toto"]
#saints['j0508']=["tata"]
#saints=array("s")
#saints[1]="tata"


for w in range(0, weeks_nb):
	#print w
	print "=== semaine %s ===" % (t.isocalendar()[1]) #w+1
	for _d in range(0, 7):
		#print t.weekday()
		weekday=t.weekday()
		day=t.timetuple()[2]
		month=t.timetuple()[1]
		year=t.timetuple()[0]
		print "%s %s %s %s" % (weekdayToStr(weekday), dayToStr(day), monthToStr(month), year)
		#print weekday(0)
		#print saints["j%s%s" % (t.timetuple()[2], t.timetuple()[1])]
		
		s=saints( month, day )
		if s<>"":
			print " saint(e) " + s

		t = t + timedelta(1)



#print t.__hash__()