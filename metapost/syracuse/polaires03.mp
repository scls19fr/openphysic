input geometrie2d;
input courbes;
input plusa;

vardef f(expr t) = sqrt(cos(2*t)) enddef;

beginfig(1);
    
    Repere(12,9,6,4.5,4,4);
    Axes;
    Debut;
	Unites(1);
	Graduations;
	
	trace 
	    CourbeEnPolaires(f,-0.7853,0.7853,100) ..
	    reverse CourbeEnPolaires(f,2.3562,3.9269,100) ..
	    cycle
	    withpen pencircle scaled 1.5
	    withcolor (0.18,0.55,0.34);

	    
	paLegendeCCO((1,1),"$r^2=\cos\,2\theta$");

    Fin;

endfig;

end