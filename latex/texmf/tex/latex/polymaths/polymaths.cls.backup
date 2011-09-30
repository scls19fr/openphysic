\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{polymaths}
              [2005/11/22 v1.1
 macros pour poly de cours et bouquin]


\LoadClass{livre}



\RequirePackage[upright]{fourier}  % pour les fontes utopia et autres merveilles 


\if@compatibility
  \renewcommand\@ptsize{0}
\else
\DeclareOption{10pt}{\renewcommand\@ptsize{10}}\DeclareOption{11pt}{\renewcommand\@ptsize{11}}
\DeclareOption{12pt}{\renewcommand\@ptsize{12}}
\fi
 
\DeclareOption{a4paper}
   {\setlength\paperheight {297mm}%
    \setlength\paperwidth  {210mm}\setlength{\textwidth}{173mm}
\setlength{\textheight}{230mm}}
\DeclareOption{dunod}
   {\setlength\paperheight {240mm}%
    \setlength\paperwidth  {170mm}
\setlength{\textwidth}{140mm}
\setlength{\textheight}{215mm}}
\DeclareOption{a5paper}
   {\setlength\paperheight {210mm}%
    \setlength\paperwidth  {148mm}}
\DeclareOption{b5paper}
   {\setlength\paperheight {250mm}%
    \setlength\paperwidth  {176mm}}
