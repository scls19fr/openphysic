% lsystem FLOWER3.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : FLOWER3.LS
% ratio   2
% ignore  X
% seed    X
% rule    X -> F[+X][-X]FX
% rule    F -> FF
% delta   25.7
% theta   90
% leng    235
% iter    7
% x       0
% y       -235
% blue    0
% green   1
% red     .7
%% FIN du fichier

input tortue;

vardef trace(expr a,b) =
    draw a--b withpen pencircle scaled 1pt
              withcolor (.7,1,0);
enddef;

vardef deplace(expr a,b) =
enddef;

vardef F(expr n,m) =
   if m>0:
        F(n,m-1);
        F(n,m-1);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef X(expr n,m) =
   if m>0:
        F(n,m-1);
        blop(n,n+1);
        tourne(n+1,25.7);
        X(n+1,m-1);
        blop(n,n+1);
        tourne(n+1,-25.7);
        X(n+1,m-1);
        F(n,m-1);
        X(n,m-1);
   fi
enddef;

vardef axiome(expr n,m) =
        X(n,m);
enddef;

beginfig(1);
    longueur = 235 / ( 2 ** 7 );
    tortue(1,0,-235,90,1);
    axiome(1,7);
endfig;
end
