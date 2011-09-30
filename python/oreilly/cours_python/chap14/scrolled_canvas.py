#! /usr/bin/env python
# -*- coding: Latin-1 -*-

####################################
#   Scroll Game                    #
#   G.Swinnen, Verviers (Belgium)  #
#   Copyright : GPL                #
####################################

from Tkinter import *
import Pmw
from random import randrange

Pmw.initialise()
coul =['sienna','maroon','brown','pink','tan','wheat','gold','orange','plum',
       'red','khaki','indian red','thistle','firebrick','salmon','coral']
 
class FenPrinc(Pmw.ScrolledCanvas):
    """Fenêtre principale : canevas extensible avec barres de défilement"""
    def __init__(self):
        Pmw.ScrolledCanvas.__init__(self,
                 usehullsize =1, hull_width =500, hull_height =300,
                 canvas_bg ='grey40', canvasmargin =10,                 
                 labelpos =N, label_text ='Attrapez le bouton !',
                 borderframe =1,
                 borderframe_borderwidth =3)
        # Il faut préciser les options ci-dessous après initialisation :         
        self.configure(vscrollmode ='dynamic', hscrollmode ='dynamic')        
        self.pack(padx =5, pady =5, expand =YES, fill =BOTH)
        
        self.can = self.interior()        # accès au composant Canvas
        # Décor : tracé d'une série d'ellipses aléatoires :
        for r in range(80):
            x1, y1 = randrange(-800,800), randrange(-800,800) 
            x2, y2 = x1 +randrange(40,300), y1 +randrange(40,300)
            couleur = coul[randrange(0,16)]
            self.can.create_oval(x1, y1, x2, y2, fill=couleur, outline='black')
        # Ajout d'une petite image GIF :    
        self.img = PhotoImage(file ='linux2.gif')    
        self.can.create_image(50, 20, image =self.img)    
        # Bouton à attraper :    
        self.x, self.y = 50, 100
        self.bou = Button(self.can, text ="Start", command =self.start)
        self.fb = self.can.create_window(self.x, self.y, window =self.bou)
        self.resizescrollregion()
            
    def anim(self):
        if self.run ==0:
            return
        self.x += randrange(-60, 61)
        self.y += randrange(-60, 61)
        self.can.coords(self.fb, self.x, self.y)
        self.configure(label_text = 'Cherchez en %s %s' % (self.x, self.y))       
        self.resizescrollregion()
        self.after(250, self.anim)
        
    def stop(self):
        self.run =0   
        self.bou.configure(text ="Start", command =self.start)   
    
    def start(self):
        self.bou.configure(text ="Attrapez-moi !", command =self.stop)   
        self.run =1
        self.anim()    
        
##### Main Program ##############

FenPrinc().mainloop()
