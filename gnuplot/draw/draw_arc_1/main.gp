set parametric

# Centre
x0=1
y0=1

# Rayon
r=1

t_min=pi/180*30
t_max=pi/180*60

set trange [t_min:t_max]
plot x0+r*cos(t),y0+r*sin(t)