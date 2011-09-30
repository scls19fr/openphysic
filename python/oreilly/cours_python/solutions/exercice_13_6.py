# -*- coding:Latin-1 -*-

from Tkinter import *

def cercle(can, x, y, r, coul ='white'):
    "dessin d'un cercle de rayon <r> en <x,y> dans le canevas <can>"
    can.create_oval(x-r, y-r, x+r, y+r, fill =coul)

class Application(Tk):
    def __init__(self):
        Tk.__init__(self)        # constructeur de la classe parente
        self.can =Canvas(self, width =475, height =130, bg ="white")
        self.can.pack(side =TOP, padx =5, pady =5)
        Button(self, text ="Train", command =self.dessine).pack(side =LEFT)
        Button(self, text ="Hello", command =self.coucou).pack(side =LEFT)
        Button(self, text ="Ecl34", command =self.eclai34).pack(side =LEFT)
        
    def dessine(self):
        "instanciation de 4 wagons dans le canevas"
        self.w1 = Wagon(self.can, 10, 30)
        self.w2 = Wagon(self.can, 130, 30, 'dark green')
        self.w3 = Wagon(self.can, 250, 30, 'maroon')
        self.w4 = Wagon(self.can, 370, 30, 'purple')
        
    def coucou(self):
        "apparition de personnages dans certaines fenêtres"
        self.w1.perso(3)        # 1er wagon, 3e fenêtre
        self.w3.perso(1)        # 3e wagon, 1e fenêtre
        self.w3.perso(2)        # 3e wagon, 2e fenêtre
        self.w4.perso(1)        # 4e wagon, 1e fenêtre
        
    def eclai34(self):
        "allumage de l'éclairage dans les wagons 3 & 4"
        self.w3.allumer()
        self.w4.allumer()
        
class Wagon:
    def __init__(self, canev, x, y, coul ='navy'):
        "dessin d'un petit wagon en <x,y> dans le canevas <canev>"
        # mémorisation des paramètres dans des variables d'instance :
        self.canev, self.x, self.y = canev, x, y
        # rectangle de base : 95x60 pixels :
        canev.create_rectangle(x, y, x+95, y+60, fill =coul)
        # 3 fenêtres de 25x40 pixels, écartées de 5 pixels :
        self.fen =[]    # pour mémoriser les réf. des fenêtres 
        for xf in range(x +5, x +90, 30):
            self.fen.append(canev.create_rectangle(xf, y+5,
                                xf+25, y+40, fill ='black'))
        # 2 roues de rayon égal à 12 pixels  :
        cercle(canev, x+18, y+73, 12, 'gray')
        cercle(canev, x+77, y+73, 12, 'gray')
  
    def perso(self, fen):
        "apparition d'un petit personnage à la fenêtre <fen>"
        # calcul des coordonnées du centre de chaque fenêtre :
        xf = self.x + fen*30 -12
        yf = self.y + 25
        cercle(self.canev, xf, yf, 10, "pink")      # visage
        cercle(self.canev, xf-5, yf-3, 2)   # oeil gauche        
        cercle(self.canev, xf+5, yf-3, 2)   # oeil droit
        cercle(self.canev, xf, yf+5, 3)     # bouche
        
    def allumer(self):
        "déclencher l'éclairage interne du wagon"
        for f in self.fen:
            self.canev.itemconfigure(f, fill ='yellow')

app = Application()
app.mainloop()