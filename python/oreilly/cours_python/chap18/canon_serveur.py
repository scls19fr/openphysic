# -*- coding:Latin-1 -*-

#######################################################
# Jeu des bombardes - partie serveur                  #
# (C) Gérard Swinnen, Verviers (Belgique) - July 2004 #
# Licence : GPL                                       #
# Avant d'exécuter ce script, vérifiez que l'adresse  #
# IP ci-dessous soit bien celle de la machine hôte.   #
# Vous pouvez choisir un numéro de port différent, ou #
# changer les dimensions de l'espace de jeu.          #
# Dans tous les cas, vérifiez que les mêmes choix ont #
# été effectués pour chacun des scripts clients.      #
#######################################################

host, port = '192.168.0.235', 35000
largeur, hauteur = 700, 400             # dimensions de l'espace de jeu

from Tkinter import *
import socket, sys, threading, time
import canon03
from canon04 import Canon, AppBombardes

class Pupitre(canon03.Pupitre):
    """Pupitre de pointage amélioré""" 
    def __init__(self, boss, canon):
        canon03.Pupitre.__init__(self, boss, canon)

    def tirer(self):
        "déclencher le tir du canon associé"
        self.appli.tir_canon(self.canon.id)
        
    def orienter(self, angle):
        "ajuster la hausse du canon associé"
        self.appli.orienter_canon(self.canon.id, angle)

    def valeur_score(self, sc =None):
        "imposer un nouveau score <sc>, ou lire le score existant"
        if sc == None:
            return self.score
        else:
            self.score =sc
            self.points.config(text = ' %s ' % self.score)

    def inactiver(self):
        "désactiver le bouton de tir et le système de réglage d'angle"
        self.bTir.config(state =DISABLED)
        self.regl.config(state =DISABLED) 

    def activer(self):
        "activer le bouton de tir et le système de réglage d'angle"
        self.bTir.config(state =NORMAL)
        self.regl.config(state =NORMAL)
        
    def reglage(self, angle):
        "changer la position du curseur de réglage"
        self.regl.config(state =NORMAL)
        self.regl.set(angle)
        self.regl.config(state =DISABLED)

class ThreadConnexion(threading.Thread):
    """objet thread gestionnaire d'une connexion client"""
    def __init__(self, boss, conn):
        threading.Thread.__init__(self)
        self.connexion = conn           # réf. du socket de connexion
        self.app = boss                 # réf. de la fenêtre application

    def run(self):
        "actions entreprises en réponse aux messages reçus du client"
        nom = self.getName()            # id. du client = nom du thread
        while 1:
            msgClient = self.connexion.recv(1024)
            print "**%s** de %s" % (msgClient, nom)
            deb = msgClient.split(',')[0]
            if deb == "fin" or deb =="":
                self.app.enlever_canon(nom)
                # signaler le départ de ce canon aux autres clients :
                self.app.verrou.acquire()
                for cli in self.app.conn_client:
                    if cli != nom:
                        message = "départ_de,%s" % nom
                        self.app.conn_client[cli].send(message)
                self.app.verrou.release()                
                # fermer le présent thread :
                break                   
            elif deb =="client OK":
                # signaler au nouveau client les canons déjà enregistrés :
                msg ="canons,"
                for g in self.app.guns:
                    gun = self.app.guns[g]
                    msg =msg +"%s;%s;%s;%s;%s," % \
                              (gun.id, gun.x1, gun.y1, gun.sens, gun.coul)
                self.app.verrou.acquire()
                self.connexion.send(msg)
                # attendre un accusé de réception ('OK') :
                self.connexion.recv(100)
                self.app.verrou.release()                
                # ajouter un canon dans l'espace de jeu serveur.
                # la méthode invoquée renvoie les caract. du canon créé :
                x, y, sens, coul = self.app.ajouter_canon(nom)
                # signaler les caract. de ce nouveau canon à tous les
                # clients déjà connectés :
                self.app.verrou.acquire()
                for cli in self.app.conn_client:
                    msg ="nouveau_canon,%s,%s,%s,%s,%s" % \
                                       (nom, x, y, sens, coul)
                    # pour le nouveau client, ajouter un champ indiquant
                    # que le message concerne son propre canon :
                    if cli == nom:
                        msg =msg +",le_vôtre"
                    self.app.conn_client[cli].send(msg)
                self.app.verrou.release()
            elif deb =='feu':
                self.app.tir_canon(nom)
                # Signaler ce tir à tous les autres clients :
                self.app.verrou.acquire()
                for cli in self.app.conn_client:
                    if cli != nom:
                        message = "tir_de,%s," % nom
                        self.app.conn_client[cli].send(message)        
                self.app.verrou.release()
            elif deb =="orienter":
                t =msgClient.split(',')
                # on peut avoir reçu plusieurs angles. utiliser le dernier : 
                self.app.orienter_canon(nom, t[-2])
                # Signaler ce changement à tous les autres clients :
                self.app.verrou.acquire()
                for cli in self.app.conn_client:
                    if cli != nom:
                        # virgule terminale, car messages parfois groupés :
                        message = "angle,%s,%s," % (nom, t[-2])
                        self.app.conn_client[cli].send(message)
                self.app.verrou.release()
                    
        # Fermeture de la connexion :
        self.connexion.close()          # couper la connexion
        del self.app.conn_client[nom]   # suppr. sa réf. dans le dictionn.
        self.app.afficher("Client %s déconnecté.\n" % nom)
        # Le thread se termine ici

