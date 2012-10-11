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
	
	def drawline(self, layer, x1, y1, x2, y2, RGB='rgb(10,10,10)', strokewidth='1px'):
		line = inkex.etree.Element(inkex.addNS('line', 'svg'))
		line.set('stroke', RGB);
		line.set('stroke-width', strokewidth );
		line.set('x1', str(x1)+'mm' )
		line.set('y1', str(y1)+'mm' )
		line.set('x2', str(x2)+'mm' )
		line.set('y2', str(y2)+'mm' );
		layer.append( line ) # Ajout de la ligne sur le calque
	
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
		x0 = 5
		y0 = 23
		
		papier_width = 200
		papier_height = 250

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
				self.drawline(layer, x0, y0+i*10+k, x0+papier_width, y0+i*10+k, couleur3, strokewidth3)


		# Creation des lignes verticales secondaires (1mm)
		for j in range(0,papier_width/10,1):
			for k in range(1,10):
				self.drawline(layer, x0+j*10+k, y0, x0+j*10+k, y0+papier_height, couleur3, strokewidth3)

		# Creation des lignes horizontales secondaires (5mm)
                k = 5
		for i in range(0,papier_height/10,1):
                        self.drawline(layer, x0, y0+i*10+k, x0+papier_width, y0+i*10+k, couleur2, strokewidth2)

		# Creation des lignes horizontales verticales (5mm)
                k = 5
		for j in range(0,papier_width/10,1):
			self.drawline(layer, x0+j*10+k, y0, x0+j*10+k, y0+papier_height, couleur2, strokewidth2)

		
		# Creation des lignes horizontales primaires (1cm)
		for i in range(0,papier_height/10+1,1):
			self.drawline(layer, x0, y0+10*i, x0+papier_width, y0+10*i, couleur1,strokewidth1)
	
		# Creation des lignes verticales primaires (1cm)
		for j in range(0,papier_width/10+1,1):
			self.drawline(layer, x0+10*j, y0, x0+10*j, y0+papier_height, couleur1, strokewidth1)
		
		# Creation des lignes horizontales "50mm"
		for i in range(0,papier_height/10,5):
			self.drawline(layer, x0, y0+10*i, x0+papier_width, y0+10*i, couleur0,strokewidth0)
	
		# Creation des lignes verticales "50mm"
		for j in range(0,papier_width/10,5):
			self.drawline(layer, x0+10*j, y0, x0+10*j, y0+papier_height, couleur0, strokewidth0)


		# Creation des axes
		# Creation du texte


# Execute la fonction "effect" de la classe "CHello"
drawing = CPapier()
drawing.affect()
