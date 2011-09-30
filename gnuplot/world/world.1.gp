# set terminal png transparent nocrop enhanced font arial 8 size 420,320 
# set output 'world.1.png'
set yzeroaxis lt 0 lw 1.000
plot 'world.dat' with lines 3 4, 'world.cor' with points 1 2
