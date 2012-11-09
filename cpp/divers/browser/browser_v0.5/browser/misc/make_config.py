#!/usr/bin/env python

import sys
import argparse
from datetime import *

class DisplayConfigGenerator:
        def __init__(self, scriptname, filenameInTemplate, filenameOutConfig):
                self.date0 = date(2012, 8, 6) # date du premier lundi du projet

                weekid = self.currentWeekId(date.today())

                self.scriptname = scriptname
                self.filenameInTemplate = filenameInTemplate
                self.filenameOutConfig = filenameOutConfig

                now = datetime.now()

                self.dic_replace = { # dictionnaire permettant de faire les remplacements dans le template de fichier de conf
                        'scriptname': scriptname,
                        'inputfilename': filenameInTemplate,
                        'outputfilename': filenameOutConfig,
                        'datetime': now,
                        'days': now.weekday(),
                        'weekid': weekid,
                        'nextweekid': weekid+1,
                        'direct_planning_url': "https://upplanning.appli.univ-poitiers.fr/ade/custom/modules/plannings/direct_planning.jsp?login=visu&password=visu&showTree=false&showPianoDays=false&showPianoWeeks=false&showOptions=false&projectId=3",
                }

        def currentWeekId(self, date1=date.today()):
                week = ((date1-self.date0)/7).days
                return(week)

        def mondayOfWeek(self, date):
                pass
		
        def outStr(self):
                fIn = open(self.filenameInTemplate, 'r')
                strOut = fIn.read()
                fIn.close()
                return(strOut.format(**self.dic_replace))

        def writeFile(self):
                fOut = open(self.filenameOutConfig, 'w')
                strOut = self.outStr()
                fOut.write(strOut)
                fOut.close()

if __name__ == "__main__":
        parser = argparse.ArgumentParser(description='Make config file for digital signage', epilog="That's all Folks!")
        parser.add_argument('input', help='filename of template config file', action='store')
        parser.add_argument('output', help='filename of output config file', action='store')
        args = parser.parse_args()
        myconfig = DisplayConfigGenerator(sys.argv[0], args.input, args.output)
        myconfig.writeFile()
