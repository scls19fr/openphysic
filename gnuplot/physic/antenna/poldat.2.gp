# set terminal png transparent nocrop enhanced font arial 8 size 420,320 
# set output 'poldat.2.png'
set clip points
unset border
set dummy t,y
set angles degrees
set grid polar 15.000000
set grid xtics nomxtics noytics nomytics noztics nomztics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid layerdefault
unset key
set polar
set size ratio 1 1,1
set style data lines
set xtics axis nomirror norotate autofreq 
set ytics axis nomirror norotate autofreq 
set title "Antenna Pattern" 0.000000,0.000000  font ""
set timestamp "%a %b %d %H:%M:%S %Y" bottom norotate 0.000000,0.000000  ""
set rrange [ -200.000 : 60.0000 ] noreverse nowriteback
set trange [ -3.14159 : 3.14159 ] noreverse nowriteback
set xlabel "Azimuth" 0.000000,0.000000  font ""
set xrange [ -220.000 : 220.000 ] noreverse nowriteback
set ylabel "dBSM" 0.000000,0.000000  font ""
set yrange [ -220.000 : 220.000 ] noreverse nowriteback
tv(t,r) = sin(t)/(1+r)
tu(t,r) = (cos(t) +r)/(1+r)
cu(t,x) = 1 + cos(t)/x
cv(t,x) = (1+ sin(t))/x
plot "-" using 1:5,"-"
