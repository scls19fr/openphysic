set parametric

# Centre
x0=1
y0=1

# Rayon
r=1

t_min=pi/180*30 # angle de depart
t_max=pi/180*60 # angle d'arrivee

set trange [0:2*pi]
plot x0+r*cos(t*(t_max-t_min)/(2*pi)+t_min),y0+r*sin(t*(t_max-t_min)/(2*pi)+t_min)