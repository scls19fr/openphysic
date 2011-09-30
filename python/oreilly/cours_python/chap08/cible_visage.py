# -*- coding:Latin-1 -*-

# Exercice utilisant la bibliothèque graphique Tkinter
 
from Tkinter import *

def cercle(x, y, r, coul ='black'):
    "tracé d'un cercle de centre (x,y) et de rayon r"
    can.create_oval(x-r, y-r, x+r, y+r, outline=coul)
    
def figure_1():
    "dessiner une cible"
    # Effacer d'abord tout dessin préexistant :
    can.delete(ALL)
    # tracer les deux lignes (vert. et horiz.) :
    can.create_line(100, 0, 100, 200, fill ='blue')
    can.create_line(0, 100, 200, 100, fill ='blue')
    # tracer plusieurs cercles concentriques :
    rayon = 15
    while rayon < 100:
        cercle(100, 100, rayon)
        rayon += 15 
     
def figure_2():
    "dessiner un visage simplifié"
    # Effacer d'abord tout dessin préexistant :
    can.delete(ALL)
    # Les caractéristiques de chaque cercle sont
    # placées dans une liste de listes :
    cc =[[100, 100, 80, 'red'],     # visage
         [70, 70, 15, 'blue'],      # yeux
         [130, 70, 15, 'blue'],     
         [70, 70, 5, 'black'],      
         [130, 70, 5, 'black'],
         [44, 115, 20, 'red'],      # joues
         [156, 115, 20, 'red'],
         [100, 95, 15, 'purple'],   # nez
         [100, 145, 30, 'purple']]  # bouche
    # on trace tous les cercles à l'aide d'une boucle :
    i =0
    while i < len(cc):      # parcours de la liste
        el = cc[i]          # chaque élément est lui-même une liste
        cercle(el[0], el[1], el[2], el[3])
        i += 1

##### Programme principal : ############
    
fen = Tk()
can = Canvas(fen, width =200, height =200, bg ='ivory')
can.pack(side =TOP, padx =5, pady =5)
b1 = Button(fen, text ='dessin 1', command =figure_1)
b1.pack(side =LEFT, padx =3, pady =3)
b2 = Button(fen, text ='dessin 2', command =figure_2)
b2.pack(side =RIGHT, padx =3, pady =3)
fen.mainloop()