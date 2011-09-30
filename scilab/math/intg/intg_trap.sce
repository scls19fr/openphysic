// Calcul d'une intégrale
// Méthode des trapèzes

clear

function [y]=f(x)
	y=x^2; // MODIFIABLE
endfunction

N = 1000; // Nb de rectangles

x_min = 0; // borne inf
x_max = 1; // borne sup

S=0;

x_pas=(x_max-x_min)/N;

for x=x_min:x_pas:x_max-x_pas
	S=S+x_pas*(f(x)+f(x+x_pas))/2;
end
S
