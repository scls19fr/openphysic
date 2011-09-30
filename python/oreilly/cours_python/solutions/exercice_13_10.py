#! /usr/bin/env python
# -*- coding: Latin-1 -*-

##################################################
#                 Oscillo2.py                     #
#  Widget dérivé de <Canvas>, spécialisé pour    #
#  dessiner des graphiques élongation/temps      #
#                                                #
#      Auteur : G.Swinnen (Liège, Belgium)       #
#         16/03/2002 - Licence GPL               #
##################################################

from Tkinter import *
from math import sin, pi

class OscilloGraphe(Canvas):
    "Canevas spécialisé, pour dessiner des courbes élongation/temps"
    def __init__(self, master=None, larg=200, haut=150):
        "Constructeur du graphique : axes et échelle horiz."
        # construction du widget parent :
        Canvas.__init__(self)                             # appel au constructeur 
        self.configure(width=larg, height=haut)           # de la classe parente 
        self.larg, self.haut = larg, haut                         # mémorisation
        # tracé d'une échelle horizontale avec 8 graduations :
        pas = (larg-25)/8.          # intervalles de l'échelle horizontale
        for t in range(1, 9):
            stx = 10 + t*pas        # +10 pour partir de l'origine
            self.create_line(stx, haut/10, stx, haut*9/10, fill='grey')
        # tracé d'une échelle verticale avec 5 graduations :
        pas = haut*2/25.            # intervalles de l'échelle horizontale
        for t in range(-5, 6):
            sty = haut/2 -t*pas      # haut/2 pour partir de l'origine
            self.create_line(10, sty, larg-15, sty, fill='grey')
        # tracé des axes de référence :
        self.create_line(10, haut/2, larg, haut/2, arrow=LAST)    # axe X
        self.create_line(10, haut-5, 10, 5, arrow=LAST)           # axe Y
        # indication des grandeurs physiques aux extrémités des axes :
        self.create_text(20, 10, anchor =CENTER, text = "e")
        self.create_text(larg-10, haut/2-12, anchor =CENTER, text = "t")

    def traceCourbe(self, freq=1, phase=0, ampl=10, coul='red'):
        "tracé d'un graphique élongation/temps sur 1 seconde"
        curve =[]                       # liste des coordonnées
        pas = (self.larg-25)/1000.      # l'échelle X correspond à 1 seconde
        for t in range(0,1001,5):       # que l'on divise en 1000 ms.
            e = ampl*sin(2*pi*freq*t/1000 - phase)
            x = 10 + t*pas
            y = self.haut/2 - e*self.haut/25
            curve.append((x,y))
        n = self.create_line(curve, fill=coul, smooth=1)
        return n                        # n = numéro d'ordre du tracé

#### Code pour tester la classe : ####

if __name__ == '__main__':
    root = Tk()
    gra = OscilloGraphe(root, 250, 180)
    gra.pack()
    gra.configure(bg ='ivory', bd =2, relief=SUNKEN)
    gra.traceCourbe(2, 1.2, 10, 'purple')
    root.mainloop()

