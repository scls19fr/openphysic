input geometrie2d;
input courbes;
input plusa;

vardef r(expr t) = 1 + 2*cos(t) enddef;

beginfig(1);

    Repere(12,9,4,4.5,2,2);
    Axes;
    Debut;
	Unites(1);
	Graduations;
	
	trace CourbeEnPolaires(r,-Pi,Pi,100)
	    withpen pencircle scaled 1.5
	    withcolor (0.18,0.55,0.34);
	    
	paLegendeCCO((3,2),"$r=1+2\cos\,\theta$");
    
    Fin;

endfig;
end
