#! /usr/bin/env python
# -*- coding: Latin-1 -*-

from Tkinter import *
fen1 = Tk()

# création de widgets Label(), Entry(), et Checkbutton() :
Label(fen1, text = 'Premier champ :').grid(sticky =E)
Label(fen1, text = 'Second :').grid(sticky =E)
Label(fen1, text = 'TroisiÃ?me :').grid(sticky =E)
entr1 = Entry(fen1)
entr2 = Entry(fen1)                 # ces widgets devront certainement
entr3 = Entry(fen1)                 # être  référencés plus loin :
entr1.grid(row =0, column =1)       # il faut donc les assigner chacun
entr2.grid(row =1, column =1)       # à une variable distincte
entr3.grid(row =2, column =1)
chek1 = Checkbutton(fen1, text ='Case à cocher, pour voir')
chek1.grid(columnspan =2)

# création d'un widget 'Canvas' contenant une image bitmap :
can1 = Canvas(fen1, width =160, height =160, bg ='white')
photo = PhotoImage(file ='Martin_P.gif')
can1.create_image(80,80, image =photo)
can1.grid(row =0, column =2, rowspan =4, padx =10, pady =5)

# démarrage :
fen1.mainloop()
