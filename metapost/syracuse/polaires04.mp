input geometrie2d;
input courbes;
input plusa;

vardef r(expr t) = cos(t/2)/(1+sin(t)) enddef;

beginfig(1);

    Repere(12,9,6,4.5,3,3);
    Axes;
    Debut;
	Unites(1);
	Graduations;

	drawoptions(withpen pencircle scaled 1.5 withcolor (0.18,0.55,0.34));	
	trace CourbeEnPolaires(r,-Pi/2+0.1,3Pi/2-0.1,50);
	trace CourbeEnPolaires(r,3Pi/2+0.1,7Pi/2-0.1,50);
	
	drawoptions();
	paLegendeCCO((1,-1),"$r=\frac{\cos\frac\theta2}{1+\sin\,\theta}$");
    Fin;

endfig;
end
    
