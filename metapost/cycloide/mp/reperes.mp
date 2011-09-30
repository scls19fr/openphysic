picture rSAVEPICT;

def Repere(expr l,h,ox,oy,ux,uy) =
    def gENPLACE = xscaled ux yscaled uy shifted (ox,oy) scaled gU enddef;
    rLARGEUR := l; rHAUTEUR = h;
    rXMIN := - ox / ux; rXMAX := rXMIN + l / ux;
    rYMIN := - oy / uy; rYMAX := rYMIN + h / uy;
    rUX := ux; rUY := uy;
enddef;

def Debut =
    rSAVEPICT := currentpicture; currentpicture := nullpicture;
enddef;

def Fin =
    clip currentpicture to 
	( (0,0)--(rLARGEUR,0)--(rLARGEUR,rHAUTEUR)--(0,rHAUTEUR)--cycle)
	  scaled gU;
    addto rSAVEPICT also currentpicture;
    currentpicture := rSAVEPICT;	  
    def gENPLACE = scaled gU enddef;	
enddef;

def Axes =
    drawarrow ((rXMIN,0)--(rXMAX,0)) gENPLACE;
    drawarrow ((0,rYMIN)--(0,rYMAX)) gENPLACE;
    label.lrt(TEX("$x$"),(rXMAX,0) gENPLACE);
    label.ulft(TEX("$y$"),(0,rYMAX) gENPLACE);
enddef;

vardef Graduations  =
    xmin = floor(rXMIN); xmax = floor(rXMAX) + 1;
    ymin = floor(rYMIN); ymax = floor(rYMAX) + 1;
    SequenceTirets((xmin,0),(1,0),(0,-4),xmax-xmin+1);
    SequenceTirets((xmin+0.5,0),(1,0),(0,-2),xmax-xmin);
    SequenceTirets((0,ymin),(0,1),(-4,0),ymax-ymin+1);
    SequenceTirets((0,ymin+0.5),(0,1),(-2,0),ymax-ymin);
enddef;

%
% SequenceTirets
% ------------------------------------------------------------------------------
vardef SequenceTirets(expr o,p,t,n) text a=
    save ot; pair ot; ot := o gENPLACE;
    for i:=1 upto n:
	% tiret
	draw ot -- (ot shifted t) a;
	% avancement
	ot := (o + i*p) gENPLACE; 
    endfor
enddef;

vardef Unites(expr t) =
    if t=1:
	label.bot(TEX("$+1$"),(1,-(3/gU/rUY)) gENPLACE);
	label.ulft(TEX("$+1$"),(-(3/gU/rUX),1) gENPLACE);
    fi  
enddef;


endinput