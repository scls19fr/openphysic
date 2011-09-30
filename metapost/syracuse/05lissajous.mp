input geometrie2d;
input courbes;

vardef fx(expr t) = cos(3*t+Pi/5) enddef;
vardef fy(expr t) = sin(2*t-Pi/3) enddef;

path courbe;
courbe = Courbe(fx,fy,-Pi,Pi,200);

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
	    
	remplis courbe--cycle
	    withcolor .8white;
	    
	trace courbe
	    withpen pencircle scaled 2
	    withcolor avocat;

    Fin;
endfig;
end
