input geometrie2d;
input courbes;

vardef f(expr x) = 1+a*x/(1+x) enddef;

beginfig(1);
    Repere(10,10,5,5,2,2); 
    Axes;
    Debut;
	Unites(1);
	Graduations;
 
	%% Champs de vecteurs 
	ahlength := 2.5;
	vardef F(expr x,y) = (y-1)/(x+x*x) enddef; 
	ChampVecteurs(F,0.1,0.1,0.2,0.2,0.15,0.5white); 
 
	%% Courbes intégrales 
	color couleur; couleur = (0.9,0.1,0.9); 
	for n = 0 upto 20: 
	    a := (n/8) - 1.25; 
	    trace Representation(f,-0.9,2.5,50)
		withcolor couleur; 
	    trace Representation(f,-2.5,-1.05,50) 
		withcolor couleur; 
	endfor 
 
	trace Droite(Point(-2,1),Point(2,1))
	    withcolor couleur; 
	trace Droite(Point(-1,2),Point(-1,-2))
	    withpen pencircle scaled 1
	    withcolor red;
	    
	pointe Point(0,1)
	    withcolor red;
 
    Fin;
     
    Etiquette("$(x+x^2)y'-y=-1$",2.5,(5,-0.7));
endfig;
end