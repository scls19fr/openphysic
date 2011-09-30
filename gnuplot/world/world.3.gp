# set terminal png transparent nocrop enhanced font arial 8 size 420,320 
# set output 'world.3.png'
set dummy u,v
set angles degrees
set arrow 1 from 0, 0, -1.2 to 0, 0, 1.2  back nofilled linetype 5 linewidth 2.000
set arrow 2 from -1.2, 0, 0 to 1.2, 0, 0  nohead back nofilled linetype 5 linewidth 1.000
set arrow 3 from 0, -1.2, 0 to 0, 1.2, 0  nohead back nofilled linetype 5 linewidth 1.000
set parametric
set view 70, 40, 0.8, 1.2
set samples 32, 32
set isosamples 9, 9
set mapping spherical
set hidden3d offset 1 trianglepattern 3 undefined 1 altdiagonal bentover
set yzeroaxis lt 0 lw 1.000
set ticslevel 0
set title "3D solid version through hiddenlining" 0.000000,0.000000  font ""
set urange [ -90.0000 : 90.0000 ] noreverse nowriteback
set vrange [ 0.00000 : 360.000 ] noreverse nowriteback
splot cos(u)*cos(v),-cos(u)*sin(v),sin(u) with lines 5 6,'world.dat' u 1:2:(1.001) with lines 3 4, 'world.cor' with points 1 2
