input geometrie2d;
input courbes;
input plusa;

vardef r(expr t) = 1 / (cos(t)+sin(2t) ) enddef;

beginfig(1);

    Repere(12,9,6,4.5,1.3,1.3);
    Axes;
    Debut;
	Unites(1);
	Graduations;
	
	drawoptions(withpen pencircle scaled 1 withcolor (0.39,0.58,0.93));
	trace Droite((4/3,0),(4/3-sqrt(3),1));
	trace Droite((4/3,0),(4/3+sqrt(3),1));
	trace Droite((1/3,0),(1/3,1));
	trace Droite((-1,0),(-1,1));    

	drawoptions(withpen pencircle scaled 1.5 withcolor(0.18,0.55,0.34));
	trace CourbeEnPolaires(r,-Pi/6+0.1,Pi/2-0.09,150);
	trace CourbeEnPolaires(r,Pi/2+0.09,7Pi/6-0.1,150);
	trace CourbeEnPolaires(r,7Pi/6+0.1,3Pi/2-0.1,150);
	trace CourbeEnPolaires(r,3Pi/2+0.1,11Pi/6-0.1,150);
	
	drawoptions();
	paLegendeCCO((-2.3,0),"$r=\frac1{\cos\,\theta+\sin\,2\theta}$");
        
	Etiquette.rt("Asymptotes obliques: $x\pm \sqrt3 y = \frac43$",0.9,(1/3,2.5));
	Etiquette.rt("Asymptotes verticales: $x=-1$ et $x=\frac13$",0.9,(1/3,3));
    Fin;
    
endfig;
end
