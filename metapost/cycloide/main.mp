% ===== TeXmélu2 (25 septembre 2001 - JMS)
%http://193.55.139.7/syracuse/cgi-bin/texmelu2-mp.pl?fichier=/syracuse/metapost/courbes/courbes2/cycloide
input courbes;
% ======================================== fonctions
vardef fx(expr t) =
        t-sin(t)
enddef;
vardef fy(expr t) =
       1-cos(t)
enddef;
% ======================================== figure
beginfig(1);
verbatimtex 
%&latex 
\documentclass{article} 
\usepackage[latin1]{inputenc} 
\usepackage{times} 
\everymath{\displaystyle} 
\begin{document} 
etex 
 
 
 
repere(12cm,6cm,2cm,1cm,1.5cm,1.5cm); 
 
for i = 1 upto 20: 
 u := (i-1)/4; 
 draw fullcircle scaled (2*unite) shifted rpoint(u,1); 
 fill fullcircle scaled (2*unite) shifted rpoint(u,1) 
 withcolor (0.95-i/30)*white; 
 draw f(u) en_place withpen pencircle scaled 4pt withcolor blue; 
 draw ((u,1)--f(u)) en_place; 
endfor; 
 
trace.axes(0.5pt); 
marque.unites(1mm); 
 
trace.courbe(-3,10,100,1.5pt,.7red); 
 
decoupe.repere; 
etiquette.axes; 
etiquette.unites; 
 
 
label(btex \textit{La cycloïde} etex scaled 2,rpoint(4,2.3)); 
label(btex $x=t-\sin t\quad y=1-\cos t$ etex scaled 2,rpoint(4,-0.5));
endfig;
end
