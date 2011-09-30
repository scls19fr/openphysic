% lsystem BLOK3.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : BLOK3.LS
% seed    F - F - F - F
% rule    F -> F F - F + F - F - F F
% delta   90
% theta   0
% leng    15
% iter    3
% x       100
% y       -50
% blue    0
% green   0
% red     1
%% FIN du fichier

input tortue;

vardef trace(expr a,b) =
    draw a--b withpen pencircle scaled 1pt
              withcolor (1,0,0);
enddef;

vardef deplace(expr a,b) =
enddef;

vardef F(expr n,m) =
   if m>0:
        F(n,m-1);
        F(n,m-1);
        tourne(n,-90);
        F(n,m-1);
        tourne(n,90);
        F(n,m-1);
        tourne(n,-90);
        F(n,m-1);
        tourne(n,-90);
        F(n,m-1);
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
    longueur = 15;
    tortue(1,100,-50,0,1);
    axiome(1,3);
endfig;
end
