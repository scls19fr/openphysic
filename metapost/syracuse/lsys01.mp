input tortue.mp; 
numeric e,h,d; 
color lacouleur;

def pas(expr x) = x * 4mm + 1.5mm enddef;
def epaisseur(expr x) = .2mm * x + .1mm enddef;
def couleur(expr x) = green enddef;
d := 20 ;
lacouleur := green;

vardef trace(expr a,b) = 
 draw a--b 
      withpen pencircle scaled e 
      withcolor lacouleur; 
enddef;

%% lsys1
%% règle A => GS[-A][+A]
vardef A (expr n,m) = 
 save h,e;
 h := pas(m);
 e := epaisseur(m);
 if m>0:
   avance(n,h,trace); 
   blop(n,n+1); 
   tourne(n+1,-1*d); 
   A(n+1,m-1); 
   blop(n,n+1); 
   tourne(n+1,d); 
   A(n+1,m-1);
 fi
enddef; 

beginfig(1);
tortue(1,0,0,90,1);  
A(1,8);
endfig;

end