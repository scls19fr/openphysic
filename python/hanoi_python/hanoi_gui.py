from Tkinter import *
import hanoi
import time

class clDessinTours(Canvas) :
  def __init__ (self, parent, hanoi) :
    Canvas.__init__(self, parent)
    self.hanoi = hanoi
    self.disques_max = self.hanoi.hauteur_max
    self.items_vers_disques = {}
    self.disques_vers_items = {}
    self.items_vers_tours = {}
    self.hauteur_disques = 8
    self.inter_disques = 2
    self.inter_bases = 16
    self.largeur_unitaire = 10
    self.largeur_piquet = 8
    self.hauteur_base = 10
    self.positions_tours = []
    self.positions_disques = []
    self.hauteur_piquets = (self.hauteur_disques+self.inter_disques)*self.disques_max + \
      self.hauteur_disques
    self.largeur_base = self.largeur_unitaire*self.disques_max*2+self.largeur_piquet

  def Tour(self, x, y) :
    items = self.find_overlapping(x-1, y-1, x+1, y+1)
    print items
    for item in items :
      if ( self.items_vers_tours.has_key(item) ) :
        return self.items_vers_tours[item]
    return None    

  def CreerDisque(self, largeur) :
    x = self.largeur_unitaire*largeur*2+self.largeur_piquet
    y = self.hauteur_disques
    item = self.create_rectangle(0, 0, x, y, fill="SandyBrown")
    self.positions_disques[largeur] = (x/2, y/2)
    self.items_vers_disques[item] = largeur
    self.disques_vers_items[largeur] = item
    return item

  def DeplacerDisque(self, disque, x, y) :
    pos = self.positions_disques[disque]
    dx = x - pos[0]
    dy = y - pos[1]
    item = self.disques_vers_items[disque]
    self.move(item, dx, dy)
    self.tag_raise(item, "all")
    self.positions_disques[disque] = (x, y)

  def PoserDisque(self, disque, num_tour, etage) :
    x = self.positions_tours[num_tour]
    y = self.hauteur_disques + self.hauteur_piquets - \
      (self.hauteur_disques+self.inter_disques)*etage + \
      self.hauteur_disques/2
    self.DeplacerDisque(disque, x, y)

  def Transferer(self, tour_depart, tour_arrivee) :
    disque = self.hanoi.tours[tour_depart].sommet()
    etage = self.hanoi.tours[tour_arrivee].nbDisques()+1
    self.PoserDisque(disque, tour_arrivee, etage)

  def Dessin(self) :
    self.disques_max = self.hanoi.hauteur_max
    self.addtag_all("tous")
    self.delete("tous")
    self.items_vers_disques = {}
    self.disques_vers_items = {}
    self.items_vers_tours = {}
    self.positions_tours = [0 for i in range(3)]
    self.positions_disques = [(0,0) for i in range(self.disques_max+1)]

    self.hauteur_piquets = (self.hauteur_disques+self.inter_disques)*self.disques_max + \
      self.hauteur_disques
    self.largeur_base = self.largeur_unitaire*(self.disques_max+1)*2+self.largeur_piquet
    for num_tour in range(3) :
      x_min = self.inter_bases + (self.largeur_base+self.inter_bases)*num_tour
      y_min = self.hauteur_disques
      x_milieu = x_min+(self.largeur_base/2)
      self.positions_tours[num_tour] = x_milieu
      # la base...
      item = self.create_rectangle(x_min,
                            y_min+self.hauteur_piquets,
                            x_min+self.largeur_base,
                            y_min+self.hauteur_piquets+self.hauteur_base,
                            fill="SaddleBrown")
      self.items_vers_tours[item] = num_tour
      # le piquet...
      item = self.create_rectangle(x_milieu-self.largeur_piquet/2,
                            y_min,
                            x_milieu+self.largeur_piquet/2,
                            y_min+self.hauteur_piquets,
                            fill="SaddleBrown")
      self.items_vers_tours[item] = num_tour
      # les disques...
      for etage in range(1, self.disques_max+1) :
        disque = self.hanoi.tours[num_tour].disque(etage)
        if ( disque > 0 ) :
          self.CreerDisque(disque)
          self.PoserDisque(disque, num_tour, etage)
    # redimensionne le canevas
    self.configure(width=3*self.largeur_base+4*self.inter_bases,
                   height=2*self.hauteur_disques+self.hauteur_piquets+self.hauteur_base)

