% lsystem FLOWER2.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : FLOWER2.LS
% ratio   2
% ignore  X
% seed    X
% rule    X -> F-[[X]+X]+F[+FX]-X
% rule    F -> FF
% delta   22.5
% theta   90
% leng    180
% iter    6
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
        tourne(n,-22.5);
        blop(n,n+1);
        blop(n+1,n+2);
        X(n+2,m-1);
        tourne(n+1,22.5);
        X(n+1,m-1);
        tourne(n,22.5);
        F(n,m-1);
        blop(n,n+1);
        tourne(n+1,22.5);
        F(n+1,m-1);
        X(n+1,m-1);
        tourne(n,-22.5);
        X(n,m-1);
   fi
enddef;

vardef axiome(expr n,m) =
        X(n,m);
enddef;

beginfig(1);
    longueur = 180 / ( 2 ** 6 );
    tortue(1,0,-235,90,1);
    axiome(1,6);
endfig;
end
