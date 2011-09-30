input geometrie2d;
input courbes;
input plusa;

vardef r(expr t) = cos(2t)/cos(t) enddef;

beginfig(1);

    Repere(12,9,8,4.5,2,2);
    Axes;
    Debut;
	Unites(1);
	Graduations;
	
	trace Droite((-1,2),(-1,-2))
	    withpen pencircle scaled 1
	    withcolor (0.39,0.58,0.93);
	    
        trace CourbeEnPolaires(r,-Pi/2+0.1,Pi/2-0.1,200)
	    withpen pencircle scaled 1.5
	    withcolor (0.18,0.55,0.34);
		
	paLegendeCCO((-3,0),"$r=\frac{\cos\,2\theta}{\cos\,\theta}$");
	
    Fin;
    
endfig;
end    
