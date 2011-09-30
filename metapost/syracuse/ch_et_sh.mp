input geometrie2d;
input courbes;
input reperes;

beginfig(1);
    
    Repere(10,10,5,5,2,2); 
    Axes;
    Debut;
	Graduations;
	Unites(1);
	% Tracé des courbes 
	trace Representation(sh,-3,3,50) 
	    withpen pencircle scaled 1.5pt 
	    withcolor 0.5[green,red]; 
	trace Representation(ch,-3,3,50)
	    withpen pencircle scaled 1.5pt 
	    withcolor 0.5[green,red]; 
	
	Etiquette("$y=\hbox{ch }x$",1.5,(-1.5,1));
	Etiquette("$y=\hbox{sh }x$",1.5,(-1.5,-1));
	O = Point(0,0);
	marque.ulft "O"; 
    Fin; 
    
    Etiquette(
	"\begin{minipage}{4cm}\begin{center}\it cosinus et sinus\\ hyperboliques\end{center}\end{minipage}",2,(5,-0.7)); 
	    
endfig;
end