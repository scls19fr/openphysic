clear;
V=5;
R=0.35;
OMEGA=V/R;
t=[0:0.05:1]';
N=size(t,"r");
x1=R*cos(-OMEGA*t)+V*t;
x2=R*cos(-OMEGA*t);
x3=V*t;
y1=R*sin(-OMEGA*t);
y2=ones(N,1);
isoview(0,4,-2,2) // isoview(xmin,xmax,ymin,ymax) 
plot2d(x1,y1,style=-1);
plot2d(x3,y2,style=-1);
