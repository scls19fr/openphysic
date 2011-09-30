input geometrie2d;
input courbes;
input plusa;

vardef r(expr t) = 1 + cos(t/2) enddef;

beginfig(1);

    Repere(12,9,4,4.5,2,2);
    Axes;
    Debut;
	Unites(1);
	Graduations;
	
	trace CourbeEnPolaires(r,-Pi,3Pi,200)
	    withpen pencircle scaled 1.5
	    withcolor (0.18,0.55,0.34);
	    
	paLegendeCCO((2.75,-1.75),"$r=1+\cos\frac\theta2$");
	
    Fin;
    
endfig;
end

