% lsystem FLOWER4.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : FLOWER4.LS
% ratio   1
% ignore  X
% seed    X
% rule    X -> F [+ X] - X
% rule    F -> f F
% rule    f -> f
% leng    10
% delta   25
% x       0
% y       -230
% theta   90
% iter    9
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
        f(n,m-1);
        F(n,m-1);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef X(expr n,m) =
   if m>0:
        F(n,m-1);
        blop(n,n+1);
        tourne(n+1,25);
        X(n+1,m-1);
        tourne(n,-25);
        X(n,m-1);
   fi
enddef;

vardef f(expr n,m) =
   if m>0:
        f(n,m-1);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef axiome(expr n,m) =
        X(n,m);
enddef;

beginfig(1);
    longueur = 10 / ( 1 ** 9 );
    tortue(1,0,-230,90,1);
    axiome(1,9);
endfig;
end
