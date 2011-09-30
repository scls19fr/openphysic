#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
    Copyright Sebastien Celles, (2011/09/11) 
    
    s.celles@gmail.com
    http://www.celles.net/
    
    Ce logiciel est un programme informatique servant à [rappeler les
    caractéristiques techniques de votre logiciel]. 
    
    Ce logiciel est régi par la licence CeCILL soumise au droit français et
    respectant les principes de diffusion des logiciels libres. Vous pouvez
    utiliser, modifier et/ou redistribuer ce programme sous les conditions
    de la licence CeCILL telle que diffusée par le CEA, le CNRS et l'INRIA 
    sur le site "http://www.cecill.info".
    
    En contrepartie de l'accessibilité au code source et des droits de copie,
    de modification et de redistribution accordés par cette licence, il n'est
    offert aux utilisateurs qu'une garantie limitée.  Pour les mêmes raisons,
    seule une responsabilité restreinte pèse sur l'auteur du programme,  le
    titulaire des droits patrimoniaux et les concédants successifs.
    
    A cet égard  l'attention de l'utilisateur est attirée sur les risques
    associés au chargement,  à l'utilisation,  à la modification et/ou au
    développement et à la reproduction du logiciel par l'utilisateur étant 
    donné sa spécificité de logiciel libre, qui peut le rendre complexe à 
    manipuler et qui le réserve donc à des développeurs et des professionnels
    avertis possédant  des  connaissances  informatiques approfondies.  Les
    utilisateurs sont donc invités à charger  et  tester  l'adéquation  du
    logiciel à leurs besoins dans des conditions permettant d'assurer la
    sécurité de leurs systèmes et ou de leurs données et, plus généralement, 
    à l'utiliser et l'exploiter dans les mêmes conditions de sécurité. 
    
    Le fait que vous puissiez accéder à cet en-tête signifie que vous avez 
    pris connaissance de la licence CeCILL, et que vous en avez accepté les
    termes.
"""

"""
Ouvrir le lfichier .ods
Modifier nom des élèves et mettre le numero de passage (numéro de photo affiché sur l'appareil... pas le nom de la photo)
Enregistrer le fichier au format .csv
Repérer le nom du fichier de la première photo IM000592.jpg et mettre dans num_prem_photo (ici 592)
Repérer le plus petit numéro de passage (premier numéro de photo sur l'appareil) et mettre dans num_ordre_prem_photo (ici 87)

"""


import csv
import os.path

liste = "bilan_fiche_renseignements_eleve.csv"
annee = "2011-2012"
classe = "5D"
trombi_f = "trombi_%s_%s.html" % (annee, classe) #'index.html'
nb_colonnes = 8
titre = "Trombinoscope 5emeD - 2011-2012"
num_prem_photo = 592 # premier numero de fichier image IM000592.jpg ici 592
num_ordre_prem_photo = 87 # premier numero numero d'ordre de passage
PHOTO_INC = "photos/"+"nophoto.png"
PHOTO_NAME_FORMAT = "IM%(#)06d.jpg" 
PHOTO_DIR = "photos/img/"

def main(): #Ouverture du fichier CSV
    FILECSV = open(liste, "r")
    filecsv = csv.reader(FILECSV)

    #Creation du fichier.html
    FILE = open(trombi_f, 'w')

    #Creation de l 'entete du fichier .html
    FILE.write(r"""<html>
  <head>
    <title>
      %(TITRE)s
    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>  
  </head>
  <body>
    <center>
      %(TITRE)s
    </center>

    <center>
    <table>
""" % {'TITRE':titre})

    # Partie centrale du fichier .html
    indice=0
    ligne=1
    colonne=1
    
    for row in filecsv:
        #print(row)
        NOM = row[1]
        PRENOM = row[2]
        NUM_PHOTO = row[11]
    
        if indice!=0:
            try:
                numphoto = int(NUM_PHOTO) # verif si il y a bien un numero d'ordre de passage
                num_fichier_photo = numphoto+num_prem_photo-num_ordre_prem_photo
                print("n°%s %s %s - fichier %s" % (indice, NOM, PRENOM, num_fichier_photo))
                PHOTO = PHOTO_DIR + PHOTO_NAME_FORMAT % {"#": num_fichier_photo}
            except ValueError:
                PHOTO = PHOTO_INC # s'il n'y en a pas (rien dans la col ou non convertible en nombre)
                print("n°%s %s %s - fichier %s" % (indice, NOM, PRENOM, "PAS DE NUMERO D'ORDRE"))

            if not os.path.isfile(PHOTO):
                PHOTO = PHOTO_INC
                print("n°%s %s %s - fichier %s" % (indice, NOM, PRENOM, "FICHIER PHOTO INTROUVABLE"))

            print("\t"+PHOTO)

            FILE.write(r"""
        <td>
          <table>
            <tr><td><img src="%s" align="bottom" width="100px" alt="%s"></td></tr>
                <tr><td>%s</td></tr>
                <tr><td>%s</td></tr>
          </table>
        </td>
""" % (PHOTO, NOM+'_'+PRENOM, NOM, PRENOM) )

            colonne = colonne + 1 # nouvelle colonne
			
            if colonne == nb_colonnes+1: # nouvelle ligne
                colonne=1
                ligne=ligne+1

            if colonne == 1:
                FILE.write("      </tr>"+"\r\n")					
            else:
                FILE.write("")

        indice = indice+1

	# Fin de la ligne de photo (case vide)
	#while colonne <> nb_colonnes + 1 and colonne <> 1:
	#	FILE.write("        <td>"+"\r\n")
	#	#FILE.write("           "+"\r\n")
	#	FILE.write("        </td>"+"\r\n")
	#	colonne=colonne+1

    if colonne == nb_colonnes + 1:
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
