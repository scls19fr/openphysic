#! /usr/bin/env python
# -*- coding: Latin-1 -*-

###########################################
#  Jeu de ping                            #
#  Références : Voir article de la revue  #
#  <Pour la science>, Aout 2002           #
#                                         #
# (C) Gérard Swinnen (Verviers, Belgique) #
# http://www.ulg.ac.be/cifen/inforef/swi  #
#                                         #
#  Version du 29/09/2002 - Licence : GPL  #
###########################################

from Tkinter import *

class MenuBar(Frame):
    """Barre de menus déroulants"""
    def __init__(self, boss =None):
        Frame.__init__(self, borderwidth =2, relief =GROOVE)
        ##### Menu <Fichier> #####
        fileMenu = Menubutton(self, text ='Fichier')
        fileMenu.pack(side =LEFT, padx =5)
        me1 = Menu(fileMenu)
        me1.add_command(label ='Options', underline =0,
                        command = boss.options)
        me1.add_command(label ='Restart', underline =0,
                        command = boss.reset)
        me1.add_command(label ='Terminer', underline =0,
                        command = boss.quit)
        fileMenu.configure(menu = me1)    

        ##### Menu <Aide> #####
        helpMenu = Menubutton(self, text ='Aide')
        helpMenu.pack(side =LEFT, padx =5)
        me1 = Menu(helpMenu)
        me1.add_command(label ='Principe du jeu', underline =0,
                        command = boss.principe)
        me1.add_command(label ='A propos ...', underline =0,
                        command = boss.aPropos)
        helpMenu.configure(menu = me1)
        
               
class Panneau(Frame):
    """Panneau de jeu (grille de n x m cases)"""
    def __init__(self, boss =None):
        # Ce panneau de jeu est constitué d'un cadre redimensionnable
        # contenant lui-même un canevas. A chaque redimensionnement du
        # cadre, on calcule la plus grande taille possible pour les
        # cases (carrées) de la grille, et on adapte les dimensions du
        # canevas en conséquence.
        Frame.__init__(self)
        self.nlig, self.ncol = 4, 4         # Grille initiale = 4 x 4
        # Liaison de l'événement <resize> à un gestionnaire approprié :
        self.bind("<Configure>", self.redim)
        # Canevas : 
        self.can =Canvas(self, bg ="dark olive green", borderwidth =0,
                         highlightthickness =1, highlightbackground ="white")
        # Liaison de l'événement <clic de souris> à son gestionnaire :
        self.can.bind("<Button-1>", self.clic)
        self.can.pack()
        self.initJeu()

    def initJeu(self):
        "Initialisation de la liste mémorisant l'état du jeu"
        self.etat =[]               	# construction d'une liste de listes
        for i in range(12):             # (équivalente à un tableau 
            self.etat.append([0]*12)	#  de 12 lignes x 12 colonnes) 

    def redim(self, event):
        "Opérations effectuées à chaque redimensionnement"
        # Les propriétés associées à l'événement de reconfiguration
        # contiennent les nouvelles dimensions du cadre : 
        self.width, self.height = event.width -4, event.height -4
        # La différence de 4 pixels sert à compenser l'épaisseur
        # de la 'highlightbordure" entourant le canevas)
        self.traceGrille()
        
    def traceGrille(self):
        "Dessin de la grille, en fonction des options & dimensions"
        # largeur et hauteur maximales possibles pour les cases :
        lmax = self.width/self.ncol        
        hmax = self.height/self.nlig
        # Le coté d'une case sera égal à la plus petite de ces dimensions :
        self.cote = min(lmax, hmax)
        # -> établissement de nouvelles dimensions pour le canevas :
        larg, haut = self.cote*self.ncol, self.cote*self.nlig
        self.can.configure(width =larg, height =haut)
        # Tracé de la grille :
        self.can.delete(ALL)                # Effacement dessins antérieurs
        s =self.cote                       
        for l in range(self.nlig -1):       # lignes horizontales
            self.can.create_line(0, s, larg, s, fill="white")
            s +=self.cote
        s =self.cote
        for c in range(self.ncol -1):       # lignes verticales
            self.can.create_line(s, 0, s, haut, fill ="white")
            s +=self.cote
        # Tracé de tous les pions, blancs ou noirs suivant état du jeu :    
        for l in range(self.nlig):
            for c in range(self.ncol):
                x1 = c *self.cote +5            # taille des pions = 
                x2 = (c +1)*self.cote -5        # taille de la case -10
                y1 = l *self.cote +5            #
                y2 = (l +1)*self.cote -5
                coul =["white","black"][self.etat[l][c]]
                self.can.create_oval(x1, y1, x2, y2, outline ="grey",
                                     width =1, fill =coul)     

    def clic(self, event):
        "Gestion du clic de souris : retournement des pions"
        # On commence par déterminer la ligne et la colonne :
        lig, col = event.y/self.cote, event.x/self.cote
        # On traite ensuite les 8 cases adjacentes :
        for l in range(lig -1, lig+2):
            if l <0 or l >= self.nlig:
                continue
            for c in range(col -1, col +2):
                if c <0 or c >= self.ncol:
                    continue
                if l ==lig and c ==col:
                    continue
                # Retournement du pion par inversion logique :
                self.etat[l][c] = not (self.etat[l][c])
        self.traceGrille() 
           

