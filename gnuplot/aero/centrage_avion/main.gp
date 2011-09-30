MASSE_Avion_Vide_et_10_litres = 550
MASSE_CDB = 80
MASSE_CoPilote = 70
MASSE_Passager1 = 50
MASSE_Passager2 = 0
MASSE_Bagages = 20

VOLUME_Essence = 100

# -----------------

MASSE_VOLUMIQUE_Essence = 0.72
MASSE_Essence = MASSE_VOLUMIQUE_Essence*VOLUME_Essence

BRAS_DE_LEVIER_Avion_Vide_et_10_litres = 0.333
BRAS_DE_LEVIER_CDB = 0.410
BRAS_DE_LEVIER_CoPilote = 0.410
BRAS_DE_LEVIER_Passager1 = 1.190
BRAS_DE_LEVIER_Passager2 = 1.190
BRAS_DE_LEVIER_Bagages = 1.900
BRAS_DE_LEVIER_Essence = 1.120

MOMENT_Avion_Vide_et_10_litres = MASSE_Avion_Vide_et_10_litres * BRAS_DE_LEVIER_Avion_Vide_et_10_litres
MOMENT_CDB = MASSE_CDB * BRAS_DE_LEVIER_CDB
MOMENT_CoPilote = MASSE_CoPilote * BRAS_DE_LEVIER_CoPilote
MOMENT_Passager1 = MASSE_Passager1 * BRAS_DE_LEVIER_Passager1
MOMENT_Passager2 = MASSE_Passager2 * BRAS_DE_LEVIER_Passager2
MOMENT_Bagages = MASSE_Bagages * BRAS_DE_LEVIER_Bagages
MOMENT_Essence = MASSE_Essence * BRAS_DE_LEVIER_Essence

MASSE_Total_sans_essence = MASSE_Avion_Vide_et_10_litres + MASSE_CDB + MASSE_CoPilote + MASSE_Passager1 + MASSE_Passager2 + MASSE_Bagages
MASSE_Total_avec_essence = MASSE_Total_sans_essence + MASSE_Essence

MOMENT_Total_sans_essence = MOMENT_Avion_Vide_et_10_litres + MOMENT_CDB + MOMENT_CoPilote + MOMENT_Passager1 + MOMENT_Passager2 + MOMENT_Bagages
MOMENT_Total_avec_essence =  MOMENT_Total_sans_essence + MOMENT_Essence

BRAS_DE_LEVIER_Total_sans_essence =  MOMENT_Total_sans_essence / MASSE_Total_sans_essence
BRAS_DE_LEVIER_Total_avec_essence = MOMENT_Total_avec_essence / MASSE_Total_avec_essence

set terminal x11 # affichage en fenêtre

set border# bordure
set grid # grille

# légende (activer légende=set, pas de légende=unset)
set key default 
#unset key

set xrange [0.2:0.6] # intervalle de x (bras de levier)
set yrange [500:1100] # intervalle de y (masse)

set xtics 0.1
set ytics 100

set xlabel "bras de levier" # titre des x
set ylabel "masse (kg)" # titre des y

set parametric

#set trange [0:2*pi]

plot BRAS_DE_LEVIER_Total_avec_essence,MASSE_Total_avec_essence with points \
     , BRAS_DE_LEVIER_Total_sans_essence,MASSE_Total_sans_essence with points \
     , "main.dat" with lines