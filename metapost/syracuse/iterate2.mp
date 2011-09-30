% lsystem ITERATE2.LS -- Thu Feb 13 00:54:56 CET 2003
%% Fichier de paramètres : ITERATE2.LS
% #
%
% ratio   2
% ignore  X
% seed    [X] ++++ [X] ++++ [X]
% rule    X ->  [+ F X] [- F X]
% rule    F -> F F
% leng    256
% delta   30
% x       0
% y       0
% theta   90
% iter    8
% blue    .7
% green   .7
% red     .7
%% FIN du fichier

input tortue;

vardef trace(expr a,b) =
    draw a--b withpen pencircle scaled 1pt
              withcolor (.7,.7,.7);
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
        blop(n,n+1);
        tourne(n+1,30);
        F(n+1,m-1);
        X(n+1,m-1);
        blop(n,n+1);
        tourne(n+1,-30);
        F(n+1,m-1);
        X(n+1,m-1);
   fi
enddef;

vardef axiome(expr n,m) =
        blop(n,n+1);
        X(n+1,m);
        tourne(n,30);
        tourne(n,30);
        tourne(n,30);
        tourne(n,30);
        blop(n,n+1);
        X(n+1,m);
        tourne(n,30);
        tourne(n,30);
        tourne(n,30);
        tourne(n,30);
        blop(n,n+1);
        X(n+1,m);
enddef;

beginfig(1);
    longueur = 256 / ( 2 ** 8 );
    tortue(1,0,0,90,1);
    axiome(1,8);
endfig;
end
