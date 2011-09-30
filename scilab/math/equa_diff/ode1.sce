// Résolution numérique d'une équation différentielle
// y' + b y = c
// on cherche la solution y(x)
// méthode utilisée : la fonction ode de Scilab
// plus d'info en tapant help ode dans Scilab
// S. Celles
// 09/02/2007

clear

b = 1; // MODIFIABLE
c = 1; // MODIFIABLE

// on réécrit l'équa diff sous la forme
// y' = c - b y

function ydot=f(t,y)
  ydot= c - b*y;
endfunction

y0=0;
t0=0;
t=0:0.1:10;

y=ode(y0,t0,t,f);
plot(t,y);
