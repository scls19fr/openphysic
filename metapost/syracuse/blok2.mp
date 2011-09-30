% lsystem BLOK2.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : BLOK2.LS
% #    ÚÄÄÄÂÄ¿
% #    ÃÄÂÄ´ ³
% #    ³ ÃÄÁÄ´
% #    ÀÄÁÄÄÄÙ
%
% ratio   3
% seed    F - F - F - F
% rule    F -> F F [- F F + + F F] F
% delta   90
% theta   90
% leng    470
% iter    4
% x       -235
% y       -235
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
        blop(n,n+1);
        tourne(n+1,-90);
        F(n+1,m-1);
        F(n+1,m-1);
        tourne(n+1,90);
        tourne(n+1,90);
        F(n+1,m-1);
        F(n+1,m-1);
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
    longueur = 470 / ( 3 ** 4 );
    tortue(1,-235,-235,90,1);
    axiome(1,4);
endfig;
end
