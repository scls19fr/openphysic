input geometrie2d;
input courbes;
input reperes;
vardef fx(expr t) = sqrt(cos(2*t))*cos(t) enddef;
vardef fy(expr t) = sqrt(cos(2*t))*sin(t) enddef;

beginfig(1);
    Repere(9,7,4.5,3.5,4,4);
    Axes; 
    Debut;
	Graduations;
	Unites(1);
	trace Courbe(fx,fy,-Pi/4,Pi/4,100)
	    withpen pencircle scaled 1.5pt 
	    withcolor 0.8red+0.1green; 
	trace Courbe(fx,fy,3*Pi/4,5*Pi/4,100)
	    withpen pencircle scaled 1.5pt 
	    withcolor 0.8red+0.1green; 
	pointe  Point(0,0);
	Etiquette("$\rho=\sqrt{\cos 2\theta}$",1.5,(0.5,-0.5));
    Fin;
    
    Etiquette("\it Lemniscate de Bernoulli",2,(4.5,-0.5));    
endfig;
end
