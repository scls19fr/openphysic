input labels;

string ogT[];
numeric ogTA[], ogTB[], ogTC[], ogTD[], ogTE[], ogTF[];
numeric ogt, gTRD, gU, gPR;

% ogt est le compteur des objets graphiques créés.
ogt := 0;

% Paramètre utilisé pour le tracé des droites. Il fixe la longueur du segment
% tracé en fonction de la longueur du bipoint qui définit la droite.
gTRD := 5;

% gU est l'unité de base, ici le cm.
gU := 1cm;

% gENPLACE est la transformation qui place les objets ... en premier.
string gENPLACEs;
gENPLACEs = "scaled gU";
def gENPLACE = scantokens gENPLACEs enddef;

% diamètre des cercles marquant les points
gPR := 2;

% Point -----------------------------------------------------------------------
vardef Point (expr a,b) =
    ogT[incr ogt] = "point";
    ogTA[ogt] = a; ogTB[ogt] = b; 
    ogt
enddef;

% Vecteur ---------------------------------------------------------------------
vardef Vecteur (expr a,b) =
    ogT[incr ogt] = "vecteur";
    ogTA[ogt] = a; ogTB[ogt] = b; 
    ogt
enddef;

% Droite ----------------------------------------------------------------------
vardef Droite (expr a,b) =
    save n; n = incr ogt;
    ogT[n] = "droite";
    ogTA[n] = if pair a: Point(xpart a,ypart a) else: a fi;
    ogTB[n] = if pair b: Point(xpart b,ypart b) else: b fi;  
    n
enddef;

% Segment ---------------------------------------------------------------------
vardef Segment (expr a,b) =
    ogT[incr ogt] = "segment";
    ogTA[ogt] = a; ogTB[ogt] = b; 
    ogt
enddef;

% Triangle --------------------------------------------------------------------
vardef Triangle (expr a,b,c) =
    ogT[incr ogt] = "triangle";
    ogTA[ogt] = a; ogTB[ogt] = b; ogTC[ogt] = c;
    ogt
enddef;

% Cercle ----------------------------------------------------------------------
vardef Cercle (expr a,b) =
    save n; n = incr ogt;
    ogT[n] = "cercle"; ogTB[n] = b;
    ogTA[n] = if pair a: Point(xpart a,ypart a) else: a fi; 
    n
enddef;

% Quadrilatère complet --------------------------------------------------------
vardef QComplet (expr a,b,c,d,e) =
    save p,r; pair p, numeric r;
    ogT[incr ogt] = "qcomplet"; r = ogt;
    ogTA[ogt] = a; ogTB[ogt] = b; ogTC[ogt] = c;
    ogTD[r] = Point_(d [_Point(a), _Point(b)]);
    ogTE[r] = Point_(e [_Point(b), _Point(c)]);
    p = whatever [ _Point(a), _Point(c) ];
    p = whatever [ _Point(ogTD[r]), _Point(ogTE[r]) ];
    ogTF[r] = Point_(p);
    r
enddef;

% Isobarycentre d'une liste de points <t> .....................................
vardef IsoBarycentre (text t) =
    save x,y,n;
    x := 0; y := 0; n := 0;
    for p_ = t: 
	x := x + ogTA[p_];
	y := y + ogTB[p_]; 
	n := n + 1 ; 
    endfor;
    if n>0: Point ((1/n)*x,(1/n)*y) fi
enddef;

% Barycentre des points <a> et <b>, <b> est affecté du poids x, <a> du poids 1-x
vardef Barycentre (expr a,b,x) =
    save p; pair p;
    p = x [ _Point(a), _Point(b)];
    Point_(p)
enddef;

% Milieu du segement <a> ......................................................
vardef Milieu (expr a) =
    IsoBarycentre(ogTA[a],ogTB[a])
enddef;

% Médiatrice du segment <a> ...................................................
vardef Mediatrice (expr a) =
    save p,q; pair q;
    p = Milieu(a); 
    q = _Point(p) + (_Vecteur(a) rotated 90);
    Droite(p,Point_(q))
enddef;

% Bissectrice de l'angle de sommet <b> limité par les points <a> et <c> .......
vardef Bissectrice (expr a,b,c) =
    save p,q,r,t; pair p,q,r,t;
    q = _Point(b);
    p = q +  unitvector(_Point(a) - q);
    r = q +  unitvector(_Point(c) - q);
    t - p = whatever * (q - p) rotated 90;
    t - r = whatever * (q - r) rotated 90;
    Droite(b,Point_(t))
enddef;

% Perpendiculaire à la droite <b> passant par <a> .............................
vardef Perpendiculaire (expr a,b) =
    Droite(a,Point_(_Point(a) + (_Vecteur(b) rotated 90)))
enddef;

% Intersection des droites <a> et <b> .........................................
vardef Intersection (expr a,b) =
    save p; pair p;
    p = whatever  [ _Point(ogTA[a]), _Point(ogTB[a]) ];
    p = whatever  [ _Point(ogTA[b]), _Point(ogTB[b]) ];
    Point_(p)
enddef;

% Projection du point <a> sur la droite <b> ...................................
vardef Projection (expr a,b) =
    Point_(_Projection(a,b))
enddef;

% Orthocentre du triangle <t> .................................................
vardef Orthocentre (expr t) =
    Intersection(
	Perpendiculaire(PointDe(t,1),Droite(PointDe(t,2),PointDe(t,3))),
	Perpendiculaire(PointDe(t,2),Droite(PointDe(t,3),PointDe(t,1)))
    )
