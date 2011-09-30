# -*- coding: Latin-1 -*-

#######################################################
# Jeu des bombardes - partie cliente                  #
# (C) Gérard Swinnen, Liège (Belgique) - Juillet 2004 #
# Licence : GPL                                       #
# Avant d'exécuter ce script, vérifiez que l'adresse, #
# le numéro de port et les dimensions de l'espace de  #
# jeu indiquées ci-dessous correspondent exactement   #
# à ce qui a été défini pour le serveur.              #
#######################################################

from Tkinter import *
import socket, sys, threading, time
from canon_serveur import Canon, Pupitre, AppServeur 

host, port = '192.168.0.235', 35000
largeur, hauteur = 700, 400          # dimensions de l'espace de jeu

class AppClient(AppServeur):
    def __init__(self, host, port, larg_c, haut_c):
        AppServeur.__init__(self, host, port, larg_c, haut_c)
        
    def specificites(self):
        "préparer les objets spécifiques de la partie client"    
        self.master.title('<<< Jeu des bombardes >>>')
        self.connex =ThreadSocket(self, self.host, self.port)
        self.connex.start()
        self.id =None

    def ajouter_canon(self, id, x, y, sens, coul):
        "instancier un canon et un pupitre de nom <id> dans 2 dictionnaires"
        self.guns[id] = Canon(self.jeu, id, int(x), int(y), int(sens), coul)
        self.pupi[id] = Pupitre(self, self.guns[id])
        self.pupi[id].inactiver()
    
    def activer_pupitre_personnel(self, id):
        self.id =id                         # identifiant reçu du serveur
        self.pupi[id].activer()
        
    def tir_canon(self, id):
        r = self.guns[id].feu()             # renvoie False si enrayé
        if r and id == self.id:
            self.connex.signaler_tir()
        
    def imposer_score(self, id, sc):
        self.pupi[id].valeur_score(int(sc))
        
    def deplacer_canon(self, id, x, y):
        "note: les valeurs de x et y sont reçues en tant que chaînes"
        self.guns[id].deplacer(int(x), int(y))

    def orienter_canon(self, id, angle):
        "régler la hausse du canon <id> à la valeur <angle>"
        self.guns[id].orienter(angle)
        if id == self.id:
            self.connex.signaler_angle(angle)
        else:
            self.pupi[id].reglage(angle)
            
    def fermer_threads(self, evt):
        "couper les connexions existantes et refermer les threads"
        self.connex.terminer()
        self.active =0                  # empêcher accès ultérieurs à Tk

    def depl_aleat_canon(self, id):
        pass                            # => méthode inopérante

    def goal(self, a, b):
        pass                            # => méthode inopérante


class ThreadSocket(threading.Thread):
    """objet thread gérant l'échange de messages avec le serveur"""
    def __init__(self, boss, host, port):
        threading.Thread.__init__(self)
        self.app = boss            # réf. de la fenêtre application
        # Mise en place du socket - connexion avec le serveur :
        self.connexion = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        try:
            self.connexion.connect((host, port))
        except socket.error:
            print "La connexion a échoué."
            sys.exit()    
        print "Connexion établie avec le serveur."

    def run(self):
        while 1:
            msg_recu = self.connexion.recv(1024)
            print "*%s*" % msg_recu
            # le message reçu est d'abord converti en une liste :
            t =msg_recu.split(',')
            if t[0] =="" or t[0] =="fin":
                # fermer le présent thread :
                break                   
            elif t[0] =="serveur OK":
                self.connexion.send("client OK")
            elif t[0] =="canons":
                self.connexion.send("OK")       # accusé de réception
                # éliminons le 1er et le dernier élément de la liste.
                # ceux qui restent sont eux-mêmes des listes :
                lc = t[1:-1]
                # chacune est la description complète d'un canon :
                for g in lc:
                    s = g.split(';')
                    self.app.ajouter_canon(s[0], s[1], s[2], s[3], s[4])
            elif t[0] =="nouveau_canon":
                self.app.ajouter_canon(t[1], t[2], t[3], t[4], t[5])
                if len(t) >6:
                    self.app.activer_pupitre_personnel(t[1])
            elif t[0] =='angle':
                # il se peut que l'on ait reçu plusieurs infos regroupées.
                # on ne considère alors que la première :
                self.app.orienter_canon(t[1], t[2])                 
            elif t[0] =="tir_de":
                self.app.tir_canon(t[1])
            elif t[0] =="scores":
                # éliminons le 1er et le dernier élément de la liste.
                # ceux qui restent sont eux-mêmes des listes :
                lc = t[1:-1]
                # chaque élément est la description d'un score :
                for g in lc:
                    s = g.split(';')
                    self.app.imposer_score(s[0], s[1])
            elif t[0] =="mouvement_de":
                self.app.deplacer_canon(t[1],t[2],t[3])
            elif t[0] =="départ_de":
                self.app.enlever_canon(t[1])

        # Le thread <réception> se termine ici.
        print "Client arrêté. Connexion interrompue."
        self.connexion.close()
        
    def signaler_tir(self):
        self.connexion.send('feu')

    def signaler_angle(self, angle):
        self.connexion.send('orienter,%s,' % angle)
    
    def terminer(self):
        self.connexion.send('fin')

# Programme principal :
if __name__ =='__main__':
    AppClient(host, port, largeur, hauteur).mainloop()            
