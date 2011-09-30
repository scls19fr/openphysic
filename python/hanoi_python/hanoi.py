# -*- coding: iso8859-1 -*-
class clTour :
  def __init__ (self, hauteur) :
    self.hauteur_max = hauteur
    self.disques = []
  def remplir(self) :
    self.disques = range(1, self.hauteur_max+1)
    self.disques.reverse()
  def sommet(self) :
    if ( len(self.disques) > 0 ) :
      return self.disques[-1]
    else :
      return 0
  def disque(self, etage) :
    if ( etage <= len(self.disques) ) :
      return self.disques[etage-1]
    else :
      return 0
  def nbDisques(self) :
    return len(self.disques)
  def transferer(self, vers_tour) :
    if ( len(self.disques) > 0 ) :
      if ( (self.sommet() < vers_tour.sommet()) or \
           (vers_tour.nbDisques() == 0) ) :
        vers_tour.disques.append(self.sommet())
        del self.disques[-1]
      else :
        print "Impossible d'empiler un disque sur un plus petit"
    else :
      print "Tour vide, rien à transférer"

class clHanoi :
  def __init__ (self, hauteur) :
    self.hauteur_max = hauteur
    self.tours = [clTour(hauteur), clTour(hauteur), clTour(hauteur)]
    self.tours[0].remplir()
  def departValide(self, tour_depart) :
    if ( (tour_depart < 0) or (tour_depart > 2) ) :
      return 0
    if ( self.tours[tour_depart].nbDisques() == 0 ) :
      return 0
    return 1
  def arriveeValide (self, tour_depart, tour_arrivee) :
    if ( not self.departValide(tour_depart) ) :
      return 0 ;
    if ( (tour_arrivee < 0) or (tour_arrivee > 2) ) :
      return 0 ;
    if ( self.tours[tour_arrivee].nbDisques() == 0 ) :
      return 1
    if ( self.tours[tour_depart].sommet() >= self.tours[tour_arrivee].sommet() ) :
      return 0
    return 1
  def transferer(self, tour_depart, tour_arrivee) :
    if ( self.departValide(tour_depart) ) :
      if ( self.arriveeValide(tour_depart, tour_arrivee) ) :
        self.tours[tour_depart].transferer(self.tours[tour_arrivee])
      else :
        print "Ne peut pas déplacer de %d vers %d" % (tour_depart, tour_arrivee)
    else :
      print "Ne peut pas déplacer à partir de %d" % tour_depart
  def fini(self) :
    return self.tours[2].nbDisques() == self.hauteur_max
  def solution(self, callback_avant, callback_apres) :
    self.tours = [clTour(self.hauteur_max), \
                  clTour(self.hauteur_max), \
                  clTour(self.hauteur_max)]
    self.tours[0].remplir()
    self.mouvements = 0
    self.avantTransfert = callback_avant
    self.apresTransfert = callback_apres
    self.deplacerTour(0, 1, 2, self.hauteur_max)
  def deplacerTour(self, source, pivot, destination, nombre) :
    if ( nombre == 1 ) :
      self.mouvements += 1
      self.avantTransfert(source, destination, self.mouvements)
      self.transferer(source, destination)
      self.apresTransfert(source, destination, self.mouvements)
    else:
      self.deplacerTour(source, destination, pivot, nombre-1)
      self.deplacerTour(source, pivot, destination, 1)
      self.deplacerTour(pivot, source, destination, nombre-1)
