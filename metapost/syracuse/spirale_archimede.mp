input geometrie2d;
input courbes;

vardef fx(expr t) = t*cos(t)/5 enddef;
vardef fy(expr t) = t*sin(t)/5 enddef;
vardef f(expr t) = (fx(t),fy(t)) enddef;
vardef seg(expr t) = f(t-2Pi) -- f(t) enddef;
vardef mil(expr t) = 0.5[f(t-2Pi),f(t)] enddef;

beginfig(1);
    Repere(10,10,5,5,1,1); 
    Axes;
    Debut;
	Graduations;
	Unites(1); 

	trace ((0,0)--(5*cos(4),5*sin(4))) 
	    withcolor 0.3white; 

	for i = 1 upto 3: 
	    drawdblarrow seg(i*2*Pi+4) gENPLACE; 
	    Etiquette.lrt("$2\pi a$",1,mil(i*2*Pi+4)); 
	endfor 

	% Tracé de la spirale 
	trace Courbe(fx,fy,0,8Pi,100)
	    withpen pencircle scaled 1
	    withcolor red+blue;
	    
	Etiquette("$\rho = a\theta$",2,(4,-4.5));
    Fin;
    Etiquette("\it Spirale d'Archimède",3,(5,-0.7));
endfig;
end