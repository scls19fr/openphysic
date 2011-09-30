input geometrie2d;
input courbes;
input reperes;

vardef fx(expr t) = (t**2)/(1+t**2) enddef;
vardef fy(expr t) = (t**3)/(1+t**2) enddef;

beginfig(1);

    Repere(7,15,1,7.5,2.5,2.5);
    Axes;
    Debut; 
 
	path p,q,r,s; 
	p = Courbe(fx,fy,0.5,5,50);
	s = Courbe(fx,fy,-5,0.5,60); 
	q = (-0.1,-0.15)--(10,15); 
	r = fullcircle shifted (0.5,0); 
	z0 = q intersectionpoint r; 
	z1 = p intersectionpoint q; 
	z2 = q intersectionpoint ((1,-3)--(1,3)); 
 
	O = Point(0,0);
	A = Point_(z0);
	B = Point_(z1);
	C = Point_(z2);

	trace (1,-3)--(1,3) 
	    withcolor 0.5white; 
 
	trace r 
	    withcolor 0.5white; 
	trace Droite(A,B) 
	    withcolor 0.5white; 
 
	trace s..p 
	    withcolor green withpen pencircle scaled 1pt; 
	
	marque.ulft "O";
	marque.ulft "A";
	marque.ulft "B";
	marque.lrt  "C";
	
	Etiquette(
	    "$\begin{cases}x=\frac{t^2}{1+t^2}\\[2mm]y=\frac{t^3}{1+t^2}\end{cases}$",
	    1.5,
	    (1.8,-1)
	    );
    Fin;
    
    Etiquette("\it Cissoïde de Dioclès",2,(3.5,1.5));
endfig;
end
