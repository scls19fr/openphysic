# -*- coding:Latin-1 -*-

from Tkinter import *
from math import sin, cos, pi
from random import randrange
from threading import Thread, Lock
import time

class Pupitre(Frame):
    """Pupitre de pointage associé à un canon""" 
    def __init__(self, boss, canon):
        Frame.__init__(self, bd =3, relief =GROOVE)
        self.score =0
        s =Scale(self, from_ =88, to =55,
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
        # retrouver la largeur et la hauteur du canevas :
        self.xMax = int(boss.cget('width'))
        self.yMax = int(boss.cget('height'))
        self.tir_en_cours = 0

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
        if self.tir_en_cours > 5: return         # 3 obus max.
        self.tir_en_cours += 1 
        # position de départ de l'obus (c'est la bouche du canon) :
        xo, yo = self.x2, self.y2
        v = 11              # vitesse initiale
        # composantes verticale et horizontale de cette vitesse :
        vy = -v *sin(self.angle)
        vx = v *cos(self.angle) *self.sens
        tob = Thread_obus(self.boss, xo, yo, vx, vy)
        tob.start()
        
    def recharger(self):
        "charger le canon"
        self.tir_en_cours -= 1


class Thread_obus(Thread):
    def __init__(self, can, xo, yo, vx, vy):
        Thread.__init__(self)
        self.can = can                  # réf. du canevas
        self.cibles = can.master.cibles # liste des threads cibles
        self.xo, self.yo = xo, yo       # position initiale
        self.vx, self.vy = vx, vy       # vitesse initiale
        # retrouver la largeur et la hauteur du canevas :
        self.xMax = int(can.cget('width'))
        self.yMax = int(can.cget('height'))
        # dessiner un obus (au départ c'est un simple point) :
        self.obus = can.create_oval(xo, yo, xo, yo, fill='red')
        
    def run(self):
        "animer l'obus (trajectoire balistique)"
        self.anim =1
        # positionner l'obus, en re-définissant ses coordonnées :
        while self.anim:
            xa, xb = int(self.xo -3), int(self.xo +3)
            ya, yb = int(self.yo -3), int(self.yo +3)
            try:
                self.can.coords(self.obus, xa, ya, xb, yb)
            except:
                self.anim =0            #print "obus égaré"
            # calculer la position suivante :
            self.xo += self.vx
            self.yo += self.vy
            self.vy += .12              # action de la pesanteur
            self.test_obstacle()        # a-t-on atteint un obstacle ?
            time.sleep(.008)
        
        # fin de l'animation: on efface l'obus et on ferme le thread :
        self.can.delete(self.obus) 
        self.can.master.gun.recharger()
        
    def test_obstacle(self):
        "évaluer si l'obus a atteint une cible ou les limites du jeu"
        x, y = self.xo, self.yo
        if y >self.yMax or x <0 or x >self.xMax:
            self.anim =0
            return
        self.can.master.verrou.acquire()
        for n in self.cibles:
            c = self.cibles[n]
            if y > c.y -3 and y < c.y +18 and x > c.x -3 and x < c.x +43:
                self.anim =0
                self.can.master.explosion(x, y)
                self.can.master.supprimer_cible(c.num)
                break
        self.can.master.verrou.release()
    

class Thread_cible(Thread):
    """objet thread gérant l'animation d'une cible"""
    def __init__(self, can, x, y, num, coul, dt):
        Thread.__init__(self)
        self.mobile = can.create_oval(x, y, x+40, y+15, fill =coul)
        self.can = can              # réf. du canevas
        self.x, self.y = x, y       # position de la cible
        self.num = num              # identifiant
        # retrouver la largeur et la hauteur du canevas :
        self.xMax = int(can.cget('width'))
        self.yMax = int(can.cget('height'))
        self.sx, self.sy = -6, 3     # incréments d'espace et de
        self.dt = dt                 # temps pour l'animation
   
    def run(self):
        "animer la cible"
        self.anim = 1 
        while self.anim:
            self.x += self.sx
            self.y += self.sy
            try:
                self.can.coords(self.mobile, self.x, self.y, self.x+40, self.y+15)
            except:
                self.anim =0        # objet "égaré" > on ferme !
            if self.x < -20:
                # cible arrivée à l'extrémité gauche :
                self.can.master.verrou.acquire()
                self.can.master.supprimer_cible(self.num)
                self.can.master.verrou.release()
                self.can.master.pup.attribuerPoint(-1)
            if self.y < self.yMax /3 or self.y > self.yMax -20:
                self.sy = -self.sy
            time.sleep(self.dt)
        
        # fin de l'animation: on efface la cible et on ferme le thread :
        self.can.delete(self.mobile)
        
    def stop(self):
        "forcer la fin de l'animation et la fermeture du thread"
        self.anim =0
        
    def accelerer(self):
        "accélérer le mouvement"
        self.x = self.xMax
        self.dt /= 2


class Application(Frame):
    def __init__(self):
        Frame.__init__(self)
        self.master.title('<<< Tir sur cible mobile >>>')
        self.pack()
        self.xm, self.ym = 800, 500
        self.jeu = Canvas(self, width =self.xm, height =self.ym,
                          bg ='ivory', bd =3, relief =SUNKEN)
        self.jeu.pack(padx =4, pady =4, side =TOP)
        self.img = PhotoImage(file ='gust.gif')
        self.jeu.create_image(400, 250, image =self.img)
        # Instanciation d'un canon et d'un pupitre de pointage :
        x, y = 30, self.ym -20
        self.gun =Canon(self.jeu, 1, x, y, 1)
        self.pup =Pupitre(self, self.gun)
        # Prévoir un verrou pour la synchronisation des threads cibles :
        self.verrou = Lock()
        # Pour chaque cible, on instanciera un objet thread
        # dans un dictionnaire :
        self.cibles ={}
        self.num_c =0       # n° d'identification des cibles
        self.dt = .2        # dT utilisé pour l'animation des cibles (s)
        self.ti = 3500      # dT séparant le départ des diff. cibles (ms)
        self.ajouter_cible()
        # la fermeture de la fenêtre provoquera l'arrêt des threads :
        self.master.protocol('WM_DELETE_WINDOW', self.fermer_threads)
        #self.bind('<Destroy>',self.fermer_threads)

    def explosion(self, x, y):
        "dessiner l'explosion de l'obus (cercle jaune)"
        self.jeu.create_oval(x-15, y-15, x+15, y+15, fill ='yellow',
                             outline ='orange', width =2, tags ='bang')
        self.jeu.after(100, self.fin_explosion)
    
    def fin_explosion(self):
        "effacer le cercle d'explosion"
        self.jeu.delete('bang')
        self.pup.attribuerPoint(1)

    def ajouter_cible(self):
        col =['maroon', 'purple', 'green', 'blue', 'navy', 'dark cyan']
        # tirer au hasard la couleur de la cible :
        coul = col[randrange(len(col))]
        # tirer au hasard sa coordonnée Y initiale :
        yo = randrange(int(self.ym/3), self.ym -20)
        self.num_c += 1         # n° d'identification 
        if self.ti > 200 :
            self.ti /= 1.05     # lancer de + en + de cibles 
        if self.dt >.005:
            self.dt /= 1.05     # les cibles vont de + en + vite
        #self.dt =.2 / (1 + randrange(20))    # vitesse aléatoire
        tc = Thread_cible(self.jeu, self.xm, yo, self.num_c, coul, self.dt)
        self.verrou.acquire()
        self.cibles[self.num_c] = tc
        self.verrou.release()
        self.cibles[self.num_c].start()
        # lancer continuellement de nouvelles cibles :
        self.after(int(self.ti), self.ajouter_cible)
        
    def supprimer_cible(self, num):
        self.cibles[num].stop()         # arrêter le thread
        del self.cibles[num]            # supprimer l'objet thread
        
    def fermer_threads(self):
        "arrêter tous les threads cibles encore actifs, puis quitter"
        for c in self.cibles:
            self.cibles[c].stop()
        time.sleep(1)                   # laisser faire ...
        self.master.destroy()
        
if __name__ =='__main__':
    Application().mainloop()
