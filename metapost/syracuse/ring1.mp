% lsystem RING1.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : RING1.LS
% seed    F - F - F - F
% rule    F -> F F - F [ - F - F ] + F
% delta   90
% theta   0
% leng    3
% iter    4
% x       100
% y       180
% blue    1
% green   .3
% red     0
%% FIN du fichier

input tortue;

vardef trace(expr a,b) =
    draw a--b withpen pencircle scaled 1pt
              withcolor (0,.3,1);
enddef;

vardef deplace(expr a,b) =
enddef;

vardef F(expr n,m) =
   if m>0:
        F(n,m-1);
        F(n,m-1);
        tourne(n,-90);
        F(n,m-1);
        blop(n,n+1);
        tourne(n+1,-90);
        F(n+1,m-1);
        tourne(n+1,-90);
        F(n+1,m-1);
        tourne(n,90);
        F(n,m-1);
   else:
        avance(n,longueur,trace);
   fi
enddef;

vardef axiome(expr n,m) =
        F(n,m);
        tourne(n,-90);
        F(n,m);
        tourne(n,-90);
        F(n,m);
        tourne(n,-90);
        F(n,m);
enddef;

beginfig(1);
    longueur = 3 / ( 1 ** 4 );
    tortue(1,100,180,0,1);
    axiome(1,4);
endfig;
end
