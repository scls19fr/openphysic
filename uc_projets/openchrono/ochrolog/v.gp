#set terminal x11 # affichage en fenêtre

set border# bordure
set grid # grille
set key # légende (activer légende=set, pas de légende=unset)

# set xrange [-5:5] # intervalle de x
# set yrange [0:20] # intervalle de y
set yrange [0:150]

# set xtics 1
# set ytics 5

set xlabel "temps (s)" # titre des x

set ylabel "V (km/h)" # titre des y
plot 'main.dat' using 1:3
