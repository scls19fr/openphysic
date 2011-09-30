input geometrie2d;
input courbes;
input reperes;

vardef r(expr t) = 1+cos(t) enddef;

beginfig(1);

    Repere(9,7,3.5,3.5,2,2); 
    Axes
    Debut;
	Graduations;
	Unites(1); 
	trace CourbeEnPolaires(r,0,2*Pi,100)
	    withpen pencircle scaled 1.5pt 
	    withcolor (0,0.7,0.93); 
	Etiquette("$\rho = 1+\cos\theta$",1.5,(1.5,-1.5));
	O = Point(0,0);
	marque.urt "O";
    Fin; 
    
    Etiquette("\it Cardioïde",2,(4.5,-0.5)); 
endfig;
end