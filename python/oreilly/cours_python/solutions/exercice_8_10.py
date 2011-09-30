# -*- coding:Latin-1 -*-

# Dessin d'un damier, avec placement de pions au hasard
 
from Tkinter import *
from random import randrange        # générateur de nombres aléatoires

def damier():
    "dessiner dix lignes de carrés avec décalage alterné"
    y = 0
    while y < 10:
        if y % 2 == 0:              # une fois sur deux, on
            x = 0                   # commencera la ligne de
        else:                       # carrés avec un décalage
            x = 1                   # de la taille d'un carré
        ligne_de_carres(x*c, y*c)
        y += 1
        
def ligne_de_carres(x, y):
    "dessiner une ligne de carrés, en partant de x, y" 
    i = 0
    while i < 10:
        can.create_rectangle(x, y, x+c, y+c, fill='navy')
        i += 1
        x += c*2                    # espacer les carrés
        
def cercle(x, y, r, coul):
    "dessiner un cercle de centre x,y et de rayon r"
    can.create_oval(x-r, y-r, x+r, y+r, fill=coul)
    
def ajouter_pion():
    "dessiner un pion au hasard sur le damier"
    # tirer au hasard les coordonnées du pion :
    x = c/2 + randrange(10) * c
    y = c/2 + randrange(10) * c
    cercle(x, y, c/3, 'red')
        
##### Programme principal : ############
    
# Tâchez de bien "paramétrer" vos programmes, comme nous l'avons
# fait dans ce script. Celui-ci peut en effet tracer des damiers
# de n'importe quelle taille en changeant seulement la valeur
# d'une seule variable, à savoir la dimension des carrés :
 
c = 30                  # taille des carrés

fen = Tk()
can = Canvas(fen, width =c*10, height =c*10, bg ='ivory')
can.pack(side =TOP, padx =5, pady =5)
b1 = Button(fen, text ='damier', command =damier)
b1.pack(side =LEFT, padx =3, pady =3)
b2 = Button(fen, text ='pions', command =ajouter_pion)
b2.pack(side =RIGHT, padx =3, pady =3)
fen.mainloop()