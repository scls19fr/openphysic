#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Petite démo pour l'utilisation du widget ComboBox : 

from Tkinter import *
import Pmw          

def changeCoul(col):
    fen.configure(background = col)

def changeLabel():
    lab.configure(text = combo.get())

couleurs = ('navy', 'royal blue', 'steelblue1', 'cadet blue',
            'lawn green', 'forest green', 'dark red',
            'grey80','grey60', 'grey40', 'grey20')
    
fen = Pmw.initialise()
bou = Button(fen, text ="Test", command =changeLabel)
bou.grid(row =1, column =0, padx =8, pady =6)
lab = Label(fen, text ='néant', bg ='ivory')
lab.grid(row =1, column =1, padx =8)

combo = Pmw.ComboBox(fen, labelpos = NW,
                     label_text = 'Choisissez la couleur :',
                     scrolledlist_items = couleurs,
                     listheight = 150,
                     selectioncommand = changeCoul)
combo.grid(row =2, columnspan =2, padx =10, pady =10)

fen.mainloop()
