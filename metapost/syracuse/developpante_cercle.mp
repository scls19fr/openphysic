input geometrie2d;
input courbes;

vardef fx(expr t) = cos(t)+t*sin(t) enddef;
vardef fy(expr t) = sin(t)-t*cos(t) enddef;
vardef seg(expr t) = (cos(t),sin(t))--(fx(t),fy(t)) enddef;

beginfig(1);
    Repere(12,10,8,3,2,2); 
    Axes;
    Debut;
	Graduations;
	Unites(1); 
	
	trace fullcircle scaled 2
	    withpen pencircle scaled 1.5
	    withcolor 0.3white; 
 
	% Tracé d'une développante 
	trace Courbe(fx,fy,0,1.5*Pi,70)
	    withpen pencircle scaled 1.5 
	    withcolor 0.1[green,red]; 
 
	% Tracé des rayons 
	for i = 1 upto 9: 
	    trace seg(Pi*i/7)
	    	withcolor 0.3white; 
	endfor;
	
	Etiquette(
	    "$\begin{cases}x=\cos t+t\sin t\\[1mm]y=\sin t - t\cos t\end{cases}$",
	     1.5,(-2,-1));
 
    Fin;
    
    Etiquette("\it Développante de cercle",2,(6,-0.6));
endfig;
end