#! /usr/bin/env python
# -*- coding: Latin-1 -*-

# Petite démo pour l'utilisation du widget ScrolledText : 

from Tkinter import *
import Pmw          

def action(event=None):
    """défilement du texte jusqu'à la balise <cible>"""
    index = st.tag_nextrange('cible', '0.0', END)
    st.see(index[0])

# Instanciation d'une fenêtre contenant un widget ScrolledText :  
fen = Pmw.initialise()
st = Pmw.ScrolledText(fen,
                      labelpos =N,
                      label_text ="Petite démo du widget ScrolledText",
                      label_font ='Times 14 bold italic',
                      label_fg = 'navy', label_pady =5,
                      text_font='Helvetica 11 normal', text_bg ='ivory',
                      text_padx =10, text_pady =10, text_wrap ='none', 
                      borderframe =1,
                      borderframe_borderwidth =3,
                      borderframe_relief =SOLID,
                      usehullsize =1,
                      hull_width =370, hull_height =240)
st.pack(expand =YES, fill =BOTH, padx =8, pady =8)

# Définition des balises, liaison d'un événement <clic de souris> : 
st.tag_configure('titre', foreground ='brown', font ='Helvetica 11 bold italic')
st.tag_configure('lien', foreground ='blue', font ='Helvetica 11 bold')
st.tag_configure('cible', foreground ='forest green', font ='Times 11 bold')
st.tag_bind('lien', '<Button-3>', action)

titre ="""Le Corbeau et le Renard
par Jean de la Fontaine, auteur français
\n"""
auteur ="""
Jean de la Fontaine
écrivain français (1621-1695)
célèbre pour ses Contes en vers,
et surtout ses Fables, publiées
de 1668 à 1694."""

# Remplissage du widget Text (2 techniques) :
st.importfile('CorbRenard.txt')
st.insert('0.0', titre, 'titre')
st.insert(END, auteur, 'cible')
# Insertion d'une image :
photo =PhotoImage(file= 'Penguin.gif')
st.image_create('6.14', image =photo)
# Ajout d'une balise :
st.tag_add('lien', '2.4', '2.23')

fen.mainloop()
