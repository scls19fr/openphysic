set parametric

set grid  # grille
unset key # pas de légende

# Point de depart
xA=1
yA=1

# Point d'arrivee
xB=2
yB=3

tmin=0
tmax=2*pi
alpha=(xB-xA)/(tmax-tmin)
beta=(yB-yA)/(tmax-tmin)
set trange [tmin:tmax]

plot alpha*(t-tmin)+xA,beta*(t-tmin)+yA