class clHanoiGui :
  def __init__ (self, racine) :
    self.racine = racine
    self.hanoi = hanoi.clHanoi(3)
    cadre_haut = Frame(racine, relief="ridge", borderwidth=2)

    gauche = Frame(cadre_haut)
    Label(gauche, text="Nb de disques : ").pack(side="top", padx=2, pady=0)
    self.nb_disques = IntVar()
    echelle = Scale(gauche, from_=3, to=10, orient="horizontal", tickinterval=1,
      variable=self.nb_disques)
    echelle.pack(side="top", expand="yes", fill="x", padx=2, pady=2)
    gauche.pack(side="left", expand="yes", fill="x")

    cadre_boutons = Frame(cadre_haut)
    Button(cadre_boutons, text="Commencer", command=self.Commencer) \
      .grid(row=0, column=0, sticky="nsew")
    Button(cadre_boutons, text="Solution", command=self.Solution) \
      .grid(row=1, column=0, sticky="nsew")
    Button(cadre_boutons, text="Options", command=self.Options) \
      .grid(row=0, column=1, sticky="nsew")
    Button(cadre_boutons, text="Quitter", command=self.Quitter) \
      .grid(row=1, column=1, sticky="nsew")
    cadre_boutons.pack(side="left")
    
    cadre_haut.pack(side="top", fill="x")
    
    self.dessin_tours = clDessinTours(racine, self.hanoi)
    self.dessin_tours.pack(side="top", expand="yes", fill="both")
    
    self.message = Label(racine, relief="ridge")
    self.message.pack(side="top", pady=2, expand="yes", fill="both")
    
    self.dessin_tours.Dessin()
    self.dessin_tours.bind("<ButtonPress-1>", self.ChoixTour)
    self.attente_tour_depart = 0
    self.tour_depart = -1
    self.Commencer()

  def ChoixTour(self, event) :
    tour = self.dessin_tours.Tour(event.x, event.y)
    if ( not (tour == None) ) :
      if ( self.attente_tour_depart ) :
        if ( self.hanoi.departValide(tour) ) :
          self.tour_depart = tour
          self.attente_tour_depart = 0
          self.message.configure(text="Tour de depart : %d" % (tour+1))
        else :
          self.message.configure(text="Depart invalide !")
      else :
        if ( self.hanoi.arriveeValide(self.tour_depart, tour) ) :
          self.dessin_tours.Transferer(self.tour_depart, tour)
          self.hanoi.transferer(self.tour_depart, tour)
          if ( self.hanoi.fini() ) :
            self.message.configure(text="Bravo, vous avez trouvé !")
          else :
            self.mouvements += 1
            self.message.configure(text="Mouvement %d"%self.mouvements)
        else :
          self.message.configure(text="Arrivee invalide !")
        self.attente_tour_depart = 1
    else :
      self.message.configure(text="Tour invalide !")
      
  def Options(self) :
    pass

  def Commencer(self) :
    nb = self.nb_disques.get()
    self.hanoi = hanoi.clHanoi(nb)
    self.dessin_tours.hanoi = self.hanoi
    self.dessin_tours.Dessin()
    self.attente_tour_depart = 1
    self.mouvements = 0
    self.message.configure(text="Solution en %d mouvements minimum."%(2**nb-1))

  def Solution(self) :
    self.Commencer()
    self.hanoi.solution(self.SolutionAvantEtape, self.SolutionApresEtape)

  def SolutionAvantEtape(self, depuis, vers, mouvement) :
    self.message.configure(text="Mouvement %d, de %d vers %d" % (mouvement, depuis+1, vers+1))
    self.dessin_tours.Transferer(depuis, vers)

  def SolutionApresEtape(self, depuis, vers, mouvement) :
    self.racine.update()
    time.sleep(0.75)

  def Quitter(self) :
    self.racine.quit()

racine = Tk()
hanoi_gui = clHanoiGui(racine)
racine.mainloop()
