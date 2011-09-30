#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Exemple de barre d'outils avec bulles d'aide :

from Tkinter import *
import Pmw
from random import randrange

# noms des fichiers contenant les icones (format GIF):
images =('floppy_2','papi2','pion_1','pion_2','help_4')
textes =('sauvegarde','papillon','joueur 1','joueur 2','Aide')

class Application(Frame):
    def __init__(self):
        Frame.__init__(self)
        # Création d'un objet <bulle d'aide> (un seul suffit) :
        tip = Pmw.Balloon(self)
        # Création de la barre d'outils (c'est un simple cadre) :
        toolbar = Frame(self, bd =1)
        toolbar.pack(expand =YES, fill =X)
        # Nombre de boutons à construire :
        nBou = len(images)
        # Les icônes des boutons doivent être placées dans des variables
        # persistantes. Une liste fera l'affaire :
        self.photoI =[None]*nBou

        for b in range(nBou):
            # Création de l'icône (objet PhotoImage Tkinter) :
            self.photoI[b] =PhotoImage(file = images[b] +'.gif')
            # Création du bouton. On fait appel à une fonction lambda
            # pour pouvoir transmettre un argument à la methode <action> :
            bou = Button(toolbar, image =self.photoI[b], relief =GROOVE,
                         command = lambda arg =b: self.action(arg))
            bou.pack(side =LEFT)
            tip.bind(bou, textes[b])    # lien avec bulle d'aide

        self.ca = Canvas(self, width =400, height =200, bg ='orange')
        self.ca.pack()
        self.pack()

    def action(self, b):
        "l'icône du bouton b est recopiée dans le canevas"
        x, y = randrange(25,375), randrange(25,175)
        self.ca.create_image(x, y, image =self.photoI[b])

Application().mainloop()

