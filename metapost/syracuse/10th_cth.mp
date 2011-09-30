input geometrie2d;
input courbes;

def lignes(expr x,p,y,a,s) text t =
    save i;
    for i:=x step p until y:
	trace (((down--up) scaled s shifted (i,0)) rotated a ) t;
    endfor
enddef;

vardef coth(expr t) = 1/th(t) enddef;

beginfig(1);

    Repere(10,15,5,7.5,1.5,1.5);
    Axes;
    Debut;
	
	lignes(-4,0.1,4,0,10)
	    withpen pencircle scaled .5
	    withcolor .9white;
	lignes(-5,0.1,5,90,10)
	    withpen pencircle scaled .5
	    withcolor .9white;
	lignes(-4,1,4,0,10)
	    withpen pencircle scaled .5
	    withcolor .7white;
	lignes(-5,1,5,90,10)
	    withpen pencircle scaled .5
	    withcolor .7white;

	Unites(1);
	Graduations;
	Axes;	    

	trace Representation(th,-4,4,50)
	    withpen pencircle scaled 1.5pt
	    withcolor 0.3blue;
	    
	trace Representation(coth,-4,-0.05,50)
	    withpen pencircle scaled 1.5pt
	    withcolor 0.4green;

	trace Representation(coth,0.05,4,50)
	    withpen pencircle scaled 1.5pt
	    withcolor 0.4green;
	
	trace (-4,1)--(4,1)
	    withcolor .7red;
	trace (-4,-1)--(4,-1)
	    withcolor .7red;
	
	Etiquette("$y=\mathrm{th} x$",2,(-2,-0.5));
	Etiquette("$y=\frac1{\mathrm{th} x}$",2,(-2,-3.5));	    
	
    Fin;
endfig;

end

