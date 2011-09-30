class Sac:
    def __init__(self): # Initiatisation de la classe
        self.vider()
    def vider(self): # Vidage du sac
        self.donnees = []
    def ajouter(self, x): # Ajouter un objet dans le sac
        self.donnees.append(x)
    def ajouterdoublon(self, x): # Ajouter 2 fois le meme objet
        self.ajouter(x)
        self.ajouter(x)
    def montrer(self): # Montrer le sac
        return self.donnees

MySac = Sac()
print(MySac.montrer())
MySac.vider()
MySac.ajouter(1)
MySac.ajouterdoublon(2)
print(MySac.montrer())
