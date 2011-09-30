// Oscillations d'une masse reliée à un ressort
// S. CELLES - 09/02/2007

// x.. + h/m x. + k/m x = 0
// x.. + 2 %lambda x. + %omega0^2 x = 0
// x.. = - 2 %lambda x. - %omega0^2 x

clear;

m = 0.050; // kg
k = 10; // N/m
h = 0.01; // N*s/m (f = h*v)

%omega0 = sqrt(k/m);
%lambda = h/(2*m);

// on pose u1=x et u2=x'=v

function [f]=MonSecondMembre(t,u)
  f(1) = u(2)
  f(2) = - 2*%lambda*u(2) - %omega0^2*u(1);
endfunction

t0=0;
t=0:0.01:5;
x0 = 0.05;
v0 = 0;
u0 = [x0 ; v0];

[u]=ode(u0,t0,t,MonSecondMembre);

x = u(1,:); // extraction ligne 1
v = u(2,:);

xbasc();
// evolution temporelle
plot(t,x);

halt();
xbasc();

// portrait de phase
isoview(-x0,x0,-x0,x0) // isoview(xmin,xmax,ymin,ymax) 
plot(x,v/%omega0);
