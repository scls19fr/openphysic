input geometrie2d;
input courbes;

vardef fx(expr t) = t enddef;
vardef fy(expr t) = (t-5)*sin(t)-cos(t)+2 enddef;
vardef f(expr t) = (fx(t),fy(t)) enddef;
vardef py(expr t) = (0,fy(t)) -- f(t) enddef;
vardef px(expr t) = f(t) -- (fx(t),0) enddef;
color aubergine;
aubergine = (37/256,2/256,29/256);


beginfig(1);

    a = 1;
    b = 7;
    n = 24;
    h = (b-a)/n;
    
    path courbe;
    courbe = Courbe(fx,fy,a,b,150);

    Repere(10,10,2,3,1,1);
    Axes;
    Debut;
    
	remplis (a,0)--courbe--(b,0)--cycle
	    withcolor .7red;
	    

	for i=1 upto n:
	    path cc;
	    aa := a + (i-1) * h;
	    bb := aa + h;
	    ff := fy(aa + h/2);
	    cc := (aa,0)--(aa,ff)--(bb,ff)--(bb,0)--cycle;
	    remplis cc 
		withcolor 0.8white;
	    trace cc;
	endfor;


	trace courbe
	    withpen pencircle scaled 2
	    withcolor aubergine;


	Etiquette.bot("$x_{i-1}$",1,(a+n/2*h,0));
	Etiquette.bot("$x_{0}$",1,(a,0));
	Etiquette.bot("$x_{n}$",1,(b,0));
	Etiquette.ulft("$a$",1.25,(a,0));
	Etiquette.urt("$b$",1.25,(b,0));
	Etiquette.top("$y=f(x)$",1.25,f(b));
	Etiquette.bot("$x_{i}$",1,(a+n/2*h+h,0));

	trace py(a+(n+1)/2*h)--px(a+(n+1)/2*h)
	    dashed evenly
	    withcolor (0.9,0.7,0.3);

	Etiquette.lft("$f(\xi_i)$",1,(0,fy(a+(n+1)/2*h)));
	Etiquette.bot("$\xi_i$",1,(a+(n+1)/2*h,-0.4));
	
	drawarrow ((a+(n+1)/2*h,-0.4)--(a+(n+1)/2*h,-0.1))
	    gENPLACE;
	    
	Etiquette("\textit{Sommes de Riemann}",2,(4,5));
	Etiquette("$S = \sum_{i=1}^n f(\xi_i)(x_i - x_{i-1})$",1.5,(5,-2));

    Fin;
endfig;
end
