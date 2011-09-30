#set terminal x11 # affichage en fenêtre

set border# bordure
set grid # grille
unset key # légende (activer légende=set, pas de légende=unset)

# set xrange [-5:5] # intervalle de x
# set yrange [0:20] # intervalle de y

# set xtics 1
# set ytics 5

set xlabel "temps (s)" # titre des x

set multiplot
set size 0.3,0.5
set origin 0.0,0.5
# plot 'main.dat' using 1:2,x**2 # using 1:2 sert à choisir la colonne
set yrange [0:15000]
set ylabel "RPM (tr/min)" # titre des y
plot 'main.dat' using 1:2 with dots

set origin 0.0,0.0
set yrange [0:150]
set ylabel "V (km/h)" 
plot 'main.dat' using 1:3 with dots

set origin 0.25,0.5
set yrange [-25:25]
set ylabel "Ax (m/s^2)"
plot 'main.dat' using 1:4 with dots

set origin 0.25,0.0
set yrange [-25:25]
set ylabel "Ay (m/s^2)"
plot 'main.dat' using 1:5 with dots

set size 0.5,0.5
set origin 0.5,0.25
set size square
set xrange [-500:500]
set yrange [-500:500]
set xlabel "x (m)"
set ylabel "y (m)"
plot 'main.dat' using 1:2 with dots

unset multiplot


