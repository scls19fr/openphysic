input geometrie2d;
input courbes;

vardef f(expr x) = tan(x+a) enddef;

beginfig(1);

    Repere(10,10,5,5,2,2); 
    Axes;
    Debut;
	Graduations;
	Unites(1); 
	%% Champs de vecteurs 
	ahlength := 2.5;
	vardef F(expr x,y) = 1+y**2 enddef; 
	ChampVecteurs(F,0,0,0.2,0.2,0.1,0.5white); 
 
	%% Courbes intégrales 
	for n = 0 upto 16: 
	a := (n/2) - 4; 
	trace Representation(f,-1.5-a,1.5-a,50)
	    withpen pencircle scaled 1
	    withcolor (0.4,0.5,0.8); 
	endfor 
 
    Fin; 
    
    Etiquette("$y'=1+y^2$",2.5,(5,-0.7));
endfig;
end