\DeclareOption{letterpaper}
   {\setlength\paperheight {11in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{legalpaper}
   {\setlength\paperheight {14in}%
    \setlength\paperwidth  {8.5in}}
\DeclareOption{executivepaper}
   {\setlength\paperheight {10.5in}%
    \setlength\paperwidth  {7.25in}}
\DeclareOption{landscape}
   {\setlength\@tempdima   {\paperheight}%
    \setlength\paperheight {\paperwidth}%
    \setlength\paperwidth  {\@tempdima}}
\DeclareOption{roman}
   {\setlength\paperheight {214mm}%
    \setlength\paperwidth  {130mm}
\setlength{\textwidth}{75mm}
\setlength{\textheight}{150mm}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%

%       P A C K A G E S 
%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Francisation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Permet de rester compatible avec les macounets
% qui utilisent appelmac à la place de latin1
% comme option de package inputenc
\DeclareOption{applemac}{\def\THE@@encoding{applemac}}
\DeclareOption{latin1}{\def\THE@@encoding{latin1}}% pour linux
\ExecuteOptions{latin1,a4-p}

\ProcessOptions

\PassOptionsToPackage{\THE@@encoding}{inputenc}
\RequirePackage[ansinew]{inputenc}          %pour windows

\RequirePackage[T1]{fontenc}       % une police avec des caractères accentués
\RequirePackage[francais]{babel}   % un package de francisation (date, césure ...) 




%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Polices
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{ amsmath,amssymb,amsbsy,amsthm,amsfonts,amstext,amscd,amsopn,amsxtra,upref}  % diverses fontes et %environnements de maths  
\RequirePackage{manfnt,marvosym
,pifont,mathrsfs,textcomp} % fontes pour certains symboles
 \RequirePackage{url} % pour ecrire des url
\RequirePackage{monster2e} %Pour écrire en très gros
 \RequirePackage{fix-cm}  % pour écrire en très gros avec la taille qu'on veut {\fontsize{taille pt}{espace à suivre pt}\selectfont titre} 
\RequirePackage[clock,weather,misc,alpine]{ifsym} % d'autres fontes
\RequirePackage{listings}% pour les listings informatiques
%\RequirePackage[baw]{ fvrb-ex} % pour  écrire en  verbatim 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pour utiliser marvosym
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\DeclareFontFamily{OT1}{mvs}{}
\DeclareFontShape{OT1}{mvs}{m}{n}{<-> fmvr8x}{}
\def\mvs{\usefont{OT1}{mvs}{m}{n}}
\def\mvchr{\mvs\char}
\def\Euro{\,{\mvchr164}\xspace}   % Euro
\def\Cafe{{\mvchr"4B}\xspace}     % Café chaud
\def\CisG{{\mvchr"71}}            % Ciseaux gauche sur pointillés 
\def\CisP{{\mvchr"72}}            % pointillés 
\def\CisD{{\mvchr"73}}            % Ciseaux droite sur pointillés 


\newcommand{\CiseauxG}[1][21cm]{%
	\makebox[0cm]{%
	\begin{minipage}{#1}
	\CisP\CisP\CisP\CisP\CisP\CisP\CisP\CisP\CisP%
	\CisG\leaders\hbox{\CisP}\hfill\rule{0pt}{0pt}
	\end{minipage}}}

\newcommand{\attention}{\dbend}  % symbole attention !
\newcommand{\arobase}{\MVAt}  % belle arrow base


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Multicolonne
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{multicol}   % Gestion des colonnes dans le texte
\setlength{\multicolsep}{3pt}   % Espace avant et après
                                % qui à 12pt par défaut

\newcommand{\MCintegre}{%                     Multicol sans espace
	\vspace{0.3\baselineskip}
	\setlength{\multicolsep}{0pt}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  références
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage[french]{varioref}  %  pour faire des références à la française


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Inclusion de graphiques
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ù
\RequirePackage{graphics}
\RequirePackage[dvips,final]{graphicx}
\RequirePackage{picins}
\RequirePackage{epsfig}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%% Gestion des tableaux % %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{array}     % Nouveau package de tableau
\RequirePackage{tabularx}  % Nouveau package de tableau de
                           % fixe largeur
\RequirePackage{dcolumn}   % alignement sur la virgule
\RequirePackage{hhline}    % Nouvelle gestion des lignes 
                           % horizontales dans les tableaux
\RequirePackage{multirow}  % package permettant de d'écrire sur plusieures
                           % lignes dans un tableau
\RequirePackage{slashbox}  % ligne diagonale dans une case

%%%%%%%%%%%%%%%%%%%%%%
% %%% Les listes % %%%
%%%%%%%%%%%%%%%%%%%%%%

% Redefinir les etiquettes des listes
\RequirePackage[flushleft,alwaysadjust]{paralist}

% Défini les étiquettes des listes par défaut.
\setdefaultenum{\bf 1.}{a)}{\it i.}{}

% Défini les étiquettes des itemize par défaut.
\setdefaultitem{}{}{}{}

% Permet d'avoir une liste numérottée en lettres
% minuscules grecques avec le paramètre [g]
\RequirePackage{greekctr}
%\makeatletter
\g@addto@macro\pl@hook{%
  \ifx g\pl@temp
    \def\@tempa{\pl@label\greek}%
  \fi}







%%%%%%%%%%%%%%%%%%%%%
% %%% PS Tricks % %%%
%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{pstcol}     % Package PS-trikcs pour dessiner en couleurs
\RequirePackage{pst-fill}   % Package PS-trikcs pour le remplissage
\RequirePackage{pst-plot}   % Package PS-trikcs pour tracer les courbes 
\RequirePackage{pst-tree}   % Package PS-trikcs pour dessiner les arbres
\RequirePackage{pst-text}    % pour écrire du texte le long d'une ligne et autres
\RequirePackage{pst-char, pst-grad,pst-fill, pst-node}   % pour faire des dégradés etc.
          
        


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%% Gestion des espaces % %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{xspace}	    % Pour bien gérer les espaces à la fin de macros 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%% Gestion conditionnelle % %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{ifthen}     % traite des commandes condiftionnelles
\RequirePackage{calc}              % permet les calculs
\RequirePackage{lastpage}   % utilisé dans tounez la page et
                            % les tableaux de signes et de variations
\RequirePackage{tableau}    %  package pour faire des tableaux

%\RequirePackage{yhmath}		% arc de cerle et chapeau divers et grands



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Entête et pied de page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{fancyhdr,fancybox}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% index
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%ù

\RequirePackage{makeidx} % pour faire un index


%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% définir des couleurs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\RequirePackage[dvips]{color}

%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  pour écrire en utilisant des formes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{shapepar}






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Divers (certains sont peut-être inutiles :-)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{ float, theorem,parallel, subfigure,caption2} 
        
  



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%
%
%    F O R M A T 
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%% Mise en page :  

\footskip8mm
\setlength\parskip{4pt plus 1.5pt minus 1.5pt}
\addtolength{\skip\footins}{4mm}
\oddsidemargin-0.3cm
\evensidemargin-0.3cm
\topskip0pt
\topmargin0pt
\headheight12.37pt   %  pour inclure un en-tête
\headsep7mm
\hfuzz2pt
\fboxsep2pt
\setcounter{secnumdepth}{4}
\emergencystretch9pt
\baselineskip 3.5ex




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   M A C R O S                          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   MATHS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\ds}{\displaystyle}  % raccourci pour avoir de grandes formules

\newcommand{\fonc}[4]{#1\ :\begin{array}{rll} #2 &\to &#3\\ x& \mapsto &#4 \end{array}}  % fonction de   x $
\newcommand{\Fonc}[5]{#1\ :\begin{array}{rll} #2 &\to &#3\\ #4& \mapsto &#5 \end{array}}  %  fonction d'une autre variable



\newcommand{\limd}[2][x]{\ds\lim_{{#1\to #2}\atop{#1>#2}} } % limite à droite

 \newcommand{\limg}[2][x]{\ds\lim_{{#1\to #2}\atop{#1<#2}} } %  limite à gauche


\newcommand{\R}{\bbr}  % parce que quand on copie le texte d'un autre, y a toujours un idiot pour utiliser \R


%  VECTEURS

\newcommand{\ve}[1]{\overrightarrow{#1}}
%{\overrightarrow{\kern-2pt\mathstrut #1 \kern2pt}}   % vecteur

% %%% Commande pour décaler les parenthéses vers le bas autour
% %%% des vecteurs par exemple :
\newcommand{\DecalV}[2][2pt]{%
	\raisebox{#1}{%
		$\left(\raisebox{-#1}{\ensuremath{#2}}\right)$}}

\newcommand{\DecalNorme}[2][2pt]{%
	\raisebox{#1}{%
		$\left\|\raisebox{-#1}{\ensuremath{#2}}\right\|$}}

\newcommand{\pav}{\DecalV}


\newcommand{\abv}[2][2pt]{%
	\raisebox{#1}{%
		$\left|\raisebox{-#1}{\ensuremath{#2}}\right|$}}


% %%% AXES OI, OJ, OK
\newcommand{\oi}[1][O]{\DecalV[.8pt]{#1;\ve{\imath}\,}\xspace}
\newcommand{\oj}[1][O]{\DecalV[.8pt]{#1;\ve{\jmath}\,}\xspace}
\newcommand{\ok}[1][O]{\DecalV[.8pt]{#1;\ve{k}\,}\xspace}
\newcommand{\ou}[1][O]{\DecalV[.8pt]{#1;\ve{u}}\xspace}
\newcommand{\ov}[1][O]{\DecalV[.8pt]{#1;\ve{v}}\xspace}

% %%% REPERE OIJ
\newcommand{\oij}[1][O]{\DecalV[.8pt]{#1;\ve{\imath},\ve{\jmath}\,}\xspace}
\newcommand{\oik}[1][O]{\DecalV[.8pt]{#1;\ve{\imath},\ve{k}\,}\xspace}
\newcommand{\ojk}[1][O]{\DecalV[.8pt]{#1;\ve{\jmath},\ve{k}\,}\xspace}

% %%% REPERE OUV
\newcommand{\ouv}[1][O]{\DecalV[.8pt]{#1;\ve{u},\ve{v}}\xspace}

% %%% REPERE OIJK
\newcommand{\oijk}[1][O]{\DecalV[.8pt]{#1;\ve{i},\ve{j},\ve{k}\,}\xspace}



%%%%%%%%%%%%%%%%%%%%%%%%%
% limites

\newcommand{\lin}{\ds\lim_{n\to +\infty}}   % limite de suite
\newcommand{\Lim}[2][x]{\displaystyle{\lim_{#1 \to #2}}} % limite quand 1 tend vers 2 avec 1=x par défaut



% %%% Fausse limite
\newcommand{\tendvers}[2][x]{\xrightarrow[#1\to#2]{}}
%{\underset{#1\xrightarrow #2}{\longrightarrow}}  %  lim avec flèche


% %%% Parties reelle et imaginaire
\renewcommand{\Re}{\RC e}

\renewcommand{\Im}{\IC m}



% %%% Intégrales
\newcommand{\Int}[2]{\displaystyle{\int_{#1}^{#2}}}
\renewcommand{\d}{\medspace\text{d}}


% %%% Intégration par parties dans l'ordre u,v',u',v
\newcommand{\intpp}[4]{%
	$\left\{%
	\begin{matrix}
	\vtab u(x) = #1 & \vtab u'(x) = #3 \\
	\stackrel{}{ v'(x) = #2} & \stackrel{}{v(x) = #4} \\
	\end{matrix}
	\right.$}

\newcommand{\intpps}[5]{%
	$\left\{%
	\begin{matrix}
	\vtab u_{#5}(x) = #1 & \vtab u_{#5}'(x) = #3 \\
	\stackrel{}{ v_{#5}'(x) = #2} & \stackrel{}{v_{#5}(x) = #4} \\
	\end{matrix}
	\right.$}


%%%%Equivalent,DL
\newcommand{\ege}[1]{\underset{#1}{=}} %egal en
\newcommand{\eqe}[1]{\underset{#1}{\sim}}    % equiv en
\newcommand{\ese}[1]{\underset{#1}{\simeq}}  %sensiblement égal en


% %%% Congruence
\newcommand{\congru}[3]{#1\equiv #2\thickspace [#3]}


%%%%angle de vecteur avec chapeau
\newcommand{\anglevec}[2]{%
	\DecalV{%
	\widehat{%
	\ve{#1};\ve{#2}
	}}}

\newcommand{\ao}[2]{\DecalV{\ve{#1},\ve{#2}}}   % angle de vect sans chapeau
\newcommand{\ps}[2]{\ve{#1}\cdot\ve{#2}}    %  produit scalaire lycée avec point


%%%Grosse fraction
\newcommand{\fr}{\ds\frac}

% %%% Fraction en exposant
\newcommand{\efr}[2]{%
	\raisebox{.3ex}{\scriptsize{$#1$}}\negmedspace\slash
	\negthinspace\raisebox{-.2ex}{\scriptsize{$#2$}}}
	
% %%% Fraction en oblique
\newcommand{\ofr}[2]{%
	\raisebox{0ex}{$#1$}\negthinspace\slash
	\raisebox{-.5ex}{$#2$}}

% %%% Parallelisme
\renewcommand{\parallel}{\mbox{\slash\negthickspace\slash}}

% %%% un ; avec un peu d'espace autour pour les intervalles
\newcommand{\pv}{\ensuremath{\: ; \,}}

% Un vrai virgule pour les décimaux
 \catcode`¤\active
 \def¤{{,}} 

\DeclareMathSymbol{@}{\mathord}{letters}{"3B}

% %%% Somme majuscule
\newcommand{\Sum}{\displaystyle\sum}


%%%% Macro qui permet de d'avoir de colonnes centrées de dimension fixe. pour les tableaux
\newcommand{\Coltitre}[2]{\makebox[#1][c]{\vtab\textbf{#2}}}



\newcommand{\im}{{\rm Im}\,} % image
\newcommand{\ke}{{\rm Ker}\,}  %  noyau




\newcommand{\ens}[2]{\left\{\left.{#1}\,\right\vert\, {#2}\right\}}  %ensemble en extension avec barre
\newcommand{\ensbis}[2]{\left\{\left.{#1}\,\right\mid\, {#2}\right\}}  % ensemble avec virgule


% Majuscules de mathcal 

\newcommand{\AR}{\mathcal{A}}
\newcommand{\BR}{\mathcal{B}}
\newcommand{\CR}{\mathcal{C}}
\newcommand{\DR}{\mathcal{D}}
\newcommand{\ER}{\mathcal{E}}
\newcommand{\FR}{\mathcal{F}}
\newcommand{\GR}{\mathcal{G}}
\newcommand{\HR}{\mathcal{H}}
\newcommand{\IR}{\mathcal{I}}
\newcommand{\JR}{\mathcal{J}}
\newcommand{\KR}{\mathcal{K}}
\newcommand{\LR}{\mathcal{L}}
\newcommand{\MR}{\mathcal{M}}
\newcommand{\NR}{\mathcal{N}}
\newcommand{\OR}{\mathcal{O}}
\newcommand{\PR}{\mathcal{P}}
\newcommand{\QR}{\mathcal{Q}}
\newcommand{\RR}{\mathcal{R}}
\newcommand{\SR}{\mathcal{S}}
\renewcommand{\TR}{\mathcal{T}}
\newcommand{\UR}{\mathcal{U}}
\newcommand{\VR}{\mathcal{V}}
\newcommand{\WR}{\mathcal{W}}
\newcommand{\XR}{\mathcal{X}}
\newcommand{\YR}{\mathcal{Y}}
\newcommand{\ZR}{\mathcal{Z}}

% majuscules encore plus curvilignes, comme à l'école

\newcommand{\AC}{\mathscr{A}}
\newcommand{\BC}{\mathscr{B}}
\newcommand{\CC}{\mathscr{C}}
\newcommand{\DC}{\mathscr{D}}
\newcommand{\EC}{\mathscr{E}}
\newcommand{\FC}{\mathscr{F}}
\newcommand{\GC}{\mathscr{G}}
\newcommand{\HC}{\mathscr{H}}
\newcommand{\IC}{\mathscr{I}}
\newcommand{\JC}{\mathscr{J}}
\newcommand{\KC}{\mathscr{K}}
\newcommand{\LC}{\mathscr{L}}
\newcommand{\MC}{\mathscr{M}}
\newcommand{\NC}{\mathscr{N}}
\newcommand{\OC}{\mathscr{O}}
\newcommand{\PC}{\mathscr{P}}
\newcommand{\QC}{\mathscr{Q}}
\newcommand{\RC}{\mathscr{R}}
\newcommand{\SC}{\mathscr{S}}
\renewcommand{\TC}{\mathscr{T}}
\newcommand{\UC}{\mathscr{U}}
\newcommand{\VC}{\mathscr{V}}
\newcommand{\WC}{\mathscr{W}}
\newcommand{\XC}{\mathscr{X}}
\newcommand{\YC}{\mathscr{Y}}
\newcommand{\ZC}{\mathscr{Z}}




%%%%%%%%%%%%%%%%%%%%%%%%%%
%  ensembles de nombres 

\newdimen\AAdi%
\newbox\AAbo%
\font\AAFf=cmex10%   %ou cmex10
\def\AArm{\fam0 \rm}%
\def\AAk#1#2{\setbox\AAbo=\hbox{#2}\AAdi=\wd\AAbo\kern#1\AAdi{}}%
\def\AAr#1#2#3{\setbox\AAbo=\hbox{#2}\AAdi=\ht\AAbo\raise#1\AAdi\hbox{#3}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% alphabet blackboard
\def\bba{{\AArm A}}%
\def\bbb{\mathbb{B}}%
\def\bbc{\mathbb{C}}%
\def\bbd{\mathbb{D}}%
\def\bbe{\mathbb{E}}%
\def\bbf{\mathbb{F}}%
\def\bbg{{\AArm G\AAk{-1.02}{G}\AAr{.9}{I}{\AAFf\char"3F}}}%
\def\bbh{\mathbb{H}}%
\def\bbi{\mathbb{I}}%
\def\bbj{{\AArm J}}%
\def\bbk{\mathbb{K}}%
\def\bbl{\mathbb{L}}%
\def\bbm{\mathbb{M}}%
\def\bbn{\mathbb{N}}%
\def\bbo{{\AArm O\AAk{-1.02}{O}\AAr{.9}{I}{\AAFf\char"3F}}}%
\def\bbp{\mathbb{P}}%
\def\bbq{\mathbb{Q}}%
\def\bbr{\mathbb{R}}%
\def\bbs{{\AArm S}}%
\def\bbt{{\AArm T\AAk{-.62}{T}T}}%
\def\bbu{{\AArm U\AAk{-1}{U}\AAr{.95}{I}{\AAFf\char"3F}}}%
\def\bbv{{\AArm V}}%
\def\bbw{{\AArm W}}%
\def\bbx{{\AArm X}}%
\def\bby{{\AArm Y}}%
\def\bbz{\mathbb{Z}}%
%% 1 blackboard
\def\BBone{{\AArm 1\AAk{-.8}{I}I}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%% raccourci matrice, mais ya assistant texmaker 
\newcommand{\bmat}{\begin{pmatrix}}
\newcommand{\emat}{\end{pmatrix}}


\newcommand{\ud}{\fr{1}{2}}  % pour faire un demi !


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  systèmes

\newcommand{\bsys}{\begin{cases}}% système sans alignement 
\newcommand{\esys}{\end{cases}}


\newcommand{\bsyf}{\left\{\begin{array}{lcl}}  % système aligné à gauche
\newcommand{\esyf}{\end{array}\right.}

\newcommand{\bsyc}{\left\{\begin{array}{rcl}} % système serré sur le égal
\newcommand{\esyc}{\end{array}\right.}


%%%% Pour faire des systemes
\newenvironment{systeme}[1][5]{%               %  encore plus joli mais compliqué : rentre le nombre de colonnes 5 par défaut
	\setlength{\arraycolsep}{1pt}     % c'est un environnement !! 
	$\left\{\begin{array}{*{#1}{r}}}    
	{\end{array}\right.$}


%%% comparaison


\newcommand{\ie}{\leqslant}  % inférieur ou égal
\newcommand{\se}{\geqslant}  % supérieur ou égal


%%% grec

\newcommand{\e}{\varepsilon} % epsilonn
\newcommand{\f}{\othervarphi} % fonction phi
\newcommand{\g}{\gamma}  
\newcommand{\al}{\alpha}
\newcommand{\de}{\delta}
\newcommand{\De}{\Delta}
\newcommand{\Ga}{\Gamma}
\newcommand{\La}{\Lambda}
\newcommand{\la}{\lambda}
\renewcommand{\o}{\otheromega}
\newcommand{\si}{\sigma}
\newcommand{\Ta}{\Theta}
\newcommand{\ta}{\othertheta}
\renewcommand{\O}{\Omega}



%% implique, équivalent

\newcommand{\SSi}{\quad\text{si et seulement si}\quad} 
\newcommand{\ssi}{\Longleftrightarrow}
\newcommand{\imp}{\Longrightarrow}
\newcommand{\suf}{\Longleftarrow}


%% fonctions math affichées en romain

\newcommand{\Loc}{\operatorname{Loc}}
\newcommand{\Arg}{\operatorname{Arg}}
\newcommand{\ch}{\operatorname{ch}}
\newcommand{\sh}{\operatorname{sh}}
\newcommand{\cotan}{\operatorname{cotan}}
\renewcommand{\tanh}{\operatorname{th}}
\newcommand{\Arccos}{\operatorname{Arccos}}
\newcommand{\Arcsin}{\operatorname{Arcsin}}
\newcommand{\Arctan}{\operatorname{Arctan}}
\newcommand{\Argch}{\operatorname{Argch}}
\newcommand{\Argsh}{\operatorname{Argsh}}
\newcommand{\Argth}{\operatorname{Argth}}
\newcommand{\val}{\operatorname{val}}



%% Parenthèses crochets, etc

\newcommand{\pa}[1]{\left({#1}\right)}
\newcommand{\cro}[1]{\left[{#1}\right]}
\newcommand{\ab}[1]{\left|{#1}\right|}
\newcommand{\ac}[1]{\left\{{#1}\right\}}
\renewcommand{\no}{\DecalNorme}
\newcommand{\nov}[1]{\no{\ve{#1}}}
%[1]{\left\|{#1}\right\|}

%%% 1er 2eme

\newcommand{\er}{\textsuperscript{er}\ }
\newcommand{\eme}{\textsuperscript{ème}\ }
\newcommand{\ere}{\textsuperscript{ère}\ }

%% Divers

\newcommand{\epi}[2]{e^{\,\efr{#1i\pi}{#2}}} % e machin i pi sur truc
\newcommand{\intt}{\ds\int\!\!\!\int}  % double intégrale
\newcommand{\inttt}{\ds\int\!\!\!\int\!\!\!\int} 
\newcommand{\eq}{\mathrel{\sim}}
\newcommand{\widefrown}{\resizebox{0.6cm}{0.13cm}{$\frown$}}
\newcommand{\rg}{{\rm rg}\,}
\newcommand{\vect}[1]{{\rm Vect}\{#1\}}
\renewcommand{\dim}{\dim\,}
\newcommand{\un}{(u_n)_{n\in\bbn}\ }  % suite un
\newcommand{\vn}{(v_n)_{n\in\bbn}\ }  %suite vn
\newcommand{\co}{\choose}   % p parmi n
\newcommand{\Co}[2]{\coordp{#2}{#1}} 


\newcommand{\jok}[1]{\begin{flushright}\rotatebox{180}{\textit{#1}}\end{flushright}}  % joker écrit à l'envers en italique

\newcommand{\ut}{\fr{1}{3}}  % un tiers
\newcommand{\dt}{\fr{2}{3}}  % 2 tiers



%\newcommand{\C}{\bbc}
\renewcommand{\bar}{\overline}  % barrre pour les conjugués

\newcommand{\qcmr}{\bigcirc\  }

\newcommand{\maj}{\mathscr}

\def \vi {\ve \imath}
\def \vj {\ve \jmath}


\newcommand{\env}[1]{\begin{flushright}\rotatebox{180}{\textit{#1}}\end{flushright}} % comme jok



% %%% Notation scientifique.
\newcommand{\Sc}[2]{%
	\ensuremath{%
	#1\cdot 10^{#2}}}


% %%% Mes d'un angle
\newcommand{\Mes}[1]{%
	\ensuremath{%
	\mathrm{mes}
	\DecalV{\widehat{#1}}
	}}




% Du gras en mode maths mes en italique contrairement à \mathbf
% juste pour un petit bout, sinon utiliser \boldmath et \unboldmath
% à l'extérieur des $$
\newcommand{\Mathbold}[1]{\mbox{\boldmath$#1$\unboldmath}}






%%%% Macros pour un Vrai-Faux

\newcommand{\Q}{\mbox{\ding{114}\hspace{-.7em}\raisebox{.2ex}[1ex]{\ding{51}}}}

\newcommand{\VF}{%
	\hfill\makebox[1cm][s]{\bf V\hfill F}
	}
	
\newcommand{\Rep}[1][]{%
	\ifthenelse{\equal{#1}{v}}{%
		\hfill\makebox[1cm][s]{\Q\hfill \ding{114}}}{%
		\ifthenelse{\equal{#1}{f}}{%
			\hfill\makebox[1cm][s]{\ding{114} \hfill\Q}}{%
			\hfill\makebox[1cm][s]{\ding{114} \hfill\ding{114}}}}}


%%%% Qcm
\newcounter{num}
\newcounter{qcm}[num]
\newcommand{\Nqcm}{\stepcounter{qcm}\theqcm) }

\newenvironment{Question}[2][5.43cm]
	{\begin{minipage}{#1}%
	\Nqcm #2%
	\begin{Pilist}{pzd}{114}}%
	{\end{Pilist}%
	\end{minipage}%
	
	\vspace{0.2cm}
	}
% Permet de centre qqchose dans une case de tableau qui n'est pas
% définie comme centée.
\newcommand{\Centre}[1]{\hfill#1\hfill\strut\ignorespaces}

% Ou de façon plus professionnelle
\newcolumntype{C}[3]{>{\hfill#2}#1<{#3\hfill\strut\ignorespaces}}


% %%% Place verticale dans un tableau
\newcommand{\vtab}[1][1]{\rule[-0.9em*\real{#1}]{0pt}{2.2em*\real{#1}}}

%%%%%%% Colonne épaisse
\newcolumntype{I}{!{\vrule width 2pt}}

%%%%%%%%%%%%%%% ligne épaisse
\newlength\savedwidth
\newcommand\whline{\noalign{\global\savedwidth\arrayrulewidth
                                             \global\arrayrulewidth 2pt}%
                                 \hline
                                 \noalign{\global\arrayrulewidth\savedwidth}}





%%%%%%%%%%%%% entete tableau normal
\newcolumntype{N}[1]{  I@{\vrule height.5cm width0pt depth.2cm\hspace{.5cm}}c@{\hspace{.5cm}}I@{\vrule height.5cm width0pt depth.2cm\hspace{.5cm}}c@{\hspace{.5cm}}*#1{|@{\vrule height.5cm width0pt depth.2cm\hspace{.5cm}}c@{\hspace{.5cm}}}I  }

\setlength\extrarowheight{4pt}

\renewcommand\tabularxcolumn[1]{m{#1}}  % pour centrer verticalement
\newcolumntype{Z}{>{\centering\arraybackslash}X} % pour centrer horizontalement
\newcolumntype{Y}[1]{IcIZ*{#1}{|Z} I}
%\newcommand{\Coltitre}[2]{\makebox[#1][c]{\vtab\textbf{#2}}}
% %%% Place verticale dans un tableau
\newcommand{\vtabplus}{\rule[-1.2em]{0pt}{3em}}

% %%% Double Place verticale dans un tableau
\newcommand{\vtabb}{\rule[-1.6em]{0pt}{4em}}

% %%% Place verticale dans un systeme
\newcommand{\systab}{\rule[-1.05em]{0pt}{1.05em}}

% %%% Coordonnées verticales dans le plan
\newcommand{\coordp}[2]{%
	\begin{pmatrix}
	#1 \\ #2
	\end{pmatrix}}

% %%% Coordonnées verticales dans l'espace
\newcommand{\coordpp}[3]{%
	\scalebox{.7}{%
		\begin{pmatrix}
		#1 \\ #2 \\ #3
		\end{pmatrix}}}




\newlength{\Hauteur}
\newcommand{\Hautf}[1]{%
	\setlength{\Hauteur}{#1\baselineskip}
	\setlength{\Hauteur}{.5\Hauteur}
	\rule{0pt}{\Hauteur}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%    DESSIN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% adapté à mon ordi : à changer
\renewcommand{\figurename}{Figure}
\renewcommand{\captionlabeldelim}{\ }

\newcommand{\des}[2]{
\begin{center}
\includegraphics[height=#2cm]{/home/moi/Lycee/TS/figures/#1}\caption{}
\end{center}}



%% Inclusion d'un dessin à partir d'un fichier eps externe
\newcommand{\dessin}[4][Exercice \theex]%
{\centering %\begin{center}
%\graphicspath{{#2}}
\includegraphics{#2#3}
\figtitre[#1]{#4}
%\end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Couleurs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{orange}{rgb}{0.589999,0.269997,0.080004}
\definecolor{or}{rgb}{1,0.843104,0}
\definecolor{bleu_ciel}{rgb}{0.635286,0.9693528,1}
\definecolor{bleu_m}{rgb}{0.423524,0.6462352,0.7372784}
\definecolor{bleu_f}{rgb}{0.211762,0.3231176,0.3686392}
\definecolor{0.6white}{rgb}{0.6,0.6,0.6}
\definecolor{bleu}{rgb}{0.529405,0.807794,1}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%  Sections, sous-sections, etc
%
%%%%%%%%%%% LES MACROS DU BOUQUIN %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\NoLecon}{}
\newcommand{\NomSection}{}
\newcommand{\NomChap}{}
\newcommand{\NomLecon}{}
\newcommand{\NumLecon}{}



\newcommand{\LECOND}[6]{
%\setcounter{pb}{0}\setcounter{sec}{0}\setcounter{num}{0}\setcounter{solnum}{0}
%\setcounter{Def}{0}\setcounter{Prop}{0}\setcounter{Th}{0}
\renewcommand{\NomLecon}{#5}
\renewcommand{\NumLecon}{#1}\renewcommand{\NoLecon}{#2}
%\thispagestyle{empty}
\begin{minipage}[t]{0.75\textwidth}\vspace{0cm}
\begin{center}
%\pscharpath[linestyle=none,fillstyle=gradient,gradbegin=black,gradend=bleu,gradmidpoint=0.5]
{\LARGE\textsc{#2 Leçon}}\\
\bigskip\bigskip\bigskip
\pscharpath[linestyle=none,fillstyle=gradient,gradbegin=black,gradend=bleu,gradmidpoint=0.5]
{ \Huge{ #3}} \\ 
\pscharpath[linestyle=none,fillstyle=gradient,gradbegin=black,gradend=bleu,gradmidpoint=0.5]
{\Huge{ #4}}   
%\addcontentsline{toc}{chapter}{\protect\numberline{}{\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\! \textcolor{bleu}{\textsc{#2\ \ Leçon} : \ #5}} \ \sm}
\end{center}
\end{minipage}
\begin{minipage}[t]{0.3\textwidth}\vspace{0cm}      % à rajouter si on veut une illustration
\hspace{-1.5cm}
\includegraphics[width=\textwidth]{#6}
\end{minipage}
}

\newcommand{\LECON}[6]{
\setcounter{pb}{0}\setcounter{sec}{0}\setcounter{num}{0}\setcounter{solnum}{0}
\setcounter{Def}{0}\setcounter{Prop}{0}\setcounter{Th}{0}\renewcommand{\NomLecon}{#5}
\renewcommand{\NumLecon}{#1}\renewcommand{\NoLecon}{#2}
\thispagestyle{empty}
%\begin{minipage}[t]{0.75\textwidth}\vspace{0cm}
\begin{center}
%\pscharpath[linestyle=none,fillstyle=gradient,gradbegin=black,gradend=bleu,gradmidpoint=0.5]
{\Huge\textsc{Chapitre #1 }}\\
\bigskip\bigskip\bigskip
\pscharpath[linestyle=none,fillstyle=gradient,gradbegin=black,gradend=bleu,gradmidpoint=0.5]
{ \Huge{ #3}} \\ 
\pscharpath[linestyle=none,fillstyle=gradient,gradbegin=black,gradend=bleu,gradmidpoint=0.5]
{\Huge{ #4}}   
\addcontentsline{toc}{chapter}{\protect\numberline{}{\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\! \textcolor{bleu}{\large\textsc{Chapitre \ \ #1} : \ #5}} \ \sm}
\end{center}
%\end{minipage}
%\begin{minipage}[t]{0.3\textwidth}\vspace{0cm}
%\hspace{-1.5cm}
%\includegraphics[width=\textwidth]{#6}
%\end{minipage}
}


\newcommand{\bs}{\bigskip}



\newcounter{ppb}
\newcommand{\SUBSUBSECTION}[1]{\refstepcounter{ppb}\subsubsection*{#1} 
\addcontentsline{toc}{subsubsection}{\protect\numberline{}{\footnotesize{#1}}} }




\newcounter{pb}
\makeatletter
\newcommand\SUBSECTION{\setcounter{ppb}{0}\@startsection{subsection}{2}{-5mm}{0.85\parskip}{0.65\parskip}
{\Large\bfseries\textcolor{bleu_m}{\Listerd}\ \ \textcolor{bleu_m}  }}
%\addcontentsline{toc}{subsection}{\protect\numberline{}{\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\!\small{#1}}} }
\makeatother


\newcounter{sec}

\newcommand{\SECTION}[2]{
\refstepcounter{sec}\setcounter{pb}{0}\setcounter{ppb}{0}\setcounter{subsection}{0}
\renewcommand{\NomSection}{#1}
  \bigskip\vspace{1.5cm}
  {   \LARGE\textcolor{bleu_f}{\textbf{\thesec\ -\ #2}}   }
         \bigskip                  %}                                 
\addcontentsline{toc}{section}{\protect\numberline{\large\textbf{\textcolor{bleu_f}{\thesec}}}{\!\!\!\!\!\!\large\textbf{\textcolor{bleu_f}{#2}}}}}


\newcounter{chap}
\newcommand{\CHAP}[2]{\refstepcounter{chap}\setcounter{sec}{0}\setcounter{pb}{0}\setcounter{ppb}{0}
\renewcommand{\NomChap}{#1}
\psframebox[fillstyle=solid,fillcolor=bleu]
{     \white{   \Huge\textbf{\Roman{chap}}\Huge\textbf{\ -\ #1}   }           }                                                    
%\addcontentsline{toc}{chapter}{\protect\numberline{\!\!\!\!\!\!\!\!\Roman{chap}.}{\!\!\!\!\!\!\!\!#2}}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  T i T r e s
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\Titre}[2][30]{%
\begin{center}
 {\fontsize{#1 pt}{100pt}\selectfont \pscharpath[linestyle=none,fillstyle=gradient,gradbegin=black,gradend=bleu,gradmidpoint=0.5]
{#2 }} 
\end{center}
\vspace{2cm}
}


\newcommand{\titre}[2][30]{%
\begin{center}
 {\fontsize{#1 pt}{100pt}\selectfont \textcolor{bleu_f}
{\textbf{#2} }} 
\thispagestyle{empty}
\end{center}
\vspace{2cm}
}

%% Environnement encadré
\newcommand{\coursi}{\refstepcounter{courscomp} \thecourscomp . \hfill}

\newsavebox{\fmbox}
\newenvironment{encadrer}{%
	\vspace{1em}
    \begin{lrbox}{\fmbox}\begin{minipage}{.98\linewidth}}
    {%\vspace{1em}
    \end{minipage}\end{lrbox}\fbox{\usebox{\fmbox}}
	
	\vspace{1em minus .5em }
	}
     

%%%%%%%%%%%%
%% Listes et compagnie
%%%%%%%%%%%%%%%%%%%%%%%


%% Environnement Théorème, définition ....
\newenvironment{rubric}[2][]%
	{\textsc{\textbf{#2}} \hspace{2ex} \textit{#1}\par}%
	{\par\addvspace{1em}}




\newenvironment{belet}                                                                                 % avec un triangle
{\begin{list}{}{\renewcommand{\makelabel}{$\triangleright$}}}{\end{list}}
\newcommand{\bel}{\begin{belet}}
\newcommand{\el}{\end{belet}}



\newenvironment{Abstract}[1]    % résumé avant chapitre ou ds
{\begin{center}
\begin{minipage}{10cm}
\textbf{Résumé} \footnotesize{#1}} {\end{minipage}
\end{center}
\bigskip\bigskip}

%%%%%%%%%





%%%%%%%%%%%%%%

\newcommand{\ENC}[2]{                             % encadré pour théorèmes rempli en bleu ciel
\bigskip

%\begin{Boxedminipage}{\textwidth}
\psshadowbox*[fillcolor=bleu_ciel]{
\begin{minipage}{\textwidth}
\sm

\textbf{#1}

\sm

{ #2}

\sm
\end{minipage}
}
\bigskip
}





\newcommand{\enc}[1]{                                                                            % petit encadré
\begin{center} \psshadowbox*[fillcolor=bleu_ciel]{   #1 } \end{center}  
}

%%%%%%%%%%%%%%%%%%%%
\newcommand{\sm}{\smallskip}    % petit espace



\newenvironment{Boxedminipage}                                                                % pour fabriquer l'encadré
{\begin{Sbox}\begin{minipage}} {\end{minipage}\end{Sbox}\fbox{\TheSbox}}



% %%% Permet d'écrire dasn une liste en revenant contre la marge de gauche
% %%% Indépendemment de la numérotation des questions.
\newcommand{\HorsListe}[2][1]{%
	\par\nopagebreak[4]\addvspace{2\itemsep}\hspace{-#1\leftmargin}%
	\begin{minipage}{\linewidth+#1\leftmargin}
	#2
	\end{minipage}%
	\nopagebreak[2]}


\newcommand{\Listetr}{$\blacktriangleright$}
\newcommand{\Listetro}{$\vartriangleright$}
\newcommand{\Listecr}{$\blacksquare$}
\newcommand{\Listecro}{$\square$}
\newcommand{\Listerd}{$\bullet$}
\newcommand{\Listerdo}{$\circ$}

\newenvironment{listetr}%
	{\begin{list}{\Listetr}{}}%
	{\end{list}}

\newenvironment{listerd}%
	{\begin{list}{\Listerd}{}}%
	{\end{list}}

\newenvironment{listecr}%
	{\begin{list}{\Listecr}{}}%
	{\end{list}}

\newenvironment{listetro}%
	{\begin{list}{\Listetro}{}}%
	{\end{list}}

\newenvironment{listerdo}%
	{\begin{list}{\Listerdo}{}}%
	{\end{list}}

\newenvironment{listecro}%
	{\begin{list}{\Listecro}{}}%
	{\end{list}}

\newenvironment{qcm}%
	{\begin{list}{\ding{114}}{}}%
	{\end{list}}


%%%% Environnement de demonstration sur plusieures lignes mais
%%%% mais en un seul bloc intégré à la ligne en cours. 
\newenvironment{arrayl}[1][rcl]%
	{\setlength{\arraycolsep}{1.5pt}
	 $\begin{array}[t]{#1}}%
	{\end{array}$}%

% %%% premet d'écrire la réponse encadrée après un arrayl au bout de la ligne
% %%% collé à droite
\newcommand{\Reponse}[2][-1]{%
	\hfill\raisebox{#1\baselineskip}{\smash{\makebox[0pt][r]{\fbox{#2}}}}}


% environnement avec un zigouigoui ondulé sur la gauche
\newsavebox{\MYbox}%
\newlength\MYh\newlength\MYd%

\newenvironment{Zigoui}[1][ondule.1]{%
    \def\Barre{#1}
    \begin{lrbox}{\MYbox}
		\begin{minipage}[b]{\linewidth -4bp -.5cm -.3cm }}{%
    	\end{minipage}
	\end{lrbox}%
	\settoheight{\MYh}{\usebox{\MYbox}}%
	\settodepth{\MYd}{\usebox{\MYbox}}%
	\addtolength{\MYh}{\MYd+4bp}%
	
	\medskip
	\hfill
	\raisebox{\totalheight-3bp}{%
		\includegraphics*[clip=true,bb= 1 -2 \MYh*72.27 2,angle=-90]{\Barre}}
	\hspace{0.3cm}\usebox{\MYbox}%
	\par\addvspace{2ex}
	}%

%%% Permet d'avoir autant de ligne de réponse que l'on veut
%%% comme un enumerate ou un itemize
\newlength{\REPsep}
\setlength{\REPsep}{1.5em}

\newcommand{\REPenum}[2][\bf 1.]{%
	\begin{enumerate}[#1]
	\multido{\i=1+1}{#2}{
	\item \rule{0pt}{\REPsep}\dotfill }
	\end{enumerate}
	\addvspace{2em}}

\newcommand{\REPitem}[2][\Listerd]{%
	\begin{itemize}[#1]
	\multido{\i=1+1}{#2}{
	\item \rule{0pt}{\REPsep}\dotfill }
	\end{itemize}
	\addvspace{\REPsep}}

\newenvironment{DeuxCols}[1][2]{%                             pour écrire en deux colonnes , 2 par défaut
	\setlength{\columnsep}{30pt}
	\setlength{\columnseprule}{.5pt}
	\begin{multicols}{#1}}%
	{\end{multicols}}



% %%% Enumerate de second niveau sur deux colonnes.
\newenvironment{Sliste}[1][a)]%
	{\setlength{\multicolsep}{8pt}
	 \begin{multicols}{2}
	 \begin{enumerate}[#1]}%
	{\end{enumerate}
	 \end{multicols}}

%%%% enumerate sur n colonnes
\newenvironment{nliste}[2][a)]%
	{\setlength{\multicolsep}{8pt}
	 \begin{multicols}{#2}
	 \begin{enumerate}[#1]}%
	{\end{enumerate}
	 \end{multicols}}


%%%%%%%%%%%%%% Divers raccourcis 
\newcommand{\bet}{\begin{center}\begin{tabular}}
\newcommand{\et}{\end{tabular}\end{center}}



\newcommand{\bqa}{\begin{eqnarray}}
\newcommand{\eqa}{\end{eqnarray}}

\newcommand{\bd}{\begin{document}}
\newcommand{\ed}{\end{document}}

\newcommand{\bqas}{\begin{eqnarray*}}
\newcommand{\eqas}{\end{eqnarray*}}

\newcommand{\been}{\begin{enumerate}}
\newcommand{\een}{\end{enumerate}}





\newcommand{\bfi}{\begin{figure} }

\newcommand{\efi}{\end{figure}}

\newcommand{\id}{\IR\!d}

\newcommand{\ba}{\begin{array}}
\newcommand{\ea}{\end{array}}

\newcommand{\be}{\begin{equation}}
\newcommand{\ee}{\end{equation}}

\newcommand{\bi}{\begin{itemize}}
\newcommand{\ei}{\end{itemize}}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Tableau de variation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\croi}{% croissante
\unitlength=1cm
\begin{minipage} {1cm}%pour centrer verticalement f(x)
\begin{picture}(1,1) % dessin de 2 X 2
\put(0,0){\vector(1,1){1}} % 1 à partir (0,0) direction (1,1)
\end{picture}
\end{minipage}}


\newcommand{\dec}{%décroissante
\setlength{\unitlength}{1cm}
\begin{minipage} {1cm}%pour centrer verticalement f(x)
\begin{picture}(1,1) % dessin de 2 X 2
\put(0,1){\vector(1,-1){1}}
\end{picture}
\end{minipage}
}


% xcas


  \newcommand{\p}{\textasciicircum}  % pour avoir le chapeau de la puissance


\newcommand{\cas}[1]{
\texttt{#1}
}

\newcommand{\map}[1]{
\texttt{\color{red} #1}
}

\newcommand{\mup}[1]{

 \smallskip 


\texttt{\textcolor{red}{#1}}


  \smallskip

}




%%%%%%%%%%%%%%%%%%%% ENTETES %%%%%%%%%


\newcommand{\entete}[3]{
\fancyfoot[C]{{\scriptsize\textsl{ Guillaume Connan, #3, 2005-2006}}}
 \fancyhead[RO,LE]{\thepage} \fancyhead[RE,LO]{ }
 \fancyhead[CO]{  #1 } \fancyhead[CE]{\textbf{#2 } }
\renewcommand{\headrulewidth}{0.4pt}
 \pagestyle{fancy}
}


\newcommand{\entetinfo}[3]{
\fancyfoot[C]{{\scriptsize\textsl{  #3, 2005-2006}}}
 \fancyhead[RO,LE]{\thepage} \fancyhead[RE,LO]{ }
 \fancyhead[CO]{  #1 } \fancyhead[CE]{\textbf{#2 } }
\renewcommand{\headrulewidth}{0.4pt}
 \pagestyle{fancy}
}



\newcommand{\entetalice}[2]{
\fancyfoot[C]{ }
 \fancyhead[RO,LE]{\thepage} \fancyhead[LO,RE]{ }
 \fancyhead[CO]{ \textbf{ #1} } \fancyhead[CE]{#2  }
\renewcommand{\headrulewidth}{0.4pt}
 \pagestyle{fancy}
}


\newcommand{\enteteroman}[2]{
\fancyfoot[C]{\thepage }
 \fancyhead[RO,LE]{ } \fancyhead[LO,RE]{ }
 \fancyhead[CO]{ \textit{\small #1} } \fancyhead[CE]{#2  }
\renewcommand{\headrulewidth}{0.4pt}
 \pagestyle{fancy}
}


\newcommand{\etoile}{\begin{center}\begin{tabular}{ccc}
*& &*\\
 &*& 
\end{tabular}
\end{center}
}

\setcounter{tocdepth}{3} %\setcounter{page}{0}


\pagenumbering{arabic} \setlength{\unitlength}{1cm} \setlength{\parindent}{0mm} \floatplacement{figure}{H}

\setlength{\parindent}{0mm}

% pour le sommaire

\makeatletter
\def\addcontentsline@toc#1#2#3{\addtocontents{#1}{\protect\thispagestyle{empty}}%
\addtocontents{#1}{\protect\contentsline{#2}{#3}{\thepage}}}

\def\addcontentsline#1#2#3{\expandafter\@ifundefined{addcontentsline@#1}%
{\addtocontents{#1}{\protect\contentsline{#2}{#3}{\thepage}}} {\csname addcontentsline@#1\endcsname{#1}{#2}{#3}}}



%% Nouvelle partie
\newcommand{\partie}[2][]{%
	\addvspace{1em}
	
	\textbf{Partie #2}\qquad\textit{#1}%
	
	\nopagebreak[4]}
 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  EXERCICE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%\newcounter{num}


\newcommand{\Exot}[1]{\refstepcounter{num}
\smallskip   \textbf{\textsf{\textcolor{bleu_f}{{\LARGE\bomb}\ \ {\large Exercice  \thenum\ \  #1}}}  }  \\

 \vspace{0.005cm} }

\newcommand{\exot}[1]{\refstepcounter{num}
\smallskip   \textbf{\textsf{\textcolor{bleu_f}{{\LARGE\bomb}\ \ {\large \thenum\ \  #1}}}  }  \\

 \vspace{0.005cm} }

\newcommand{\exott}[1]{\refstepcounter{num}
\smallskip   \textbf{\textsf{\textcolor{bleu_f}{{\LARGE\bomb\bomb}\ \ {\large \thenum\ \  #1}}}  }  \\

 \vspace{0.005cm} }

\newcommand{\exottt}[1]{\refstepcounter{num}
\smallskip   \textbf{\textsf{\textcolor{bleu_f}{{\Huge\ComputerMouse}\ \ {\large \thenum\ \  #1}}}  }  \\

 \vspace{0.005cm} }

\renewcommand{\danger}{\raisebox{1.1ex}{\hspace{0.2cm} \dbend}}


%\newcommand{\exott}[1][]{\addtocounter{num}{1}
%\medskip   \textbf{\textsf{\textcolor{bleu}%{\Radioactivity\Radioactivity}\ \thenum\ \ #1}}}

%\newcommand{\exottt}[1][]{\addtocounter{num}{1}
%\medskip   \textbf{\textsf{\textcolor{bleu}%{\Radioactivity\Radioactivity\Radioactivity}\ \thenum\ \ #1}}}



\newcounter{solnum}
\newcommand{\sol}[2]{\addtocounter{solnum}{1}
\medskip   \textbf{\textsf{ \thesolnum\ \ #1}}\\
\ \small{{#2}}}

%% environnement Exercice
\newcounter{ex}
\newenvironment{exercice}[1][]{%
	\pagebreak[3]
	\refstepcounter{ex}
	\vspace{0.5em}
	%\setcounter{equation}{0} %remise du compteur equation à zero
				  %à chaque nouvel exercice    
	{\large \textbf{\textsc{\textcolor{bleu_f}{{\LARGE\bomb}Exercice \theex}}}}
	\qquad{\large \textsl{#1}}
	
	\nopagebreak[4]}%
	{\par\addvspace{1em}}

%% Exercice avec référence au fichier inclus
\newcommand{\exo}[2][]{%
	\pagebreak[3]
	\refstepcounter{ex}
	\vspace{0.5em}
	%\setcounter{equation}{0} %remise du compteur equation à zero
				  %à chaque nouvel exercice    
	{\large \textbf{\textsc{\textcolor{bleu_f}{{\LARGE\bomb}Exercice \theex}}}}	
	\qquad{\large \textit{#1}}
	\hfill\makebox[0cm][r]{\scriptsize\textit{#2}}
	
	\nopagebreak[4]

	\input{#2}
	
	\addvspace{1em}}
%
%% Exercice sans référence au fichier inclus
\newcommand{\Exo}[2][]{%
	\pagebreak[3]
	\refstepcounter{ex}
	\vspace{0.5em}
	%\setcounter{equation}{0} %remise du compteur equation à zero
				  %à chaque nouvel exercice    
	{\large \textbf{\textsc{\textcolor{bleu_f}{{\LARGE\bomb}Exercice \theex}}}}	
	\qquad{\large \textit{#1}}
	
	\nopagebreak[4]

	\input{#2}
	
	\addvspace{1em}}

%  Théorèmes définitions

\newcounter{Def}
\newcommand{\Def}[1]{\addtocounter{Def}{1}  \textbf{Définition \theDef}}


\newcounter{Prop}
\newcommand{\Prop}[1]{\addtocounter{Prop}{1}  \textbf{Propriété \theProp}}
\newcommand{\Props}[1]{\addtocounter{Prop}{1}  \textbf{Propriétés \theProp}}


\newcounter{Th}
\newcommand{\Thm}[1]{\addtocounter{Th}{1}  \textbf{Théorème \theTh\ \ }}


% redéfini les labels dénumération


\renewcommand{\theenumi}{\arabic{enumi}}
        \renewcommand{\labelenumii}{\theenumii)}
\renewcommand{\theenumii}{\alph{enumii}}
        \renewcommand{\labelenumiii}{\theenumii)}
\renewcommand{\theenumiii}{\roman{enumii}}
\renewcommand{\un}{(u_n)_{n\in\bbn}\ }


% REMARQUE

\newcommand{\Remarque}[2][Remarque]{%
	\begin{description}
	\item[#1] #2
	\end{description}}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Pour inclure des illustrations dans du texte ou en parallèle
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\figpara}[2]{\begin{minipage}[t]{0.45\textwidth}\vspace{0cm}\begin{flushleft}\includegraphics[height=5cm]{#1.eps}\end{flushleft}\end{minipage}\hspace{0.5cm}\begin{minipage}[t]{0.45\textwidth}\vspace{-0.5cm}
\hspace{5.5cm}
\begin{flushright}\includegraphics[height=5cm]{#2.eps}\end{flushright}\end{minipage}}

\newcommand{\ill}[2]{\begin{minipage}[t]{0.75\textwidth}\vspace{0cm}#1\end{minipage}\hspace{0.5cm}\begin{minipage}[t]{0.2\textwidth}\vspace{-0.5cm}
\hspace{5.5cm} \begin{flushright}\includegraphics[height=5cm]{#2.eps}\end{flushright}\end{minipage}}


\newcommand{\illps}[3]{\begin{minipage}[t]{0.75\textwidth}\vspace{0cm}#1\end{minipage}\hspace{0.5cm}\begin{minipage}[t]{0.2\textwidth}\vspace{-0.5cm}
\hspace{5.5cm} \begin{flushright}\includegraphics[height=#3cm]{#2.ps}\end{flushright}\end{minipage}}

\newcommand{\illmp}[2]{\begin{minipage}[t]{0.65\textwidth}\vspace{0cm}#1\end{minipage}\hspace{0.5cm}\begin{minipage}[t]{0.3\textwidth}\vspace{-0.5cm}
\hspace{5.5cm} \begin{flushright}\includegraphics{#2}\caption{}\end{flushright}\end{minipage}}

\newcommand{\derniere}{
%numérotation des pages par rapport à la dernière
\makeatletter
\renewcommand{\@evenfoot}
    {\hfill
    page {\thepage}/\pageref{LastPage}
    \hfill}
\renewcommand{\@oddfoot}{\hfill
    page {\thepage}/\pageref{LastPage}
    \hfill}
\makeatother
%fin de la macro pour numéroter les pages
}


%%%% vieux trucs pour le bouquin
\newcommand{\bq}{\bbq}
\newcommand{\m}{Montrer que}
\newcommand{\Qcm}{\bigcirc\ }


\newcommand{\mg}{\mathversion{bold}}


\newcommand{\mat}{Téhessin}



\newcommand{\MAT}[1]{
\smallskip

{ \textbf{Téhessin} : #1}

\smallskip
}

\newcommand{\pro}{
\smallskip

 \textbf{Mathémator}~: }


\newcommand{\tsx}{
\smallskip

 \textbf{Téhessin}~: }


\newcommand{\MATA}[1]{
\smallskip

{ \textbf{Téhessin (à part)} : \textit{#1}} }

\newcommand{\REV}{\mat, vous rêvez ! Je vous entends !}









%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%            P S T ricks
%
%%%%%%%%%%%%%%%%%%%%%%


%%%% Trigonométrie

\newcommand{\Trigo}[1]{%
\begin{pspicture}(-11.25,-3.1)(5.63,3.1)

% Dessin du quadrillage
\psaxes[linewidth=0.6pt,xunit=.4375,yunit=2.5,labels=none]%
			{->}(0,0)(-12.5,-1.2)(12.75,1.2)
\psgrid[gridlabels=0,subgriddiv=0,gridwidth=0.2pt,%
			griddots=8,xunit=0.4375,yunit=.625]%
			(-12,-4)(12,4)
{\psset{xunit=.4375,yunit=2.5}
\uput{.2}[270](-12,0){\small $-2\pi$}
\uput{.2}[270](-6,0){\small $-\pi$}
\uput{.2}[235](0,0){\small $0$}
\uput{.2}[270](6,0){\small $\pi$}
\uput{.2}[270](12,0){\small $2\pi$}
\uput{.2}[180](0,1){\small $1$}
\uput{.2}[180](0,-1){\small $-1$}
\rput[t](-6,1.2){#1}}

% Dessin du cercle trigo
\psaxes[linewidth=0.6pt,unit=2.5,labels=none,ticks=none]%
			{->}(-8.5,0)(-9.5,-1)(-7.4,1.1)

\pscustom[linestyle=dashed,linewidth=0.1pt]{%
\translate(-8.5,0)
\SpecialCoor
\multido{\i=15+15}{24}{\psline(0,0)(2.5;\i)}}

\pscircle(-8.5,0){2.5}
\end{pspicture}}


% Dessine un repère spécial trigo 0 à 12 en x, -4 à 4 en y:
% Etiquettes :
% #1 : 6 en x
% #2 : 12 en x
% #3 : -2 en y
% #4 : 2 en y
\newcommand{\AxesTrigo}[4]
{\psaxes[linewidth=0.6pt,dx=0.5,dy=0.5,labels=none]%
			{->}(0,0)(-0.1,-2.4)(6.4,2.4)
\psgrid[gridlabels=0,subgriddiv=0,gridwidth=0.5pt,%
			griddots=5,unit=.5](0,-4)(12,4)
\uput{.2}[180](0,0){\small $0$}
\uput{.2}[270](3,0){\small $#1$}
\uput{.2}[270](6,0){\small $#2$}
\uput{.2}[180](0,1){\small $#3$}
\uput{.2}[180](0,-1){\small $#4$}
\rput[Bc](3,-2.8){$y=\points[3cm]$}}


% #3*sin(x*#1+#2)+#4
% où x varie entre 0 et 720
\newcommand{\CourbeTrigo}[4]
{\psplot[plotpoints=500]{0}{6}{x 120 mul #1 mul #2 add sin #3 mul #4 add}}



%%%% Une boule en dégradés

\newsavebox{\BBoule}

\begin{lrbox}{\BBoule}
\begin{pspicture}(-.3,-.3)(.3,.3)
\pscircle[fillstyle=solid,fillcolor=bleu_f](0,0){.4}

\setlength{\MYh}{0.25cm}
\multido{\n=0.30 + .01}{70}{%
	\newgray{mygray}{\n}
	\addtolength{\MYh}{-.003cm}
	\pscircle[fillstyle=solid,linestyle=none,fillcolor=mygray]%
		(.09,-.06){\MYh}}
\end{pspicture}
\end{lrbox}

\newcommand{\Boule}[1][.4]{\scalebox{#1}{\usebox{\BBoule}}}


%%%%%%%%%%% fonctions mathématiques pour Pstricks %%%%%%%%%%%%%%%

\newcommand{\ppi}{ 3.1416 }
\newcommand{\pe}{ 2.718 }
\newcommand{\prd}{ 180 \ppi div mul }                 %% transforme des rd en degres
\newcommand{\pdeg}{ \ppi mul 180 div }                %% transforme des degres en rd
\newcommand{\pExp}{ \pe exch exp }                    %% exponentielle
\newcommand{\pCos}{ \prd cos }                        %% cosinus (argument en radian)
\newcommand{\pSin}{ \prd sin }                        %% sinus (argument en radian)
\newcommand{\ptan}{ dup sin exch cos div }            %% tangente (argument en degré)
\newcommand{\pcotan}{ dup cos exch sin div }          %% cotangente (argument en degré)
\newcommand{\pTan}{ dup \pSin exch \pCos div }        %% tangente (argument en radian)
\newcommand{\pcoTan}{ dup \pCos exch \pSin div }      %% cotangente (argument en radian)
\newcommand{\parctan}{ dup 0 ge {1 atan} {neg 1 atan neg} ifelse }
                                                      %% arctan résultat en degré
\newcommand{\pArctan}{ \parctan \pdeg }               %% arctan résultat en radian
\newcommand{\parccos}{ dup dup mul neg 1 add sqrt exch atan } %% arccos -> degré
\newcommand{\pArccos}{ \parccos \pdeg }               %% arccos -> radian
\newcommand{\parcsin}{ dup dup mul neg 1 add sqrt atan dup 90 lt {} {360 sub} ifelse }
                                                      %% arcsin -> degré
\newcommand{\pArcsin}{ \parcsin \pdeg }               %% arcsin -> radian
\newcommand{\pcosh}{ dup \pExp exch neg \pExp add 2 div }     %% cosinus hyperbolique
\newcommand{\psinh}{ dup \pExp exch neg \pExp sub 2 div }     %% sinus hyperbolique
\newcommand{\ptanh}{ dup \psinh exch \pcosh div }     %% tangente hyperbolique
\newcommand{\pcotanh}{ dup \pcosh exch \psinh div }   %% cotangente hyperbolique
\newcommand{\pfactorielle}{ dup 0 eq {pop 1} {dup 1 sub \pfactorielle mul} ifelse }
                                                      %% factorielle
\newcommand{\parctanh}{ dup 1 add exch neg 1 add  div sqrt ln }
                                                      %% tangente hyperbolique inverse
\newcommand{\parcsinh}{ dup 2 exp 1 add sqrt add ln } %% sinus hyperbolique inverse
\newcommand{\parccosh}{ dup 2 exp 1 sub sqrt add ln } %% cosinus hyperbolique inverse


%%%% Style des grilles
\newpsstyle{grille}{gridlabels=0,subgriddiv=0,gridwidth=0.5pt,griddots=10}

\newcommand{\MaGrille}[5][10]{%
	\psgrid[gridlabels=0,%
	        subgriddiv=0,%
			gridwidth=0.5pt,%
			griddots=#1](0,0)(#2,#3)(#4,#5)}

\newcommand{\MesAxes}[5][.6pt]{%
	{\footnotesize
	\psaxes[labelsep=3pt,ticksize=2pt,linewidth=#1]{->}(0,0)(#2,#3)(#4,#5)
	\pnode(#4,0){XX}\pnode(0,#5){YY}}}

\newcommand{\MesAxesEtiquettes}[2]{%
	\SpecialCoor
	\uput{.2cm}[270](XX){#1}
	\uput{.2cm}[180](YY){#2}}

\newcommand{\MonRepereij}{%
	\psline[arrowsize=3pt 3,linewidth=1.2pt]{<->}(1,0)(0,0)(0,1)
	\uput{.2cm}[270](0.5,0){$\vec{\imath}$}
	\uput{.25cm}[180](0,0.5){$\vec{\jmath}$}}

\newcommand{\MonRepereuv}{%
	\psline[arrowsize=3pt 3,linewidth=1.2pt]{<->}(1,0)(0,0)(0,1)
	\uput{.2cm}[270](0.5,0){$\vec{u}$}
	\uput{.25cm}[180](0,0.5){$\vec{v}$}}

\newcommand{\Origine}{\uput{.2}[225](0,0){$o$}}

%%%% Mes pointillés
\newpsstyle{pointilles}{linewidth=0.015,linestyle=dashed,%
		dash=0.015 0.085,arrows=cc-cc}

%%%% hachures plus fines dans les 2 sens
\newpsstyle{hachured}{fillstyle=hlines,hatchwidth=0.2pt,hatchsep=2pt}
\newpsstyle{hachureg}{fillstyle=vlines,hatchwidth=0.2pt,hatchsep=2pt}

%%%% tangente et asymptote
\newpsstyle{tangente}{arrowsize=3pt 3,linewidth=.8pt}
\newpsstyle{asymptote}{linestyle=dashed,linewidth=.3pt}

%%% Faire une tangente
\newcommand{\Tangente}[5][<->]{%
	\pscustom[style=tangente]{%
	\translate#2\rotate{#3}
	\psline{#1}(#4,0)(#5,0)}
	\psdots#2}

%%% Prolongement par continuité
%\makeatletter
\def\psas@d{
/SD {-30 210 arc stroke} def
{\pst@usecolor\psfillcolor true} false \psk@dotsize
  \tx@EndDot
/SD {0 360 arc fill} def
}
%\makeatother


%%%% Des gris
\newgray{grisclair}{.75}
\newgray{grismoyen}{.50}
\newgray{grisfonce}{.25}

%%%% Papier millimétré x*y en cm
\newcommand{\PapierMill}[2]{%
	\begin{pspicture*}(0,0)(#1,#2)
	
	\psgrid[gridwidth=0.3pt,
		gridlabels=0,
		subgriddiv=10,
		subgridcolor=black,
		subgridwidth=0.05pt](0,0)(21,29.7) % il faut être sûr
				% que ça dépasse, sinon il y a des soucis avec
				% des lignes qui ne vont pas jusqu'au bout
				% à cause des arrondis entier de multido
				% pspicture* coupe aux bonnes dimensions
	
	% Grille de 5cm en 5cm
	\psgrid[xunit=5,yunit=5,gridwidth=0.5pt,
		gridlabels=0,
		subgriddiv=0](0,0)(#1,#2)%
		
	\psline[linewidth=1.5pt](0,0)(0,#2)(#1,#2)(#1,0)(0,0)	
	\end{pspicture*}
	}


%%
%% End of file `polytar.cls'.
