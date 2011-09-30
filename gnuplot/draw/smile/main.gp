# set terminal png transparent nocrop enhanced font arial 8 size 420,320 
# set output 'fillcrvs.6.png'
unset border
set dummy t,y
set grid nopolar
set grid xtics nomxtics ytics nomytics noztics nomztics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid layerdefault
unset key
set label 1 "gnuplot" at 0, 1.2, 0 centre norotate front nopoint
set label 2 "gnuplot" at 0.02, -0.6, 0 centre norotate front nopoint
set arrow 1 from -0.1, 0.26, 0 to 0.18, -0.17, 0  front nofilled linetype 5 linewidth 4.000 size first 0.100,40.000,90.000
set parametric
set size ratio 1 1,1
unset xtics
unset ytics
set title "Let's smile with parametric filled curves" 0.000000,0.000000  font ""
set xrange [ -1.00000 : 1.00000 ] noreverse nowriteback
set yrange [ -1.00000 : 1.60000 ] noreverse nowriteback
plot [t=-pi:pi] sin(t),cos(t) with filledcurve xy=0,0 15, \
     sin(t)/8-0.5,cos(t)/8+0.4 with filledcurve 3
