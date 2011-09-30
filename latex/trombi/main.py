#!/usr/bin/env python
# -*- coding: utf-8 -*-

# **************************************************************
# * Script en Python permettant de générer un trombinoscope    *
# * Technique : ce script crée un fichier LaTeX .tex           *
# *  le fichier .tex est ensuite compilé via pdflatex          *
# *  Les photos doivent être stockées dans un répertoire ./img *
# *  Les noms/prénoms des personnes sont dans un fichier .csv  *
# **************************************************************

import csv

liste="main.csv"

# 8x3 pour 1ere page
# 8x4 pour autres pages
nb_lignes=4 # 3 pour la premiere page
nb_colonnes=8
nb_lignes_page1=3
titre="Trombinoscope"
params={'TITRE':titre}		

def main():
	filecsv = csv.reader(open(liste,"rb"))

	FILE = open('main.tex', 'w')

	Sep='' #Sep='|'
	#TabularCol="\\begin{tabularx}{\linewidth}{"
	#for i in xrange(0, 8):
		#TabularCol=TabularCol+Sep+">{\centering}X"
		#TabularCol=TabularCol+Sep+">{\centering}m{3cm}"
	#TabularCol=TabularCol+Sep+"}"
	#print TabularCol
	TabularCol="\\begin{tabularx}{\linewidth}{*{"+str(nb_colonnes)+"}{X}}"

	# En tete du fichier .tex
	FILE.write(r""" 
\documentclass[landscape,a4paper]{article}
%\documentclass[12pt,a4paper]{article}
\usepackage[french]{babel}     % specification francaise
%\usepackage[latin1]{inputenc}   % entree clavier latin1
\usepackage[utf8]{inputenc}   % entree clavier unicode
\usepackage[T1]{fontenc}        % sortie

\usepackage{lscape}
\usepackage{graphicx}
\usepackage{tabularx}

%\usepackage{geometry}
%\geometry{ hmargin=1cm, vmargin=1cm }

\setlength{\voffset}{-1.5cm}              % annulation décalage vertical (default=-1in) % fait planter \layout
\setlength{\hoffset}{-0.2cm}              % annulation décalage horizontal (default=-1in) % fait planter \layout
\setlength{\textwidth}{29cm}          % largeur de la zone de texte (default=16.5cm)
\setlength{\textheight}{20cm}           % hauteur de la zone de texte (default=24cm)
%\setlength{\marginparwidth}{40pt}       % largeur marge (default=40pt)
\setlength{\topmargin}{-2cm}           % hauteur de la marge supérieure (default=2cm)
\setlength{\evensidemargin}{-2.54cm}      % marge de gauche pour les pages paires (default=2cm)
\setlength{\oddsidemargin}{-2.54cm}       % marge de gauche pour les pages impaires (default=2.5cm)
%\setlength{\parskip}{\smallskipamount}  % espacement entre les paragraphes (default=\smallskipamount)
%\setlength{\skip\footins}{0.6cm}        % espacement entre le corps de texte et les notes de bas de page (default=0.6cm)

\usepackage[francais]{layout} % Tester les marges \layout

%\usepackage{fullpage}

% Abréviation pour \tabularnewline \hline (saut de ligne dans tableau
% avec ligne horizontale
\newcommand*{\tbnl}{\tabularnewline\hline}

%\title{Trombinoscope}
\author{\null}
%\date{\today}
\date{\null}
\begin{document}
%\begin{landscape}
%\maketitle
%\pagestyle{empty}
%
\null
%\vspace*{-1.5cm}
\begin{center}
{\LARGE
""")
	FILE.write(titre)
	FILE.write(r""" 
}
\end{center}


\vspace*{\stretch{1}}

%\layout % tester les marges
""")

#	FILE.write(TabularCol)
#	FILE.write(r"""
#\hline
#   \begin{tabular}{c}
#      x11a \tabularnewline
#      x11b \tabularnewline
#   \end{tabular}
# & x12 & x13 & x14 & x15 & x16 & x17 & x18 \tbnl
#x21 & x22 & x23 & x24 & x25 & x26 & x27 & x28 \tbnl
#\end{tabularx}
#""")

	# Partie centrale du fichier .tex
	#for row in filecsv:
	indice=0
	page=1
	ligne=1
	colonne=1
	reste=nb_lignes_page1*nb_colonnes

	for NOM, PRENOM, NOMPRENOM, PHOTO, NOM_COURT, PRENOM_COURT in filecsv:
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
				FILE.write("\r\n"+TabularCol+"\r\n")
				#FILE.write("\\hline"+"\r\n")

			if NOMPRENOM=="":
				NOMPRENOM=NOM + " " + PRENOM				
				#NOMPRENOM=NOM + "\r\n" + PRENOM
	
			#L1=NOM
			#L2=PRENOM

			
			params={'NOM':NOM, 'PRENOM':PRENOM, 'NOMPRENOM':NOMPRENOM, 'PHOTO':PHOTO, 'indice':indice, 'colonne':colonne, 'ligne':ligne, 'page':page, 'reste':reste} 
			FILE.write(r"""
   \begin{tabular}{c}
      \includegraphics[width=3cm]{%(PHOTO)s} \tabularnewline
%     %(indice)03d %(NOM)s %(PRENOM)s %(NOMPRENOM)s %(colonne)01d-%(ligne)01d-%(page)01d %(reste)02d %(indice)03d \tabularnewline
      %(NOMPRENOM)s \tabularnewline
   \end{tabular}
"""%params)
			#FILE.write("\\null")
			colonne=colonne+1 # nouvelle colonne
			reste=reste-1
			
			if colonne==nb_colonnes+1: # nouvelle ligne
				colonne=1
				ligne=ligne+1

			if page==1 and ligne==nb_lignes_page1+1 or ligne==nb_lignes+1 and reste>0: # nouvelle page
				ligne=1
				colonne=1
				page=page+1
				reste=nb_lignes*nb_colonnes



			if colonne==1:
				#FILE.write("\\hline"+"\r\n")
				FILE.write("\\end{tabularx}"+"\r\n")
				#if ligne<>1 and colonne<>1: # pas nouvelle page
				FILE.write("\\vspace*{\\stretch{1}}"+"\r\n")
					
			else:
				FILE.write("\r\n & \r\n")

			if ligne==1 and colonne==1:
				FILE.write("\\pagebreak"+"\r\n")
				FILE.write("\\vspace*{\\stretch{1}}"+"\r\n")


		indice=indice+1

	# Fin de la ligne de photo (case vide)
	while colonne<>nb_colonnes and colonne<>1:
		FILE.write("\r\n & \r\n")
		colonne=colonne+1

	if colonne==nb_colonnes:
		FILE.write("\\end{tabularx}"+"\r\n")
		FILE.write("\\vspace*{\\stretch{1}}"+"\r\n")

	# Fin du fichier .tex
	FILE.write(r"""
%\end{tabular} 
%\end{landscape}
\end{document}
""")

	# Fermeture du fichier .tex
	FILE.close()

	# Fermeture du fichier .csv

main()