enddef;

% Symétrique de <a> par rapport au point ou à la droite <b> ...................
vardef Symetrique (expr a,b) =
    if ogT[b] = "point":
	Point_(2 [_Point(a), _Point(b)])
    else:
	Point_(_Point(a) reflectedabout (_Point(ogTA[b]),_Point(ogTB[b])))
    fi
enddef;

% Distance entre le point <a> et le point/droite <b> ..........................
vardef Distance (expr a,b) =
    if ogT[b] = "droite":
	abs(_Point(a) - _Projection(a,b))
    else:
	abs(_Point(a) - _Point(b))
    fi
enddef;

% Cercle circonscrit au triangle <a> ..........................................
vardef CercleCirconscrit (expr a) =
    save p,r; 
    p = Intersection(
	Mediatrice(Segment(ogTA[a],ogTB[a])),
	Mediatrice(Segment(ogTB[a],ogTC[a]))
    );
    r = Distance(p,ogTA[a]);
    Cercle(p,r)
enddef;

% Centre du cercle <c> ........................................................
vardef Centre(expr a) =
    ogTA[a]
enddef;

% Rayon du cercle <c> .........................................................
vardef Rayon(expr a) =
    ogTB[a]
enddef;

%% ============================================================================
%% Transformations
%% ============================================================================
vardef Rotation(expr a,b,c) =
    if path a:
	a rotatedaround (_Point(b),c)
    else:
	Point_(_Point(a) rotatedaround (_Point(b),c))
    fi
enddef;

%% ============================================================================
%% objets Point, Vecteur et pairs au sens de METAPOST. 
%% Passage des uns aux autres ...
%% ============================================================================
def _Point(expr a) = (ogTA[a],ogTB[a]) enddef;
def Point_(expr p) = Point(xpart p,ypart p) enddef;
let ptoPoint = Point_;
def _Vecteur(expr a) = (_Point(ogTB[a]) - _Point(ogTA[a])) enddef;
vardef _Projection (expr a,b) = save p; pair p;
    p = _Point(a) + whatever * _Vecteur(b) rotated 90;
    p = whatever [ _Point(ogTA[b]), _Point(ogTB[b]) ];
    p enddef;

%% ----------------------------------------------------------------------------
def PointDe(expr a,b) =
    if b = 1:
	ogTA[a]
    elseif b = 2:
	ogTB[a]
    elseif b = 3:
	ogTC[a]
    elseif b = 4:
	ogTD[a]
    elseif b = 5:
	ogTE[a]
    elseif b = 6:
	ogTF[a]
    fi	
enddef;

def Lieu expr o =                      
    if ogT[o] = "triangle":
	_Point(ogTA[o])--_Point(ogTB[o])--_Point(ogTC[o])--cycle
    elseif ogT[o] = "droite":
	(gTRD [ _Point(ogTA[o]), _Point(ogTB[o]) ]) -- 
	(gTRD [ _Point(ogTB[o]), _Point(ogTA[o]) ]) 
    elseif ogT[o] = "segment":
	_Point(ogTA[o]) -- _Point(ogTB[o]) 
    elseif ogT[o] = "cercle":
	fullcircle scaled (ogTB[o]*2) shifted _Point(ogTA[o])
    elseif ogT[o] = "qcomplet":
	_Point(ogTA[o]) -- _Point(ogTB[o]) -- _Point(ogTE[o]) --
	_Point(ogTD[o]) -- _Point(ogTA[o]) -- _Point(ogTC[o]) --
	_Point(ogTE[o])
    fi
enddef;

def _pointe(expr p) =
    fill (fullcircle scaled gPR) shifted (p gENPLACE) withcolor white;
    draw (fullcircle scaled gPR) shifted (p gENPLACE) 
enddef;

def trace expr p = if path p: draw p else: draw (Lieu p) fi gENPLACE enddef;

def remplis expr p = if path p: fill p else: fill (Lieu p) fi gENPLACE enddef;

def pointe expr p = if pair p: _pointe(p) else: _pointe(_Point(p)) fi enddef;
vardef marque.@# expr p = 
    pointe(scantokens p);
    label.@#(lTEX(p),_Point(scantokens p) gENPLACE);
enddef;

def SigneOrtho(expr a,b,c,x) =
    (_Point(b) + x * unitvector(_Point(a)-_Point(b)))
        -- (_Point(b) + x * unitvector(_Point(a) - _Point(b)) 
	   + x * unitvector(_Point(c) - _Point(b)))
        -- (_Point(b) + x * unitvector(_Point(c) - _Point(b)))
enddef;

vardef Etiquette.@#(expr s,t,p) = label.@#(TEX(s) scaled t,p gENPLACE) enddef;

%% ----------------------------------------------------------------------------
def Fenetre(expr xg,yg,xd,yd) = 
    gpXG := xg;
    gpYG := yg;
    gpXD := xd;
    gpYD := yd;
    extra_endfig := "_fenetre;" & extra_endfig;
enddef;

def _fenetre = 
    clip currentpicture to 
	((gpXG,gpYG)--(gpXG,gpYD)--(gpXD,gpYD)--(gpXD,gpYG)--cycle) gENPLACE
enddef;

%% Rotation globale de la figure ----------------------------------------------
vardef RotationDeFigure(expr a) = ;
    picture temp;
    temp = currentpicture;
    currentpicture := nullpicture;
    draw temp rotated a;
    gENPLACEs := gENPLACEs & " rotated " & decimal a;
enddef;

endinput