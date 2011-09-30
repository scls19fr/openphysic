# -*- coding:Latin-1 -*-

# Examen de programmation Python - 6TSIb - Juin 2004

from Tkinter import *

class FaceDom:
    def __init__(self, can, val, pos, taille =70):
        self.can =can
        # ***
        x, y, c = pos[0], pos[1], taille/2
        can.create_rectangle(x -c, y-c, x+c, y+c, fill ='ivory', width =2)
        d = taille/3
        # ***
        self.pList =[]
        # ***
        pDispo = [((0,0),), ((-d,d),(d,-d)), ((-d,-d), (0,0), (d,d))]
        disp = pDispo[val -1]
        # ***
        for p in disp:
            self.cercle(x +p[0], y +p[1], 5, 'red')
    
    def cercle(self, x, y, r, coul):
        # ***
        self.pList.append(self.can.create_oval(x-r, y-r, x+r, y+r, fill=coul))
        
    def effacer(self):
        # ***
        for p in self.pList:
            self.can.delete(p)
        
class Projet(Frame):
    def __init__(self, larg, haut):
        Frame.__init__(self)
        self.larg, self.haut = larg, haut
        self.can = Canvas(self, bg='dark green', width =larg, height =haut)
        self.can.pack(padx =5, pady =5)
        # ***
        bList = [("A", self.boutA), ("B", self.boutB),
                 ("C", self.boutC), ("D", self.boutD),
                 ("Quitter", self.boutQuit)]
        for b in bList:
            Button(self, text =b[0], command =b[1]).pack(side =LEFT)
        self.pack()
    
    def boutA(self):
        self.d3 = FaceDom(self.can, 3, (100,100), 50)
        
    def boutB(self):
        self.d2 = FaceDom(self.can, 2, (200,100), 80)
        
    def boutC(self):
        self.d1 = FaceDom(self.can, 1, (350,100), 110)
        
    def boutD(self):
        # ***
        self.d3.effacer()

    def boutQuit(self):
        self.master.destroy()
        
Projet(500, 300).mainloop()