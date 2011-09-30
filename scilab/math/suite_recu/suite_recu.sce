// Termes d'une suite recurrente

clear

function [y]=f(x)
	// u_n+1 = sqrt ( u_n +2 )
	 y=sqrt(x+2)
  // u_n+1 = 2*u_n // suite géométrique
	//y=2*x
	// u_n+1 = u_n + 1 // suite arithmétique
	//y=x+1
endfunction


// u_courant = u_n
// u_precedent = u_n-1
n=0
u_precedent=1;
u_courant=u_precedent


while (1) // boucle infinie More (y or n) ? => n puis CTRL + C pour quitter
n=n+1
u_courant=f(u_precedent)
u_precedent=u_courant;
end
