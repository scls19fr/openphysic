input geometrie2d;
input courbes;

vardef fx(expr t) = 3*t/(1+t**3) enddef;
vardef fy(expr t) = 3*(t**2)/(1+t**3) enddef;

beginfig(1);
    Repere(10,10,5,5,2,2);
    Axes;
    Debut;
	Graduations;
	Unites(1); 
 
	trace Courbe(fx,fy,-0.9,10,50)..(0,0)..Courbe(fx,fy,-11,-1.1,20)
	    withpen pencircle scaled 1.5
	    withcolor red; 
	
	trace Droite(Point(-1,0),Point(0,-1))
	    withcolor (0.8,0.5,0.3);
	    
	Etiquette("$x^3+y^3-3xy=0$",1.5,(-1.1,-1.3));
 
    Fin;
    Etiquette("\it Folium de Descartes",2,(5,-0.5)); 
endfig;
end