input geometrie2d;
input courbes;
input plusa;

vardef r(expr t) = sin(t)/(sin(t)+cos(t)) enddef;

a := sqrt(2)/2;

beginfig(1);

    Repere(12,9,7,4.5,1.5,1.5);
    Axes;
    Debut;
	Unites(1);
	Graduations;
	
	    drawoptions(withpen pencircle scaled 1 withcolor (0.39,0.58,0.93));
	    trace Droite(Point(0,a),Point(1,a-1));
	    trace Droite(Point(0,-a),Point(1,-a-1));
	    
	    drawoptions(withpen pencircle scaled 1.5 withcolor(0.18,0.55,0.34));
	    trace CourbeEnPolaires(r,-Pi/4+0.09,3Pi/4-0.09,150);
	    trace CourbeEnPolaires(r,3Pi/4+0.09,7Pi/4-0.09,150);

	    drawoptions();
	    	    
	    paLegendeCCO((-2.5,-2),
		"$r=\frac{\sin\,\theta}{\cos\,\theta+\sin\,\theta}$");

	    Etiquette.urt("$y=-x+\frac{\sqrt2}2$",1,(a,0));
	    Etiquette.llft("$y=-x-\frac{\sqrt2}2$",1,(-a-1,1));

    Fin;

endfig;
end
