% lsystem FILL2.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : FILL2.LS
% #       fill
%
% seed    F-F-F-F
% rule    F -> F-FF--F-F
% leng    4
% delta   90
% x       0
% y       148
% theta   90
% iter    5
% blue    .8
% green   0
% red     .7
%% FIN du fichier

input tortue;

vardef trace(expr a,b) =
    draw a--b withpen pencircle scaled 1pt
              withcolor (.7,0,.8);
enddef;

vardef deplace(expr a,b) =
enddef;

vardef F(expr n,m) =
   if m>0:
        F(n,m-1);
        tourne(n,-90);
        F(n,m-1);
        F(n,m-1);
        tourne(n,-90);
        tourne(n,-90);
        F(n,m-1);
        tourne(n,-90);
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
    longueur = 4 / ( 1 ** 5 );
    tortue(1,0,148,90,1);
    axiome(1,5);
endfig;
end
