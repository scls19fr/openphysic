% lsystem SNOW2.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : SNOW2.LS
% #       Sneeuwvlok
%
% ratio   3
% seed    [F] + [F] + [F] + [F] + [F] + [F]
% rule    F -> FF [+FF] [-FF] F
% delta   60
% theta   0
% leng    160
% iter    4
% x       0
% y       0
% blue    1
% green   1
% red     0
%% FIN du fichier

input tortue;

vardef trace(expr a,b) =
    draw a--b withpen pencircle scaled 1pt
              withcolor (0,1,1);
enddef;

vardef deplace(expr a,b) =
enddef;

vardef F(expr n,m) =
   if m>0:
        F(n,m-1);
        F(n,m-1);
        blop(n,n+1);
        tourne(n+1,60);
        F(n+1,m-1);
        F(n+1,m-1);
        blop(n,n+1);
        tourne(n+1,-60);
        F(n+1,m-1);
        F(n+1,m-1);
        F(n,m-1);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef axiome(expr n,m) =
        blop(n,n+1);
        F(n+1,m);
        tourne(n,60);
        blop(n,n+1);
        F(n+1,m);
        tourne(n,60);
        blop(n,n+1);
        F(n+1,m);
        tourne(n,60);
        blop(n,n+1);
        F(n+1,m);
        tourne(n,60);
        blop(n,n+1);
        F(n+1,m);
        tourne(n,60);
        blop(n,n+1);
        F(n+1,m);
enddef;

beginfig(1);
    longueur = 160 / ( 3 ** 4 );
    tortue(1,0,0,0,1);
    axiome(1,4);
endfig;
end
