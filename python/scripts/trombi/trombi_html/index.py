#!/usr/bin/env python
# -*- coding: utf-8 -*-

# **************************************************************
# * Script en Python permettant de générer un trombinoscope    *
# * Technique : ce script crée un fichier HTML .html           *
# *  ce fichier .html peut ensuite être visualisé via un       *
# *  navigateur web (Firefox, Internet Explorer...)            *
# *  Les photos doivent être stockées dans un répertoire ./img *
# *  Les noms/prénoms des personnes sont dans un fichier .csv  *
# **************************************************************

import csv

liste="main.csv"

nb_colonnes=8
titre="Trombinoscope"

def main():
	# Ouverture du fichier CSV
	FILECSV=open(liste,"rb")
	filecsv = csv.reader(FILECSV)

	# Creation du fichier .html
	FILE = open('index.html', 'w')

	#%{'TITRE':TITRE}

	# Creation de l'entête du fichier .html
	FILE.write(r"""<html>
  <head>
    <title>
      %(TITRE)s
    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>  
  </head>
  <body>
    <center>
      <h1>%(TITRE)s</h1>
    </center>

    <center>
    <table>
"""%{'TITRE':titre})

	# Partie centrale du fichier .html
	indice=0
	ligne=1
	colonne=1

	for NOM, PRENOM, PHOTO, NOM_COURT, PRENOM_COURT in filecsv:
		if indice<>0:
			if PHOTO=='':
				PHOTO="img/"+"nophoto.png"
			else:
				try:
					numphoto = int(PHOTO)
				except ValueError:
					numphoto = None

				if numphoto is not None:
					PHOTO="img/"+"%(#)06d" % {"#": numphoto} + ".jpg"
				#else:
				#	PHOTO="err.jpg"

			if colonne==1:
				FILE.write("      <tr>"+"\r\n")

			if NOM_COURT=="":
				NOM_COURT=NOM
			
			if PRENOM_COURT=="":
				PRENOM_COURT=PRENOM

			NOMPRENOM=NOM_COURT + " " + PRENOM_COURT				

			#if NOM_COURT=="":
                        #        LIGNE1=NOM

			#if PRENOM_COURT=="":
                        #        LIGNE2=PRENOM

			#PRENOM.encode('UTF-8','replace')
			#PRENOM = unicode(PRENOM,'UTF-8') 

			params={'NOM':NOM_COURT, 'PRENOM':PRENOM_COURT, 'NOMPRENOM':NOMPRENOM, 'PHOTO':PHOTO, 'indice':indice, 'colonne':colonne, 'ligne':ligne} 
			#FILE.write(r"""        <td>
#          <img src="%(PHOTO)s" width="17" height="17" align="bottom" alt="%(NOMPRENOM)s">
#        </td>
#"""%params)
			#FILE.write(r"""        <td>
#          <img src="%(PHOTO)s" align="bottom" alt="%(NOMPRENOM)s">
#          <p>
#          %(NOMPRENOM)s
#          </p>
#        </td>
#"""%params)
                        FILE.write(r"""
        <td>
          <table>
            <tr><td><img src="%(PHOTO)s" align="bottom" alt="%(NOMPRENOM)s"></td></tr>
<!--            <tr><td>%(NOMPRENOM)s</td></tr> -->
                <tr><td>%(NOM)s</td></tr>
                <tr><td>%(PRENOM)s</td></tr>
          </table>
        </td>
"""%params)

			colonne=colonne+1 # nouvelle colonne
			
			if colonne==nb_colonnes+1: # nouvelle ligne
				colonne=1
				ligne=ligne+1


			if colonne==1:
				FILE.write("      </tr>"+"\r\n")					
			else:
				FILE.write("")


		indice=indice+1

	# Fin de la ligne de photo (case vide)
	while colonne<>nb_colonnes+1 and colonne<>1:
		FILE.write("        <td>"+"\r\n")
		#FILE.write("           "+"\r\n")
		FILE.write("        </td>"+"\r\n")
		colonne=colonne+1

	if colonne==nb_colonnes+1:
		FILE.write("      </tr>"+"\r\n")
		#FILE.write(""+"\r\n")

	# Fin du fichier .html
	FILE.write(r"""    </table>
    </center>
  </body>
</html>
""")

	# Fermeture du fichier .html
	FILE.close()

	# Fermeture du fichier .csv
	FILECSV.close()

main()

