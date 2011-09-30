class Charge:
    def __init__(self): # Initiatisation de la classe
        self.position.X=50
        self.position.Y=100

        self.charge=50
        
    class position:
        def __init__(self):
            self.X=50
            self.Y=100

MyCharge = Charge()

MyCharge.charge=MyCharge.charge+10
MyCharge.position.X=MyCharge.position.X+10
MyCharge.position.Y=MyCharge.position.Y+10

print(MyCharge.charge)
print(MyCharge.position.X)
print(MyCharge.position.Y)
