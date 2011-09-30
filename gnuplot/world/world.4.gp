# set terminal png transparent nocrop enhanced font arial 8 size 420,320 
# set output 'world.4.png'
set dummy u,v
set angles degrees
set parametric
set view 70, 40, 0.8, 1.2
set samples 32, 32
set isosamples 9, 9
set mapping cylindrical
set yzeroaxis lt 0 lw 1.000
set ticslevel 0
set title "3D version using cylindrical coordinate system" 0.000000,0.000000  font ""
set urange [ -180.000 : 180.000 ] noreverse nowriteback
set vrange [ -90.0000 : 90.0000 ] noreverse nowriteback
splot cos(u),sin(u),v with lines 5 6,'world.dat' with lines 3 4, 'world.cor' with points 1 2
