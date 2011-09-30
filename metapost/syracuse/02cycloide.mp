input geometrie2d;
input courbes;

vardef fx(expr t) = t-sin(t) enddef;
vardef fy(expr t) = 1-cos(t) enddef;
vardef f(expr t) = (fx(t),fy(t)) enddef;

beginfig(1);


    Repere(12,6,2,1,1.5,1.5);
    Axes;
    Debut;
	Unites(1);
	Graduations;

	for i = 1 upto 20:
	    u := (i-1)/4;
	    c := Cercle(Point(u,1),1);
	    remplis c
		withcolor (0.95-i/30)*white;
	    trace c;

	    trace f(u)--f(u)
		withpen pencircle scaled 4
		withcolor blue;
	    
	    trace (u,1)--f(u);
	endfor;


	trace Courbe(fx,fy,-3,10,100)
	    withpen pencircle scaled 1.5pt
	    withcolor 0.7red;
	    
	Etiquette("$\begin{cases}x=t-\sin t\\y=1-\cos t\end{cases}$",1.5,(4,2.7));    
    Fin;

    Etiquette("\textit{La cycloïde}",2,(6,0));
endfig;
end
