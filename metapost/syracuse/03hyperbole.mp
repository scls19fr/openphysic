input geometrie2d;
input courbes;
vardef fx(expr t) = ch(t) enddef;
vardef fy(expr t) = sh(t) enddef;

path courbe, asymptote;
courbe = Courbe(fx,fy,-3,3,40);
asymptote = (-10,-10)--(10,10);

beginfig(1);

    Repere(10,10,5,5,1,1);
    Axes;
    Debut;
	Unites(1);
	Graduations;

	trace courbe
	    withpen pencircle scaled 2
	    withcolor .6blue;
	trace courbe reflectedabout (origin,up)
	    withpen pencircle scaled 2
	    withcolor .6 blue;
	        
	trace asymptote
	    withpen pencircle scaled 1pt
	    withcolor .6*white;
	trace asymptote reflectedabout (origin,up)
	    withpen pencircle scaled 1pt
	    withcolor .6*white;

	Etiquette("$x^2-y^2=1$",2,(2,-4));
    Fin;

    Etiquette.bot("\fbox{\textit{Hyperbole}}",2,(5,0));
endfig;
end
