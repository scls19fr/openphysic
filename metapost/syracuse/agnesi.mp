input geometrie2d;
input courbes;

vardef f(expr t) = 1/(1+t**2) enddef;


beginfig(1);
    
    Repere(9,4,4.5,0.5,2,2); 
    Axes;
    Debut;
	Graduations;
	Unites(1);
	trace Representation(f,-4.5,4.5,100) 
	    withpen pencircle scaled 2pt 
	    withcolor 0.8blue; 
	Etiquette("$y=\frac{1}{1+x^2}$",1.5,(1.5,1));
    Fin;

    Etiquette("\it Cubique d'Agnesi",2,(4.5,-0.5)); 
    
endfig;

end