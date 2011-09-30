input geometrie2d;
input courbes;

vardef fx(expr t) = sin(t) enddef;
vardef fy(expr t) = 2*(cos(t)**2)/(2-cos(t)) enddef;

color aubergine;
aubergine = (37/256,2/256,29/256);

path courbe;
courbe = Courbe(fx,fy,-Pi,Pi,200);

beginfig(1);

    Repere(10,10,5,2,3.5,3.5);
    Axes;
    Debut;
	remplis courbe..cycle
	    withcolor .8white;

	trace courbe
	    withpen pencircle scaled 2pt
	    withcolor aubergine;

    Fin;
    Etiquette.top("\textit{Le bicorne}",2,(7.5,0));
    Etiquette.top(
	"$\begin{cases}x=\sin(t)\\y=2\cos^2(t)\left(2-\cos(t)\right)\end{cases}$",
	1.5,(2.5,0));

endfig;
end

end
