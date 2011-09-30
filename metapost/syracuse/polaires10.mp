input geometrie2d;
input courbes;
input plusa;

vardef r(expr t) = 1+sin(3t) enddef;

beginfig(1);

    Repere(12,9,6,4.5,2,2);
    Axes;
    Debut;
	Unites(1);
	Graduations;
	
	trace CourbeEnPolaires(r,0,6Pi,400)
	    withpen pencircle scaled 1.5
	    withcolor (0.18,0.55,0.34);
	    
	paLegendeCCO((1.75,-1),"$r=1+\sin\,3\theta$");

    Fin;
endfig;

end