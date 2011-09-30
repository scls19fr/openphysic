#! /usr/bin/env python
from Tkinter import Tk, Label, Canvas
from threading import Thread
from random import Random

R="red"
W="white"
S = 2 	#	l'echelle
TAILLE_X = 200
TAILLE_Y = 200

root=Tk()
dessin = Canvas(root, width=S*TAILLE_X, height=S*TAILLE_Y,background=W)
dessin.pack()

hasard = Random()
thr = Thread(None, root.mainloop)

# POINT 1 pour thr.start() : tres lent
thr.start()

for rnd in range(0, 8000):
    x = hasard.randint(0, TAILLE_X - 1)
    y = hasard.randint(0, TAILLE_Y - 1)
    dessin.create_rectangle(S*x,S*y,S*x-S,S*y-S,outline=R,fill=R)


for x in range (60,120):
    for y in range (60,120):
        dessin.create_rectangle(S*x,S*y,S*x-S,S*y-S,outline=R,fill=R)

# POINT 2 pour thr.start() : bufferise, affichage instantane

while(1):
    pass
    #null;
