# -*- coding:Latin-1 -*-

from Tkinter import *
from math import pi, sin, cos

class Canon:
    """Petit canon graphique"""
    def __init__(self, boss, x, y, angle=25):
        self.boss = boss            # référence du canevas
        self.x1, self.y1 = x, y     # axe de rotation du canon
        # dessiner la buse du canon, à l'horizontale pour commencer :
        self.lbu = 50               # longueur de la buse
        self.x2, self.y2 = x + self.lbu, y
        self.buse = boss.create_line(self.x1, self.y1, self.x2, self.y2,
                                     width =10)
        # dessiner ensuite le corps du canon par-dessus :
        r = 15                      # rayon du cercle 
        boss.create_oval(x-r, y-r, x+r, y+r, fill='blue', width =3)
        # dessiner un obus (réduit à un simple point, avant animation) :
        self.obus =boss.create_oval(x, y, x, y, fill='red')
        self.anim =False            # interrupteur d'animation
        # retrouver la largeur et la hauteur du canevas :
        self.xMax =int(boss.cget('width'))
        self.yMax =int(boss.cget('height'))
                
    def orienter(self, angle):
        "choisir l'angle de tir du canon"
        # rem : le paramètre <angle> est reçu en tant que chaîne de car.
        # il faut le traduire en nombre réel, puis convertir en radians :
        self.angle = float(angle)*2*pi/360      
        self.x2 = self.x1 + self.lbu*cos(self.angle)
        self.y2 = self.y1 - self.lbu*sin(self.angle)
        self.boss.coords(self.buse, self.x1, self.y1, self.x2, self.y2)
        
    def feu(self):
        "déclencher le tir d'un obus"
        if not self.anim:
            self.anim =True
            # position de départ de l'obus (c'est la bouche du canon) :
            self.boss.coords(self.obus, self.x2 -3, self.y2 -3,
                                        self.x2 +3, self.y2 +3)
            v =15              # vitesse initiale
            # composantes verticale et horizontale de cette vitesse :
            self.vy = -v *sin(self.angle)
            self.vx = v *cos(self.angle)
            self.animer_obus()
    
    def animer_obus(self):
        "animation de l'obus (trajectoire balistique)"
        if self.anim:
            self.boss.move(self.obus, int(self.vx), int(self.vy))
            c = self.boss.coords(self.obus)     # coord. résultantes
            xo, yo = c[0] +3, c[1] +3   # coord. du centre de l'obus
            if yo > self.yMax or xo > self.xMax:
                self.anim =False        # arrêter l'animation
            self.vy += .5
            self.boss.after(30, self.animer_obus)
        
if __name__ == '__main__':
    # Code pour tester sommairement la classe Canon : 
    f = Tk()
    can = Canvas(f,width =250, height =250, bg ='ivory')
    can.pack(padx =10, pady =10)
    c1 = Canon(can, 50, 200)

    s1 =Scale(f, label='hausse', from_=90, to=0, command=c1.orienter)
    s1.pack(side=LEFT, pady =5, padx =20)
    s1.set(25)                          # angle de tir initial

    Button(f, text='Feu !', command =c1.feu).pack(side=LEFT)

    f.mainloop()
