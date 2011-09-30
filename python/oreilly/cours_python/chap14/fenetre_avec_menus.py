#! /usr/bin/env python
# -*- coding: Latin-1 -*-

from Tkinter import *

class MenuBar(Frame):
    """Barre de menus déroulants"""
    def __init__(self, boss =None):
        Frame.__init__(self, borderwidth =2)
        
        ##### Menu <Fichier> #####
        fileMenu = Menubutton(self, text ='Fichier')
        fileMenu.pack(side =LEFT)
        # Partie "déroulante" :
        me1 = Menu(fileMenu)
        me1.add_command(label ='Effacer', underline =0,
                        command = boss.effacer)
        me1.add_command(label ='Terminer', underline =0,
                        command = boss.quit)
        # Intégration du menu :
        fileMenu.configure(menu = me1)    

        ##### Menu <Musiciens> #####        
        self.musi = Menubutton(self, text ='Musiciens')
        self.musi.pack(side =LEFT, padx='3')
        # Partie "déroulante" du menu <Musiciens> : 
        me1 = Menu(self.musi)
        me1.add_command(label ='17e siècle', underline =1,
                        foreground ='red', background = 'yellow',
                        font =('Comic Sans MS',11),
                        command = boss.showMusi17)
        me1.add_command(label ='18e siècle', underline =1,
                        foreground='royal blue', background ='white',
                        font =('Comic Sans MS',11,'bold'),
                        command = boss.showMusi18)
        # Intégration du menu :
        self.musi.configure(menu = me1)

        ##### Menu <Peintres> #####
        self.pein = Menubutton(self, text ='Peintres')
        self.pein.pack(side =LEFT, padx='3')
        # Partie "déroulante" :
        me1 = Menu(self.pein)
        me1.add_command(label ='classiques', state=DISABLED)
        me1.add_command(label ='romantiques', underline =0,
                        command = boss.showRomanti)
        # Sous-menu pour les peintres impressionistes :
        me2 = Menu(me1)
        me2.add_command(label ='Claude Monet', underline =7,
                        command = boss.tabMonet)
        me2.add_command(label ='Auguste Renoir', underline =8,
                        command = boss.tabRenoir)
        me2.add_command(label ='Edgar Degas', underline =6,
                        command = boss.tabDegas)
        # Intégration du sous-menu :
        me1.add_cascade(label ='impressionistes ', underline =0,
                        menu = me2)
        # Intégration du menu :
        self.pein.configure(menu = me1)

        ##### Menu <Options> #####
        optMenu = Menubutton(self, text ='Options')
        optMenu.pack(side =LEFT, padx ='3')
        # Variables Tkinter :
        self.relief = IntVar()
        self.actPein = IntVar()
        self.actMusi = IntVar()    
        # Partie "déroulante" du menu :
        self.mo = Menu(optMenu)
        self.mo.add_command(label = 'Activer :', foreground ='blue')
        self.mo.add_checkbutton(label ='musiciens', command = self.choixActifs,
                            variable =self.actMusi)
        self.mo.add_checkbutton(label ='peintres', command = self.choixActifs,
                            variable =self.actPein)
        self.mo.add_separator()
        self.mo.add_command(label = 'Relief :', foreground ='blue')
        for (v, lab) in [(0,'aucun'), (1,'sorti'), (2,'rentré'),
                         (3,'sillon'), (4,'crête'), (5,'bordure')]:
            self.mo.add_radiobutton(label =lab, variable = self.relief,
                                value =v, command = self.reliefBarre)
        # Intégration du menu :
        optMenu.configure(menu = self.mo)

    def reliefBarre(self):
        choix = self.relief.get()
        self.configure(relief =[FLAT,RAISED,SUNKEN,GROOVE,RIDGE,SOLID][choix])

    def choixActifs(self):
        p = self.actPein.get()
        m = self.actMusi.get()
        self.pein.configure(state =[DISABLED, NORMAL][p])
        self.musi.configure(state =[DISABLED, NORMAL][m])

class Application(Frame):
    """Application principale"""
    def __init__(self, boss =None):
        Frame.__init__(self)
        self.master.title('Fenêtre avec menus')
        mBar = MenuBar(self)
        mBar.pack()
        self.can = Canvas(self, bg='light grey', height=190,
                          width=250, borderwidth =2)
        self.can.pack()
        mBar.mo.invoke(2)
        self.pack()

    def showMusi17(self):
        self.can.create_text(10, 10, anchor=NW, text='H. Purcell',
                    font=('Times', 20, 'bold'), fill='yellow')

    def showMusi18(self):
        self.can.create_text(245, 40, anchor =NE, text = "W. A. Mozart",
                    font =('Times', 20, 'italic'), fill ='dark green')

    def showRomanti(self):
        self.can.create_text(245, 70, anchor =NE, text = "E. Delacroix",
                    font =('Times', 20, 'bold italic'), fill ='blue')

    def tabMonet(self):
        self.can.create_text(10, 100, anchor =NW, text = 'Nymphéas à Giverny',
                    font =('Technical', 20), fill ='red')

    def tabRenoir(self):
        self.can.create_text(10, 130, anchor =NW, text = 'Le moulin de la galette',
                    font =('Dom Casual BT', 20), fill ='maroon')

    def tabDegas(self):
        self.can.create_text(10, 160, anchor =NW, text = 'Danseuses au repos',
                    font =('President', 20), fill ='purple')

    def effacer(self):
        self.can.delete(ALL)


if __name__ == '__main__':
    app = Application()
    app.mainloop()
    app.destroy()
