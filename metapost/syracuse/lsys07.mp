input tortue.mp; 
numeric d,iter; 
d = 20 ;
iter = 8;
color marron;
marron = (.5,.1,0);
 

def pas(expr x) = x * 1.4mm + .5mm enddef;
def epaisseur(expr x) = .3mm * x + .1mm enddef;
def couleur(expr x) = (x/iter)[green,marron] enddef;

vardef trace(expr a,b) = 
 draw a--b 
      withpen pencircle scaled e
      withcolor c; 
enddef; 
 
%% lsys7
%% règle A => GS[-fA][+fA] 
%% règle G => GS 
%% règle f => ' ' % seulement exécutée au terme
vardef A (expr n,m) = 
 save h,e,c;
 color c;
 h := pas(m);
 e := epaisseur(m);
 c := couleur(m);
 if m>0: 
   G(n,m-1); 
   avance(n,h,trace); 
   blop(n,n+1); 
   tourne(n+1,-1*d); 
   f(n+1,m-1); 
   A(n+1,m-1); 
   blop(n,n+1); 
   tourne(n+1,d); 
   f(n+1,m-1); 
   A(n+1,m-1); 
 fi 
enddef; 
 
vardef G (expr n,m) = 
 save h;
 h := pas(m);
 if m>0: 
   G(n,m-1); 
   avance(n,h,trace); 
 fi 
enddef; 
 
vardef f (expr n,m) = 
 if m=0: 
   fill (fullcircle scaled 3mm) shifted tortue_xy[n] withcolor .5[red,white]; 
   draw (fullcircle scaled 3mm) shifted tortue_xy[n] withcolor red; 
 fi 
enddef; 

beginfig(1); 
tortue(1,0,0,90,1); 
A(1,iter);
endfig;

end