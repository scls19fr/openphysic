# -*- coding:Latin-1 -*-

# Corrigé d'interro de programmation Python - Juin 2004

from Tkinter import *
from random import randrange
from math import sin, cos, pi

class FaceDom:
    def __init__(self, can, val, pos, taille =70):
        self.can =can        
        x, y, c = pos[0], pos[1], taille/2
        self. carre = can.create_rectangle(x -c, y-c, x+c, y+c,
                                           fill ='ivory', width =2)
        d = taille/3         
        # disposition des points sur la face, pour chacun des 6 cas :
        self.pDispo = [((0,0),),
                       ((-d,d),(d,-d)),
                       ((-d,-d), (0,0), (d,d)),
                       ((-d,-d),(-d,d),(d,-d),(d,d)),
                       ((-d,-d),(-d,d),(d,-d),(d,d),(0,0)),
                       ((-d,-d),(-d,d),(d,-d),(d,d),(d,0),(-d,0))]
                    
        self.x, self.y, self.dim = x, y, taille/15
        self.pList =[]      # liste contenant les points de cette face 
        self.tracer_points(val)
        
    def tracer_points(self, val):
        # créer les dessins de points correspondant à la valeur val :
        disp = self.pDispo[val -1]
        for p in disp:
            self.cercle(self.x +p[0], self.y +p[1], self.dim, 'red')
        self.val = val
        
    def cercle(self, x, y, r, coul):
        self.pList.append(self.can.create_oval(x-r, y-r, x+r, y+r, fill=coul))
        
    def effacer(self, flag =0):
        for p in self.pList:
            self.can.delete(p)
        if flag:
            self.can.delete(self.carre)
        
class Projet(Frame):
    def __init__(self, larg, haut):
        Frame.__init__(self)
        self.larg, self.haut = larg, haut
        self.can = Canvas(self, bg='dark green', width =larg, height =haut)
        self.can.pack(padx =5, pady =5)
        # liste des boutons à installer, avec leur gestionnaire :
        bList = [("A", self.boutA), ("B", self.boutB),
                 ("C", self.boutC), ("Quitter", self.boutQuit)]
        bList.reverse()         # inverser l'ordre de la liste
        for b in bList:
            Button(self, text =b[0], command =b[1]).pack(side =RIGHT, padx=3)
        self.pack()
        self.des =[]            # liste qui contiendra les faces de dés
        self.actu =0            # réf. du dé actuellement sélectionné
        
    def boutA(self):
        if len(self.des):
            return              # car les dessins existent déjà !
        a, da = 0, 2*pi/13
        for i in range(13):
            cx, cy = self.larg/2, self.haut/2
            x = cx + cx*0.75*sin(a)             # pour disposer en cercle,
            y = cy + cy*0.75*cos(a)             # on utilise la trigono !
            self.des.append(FaceDom(self.can, randrange(1,7) , (x,y), 65))
            a += da

    def boutB(self):
        # incrémenter la valeur du dé sélectionné. Passer au suivant :
        v = self.des[self.actu].val
        v = v % 6
        v += 1        
        self.des[self.actu].effacer()
        self.des[self.actu].tracer_points(v)
        self.actu += 1
        self.actu = self.actu % 13

    def boutC(self):
        for i in range(len(self.des)):
            self.des[i].effacer(1)
        self.des =[]
        self.actu =0
        
    def boutQuit(self):
        self.master.destroy()
        
Projet(600, 600).mainloop()