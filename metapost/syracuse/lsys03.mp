input tortue.mp; 
numeric d,iter; 
d = 10 ;
iter = 15;
color marron;
marron = (.5,.1,0);
 

def pas(expr x) = x * 0.18mm + .1mm enddef;
def epaisseur(expr x) = .1 * x + .5mm enddef;
def couleur(expr x) = (x/iter)[green,marron] enddef;

vardef trace(expr a,b) = 
 draw a--b 
      withpen pencircle scaled e
      withcolor c; 
enddef; 

%% lsys3
%% règle A => GS[-A][+B]
%% règle G => GS
%% règle B => C
%% règle C => A
 
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
   A(n+1,m-1); 
   blop(n,n+1); 
   tourne(n+1,d); 
   B(n+1,m-1); 
 fi 
enddef; 
 
vardef G (expr n,m) = 
 save h,e;
 h := pas(iter-mm);
 e := epaisseur(iter-m);
 if m>0: 
   G(n,m-1); 
   avance(n,h,trace); 
 fi 
enddef; 
 
vardef B (expr n,m) = 
 if m>0: C(n,m-1); fi 
enddef; 
 
vardef C (expr n,m) = 
 if m>0: A(n,m-1); fi 
enddef; 

beginfig(1);
tortue(1,0,0,90,1); 
A(1,15);
endfig;

end