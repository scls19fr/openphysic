#!/usr/bin/env python

'''
Copyright 2012 Sebastien Celles <s.celles@gmail.com>

This file is part of Oscillo Extension for Inkscape.

Oscillo Extension for Inkscape is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

Oscillo Extension for Inkscape is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with Oscillo Extension for Inkscape. If not, see http://www.gnu.org/licenses/.
'''

# Les deux lignes suivantes sont necessaires seulement si le script n'est pas 
#  directement dans le dossier d'installation
import sys
#sys.path.append('/usr/share/inkscape/extensions')

# Utilisation du module inkex avec des effets predefinis
import inkex 
# Le module simplestyle fournit des fonctions pour le parsing des styles
from simplestyle import *

class COscillo( inkex.Effect ):
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
		
		# Creation d'un rectangle 
		x_org = 0
		y_org = 0
		
		osc_width = 100
		osc_height = 80
		
		rectangle = inkex.etree.Element(inkex.addNS('rect', 'svg'))
		rectangle.set('x', str(x_org) )
		rectangle.set('y', str(y_org) )
		rectangle.set('width', str(osc_width)+'mm' )
		rectangle.set('height', str(osc_height)+'mm' )
		rectangle.set('fill', 'rgb( 255, 255, 255)');# couleur de remplissage
		rectangle.set('stroke', 'black');# couleur du contour
		rectangle.set('stroke-width', '3px' );# largeur du contour
		
		# Ajout du rectangle sur le calque
		layer.append( rectangle )
		
		# Creation d'un cercle
		#y_org += pas_y
		#cercle = inkex.etree.Element(inkex.addNS('circle', 'svg'))
		#nRayon = ( pas_y - pas_y / 10.0) / 2.0
		#y_org += 2 * nRayon
		#cercle.set('cx', str(x_org) )
		#cercle.set('cy', str(y_org) )
		#cercle.set('r', str(nRayon) )
		#cercle.set('fill', '#0000FF');
		#cercle.set('stroke', 'red');
		#cercle.set('stroke-width', str(nLargeurTrait) );
		
		# Ajout du cercle sur le calque
		#layer.append( cercle )
		
		# Creation d'une ligne horizontale
		x_org = 0
		y_org = osc_height/2
		ligne = inkex.etree.Element(inkex.addNS('line', 'svg'))
		ligne.set('x1', str(x_org)+'mm' )
		ligne.set('y1', str(y_org)+'mm' )
		ligne.set('x2', str(x_org + osc_width)+'mm' )
		ligne.set('y2', str(y_org)+'mm' );
		ligne.set('stroke', 'rgb(10,10,10)');
		ligne.set('stroke-width', str('1px') );
		
		# Ajout de la ligne sur le calque
		layer.append( ligne )

		# Creation d'une ligne verticale
		x_org = osc_width/2
		y_org = 0
		ligne = inkex.etree.Element(inkex.addNS('line', 'svg'))
		ligne.set('x1', str(x_org)+'mm' )
		ligne.set('y1', str(y_org)+'mm' )
		ligne.set('x2', str(x_org)+'mm' )
		ligne.set('y2', str(y_org+osc_height)+'mm' );
		ligne.set('stroke', 'rgb(10,10,10)');
		ligne.set('stroke-width', str('1px') );
		
		# Ajout de la ligne sur le calque
		layer.append( ligne )		
		
		# Graduations principale (sur ligne hz)
		pas = 10
		nb = (osc_width-pas)/pas # nb de graduations
		x_org = 10
		y_org = osc_height/2
		grad = 4
		pas2 = 1
		grad2 = 2
		for j in range(nb+1):
			if j<>(nb+1)/2-1 and j<>nb:
				ligne = inkex.etree.Element(inkex.addNS('line', 'svg'))
				ligne.set('x1', str(x_org+j*pas)+'mm' )
				ligne.set('y1', str(y_org-grad/2)+'mm' )
				ligne.set('x2', str(x_org+j*pas)+'mm' )
				ligne.set('y2', str(y_org+grad/2)+'mm' );
				ligne.set('stroke', 'rgb(10,10,10)');
				ligne.set('stroke-width', str('1px') );
				layer.append( ligne ) # Ajout de la ligne sur le calque

		# Graduations principale (sur ligne vert)
		pas = 10
		nb = (osc_height-pas)/pas # nb de graduations
		x_org = osc_width/2
		y_org = 10
		grad = 4
		pas2 = 1
		grad2 = 2
		for i in range(nb+1):
			if i<>(nb+1)/2-1 and i<>nb:
				ligne = inkex.etree.Element(inkex.addNS('line', 'svg'))
				ligne.set('x1', str(x_org-grad/2)+'mm' )
				ligne.set('y1', str(y_org+i*pas)+'mm' )
				ligne.set('x2', str(x_org+grad/2)+'mm' )
				ligne.set('y2', str(y_org+i*pas)+'mm' );
				ligne.set('stroke', 'rgb(10,10,10)');
				ligne.set('stroke-width', str('1px') );
				layer.append( ligne ) # Ajout de la ligne sur le calque


# Execute la fonction "effect" de la classe "CHello"
hello = COscillo()
hello.affect()
