# Statistiques SVG avec Python
#
# auteur : Frédéric Laurent
# http://www.opikanoba.org

import os
import os.path
import string
import webbrowser
import tempfile
import SVGdraw

XMAX=100
STEP=20
YMAX=100
BAR_THICKNESS= 20
SPACE= 10

class DirectoryExplorer:
	def __init__(self):
		self.svgURL=tempfile.gettempdir()+"/result.svg"
		self.infos = []
		self.totalSize = 0
		self.rootSize=0
		self.rootName=None

	def tupleCmp(self, a,b):
		(nameA, sizeA) = a
		(nameB, sizeB) = b
		return cmp(sizeB,sizeA)
		
	def gatherSize(self, directory, level, deep=1):
		listdir = os.listdir(directory)
		filelist = filter(lambda f:os.path.isfile(os.path.join(directory, f)), listdir)
		weight = sum([os.path.getsize(os.path.join(directory, name)) for name in filelist])
		subdir = filter(lambda f: os.path.isdir(os.path.join(directory, f)), listdir)
		subdir_w = sum([self.gatherSize(os.path.join(directory,f),level,deep+1) for f in subdir])
		total = weight+subdir_w
		if (deep<=level):
			if (deep==1):
				self.totalSize = total
				self.rootSize = weight
				self.rootName=directory
				self.infos.append((directory,self.rootSize))
			else:
				self.infos.append((directory,total))
		return total
		
	def toSVG(self):
		#modification du maximum en X : depend du nombre d'element
		global XMAX
		XMAX = len(self.infos)*(BAR_THICKNESS+SPACE)
		# creation du document
		doc=SVGdraw.drawing()
		svg=SVGdraw.svg(None, '100%','100%')
		
		# creation des patterns pour les axes et la grille
		axeX = SVGdraw.pattern(id="axeX",width="20",height="10",patternUnits="userSpaceOnUse")
		axeX.addElement(SVGdraw.path("M 0 0, L 0 10","none","black","0.25"))
		axeX.addElement(SVGdraw.path("M 10 10, V 5","none","lightgray","0.25"))
		axeY = SVGdraw.pattern(id="axeY",width="10",height="20",patternUnits="userSpaceOnUse")
		axeY.addElement(SVGdraw.path("M 0 0, L 10 0","none","black","0.25"))
		axeY.addElement(SVGdraw.path("M 5 10, L 10 10","none","lightgray","0.25"))
		grid = SVGdraw.pattern(id="grid",width="10",height="10",patternUnits="userSpaceOnUse")
		grid.addElement(SVGdraw.path("M 0 0, L 10 0, L 10 10,L 0 10, L 0 0","none","lightgray","0.25"))

		defs=SVGdraw.defs()
		defs.addElement(axeX)
		defs.addElement(axeY)
		defs.addElement(grid)
		svg.addElement(defs)
		
		group=SVGdraw.group(transform="translate(130,130) scale(1,-1)")
		
		# dessin de la grille de fond
		group.addElement(SVGdraw.rect(0,0,XMAX,YMAX,"url(#grid)","lightgray","0.25"))
	
		# dessin des axes
		group.addElement(SVGdraw.rect(0,-10,XMAX,10,"url(#axeX)"))
		group.addElement(SVGdraw.rect(-10,0,10,YMAX,"url(#axeY)"))
		group.addElement(SVGdraw.line(0,0,XMAX,0,"black",1))
		group.addElement(SVGdraw.line(0,0,0,YMAX,"black",1))
		# dessin des fleches des axes
		group.addElement(SVGdraw.polygon([[-3,YMAX],[3,YMAX],[0,YMAX+10]], "black","white"))
		group.addElement(SVGdraw.polygon([[XMAX,-3],[XMAX,3],[XMAX+10,0]], "black","white"))
		
		textgroup=SVGdraw.group(transform="scale(1,-1)")
		# graduations
		for y in range(0,YMAX+STEP,STEP):
			textgroup.addElement(SVGdraw.text(-STEP,y, str(y), 8, text_anchor="middle", transform="translate(0,%d)"%(-y*2)))
		textgroup.addElement(SVGdraw.text(0,YMAX+SPACE, r"%", 8, transform="translate(0,%d)"%(-(YMAX+SPACE)*2)))
		
		# ajout de la legende principale
		legendText = "Repertoire %s - taille %.02f ko"%(self.rootName,float(self.totalSize/1024.0))
		textgroup.addElement(SVGdraw.text(XMAX,YMAX+3*SPACE, legendText,12, "verdana", 
			text_anchor="end", fill="darkblue",transform="translate(0,%d)"%(-(YMAX+3*SPACE)*2)))
		
		group.addElement(textgroup)
		
		# tri des elements selon la taille occupee
		self.infos.sort(self.tupleCmp)
		
		xincr=0
		#self.infos
		for (name,size) in self.infos:
			# calcul du pourcentage de place occupe
			pourcent = (100.0*float(size))/float(self.totalSize)
			height=int(pourcent*YMAX/100);
			# insertion du texte de l'emplacement sur le disque et de la taille occupee en Ko
			legendText = "%s (%### ###.02f ko)"%(name,float(size/1024.0))
			legend = SVGdraw.text(xincr+BAR_THICKNESS/2, -10,legendText,8,"verdana",text_anchor="begin",fill="blue")
			legend.attributes["transform"]="scale(1,-1) translate(0,20) rotate(45,%d,-10)"%(xincr+BAR_THICKNESS/2)
			group.addElement(legend)
			
			#insertion de la barre representant le pourcentage
			group.addElement(SVGdraw.rect(xincr,0,BAR_THICKNESS, height,"green","black",opacity=0.5))
			
			#insertion de la taille en pourcentage a gauche de la barre
			pourcentText=SVGdraw.text(xincr+BAR_THICKNESS/2, height+SPACE,"%02.01f%% "%pourcent,6,
				"arial", text_anchor="middle", fill="black")
			pourcentText.attributes["transform"]="scale(1,-1) translate(0,-%d)"%((height+SPACE)*2)
			group.addElement(pourcentText)
			# augmentation du l'abscisse en X
			xincr = xincr+BAR_THICKNESS+SPACE
			
		svg.addElement(group)
		doc.setSVG(svg)
		doc.toXml(self.svgURL)
		
if __name__=="__main__":
	de = DirectoryExplorer()
	de.gatherSize(r"/Python",2)
	de.toSVG()
	webbrowser.open(de.svgURL)
