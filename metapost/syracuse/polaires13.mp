input geometrie2d;
input courbes;
input plusa;

vardef r(expr t) = tan(t/2) - 1 enddef;

beginfig(1);

    Repere(12,9,7,3,1,1);
    Axes;
    Debut;
	Unites(1);
	Graduations;
	
	trace Droite((-2,2),(2,2))
	    withpen pencircle scaled 1
	    withcolor (0.39,0.58,0.93);
	    
        trace CourbeEnPolaires(r,-Pi+0.1,Pi-0.1,200)
	    withpen pencircle scaled 1.5
	    withcolor (0.18,0.55,0.34);
		
	paLegendeCCO((-3.5,3.5),"$r=\tan\frac\theta2 - 1$");
	
    Fin;
    
endfig;
end    
