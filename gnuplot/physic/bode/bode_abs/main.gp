set logscale x
set xrange [0.01:100]

plot 20*log10(1/sqrt(1+x**2))
#plot 20*log10(1/abs{1,x})   # invalid complex constant
#plot 20*log10(abs(1/{1,x})) # invalid complex constant