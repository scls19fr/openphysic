V=5
R=0.4
OMEGA=V/R
Y0=1.5
set parametric
set trange [0:3]
set xrange [-1:17]
set yrange [-1:2]
unset grid
unset title
plot V*t+cos(-OMEGA*t),sin(-OMEGA*t) \
,V*t,Y0
#plot V*t,Y0