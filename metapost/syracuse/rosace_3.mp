input geometrie2d;
input courbes;

vardef fx(expr t) = sin(3*t)*cos(t) enddef;
vardef fy(expr t) = sin(3*t)*sin(t) enddef;

beginfig(1);
    Repere(10,10,5,5,4,4); 
    Axes;
    Debut;
	Graduations;
	Unites(1);
 
	trace Courbe(fx,fy,0,2*Pi,100)
	    withpen pencircle scaled 1.5
	    withcolor red+green;
	Etiquette("$\rho=\sin 3\theta$",1.5,(0.7,-0.7));    
    Fin; 
 
    Etiquette("\it Rosace à trois boucles",2,(5,-0.5));
endfig;
end