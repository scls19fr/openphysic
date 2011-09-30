input tortue.mp; 
numeric d,iter; 
d = 6 ;
iter = 8;
color marron;
marron = (.5,.1,0);
 

def pas(expr x) = x * 1mm + .5mm enddef;
def epaisseur(expr x) = .3mm * x + .1mm enddef;
def couleur(expr x) = (x/iter)[green,marron] enddef;

vardef trace(expr a,b) = 
 draw a--b 
      withpen pencircle scaled e
      withcolor c; 
enddef; 
 
%% lsys9
%% règle A => GS[---fMA][++++B] 
%% règle B => C
%% règle C => GS[-fB][++A][++++A] 
%% règle f => ' ' % seulement exécutée au terme
%% règle G => HS 
%% règle H => HSS 
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
   tourne(n+1,-3*d); 
   f(n+1,m-1); 
   retourne(n+1); 
   A(n+1,m-1); 
   blop(n,n+1); 
   tourne(n+1,4*d); 
   B(n+1,m-1); 
 fi 
enddef; 
 
vardef B (expr n,m) = 
 if m>0: 
   C(n,m-1); 
 fi 
enddef; 
 
vardef C (expr n,m) = 
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
   B(n+1,m-1); 
   blop(n,n+1); 
   tourne(n+1,2*d); 
   A(n+1,m-1); 
   blop(n,n+1); 
   tourne(n+1,4*d); 
   A(n+1,m-1); 
 fi 
enddef; 
 
vardef G (expr n,m) = 
 save h,e,c;
 color c;
 h := pas(iter-n);
 e := epaisseur(iter-n);
 c := couleur(iter-n);
 if m>0: 
   H(n,m-1); 
   avance(n,h,trace); 
 fi 
enddef; 
 
vardef H (expr n,m) = 
 save h,e,c;
 color c;
 h := pas(iter-n);
 e := epaisseur(iter-n);
 c := couleur(iter-n);
 if m>0: 
   H(n,m-1); 
   avance(n,h,trace); 
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