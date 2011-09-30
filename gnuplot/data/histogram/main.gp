#set terminal x11 # affichage en fenêtre

set border# bordure
set grid # grille
set key # légende (activer légende=set, pas de légende=unset)


#set xrange [0:5] # intervalle de x
#set yrange [0:10] # intervalle de y

set xtics 1
set ytics 5

set xlabel "axe des x" # titre des x
set ylabel "axe des y" # titre des y
set zlabel "axe des z" # titre des y


#plot 'main.dat' using 1:2 with boxes # using 1:2 sert à choisir la colonne
splot 'main.dat' matrix with boxes
#plot 'main.dat' using 1:2:3:4 with boxes