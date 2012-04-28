#!/usr/bin/env python

def tranches2005(montant):
    return(tranches2005_apres_ab(montant*(1-20/100)))

def tranches2005_apres_ab(montant):
    if montant<4412:
        return(0)
    elif montant>=4412 and montant<8677:
        return(6.83/100)
    elif montant>=8678 and montant<15275:
        return(19.14/100)
    elif montant>=15275 and montant<24732:
        return(28.26/100)
    elif montant>=24732 and montant<40242:
        return(37.38/100)
    elif montant>=40242 and montant<49624:
        return(42.62/100)
    elif montant>=49624 and montant<120100:
        return(48.09/100)
    else:
        return(48.09/100)

montant=24000
taux=tranches2005(montant)
taxe=montant*taux

print(montant)
print(taux)
print(taxe)
