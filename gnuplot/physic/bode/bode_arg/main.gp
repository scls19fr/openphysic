set logscale x
set xrange [0.01:100]

#plot arg(1/{1,x})
plot arg(1) - atan(x/1)
