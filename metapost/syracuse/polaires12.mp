input geometrie2d;
input courbes;
input plusa;

vardef r(expr t) = cos(2t)+cos(t)*cos(t) enddef;

beginfig(1);

    Repere(12,9,6,4.5,2.5,2.5);
    Axes;
    Debut;
	Unites(1);
	Graduations;
	
        trace CourbeEnPolaires(r,-Pi,Pi,300)
	    withpen pencircle scaled 1.5
	    withcolor (0.18,0.55,0.34);
		
	paLegendeCCO((1.25,-1.25),"$r=\cos\,2\theta + \cos^2\theta$");
	
    Fin;
    
endfig;
end    
