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

                self.dic_replace = { # dictionnaire permettant de faire les remplacements dans le template de fichier de conf
                        'scriptname': scriptname,
                        'inputfilename': filenameInTemplate,
                        'outputfilename': filenameOutConfig,
                        'datetime': datetime.now(),
                        'weekid': weekid,
                        'nextweekid': weekid+1,
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
        parser.add_argument('--input', help='filename of template config file', nargs=1, type=str, required=True)
        parser.add_argument('--output', help='filename of output config file', nargs=1, type=str, required=True)
        args = parser.parse_args()
        myconfig = DisplayConfigGenerator(sys.argv[0], args.input[0], args.output[0])
        myconfig.writeFile()
