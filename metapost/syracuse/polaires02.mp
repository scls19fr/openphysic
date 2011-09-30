input geometrie2d;
input courbes;
input plusa;

vardef f(expr t) = 1 + cos(t) enddef;

beginfig(1);
    
    Repere(12,9,5,4.5,3,3);
    Axes;
    Debut;
	Unites(1);
	Graduations;
	
	trace CourbeEnPolaires(f,-Pi,Pi,200)
	    withpen pencircle scaled 1.5
	    withcolor (0.18,0.55,0.34);

	paLegendeCCO((-1,-1.1),"$r=1+\cos\theta$");
    Fin;	    
    
endfig;
end