class ThreadClients(threading.Thread):
    """objet thread gérant la connexion de nouveaux clients"""
    def __init__(self, boss, connex):
        threading.Thread.__init__(self)
        self.boss = boss                # réf. de la fenêtre application
        self.connex = connex            # réf. du socket initial
        
    def run(self):
        "attente et prise en charge de nouvelles connexions clientes"
        txt ="Serveur prêt, en attente de requêtes ...\n"
        self.boss.afficher(txt)
        self.connex.listen(5) 
        # Gestion des connexions demandées par les clients :
        while 1:    
            nouv_conn, adresse = self.connex.accept()
            # Créer un nouvel objet thread pour gérer la connexion :
            th = ThreadConnexion(self.boss, nouv_conn)
            th.start()
            it = th.getName()        # identifiant unique du thread
            # Mémoriser la connexion dans le dictionnaire :
            self.boss.enregistrer_connexion(nouv_conn, it)
            # Afficher :
            txt = "Client %s connecté, adresse IP %s, port %s.\n" %\
                   (it, adresse[0], adresse[1])
            self.boss.afficher(txt)
            # Commencer le dialogue avec le client :
            nouv_conn.send("serveur OK")

class AppServeur(AppBombardes):
    """fenêtre principale de l'application (serveur ou client)"""
    def __init__(self, host, port, larg_c, haut_c):
        self.host, self.port = host, port
        AppBombardes.__init__(self, larg_c, haut_c)        
        self.active =1          # témoin d'activité
        # veiller à quitter proprement si l'on referme la fenêtre :
        self.bind('<Destroy>',self.fermer_threads)

    def specificites(self):
        "préparer les objets spécifiques de la partie serveur"    
        self.master.title('<<< Serveur pour le jeu des bombardes >>>')
        
        # widget Text, associé à une barre de défilement :
        st =Frame(self)
        self.avis =Text(st, width =65, height =5)
        self.avis.pack(side =LEFT)
        scroll =Scrollbar(st, command =self.avis.yview)
        self.avis.configure(yscrollcommand =scroll.set)
        scroll.pack(side =RIGHT, fill =Y)
        st.pack()
        
        # partie serveur réseau :
        self.conn_client = {}           # dictionn. des connexions clients
        self.verrou =threading.Lock()   # verrou pour synchroniser threads
        # Initialisation du serveur - Mise en place du socket :
        connexion = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        try:
            connexion.bind((self.host, self.port))
        except socket.error:
            txt ="La liaison du socket à l'hôte %s, port %s a échoué.\n" %\
                  (self.host, self.port)
            self.avis.insert(END, txt)
            self.accueil =None
        else:
            # démarrage du thread guettant la connexion des clients :
            self.accueil = ThreadClients(self, connexion)
            self.accueil.start()

    def depl_aleat_canon(self, id):
        "déplacer aléatoirement le canon <id>"
        x, y = AppBombardes.depl_aleat_canon(self, id)
        # signaler ces nouvelles coord. à tous les clients :
        self.verrou.acquire()
        for cli in self.conn_client:
            message = "mouvement_de,%s,%s,%s," % (id, x, y)
            self.conn_client[cli].send(message)
        self.verrou.release()
 
    def goal(self, i, j):
        "le canon <i> signale qu'il a atteint l'adversaire <j>"
        AppBombardes.goal(self, i, j)
        # Signaler les nouveaux scores à tous les clients :
        self.verrou.acquire()
        for cli in self.conn_client:
            msg ='scores,'
            for id in self.pupi:
                sc = self.pupi[id].valeur_score()
                msg = msg +"%s;%s," % (id, sc)
            self.conn_client[cli].send(msg)        
        time.sleep(.5)               # pour mieux séparer les messages 
        self.verrou.release()

    def ajouter_canon(self, id):
        "instancier un canon et un pupitre de nom <id> dans 2 dictionnaires"
        # on alternera ceux des 2 camps :
        n = len(self.guns)
        if n %2 ==0:
            sens = -1
        else:
            sens = 1
        x, y = self.coord_aleat(sens)
        coul =('dark blue', 'dark red', 'dark green', 'purple',
               'dark cyan', 'red', 'cyan', 'orange', 'blue', 'violet')[n]
        self.guns[id] = Canon(self.jeu, id, x, y, sens, coul)
        self.pupi[id] = Pupitre(self, self.guns[id])
        self.pupi[id].inactiver()
        return (x, y, sens, coul)
        
    def enlever_canon(self, id):
        "retirer le canon et le pupitre dont l'identifiant est <id>"
        if self.active == 0:        # la fenêtre a été refermée
            return                  
        self.guns[id].effacer()
        del self.guns[id]
        self.pupi[id].destroy()
        del self.pupi[id]
        
    def orienter_canon(self, id, angle):
        "régler la hausse du canon <id> à la valeur <angle>"
        self.guns[id].orienter(angle)
        self.pupi[id].reglage(angle)    
  
    def tir_canon(self, id):
        "déclencher le tir du canon <id>"
        self.guns[id].feu()

    def enregistrer_connexion(self, conn, it):
        "Mémoriser la connexion dans un dictionnaire"
        self.conn_client[it] = conn

    def afficher(self, txt):
        "afficher un message dans la zone de texte"
        self.avis.insert(END, txt)

    def fermer_threads(self, evt):
        "couper les connexions existantes et fermer les threads"
        # couper les connexions établies avec tous les clients :
        for id in self.conn_client:
            self.conn_client[id].send('fin')
        # forcer la terminaison du thread serveur qui attend les requêtes :
        if self.accueil != None:
            self.accueil._Thread__stop()
        self.active =0                  # empêcher accès ultérieurs à Tk

if __name__ =='__main__':
    AppServeur(host, port, largeur, hauteur).mainloop()