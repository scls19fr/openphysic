input geometrie2d;
input courbes;

vardef fx(expr t) = cos(3*t+Pi/5) enddef;
vardef fy(expr t) = sin(2*t-Pi/3) enddef;

color avocat;
avocat = (56/256,82/256,3/256);

beginfig(1);

    Repere(10,10,5,5,4,4);
    Axes;
    Debut;
	Unites(1);
	Graduations;

	trace unitsquare scaled 2 shifted (-1,-1)
	    withcolor .7white;
	    
	trace Courbe(fx,fy,-Pi,Pi,150)
	    withpen pencircle scaled 2
	    withcolor avocat;

	Etiquette(
	    "$\begin{cases}x=cos\left(3t+\frac\pi5\right)\\[2mm]" &
	    "y=\sin\left(2t-\frac\pi3\right)\end{cases}$",1,(0.5,0.45));

    Fin;
    
    Etiquette.bot("\textsc{Courbe de Lissajous}",2,(5,0));
endfig;
end
