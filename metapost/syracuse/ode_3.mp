input geometrie2d;
input courbes;

vardef fx(expr x) = a*x/sqrt(1+x*x) enddef;
vardef fy(expr x) = x enddef;

beginfig(1);
    Repere(10,10,5,5,2,2); 
    Axes;
    Debut;
	Graduations;
	Unites(1);
 
	%% Champs de vecteurs 
	ahlength := 2.5;
	vardef F(expr x,y) = (y**3+y)/x enddef; 
	ChampVecteurs(F,0.1,0.1,0.2,0.2,0.15,0.5white); 

	%% Courbes intégrales 
	for n = 0 upto 20: 
	    a := (n/2) - 5; 
	    trace Courbe(fx,fy,-2.5,2.5,50) 
		withpen pencircle scaled 1
		withcolor (0.1,0.1,0.9); 
	endfor; 
    Fin;
    
    Etiquette("$xy'-y=y^3$",3,(5,-0.7));
endfig;
end