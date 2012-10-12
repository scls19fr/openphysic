#!/usr/bin/env python

'''
Copyright 2012 Sebastien Celles <s.celles@gmail.com>

This file is part of Papier Extension for Inkscape.

Papier Extension for Inkscape is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

Papier Extension for Inkscape is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with Papier Extension for Inkscape. If not, see http://www.gnu.org/licenses/.
'''

# Les deux lignes suivantes sont necessaires seulement si le script n'est pas 
#  directement dans le dossier d'installation
import sys
#sys.path.append('/usr/share/inkscape/extensions')

# Utilisation du module inkex avec des effets predefinis
import inkex 
# Le module simplestyle fournit des fonctions pour le parsing des styles
from simplestyle import *

class CPapier( inkex.Effect ):
	"""
	Exemple Inkscape 
	Cree un nouveau calque et dessine des elements de base
	"""
	def __init__(self):
		"""
		Constructeur
		Definit l'option "--strTexte" du script
		"""
		# Appel du constructeur.
		inkex.Effect.__init__(self)

		# Definit la chaine d'option "--strTexte" avec le raccourci "-w" et 
		#  la valeur par defaut "Hello".
		self.OptionParser.add_option('-w', '--strTexte', action = 'store',
		                             type = 'string', 
		                             dest = 'strTexte', default = 'Hello',
		                             help = 'Message a ecrire ?')
	
	def get_xval(self, x):
		return(x/self.scaleX+self.x0)

	def get_yval(self, y):
		return(y/self.scaleX+self.y0)

	def drawtext(self, layer, x, y, msg, RGB, size):		
		texte = inkex.etree.Element(inkex.addNS('text', 'svg'))
		texte.text = msg
		texte.set('x', str( str(x/self.scaleX+self.x0) + 'mm' ) )
		texte.set('y', str( str(y/self.scaleY+self.y0) + 'mm' ) )
		style = {'text-align' : 'center', \
		         'text-anchor': 'center', \
		         'font-size': size,\
		         'fill': RGB}
		texte.set('style', formatStyle(style) )
		layer.append( texte ) # Ajoute le texte au calque


	def drawpoint(self, layer, x, y, rayon, RGB):		
		cercle = inkex.etree.Element(inkex.addNS('circle','svg'))
		cercle.set('cx', str(x/self.scaleX+self.x0) + 'mm')
		cercle.set('cy', str(y/self.scaleY+self.y0) + 'mm')
		cercle.set('r', str(rayon) + 'mm')
		cercle.set('fill', RGB)
		cercle.set('stroke', RGB)
		cercle.set('stroke-width', '1px')
		layer.append(cercle)
	
	def drawline(self, layer, x1, y1, x2, y2, RGB='rgb(10,10,10)', strokewidth='1px'):
		line = inkex.etree.Element(inkex.addNS('line', 'svg'))
		line.set('stroke', RGB);
		line.set('stroke-width', strokewidth );
		line.set('x1', str(x1/self.scaleX+self.x0) + 'mm' )
		line.set('y1', str(y1/self.scaleY+self.y0) + 'mm' )
		line.set('x2', str(x2/self.scaleX+self.x0) + 'mm' )
		line.set('y2', str(y2/self.scaleY+self.y0) + 'mm' );
		layer.append( line ) # Ajout de la ligne sur le calque
	
	#def drawpoint(self, layer, x, y, RGB='rgb(255,0,0)'):
	#	circle = inkex.etree.Element(inkex.addNS('line', 'svg'))
	#	circle.set('stroke', RGB);
	#	circle.set('x', str(x1/self.scaleX+self.x0) + 'mm' )
	#	circle.set('y', str(y1/self.scaleY+self.y0) + 'mm' )
	#	layer.append( circle ) # Ajout de la ligne sur le calque	
	
	def effect(self):
		"""
		Fonction principale
		Surchage la fonction de la classe de base
		Dessine quelques elements sur le document SVG
		"""
		# Recupere le document SVG principal
		svg = self.document.getroot()

		# Recuperation de la hauteur et de la largeur de la feuille
		width  = inkex.unittouu( svg.get('width') )
		height = inkex.unittouu( svg.attrib['height'] )
		
		# Reglage unite en mm
		# ToDo
		
		# Creation d'un nouveau calque
		layer = inkex.etree.SubElement(svg, 'g')
		layer.set(inkex.addNS( 'label', 'inkscape'), 'Layer texte' )
		layer.set(inkex.addNS( 'groupmode', 'inkscape'), 'layer' )
		
		# Creation d'un element texte
		#texte = inkex.etree.Element(inkex.addNS('text', 'svg'))
		# - Recuperation de la valeur de la variable "strTexte" saisie dans la 
		#    boite de dialogue
		#strVal = self.options.strTexte
		#strVal = "Oscillogramme"
		#texte.text = strVal
		
		# Reglages initiaux
		#x_org = 0
		#y_org = 50
		#pas_x = width / 6
		#pas_y = width / 10

		#texte = inkex.etree.Element(inkex.addNS('text', 'svg'))
		#texte.text = strVal
		
		# Set text position to center of document.
		#texte.set('x', str( x_org ) )
		#texte.set('y', str( y_org ) )
		
		# Center text horizontally with CSS style.
		#style = {'text-align' : 'left', \
		#         'text-anchor': 'top', \
		#         'font-size': '48pt',\
		#         'fill':'rgb(255, 0, 0)'}
		#texte.set('style', formatStyle(style) )
		
		# Ajoute le texte au calque
		#layer.append( texte )
		
		# origine (haut-gauche)
		self.x0 = 5 # mm
		self.y0 = 290 # mm

		self.x0 = 205 # mm
		self.y0 = 490 # mm

		
		self.scaleX = 1
		self.scaleY = -1		
		
		#papier_width = 200
		#papier_height = 250
		papier_width = 150
		papier_height = 120

		# 5 cm
		couleur0 = 'rgb(5,5,5)'
		strokewidth0 = '2px'

		# 1 cm
		couleur1 = 'rgb(5,5,5)'
		strokewidth1 = '1.2px'

		# 5 mm
		couleur2 = 'rgb(100,100,100)'
		strokewidth2 = '1.2px'

		# 1 mm
		couleur3 = 'rgb(127,127,127)'
		strokewidth3 = '1px'

		# Creation des lignes horizontales secondaires (1mm)
		for i in range(0,papier_height/10,1):
			for k in range(1,10):
				self.drawline(layer, 0, i*10+k, papier_width, i*10+k, couleur3, strokewidth3)


		# Creation des lignes verticales secondaires (1mm)
		for j in range(0,papier_width/10,1):
			for k in range(1,10):
				self.drawline(layer, j*10+k, 0, j*10+k, papier_height, couleur3, strokewidth3)

		# Creation des lignes horizontales secondaires (5mm)
                k = 5
		for i in range(0,papier_height/10,1):
                        self.drawline(layer, 0, i*10+k, papier_width, i*10+k, couleur2, strokewidth2)

		# Creation des lignes horizontales verticales (5mm)
                k = 5
		for j in range(0,papier_width/10,1):
			self.drawline(layer, j*10+k, 0, j*10+k, papier_height, couleur2, strokewidth2)

		Xorigin = 20
		Yorigin = 30
		
		for i in range(0,papier_height+10,10):
			if ((i-Yorigin)%50)<>0: # Creation des lignes horizontales primaires (1cm)
				self.drawline(layer, 0, i, papier_width, i, couleur1,strokewidth1)
			else: # Creation des lignes horizontales primaires (5cm)
				self.drawline(layer, 0, i, papier_width, i, couleur0,strokewidth0)
	
		
		for j in range(0,papier_width+10,10):
			if ((j-Xorigin)%50)<>0: # Creation des lignes verticales primaires (1cm)
				self.drawline(layer, j, 0, j, papier_height, couleur1, strokewidth1)
			else: # Creation des lignes verticales (5cm)
				self.drawline(layer, j, 0, j, papier_height, couleur0, strokewidth0)
		
		# Creation des axes
		self.drawline(layer, Xorigin, 0, Xorigin, papier_height, 'rgb(255,0,0)', '3px') # axe ordonnees
		self.drawline(layer, 0, Yorigin, papier_width, Yorigin, 'rgb(255,0,0)', '3px') # axe abscisses
		
		# Creation des ticks axe ordonnees
		#YminorTick = 10 # 25 # 10
		#YmajorTick = 50
		#for i in range(YminorTick, papier_height, YminorTick):
		#	if ((i-Yorigin)%YmajorTick)<>0:
		#		self.drawline(layer, -1.5+Xorigin, i, Xorigin, i, 'rgb(255,0,0)','2px')
		#	else:
		#		self.drawline(layer, -2.5+Xorigin, i, Xorigin, i, 'rgb(255,0,0)','2px')

		YmajorTick = 50
		YminorTickNb = 3
		for i in range(0, (papier_height + YmajorTick)//YmajorTick):
			y = i*YmajorTick+Yorigin
			self.drawline(layer, -2.5+Xorigin, y, Xorigin, y, 'rgb(255,0,0)','2px')
			for k in range(0, YminorTickNb):
				y = i*YmajorTick+Yorigin-k*YmajorTick/YminorTickNb
				#if y>=self.get_yval(0) and y<self.get_yval(papier_height):
				self.drawline(layer, -1.5+Xorigin, y, Xorigin, y, 'rgb(255,0,0)','2px')

		XmajorTick = 50
		XminorTickNb = 3
		for j in range(0, (papier_width + XmajorTick)//XmajorTick):
			x = j*XmajorTick+Xorigin
			self.drawline(layer, x, -2.5+Yorigin, x, Yorigin, 'rgb(255,0,0)','2px')
			for k in range(0, YminorTickNb):
				x = j*XmajorTick+Xorigin-k*XmajorTick/XminorTickNb
				#if x>=self.get_xval(0) and x<=self.get_xval(papier_width):
				self.drawline(layer, x, -1.5+Yorigin, x, Yorigin, 'rgb(255,0,0)','2px')

		self.drawtext(layer, -5+Xorigin + 2.5, papier_height + 2.5, 'U (V)', 'rgb(255, 0, 0)', '12pt')		# Etiquette nom axe Y
		self.drawtext(layer, papier_width + 2.5, -1.4+Yorigin, 'I (A)', 'rgb(255, 0, 0)', '12pt')		# Etiquette nom axe X

		self.drawtext(layer, 0.5*papier_width, 0.85*papier_height, 'Titre du graphique', 'rgb(255, 0, 0)', '18pt')		# Etiquette titre graphique


		# Creation du texte sur axe ordonnees

		# Creation du texte sur axe abscisses		
		
		
		# Nouvelle origine
		
		self.x0 = self.x0 + Xorigin # tjs en mm par rapport au Haut-Gauche
		self.y0 = self.y0 - Yorigin # tjs en mm par rapport au Haut-Gauche
		
		self.scaleX = 1  # 1 cm = scaleX UniteX
		self.scaleY = -1 # 1 cm = 10mm = scaleY UniteY

		self.drawline(layer, 0, 0, 10, 20, 'rgb(0,255,0)', '3px')

		
		# Trace des points experimentaux, de la modelisation lineaire, ...
		self.drawpoint(layer, 0, 0, 1, 'rgb(0,0,255)')
		self.drawpoint(layer, 10, 20, 1, 'rgb(0,255,255)')
		
		# Trace de courbe
		


# Execute la fonction "effect" de la classe "CHello"
drawing = CPapier()
drawing.affect()
