class Charge:
    def __init__(self): # Initiatisation de la classe
        self.position_X=50
        self.position_Y=100
        self.charge=50

MyCharge = Charge()

MyCharge.charge=MyCharge.charge+10
MyCharge.position_X=MyCharge.position_X+10
MyCharge.position_Y=MyCharge.position_Y+10

print(MyCharge.charge)
print(MyCharge.position_X)
print(MyCharge.position_Y)
