input geometrie2d;
input courbes;
input plusa;

vardef r(expr t) = ln(t) enddef;

beginfig(1);

    Repere(12,9,6,4.5,1.2,1.2);
    Axes;
    Debut;
	Unites(1);
	Graduations;
	
	trace CourbeEnPolaires(r,0.005,30,400)
	    withpen pencircle scaled 1.5
	    withcolor (0.18,0.55,0.34);
	    
	paLegendeCCO((3.5,-3),"$r=\ln\,\theta$");
	
    Fin;
    
endfig;
end

