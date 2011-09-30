input geometrie2d;
input courbes;
input plusa;

vardef r(expr t) = sin(t) enddef;

beginfig(1);

    Repere(12,9,6,1,4,4);
    Axes;
    Debut;
	Unites(1);
	Graduations;
	
	trace CourbeEnPolaires(r,-Pi,Pi,50)-- cycle
	    withpen pencircle scaled 1.5
	    withcolor (0.18,0.55,0.34);
	    
	paLegendeCCO((1,1.5),"$r=\sin\,\theta$");
	    
    Fin;

endfig;
end

