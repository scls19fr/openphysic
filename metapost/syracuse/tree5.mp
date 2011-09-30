% lsystem TREE5.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : TREE5.LS
% #       Boom
%
% ratio   3
% seed    F
% rule    F -> [- F + F] [+ F - F ] F F F
% delta   40
% theta   90
% leng    425
% iter    4
% x       0
% y       -220
% blue    .7
% green   1
% red     0
%% FIN du fichier

input tortue;

vardef trace(expr a,b) =
    draw a--b withpen pencircle scaled 1pt
              withcolor (0,1,.7);
enddef;

vardef deplace(expr a,b) =
enddef;

vardef F(expr n,m) =
   if m>0:
        blop(n,n+1);
        tourne(n+1,-40);
        F(n+1,m-1);
        tourne(n+1,40);
        F(n+1,m-1);
        blop(n,n+1);
        tourne(n+1,40);
        F(n+1,m-1);
        tourne(n+1,-40);
        F(n+1,m-1);
        F(n,m-1);
        F(n,m-1);
        F(n,m-1);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef axiome(expr n,m) =
        F(n,m);
enddef;

beginfig(1);
    longueur = 425 / ( 3 ** 4 );
    tortue(1,0,-220,90,1);
    axiome(1,4);
endfig;
end
