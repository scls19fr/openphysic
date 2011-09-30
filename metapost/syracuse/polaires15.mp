input geometrie2d;
input courbes;
input plusa;

% La cochléoïde
vardef r(expr t) = sin(t)/t enddef;

% La dérivée du rayon polaire
vardef s(expr t) = cos(t)/t - sin(t)/(t*t) enddef;

% Un point de la courbe
vardef f(expr t) = r(t)*(cos(t),sin(t)) enddef;

% Un point de la tangente correspondante
vardef g(expr t) = (r(t)+s(t))*(cos(t),sin(t))+r(t)*(-sin(t),cos(t)) enddef;

gTRD := 20;

beginfig(1);

    Repere(12,9,6,4.5,5,5);
    Axes;
    Debut;
	Unites(1);
	Graduations;

	trace Droite(origin,f(2Pi/3)) withcolor (0.39,0.58,0.93);
	
	path c;
	c := (1,0) .. CourbeEnPolaires(r,0.1,5Pi,200);    
        trace c
	    withpen pencircle scaled 1.5
	    withcolor (0.18,0.55,0.34);

        trace c reflectedabout(origin,right)
	    withpen pencircle scaled 1.5
	    withcolor (0.18,0.55,0.34);
		
	paLegendeCCO((-0.75,0),"$r=\frac{\sin\,\theta}{\theta}$");
	
	% Les tangentes issues de points alignés avec l'origine sont
	% concourantes.
	for i = -9 step 3 until 9:
	    x := (2 + i) * Pi / 3;
	    trace Droite(f(x),g(x)) withcolor .6white;
	    pointe f(x);
	endfor;

	pointe origin;	
		
	pointe Intersection(Droite(f(2Pi/3),g(2Pi/3)),Droite(f(-Pi/3),g(-Pi/3)));
    Fin;
    
endfig;
end    
