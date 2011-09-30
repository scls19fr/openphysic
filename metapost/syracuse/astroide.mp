input geometrie2d;
input courbes;

vardef fx(expr t) = cos(t)**3 enddef;
vardef fy(expr t) = sin(t)**3 enddef;

beginfig(1);

    Repere(9,9,4.5,4.5,4,4);
    Axes; 
    Debut; 
	Graduations;
	Unites(1);
	trace Courbe(fx,fy,0,2*Pi,100) 
	    withpen pencircle scaled 2pt 
	    withcolor 0.7[green,red]; 
 
	Etiquette(
	    "$\begin{cases}x=\cos^3t\\ y=\sin^3t\end{cases}$",
	    1.5,
	    (0.75,-0.75)
	    ); 
    Fin;
    
    Etiquette("\it Astroïde",2,(4.5,-0.5)); 
endfig;
end