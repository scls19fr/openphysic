// Oscillations d'un pendule
// S. CELLES - 09/02/2007

// theta.. + g/l * sin(theta) = 0
// theta.. = -2*lambda*theta. - omega0^2 * sin(theta)

clear;

//m = 0.050; // kg
l = 0.20; // m
g = 9.81; // N/kg ou m/s^2

%omega0 = sqrt(g/l);

%lambda = 0.1; // frottements

// on pose u1=theta et u2=theta'=v/l

function theta_mod=modulo_perso(theta) // angles entre -pi et +pi
//  theta_mod = modulo(theta,2*%pi);
  theta_mod = modulo(theta-%pi,2*%pi)+%pi;
endfunction

function [f]=MonSecondMembre(t,u)
  f(1) = u(2);
  f(2) = -2*%lambda*u(2) - %omega0^2*sin(u(1));
endfunction

t0=0;
t=0:0.01:100;
theta0 = 178*%pi/360;
thetadot0 = -20; // thetadot = v/l
u0 = [theta0 ; thetadot0];

[u]=ode(u0,t0,t,MonSecondMembre);

//theta = u(1,:); // extraction ligne 1
theta = modulo_perso(u(1,:)); // extraction ligne 1 et modulo 2*pi
thetadot = u(2,:);

xbasc();
// evolution temporelle
plot(t,theta);

halt();
xbasc();

// portrait de phase
isoview(-theta0,theta0,-theta0,theta0) // isoview(xmin,xmax,ymin,ymax) 
plot2d(theta,thetadot/%omega0,style=0);
//plot(theta,thetadot/%omega0);

