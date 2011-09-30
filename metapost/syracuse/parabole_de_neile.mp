input geometrie2d;
input courbes;

vardef fx(expr t) = t**3 enddef;
vardef fy(expr t) = t**2 enddef;

beginfig(1);
    Repere(9,6,4.5,0.5,2,2); 
    Axes;
    Debut;
	Graduations;
	Unites(1); 
	trace Courbe(fx,fy,-3,3,100)
	    withpen pencircle scaled 1.5
	    withcolor 0.5blue+0.4green; 
	
	pointe Point(0,0);
	Etiquette("$y=\sqrt[3]{x^2}$",1.5,(1,2));
    Fin;
    Etiquette("\it Parabole de Neile",2,(4.5,-0.5));
endfig;
end