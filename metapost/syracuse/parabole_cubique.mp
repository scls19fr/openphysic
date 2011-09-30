input geometrie2d;
input courbes;
vardef fx(expr t) = t**3 enddef;
vardef fy(expr t) = t enddef;

beginfig(1);
    Repere(9,6,4.5,3,2,2); 
    Axes;
    Debut;
	Graduations;
	Unites(1);
 
	trace Courbe(fx,fy,-3,3,100) 
	    withpen pencircle scaled 1.5pt 
	    withcolor 0.5blue+0.4green; 
 
	Etiquette("$y=\sqrt[3]{x}$",1.5,(1.5,-1));
    Fin;
    Etiquette("\it Parabole cubique",2,(4.5,-0.5));
endfig;
end