# -*- coding: iso8859-1 -*-
import string
import hanoi

class clHanoiTxt :
  def __init__ (self, hauteur) :
    self.hauteur = hauteur
    self.hanoi = hanoi.clHanoi(hauteur)
    self.solution_demandee = 0
  def ReprDisque(self, taille) :
    if ( taille == 0 ) :
      return "!"
    s = "="*taille
    return "<"+s+"!"+s+">"
  def AfficherJeu (self) :
    largeur_max = len(self.ReprDisque(self.hauteur)) + 2
    print (string.center("o", largeur_max)+" ")*3
    etages = range(1, self.hauteur+1)
    etages.reverse()
    for disque in etages :
      for tour in self.hanoi.tours :
        taille = tour.disque(disque)
        repr = self.ReprDisque(taille)
        print string.center(repr, largeur_max),
      print
    print ("~"*largeur_max+" ")*3
  def DemanderTourDepart(self) :
    depart_valide = 0
    while ( not depart_valide ) :
      entree = raw_input("Tour de depart ('s' pour la solution) : ")
      if ( entree == "s" ) :
        self.solution_demandee = 1
        depart = 0
        depart_valide = 1
      else:
        try:
          depart = int(entree) - 1
        except ValueError:
          print "Nombre invalide !"
        else:
          depart_valide = self.hanoi.departValide(depart)
          if ( not depart_valide ) :
            print "Mauvaise tour de départ !"
    return depart
  def DemanderTourArrivee(self, depart) :
    arrivee_valide = 0
    while ( not arrivee_valide ) :
      try:
        arrivee = int(raw_input("Tour d'arrivée : ")) - 1
      except ValueError:
        print "Nombre invalide !"
      else:
        arrivee_valide = self.hanoi.arriveeValide(depart, arrivee)
        if ( not arrivee_valide ) :
          print "Mauvaise tour d'arrivée !"
    return arrivee
  def JeuEtape(self) :
    self.AfficherJeu()
    tour_depart = self.DemanderTourDepart()
    if ( not self.solution_demandee ) :
      tour_arrivee = self.DemanderTourArrivee(tour_depart)
      self.hanoi.transferer(tour_depart, tour_arrivee)
  def Jeu(self) :
    while ( not self.hanoi.fini() ) :
      self.JeuEtape()
      if ( self.solution_demandee ) :
        self.Solution()
  def Solution(self) :
    self.hanoi.solution(self.SolutionAvantEtape, self.SolutionApresEtape)
  def SolutionAvantEtape(self, depuis, vers, mouvement) :
    print "Mouvement %d, de %d vers %d" % (mouvement, depuis+1, vers+1)
  def SolutionApresEtape(self, depuis, vers, mouvement) :
    self.AfficherJeu()
    raw_input("Pressez Enter pour continuer...")

nb = 0
while ( (nb < 3) or (nb > 10) ) :
  try:
    nb = int(raw_input("Nombre de disques (3 à 10) ? "))
  except ValueError:
    print "Ce n'est pas un nombre valide !"
  else:
    if ( (nb < 3) or (nb > 10) ) :
      print "Entre 3 et 10 disques !"
jeu = clHanoiTxt(nb)
jeu.Jeu()
