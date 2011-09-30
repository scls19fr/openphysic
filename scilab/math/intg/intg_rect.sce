// Calcul d'une intégrale
// Méthode des rectangles

clear

function [y]=f(x)
	y=x^2; // MODIFIABLE
endfunction

N = 1000; // Nb de rectangles

x_min = 0; // borne inf
x_max = 1; // borne sup

S1=0;
S2=0;

x_pas=(x_max-x_min)/N;

for x=x_min:x_pas:x_max-x_pas
	S1=S1+x_pas*f(x);
	S2=S2+x_pas*f(x+x_pas);
end
S1
S2