class Ping(Frame):
    """corps principal du programme"""    
    def __init__(self):
        Frame.__init__(self)
        self.master.geometry("400x300")
        self.master.title(" Jeu de Ping")
        
        self.mbar = MenuBar(self)
        self.mbar.pack(side =TOP, expand =NO, fill =X)
        
        self.jeu =Panneau(self)
        self.jeu.pack(expand =YES, fill=BOTH, padx =8, pady =8)
        
        self.pack()
        
    def options(self):
        "Choix du nombre de lignes et de colonnes pour la grille"
        opt =Toplevel(self)
        curL =Scale(opt, length =200, label ="Nombre de lignes :",
              orient =HORIZONTAL,
              from_ =1, to =12, command =self.majLignes)
        curL.set(self.jeu.nlig)     # position initiale du curseur 
        curL.pack()
        curH =Scale(opt, length =200, label ="Nombre de colonnes :",
              orient =HORIZONTAL,        
              from_ =1, to =12, command =self.majColonnes)
        curH.set(self.jeu.ncol)      
        curH.pack()
    
    def majColonnes(self, n):
        self.jeu.ncol = int(n)
        self.jeu.traceGrille()
    
    def majLignes(self, n):
        self.jeu.nlig = int(n)      
        self.jeu.traceGrille()

    def reset(self):
        self.jeu.initJeu()
        self.jeu.traceGrille()
        
    def principe(self):
        "Fenêtre-message contenant la description sommaire du principe du jeu" 
        msg =Toplevel(self)
        Message(msg, bg ="navy", fg ="ivory", width =400,
            font ="Helvetica 10 bold", 
            text ="Les pions de ce jeu possèdent chacun une face blanche et "\
            "une face noire. Lorsque l'on clique sur un pion, les 8 "\
            "pions adjacents se retournent.\nLe jeu consiste a essayer "\
            "de les retouner tous.\n\nSi l'exercice se révèle très facile avec "\
            "une grille de 2 x 2 cases. Il devient plus difficile avec des "\
            "grilles plus grandes. Il est même tout à fait impossible avec "\
            "certaines grilles.\nA vous de déterminer lesquelles !\n\n"\
            "Réf : revue 'Pour la Science' - Aout 2002").pack(padx =10, pady =10)        

    def aPropos(self):
        "Fenêtre-message indiquant l'auteur et le type de licence" 
        msg =Toplevel(self)
        Message(msg, width =200, aspect =100, justify =CENTER,
            text ="Jeu de Ping\n\n(C) Gérard Swinnen, Aout 2002.\n"\
            "Licence = GPL").pack(padx =10, pady =10)
        
if __name__ == '__main__':
    Ping().mainloop()
	
