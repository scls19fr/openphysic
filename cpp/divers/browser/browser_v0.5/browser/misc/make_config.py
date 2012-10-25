#!/usr/bin/env python

"""
ToDo:
getopt (passer param template.ini et output config file
	http://www2-pcmdi.llnl.gov/cdat/tips_and_tricks/python_tips/passing_arguments.html
open file (read) config template file
open file (write) config file
"""

import sys
import getopt
from datetime import *

class DisplayConfigGenerator:
	def __init__(self):
		self.date0 = date(2012, 8, 6) # date du premier lundi du projet
		
		self.dic_replace = { # dictionnaire permettant de faire les remplacements dans le template de fichier de conf
	    	'weekid': self.currentWeekId(date.today()),
	    	'nextweekid': self.currentWeekId(date.today())+1
		}


	def currentWeekId(self, date1=date.today()):
		week = ((date1-self.date0)/7).days
		return(week)
		
	def mondayOfWeek(self, date):
		pass
		
	def out(self):
		return("""[config]
playing=true
page=0
delayReloadData=300000

[proxy]
enabled=false
setType=3
setHostName=cache.univ-poitiers.fr
setPort=3128
setUser=
setPassword=

[slide_default]
title=Titre par defaut
url="http://www.google.fr?q=defaut"
message_file=
message=Pas de message
delay=5000
transition_type=1
transition_duration=1000
zoom=1

[slides]
show_slides="0,1,3,4,5,7"
0\\title=GTE1 - S1-S2
0\\url="https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&days=0,1,2,3,4&displayConfName=IUTP-Campus%20(GTE)%20affichage%20lim&code=_Z1PT11_TP1,_Z1PT11_TP2,_Z1PT11_TP3,_Z1PT11_TP4,_Z1PT11_TP5,_Z1PT11_TP6&projectId=3"
0\\message_file=/Users/scls/display/messages/gte1.txt
0\\message=
0\\delay=20000
0\\zoom=1
1\\title=GTE2 - S3
1\\url="https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&days=0,1,2,3,4&displayConfName=IUTP-Campus%20(GTE)%20affichage%20lim&code=_Z2PT11_S3_TP1,_Z2PT11_S3_TP2,_Z2PT11_S3_TP3,_Z2PT11_S3_TP4,_Z2PT11_S3_TP5&projectId=3"
1\\message_file=/Users/scls/display/messages/gte2.txt
1\\message=
1\\delay=20000
1\\zoom=1
2\\title=GTE2 - S4
2\\url="https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&days=0,1,2,3,4&displayConfName=IUTP-Campus%20(GTE)%20affichage%20lim&code=_Z2PT11_S4_TP1,_Z2PT11_S4_TP2,_Z2PT11_S4_TP3,_Z2PT11_S4_TP4,_Z2PT11_S4_TP5&projectId=3"
2\\message_file=/Users/scls/display/messages/gte2.txt
2\\message=
2\\delay=20000
2\\zoom=1
3\\title=LP VERTE
3\\url="https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&days=0,1,2,3,4&displayConfName=IUTP-Campus%20(GTE)%20affichage%20lim&code=_ZWP041_TP1FI,_ZWP041_TP1FA,_ZWP041_TP2FI,_ZWP041_TP2FA&projectId=3"
3\\message_file=/Users/scls/display/messages/lpverte.txt
3\\message=
3\\delay=20000
3\\zoom=1

4\\title=GTE1 - S1-S2 (sem. prochaine)
4\\url="https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&days=0,1,2,3,4&displayConfName=IUTP-Campus%20(GTE)%20affichage%20lim&code=_Z1PT11_TP1,_Z1PT11_TP2,_Z1PT11_TP3,_Z1PT11_TP4,_Z1PT11_TP5,_Z1PT11_TP6&projectId=3&weeks={nextweekid}"
4\\message_file=/Users/scls/display/messages/gte1.txt
4\\message=
4\\delay=20000
4\\zoom=1
5\\title=GTE2 - S3 (sem. prochaine)
5\\url="https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&days=0,1,2,3,4&displayConfName=IUTP-Campus%20(GTE)%20affichage%20lim&code=_Z2PT11_S3_TP1,_Z2PT11_S3_TP2,_Z2PT11_S3_TP3,_Z2PT11_S3_TP4,_Z2PT11_S3_TP5&projectId=3&weeks={nextweekid}"
5\\message_file=/Users/scls/display/messages/gte2.txt
5\\message=
5\\delay=20000
5\\zoom=1
6\\title=GTE2 - S4 (sem. prochaine)
6\\url="https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&days=0,1,2,3,4&displayConfName=IUTP-Campus%20(GTE)%20affichage%20lim&code=_Z2PT11_S4_TP1,_Z2PT11_S4_TP2,_Z2PT11_S4_TP3,_Z2PT11_S4_TP4,_Z2PT11_S4_TP5&projectId=3&weeks={nextweekid}"
6\\message_file=/Users/scls/display/messages/gte2.txt
6\\message=
6\\delay=20000
6\\zoom=1
7\\title=LP VERTE (sem. prochaine)
7\\url="https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&days=0,1,2,3,4&displayConfName=IUTP-Campus%20(GTE)%20affichage%20lim&code=_ZWP041_TP1FI,_ZWP041_TP1FA,_ZWP041_TP2FI,_ZWP041_TP2FA&projectId=3&weeks={nextweekid}"
7\\message_file=/Users/scls/display/messages/lpverte.txt
7\\message=
7\\delay=20000
7\\zoom=1""".format(**self.dic_replace) )


def main(argv):
	#opts, extraparams = getopt.getopt(sys.argv[1:]) 
	#print opts
	#print extraparams
	

	config = DisplayConfigGenerator()
	#print config.currentWeekId(date(2012,9,6))
	print config.out()

if __name__ == "__main__":
	main(sys.argv[1:])
