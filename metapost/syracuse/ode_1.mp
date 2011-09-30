input geometrie2d;
input courbes;
input reperes;

vardef F(expr x,y) = x - 2 * x * y enddef;
vardef f(expr x) = 1/2 + a * exp(- x*x) enddef;

beginfig(1);
    
    Repere(10,10,5,5,2,2); 
    Axes;
    Debut;
	Graduations;
	Unites(1);
        
	% Tracé du champ de vecteurs
	ahlength := 2;
	ChampVecteurs(F,0,0,0.2,0.2,0.1,0.5white); 
 
	% Courbes intégrales
	for n = 0 upto 16: 
	    a := (n/2) - 4; 
	    trace Representation(f,-2.5,2.5,50)
		 withcolor (1,1,0); 
	endfor 
 
    Fin; 

    Etiquette("$y'+2xy=x$",2.5,(5,-0.7));
endfig;
end