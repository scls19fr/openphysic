# -*- coding:Latin-1 -*-

from Tkinter import *
from math import sin, cos, pi
from random import randrange
from threading import Thread
import time

class Canon:
    """Petit canon graphique"""
    def __init__(self, boss, num, x, y, sens):
        self.boss = boss            # référence du canevas
        self.num = num              # n° du canon dans la liste
        self.x1, self.y1 = x, y     # axe de rotation du canon
        self.sens = sens            # sens de tir (-1:gauche, +1:droite)
        self.lbu = 30               # longueur de la buse
        # dessiner la buse du canon (horizontale) :
        self.x2, self.y2 = x + self.lbu * sens, y
        self.buse = boss.create_line(self.x1, self.y1,
                                     self.x2, self.y2, width =10)
        # dessiner le corps du canon (cercle de couleur) :
        self.rc = 15                # rayon du cercle 
        self.corps = boss.create_oval(x -self.rc, y -self.rc, x +self.rc,
                                      y +self.rc, fill ='black')
        # pré-dessiner un obus (au départ c'est un simple point) :
        self.obus = boss.create_oval(x, y, x, y, fill='red')
        self.anim = 0
        # retrouver la largeur et la hauteur du canevas :
        self.xMax = int(boss.cget('width'))
        self.yMax = int(boss.cget('height'))

    def orienter(self, angle):
        "régler la hausse du canon"
        # rem : le paramètre <angle> est reçu en tant que chaîne.
        # il faut donc le traduire en réel, puis le convertir en radians :
        self.angle = float(angle)*2*pi/360      
        self.x2 = self.x1 + self.lbu * cos(self.angle) * self.sens
        self.y2 = self.y1 - self.lbu * sin(self.angle)
        self.boss.coords(self.buse, self.x1, self.y1, self.x2, self.y2)
        
    def feu(self):
        "déclencher le tir d'un obus"
        # référence de l'objet cible :
        self.cible = self.boss.master.cible
        if self.anim ==0:
            self.anim =1
            # position de départ de l'obus (c'est la bouche du canon) :
            self.xo, self.yo = self.x2, self.y2
            v = 20              # vitesse initiale
            # composantes verticale et horizontale de cette vitesse :
            self.vy = -v *sin(self.angle)
            self.vx = v *cos(self.angle) *self.sens
            self.animer_obus()
    
    def animer_obus(self):
        "animer l'obus (trajectoire balistique)"
        # positionner l'obus, en re-définissant ses coordonnées :
        self.boss.coords(self.obus, self.xo -3, self.yo -3,
                                    self.xo +3, self.yo +3)
        if self.anim >0:
            # calculer la position suivante :
            self.xo += self.vx
            self.yo += self.vy
            self.vy += .5
            self.test_obstacle()        # a-t-on atteint un obstacle ?
            self.boss.after(1, self.animer_obus)
        else:
            # fin de l'animation :
            self.boss.coords(self.obus, self.x1, self.y1, self.x1, self.y1) 
   
    def test_obstacle(self):
        "évaluer si l'obus a atteint une cible ou les limites du jeu"
        if self.yo >self.yMax or self.xo <0 or self.xo >self.xMax:
            self.anim =0
            return
        if self.yo > self.cible.y -3 and self.yo < self.cible.y +18 \
        and self.xo > self.cible.x -3 and self.xo < self.cible.x +43:
            # dessiner l'explosion de l'obus (cercle orange) :
            self.explo = self.boss.create_oval(self.xo -10,
                         self.yo -10, self.xo +10, self.yo +10,
                         fill ='orange', width =0)
            self.boss.after(150, self.fin_explosion)
            self.anim =0
   
    def fin_explosion(self):
        "effacer le cercle d'explosion - gérer le score"
        self.boss.delete(self.explo)
        # signaler le succès à la fenêtre maîtresse :
        self.boss.master.goal()        

class Pupitre(Frame):
    """Pupitre de pointage associé à un canon""" 
    def __init__(self, boss, canon):
        Frame.__init__(self, bd =3, relief =GROOVE)
        self.score =0
        s =Scale(self, from_ =88, to =65,
                 troughcolor ='dark grey',
                 command =canon.orienter)
        s.set(45)                       # angle initial de tir
        s.pack(side =LEFT)
        Label(self, text ='Hausse').pack(side =TOP, anchor =W, pady =5)        
        Button(self, text ='Feu !', command =canon.feu).\
                                    pack(side =BOTTOM, padx =5, pady =5)
        Label(self, text ="points").pack()
        self.points =Label(self, text=' 0 ', bg ='white')
        self.points.pack()
        # positionner à gauche ou à droite suivant le sens du canon :
        gd =(LEFT, RIGHT)[canon.sens == -1]
        self.pack(padx =3, pady =5, side =gd)

    def attribuerPoint(self, p):
        "incrémenter ou décrémenter le score"
        self.score += p
        self.points.config(text = ' %s ' % self.score)

class Cible:
    """objet graphique servant de cible"""
    def __init__(self, can, x, y):
        self.can = can             # référence du canevas
        self.x, self.y = x, y
        self.cible = can.create_oval(x, y, x+40, y+15, fill ='purple')
        
    def deplacer(self, dx, dy):
        "effectuer avec la cible un déplacement dx,dy" 
        self.x += dx
        self.y += dy
        self.can.move(self.cible, dx, dy)
        return self.x, self.y

class Thread_cible(Thread):
    """objet thread gérant l'animation de la cible"""
    def __init__(self, app, cible):
        Thread.__init__(self)
        self.cible = cible          # objet à déplacer
        self.app = app              # réf. de la fenêtre d'application
        self.sx, self.sy = 6, 3     # incréments d'espace et de
        self.dt =.3                 # temps pour l'animation
   
    def run(self):
        "animation, tant que la fenêtre d'application existe" 
        while self.app != None:            
            x, y = self.cible.deplacer(self.sx, self.sy)
            if x > self.app.xm -50 or x < self.app.xm /5:
                self.sx = -self.sx
            if y < self.app.ym /2 or y > self.app.ym -20:
                self.sy = -self.sy
            time.sleep(self.dt)

    def stop(self):
        "fermer le thread si la fenêtre d'application est refermée"
        self.app =None
        
    def accelere(self):
        "accélérer le mouvement"
        self.dt /= 1.5


class Application(Frame):
    def __init__(self):
        Frame.__init__(self)
        self.master.title('<<< Tir sur cible mobile >>>')
        self.pack()
        self.xm, self.ym = 600, 500
        self.jeu = Canvas(self, width =self.xm, height =self.ym,
                          bg ='ivory', bd =3, relief =SUNKEN)
        self.jeu.pack(padx =4, pady =4, side =TOP)

        # Instanciation d'un canon et d'un pupitre de pointage :
        x, y = 30, self.ym -20
        self.gun =Canon(self.jeu, 1, x, y, 1)
        self.pup =Pupitre(self, self.gun)
        
        # instanciation de la cible mobile :
        self.cible = Cible(self.jeu, self.xm/2, self.ym -25)
        # animation de la cible mobile, sur son propre thread :
        self.tc = Thread_cible(self, self.cible)
        self.tc.start()
        # arrêter tous les threads lorsque l'on ferme la fenêtre :
        self.bind('<Destroy>',self.fermer_threads)

    def goal(self):
        "la cible a été touchée"
        self.pup.attribuerPoint(1)
        self.tc.accelere()
        
    def fermer_threads(self, evt):
        "arrêter le thread d'animation de la cible"
        self.tc.stop()

if __name__ =='__main__':
    Application().mainloop()
