%!
% PostScript prologue for pstricks-add.tex.
% Version 0.01, 2005/09/27
% For distribution, see pstricks.tex.
%
%       HISTORY
% 2005/09/28 : - rename it to pstricks-add.pro
%              - agg support for Gouraud shading
% 2005/05/20 : small (unimportant) changes (hv)
% 2005/02/25 : white space removal from expression
% 2004/12/16 : addition of SUM and IFTE
% 2004/11/14 : correction of a priority problem
%              ^ before unary - (new rule FS)
/tx@addDict 410 dict def tx@addDict begin
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Pi and Euler are defined in pstricks.pro
/PIdiv2 1.57079632680 def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PS ANALYZER FOR ALGEBRAIC EXPRESSION V1.12
% E->T|E+T
% T->FS|T*FS                                  %%% NEW 2004/11/14
% FS -> F | +SF | -SF                         %%% NEW 2004/11/14
% F->P|F^P                                    %%% OLD
% F->P|F^SF                                   %%% NEW 2004/11/14  ???? ^FS
% P->(E)|literal
% literal->number|var|var[E]|func(params)%%|-P|+P%%% OLD
% params->E|E,param
%
% E expression, T term, SF signed factor, F factor, P power
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% parser
%% str -> [ LIFO vector ]
/AlgParser { InitParser SetExpr LexStr 0 exch AnalyzeListOfE ExpressionVector /ExpressionVector [] def} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/SetExpr { RemoveWS /ExpressionString exch def } def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/InitParser {
  /ExpressionVector [] def  /AddVector [] def
  /AddVectorfree [] def     /MulVector [] def
  /MulVectorfree [] def     /PowVector [] def
  /PowVectorfree [] def     /OpParVector [] def
  /ClParVector [] def       /ParVectorFree [] def
  %%/CompVector [] def      /CompVectorFree [] def
  /BraVector [] def         /SemVector [] def
  /ComVector [] def         /ExpressionVector [] def
  /LoopLevel -1 def         /LoopContext [] def     %%% NEW for SUM function
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/FLbreak { tst not {/L exch def /F exch def 2 copy L eq exch F eq and /tst exch def} {pop pop} ifelse} def
/Negbreak { tst not { dup 0 lt /tst exch def } if } def
/STOP { tst {TOUF} if} def
/tst false def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% analyze Expression List
%% first last
/AnalyzeListOfE {
  exch SemVector {
    exch 1 index 1 sub AnalyzeExpr 1 add
  } forall%%last_char
  exch AnalyzeExpr
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% analyze Expr
%% first last
/AnalyzeExpr {
  FindFirstAdd%% first last pos+
  2 copy abs 1 sub ne
  { 3 -1 roll 1 index abs 1 sub AnalyzeExpr dup abs 1 add 3 -1 roll  AnalyzeTerm EvalAdd }
  { pop AnalyzeTerm } ifelse 
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% analyze Term
%% first last
/AnalyzeTerm {%%19 28 FLbreak STOP
  FindFirstMul%% first last pos*
  2 copy abs 1 sub ne
  { 3 -1 roll 1 index abs 1 sub AnalyzeTerm dup abs 1 add 3 -1 roll  AnalyzeSignedFactor EvalMul }%%% NEW 2004/11/14
  { pop AnalyzeSignedFactor } ifelse%%% NEW 2004/11/14
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% NEW 2004/11/14
%% analyze Signed Factor
%% first last ->
/AnalyzeSignedFactor {
  ExpressionString 2 index get
  dup 45 eq%% a - sign
  { pop exch 1 add exch AnalyzeSignedFactor EvalNeg }
  { 43 eq%%a + sign
    { exch 1 add exch AnalyzeSignedFactor }
    { AnalyzeFactor } ifelse } ifelse
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% analyze Factor
%% first last ->
/AnalyzeFactor {
  FindFirstPow%% first last pos*
  2 copy abs 1 sub ne
%  { 3 -1 roll 1 index abs 1 sub AnalyzeFactor dup abs 1 add 3 -1 roll  AnalyzePower EvalPow }
  { 3 -1 roll 1 index abs 1 sub AnalyzeFactor dup abs 1 add 3 -1 roll  AnalyzeSignedFactor EvalPow }% NEW 2004/11/14
  { pop AnalyzePower } ifelse
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% analyze Power
%% first last ->
/compteur 0 def 
/AnalyzePower {
  ExpressionString 2 index get
  dup 40 eq%% an open parenthesis
  { pop 1 index UnfreePar 1 sub exch 1 add exch AnalyzeExpr }
  {  dup 45 eq%% a - sign
    { pop exch 1 add exch AnalyzePower EvalNeg }
    { dup 43 eq%%a + sign
      { pop exch 1 add exch AnalyzePower }
      { dup 46 eq 1 index 48 ge 2 index 57 le and or%%a digit or a dot
        { pop AnalyzeNumber }
        { pop AnalyzeLiteral } ifelse } ifelse } ifelse } ifelse
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% analyze parameters list
%% first last
/AnalyzeParam {
  { FindFirstCom%% first last pos,
    3 -1 roll 1 index 1 sub AnalyzeExpr
    2 copy 1 sub ne { 1 add exch } { pop pop exit } ifelse
  } loop
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Find the eventual addition at this level
%% first last -> position
/FindFirstAdd {
  2 copy /Last exch def /First exch def false 0
  AddVector {
    AddVectorFree 2 index get
    { /pos exch def
      %% if it is in the current part of the analysed expr
      pos abs First gt pos abs Last lt and
      { true 0 1 ClParVector length
        dup 0 eq%% no parenthesis
        { pop pop pop pop exch not exch exit }
        { 1 sub
          { ParVectorFree 1 index get
            { OpParVector 1 index get pos abs lt%% in this parenthesis level
              ClParVector 2 index get pos abs gt and
              { pop pop false exit } if%%then exit loop
            } if
            pop } for
          { pop pop true dup exit } if } ifelse } if
    } { pop } ifelse
    1 add
  } forall
  pop
  { pos UnfreeAdd} %% find one mul
  { Last 1 add } ifelse
} def
%%   {
%%    2 copy /Last exch def /First exch def false 0
%%    AddVector {
%%      AddVectorFree 2 index get
%%      { /pos exch def
%%        true 0 1 ClParVector length 1 sub
%%        { ParVectorFree 1 index get
%%          { OpParVector 1 index get pos abs le
%%            ClParVector 2 index get pos abs ge and
%%            pos abs First lt pos abs Last gt or or
%%            { pop pop false exit } if
%%          } if
%%          pop
%%        } for
%%        { pop pop true dup exit } if
%%      }
%%      { pop } ifelse
%%      1 add
%%    } forall
%%    pop
%%    { pos UnfreeAdd}%% find one add
%%    { Last 1 add } ifelse
%%  } def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Find the eventual multiplication at this level
%% first last -> first last position
/FindFirstMul {
  2 copy /Last exch def /First exch def false 0
  MulVector {
    MulVectorFree 2 index get
    { /pos exch def
      %% if it is in the current part of the analysed expr
      pos abs First gt pos abs Last lt and
      { true 0 1 ClParVector length
        dup 0 eq%% no parenthesis
        { pop pop pop pop exch not exch exit }
        { 1 sub
          { ParVectorFree 1 index get
            { OpParVector 1 index get pos abs lt%% in this parenthesis level
              ClParVector 2 index get pos abs gt and
              { pop pop false exit } if%%then exit loop
            } if
            pop } for
          { pop pop true dup exit } if } ifelse } if
    } { pop } ifelse
    1 add
  } forall
  pop
  { pos UnfreeMul} %% find one mul
  { Last 1 add } ifelse
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Find the eventual power at this level
%% first last -> first last position
/FindFirstPow {
  2 copy /Last exch def /First exch def false 0
  PowVector {
    PowVectorFree 2 index get
    { /pos exch def
      %% if it is in the current part of the analysed expr
      pos First gt pos Last lt and
      { true 0 1 ClParVector length
        dup 0 eq%% no parenthesis
        { pop pop pop pop exch not exch exit }
        { 1 sub
          { ParVectorFree 1 index get
            { OpParVector 1 index get pos abs lt%% in this parenthesis level
              ClParVector 2 index get pos abs gt and
              { pop pop false exit } if%%then exit loop
            } if
            pop } for
          { pop pop true dup exit } if } ifelse } if
    } { pop } ifelse
    1 add
  } forall
  pop
  { pos UnfreePow} %% find one ^
  { Last 1 add } ifelse
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Find the eventual comma at this level
%% first last -> first last position
/FindFirstCom {
  2 copy /Last exch def /First exch def false 0
  ComVector {
    ComVectorFree 2 index get
    { /pos exch def
      %% if it is in the current part of the analysed expr
      pos First gt pos Last lt and
      { true 0 1 ClParVector length
        dup 0 eq%% no parenthesisSTOP 
        { pop pop pop pop exch not exch exit }
        { 1 sub
          { ParVectorFree 1 index get
            { OpParVector 1 index get pos abs lt%% in this parenthesis level
              ClParVector 2 index get pos abs gt and
              { pop pop false exit } if%%then exit loop
            } if
            pop } for
          { pop pop true dup exit } if } ifelse } if
    } { pop } ifelse
    1 add
  } forall
  pop
  { pos UnfreeCom} %% find one comma
  { Last 1 add } ifelse
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Find the first opened parenthesis (only for func call)
%% first last -> first last position
/FindFirstPar {
  2 copy /Last exch def /First exch def false 0
  OpParVector {
    ParVectorFree 2 index get
    { /pos exch def
      pos First gt pos Last lt and
      { exch not exch exit } if
    } { pop } ifelse
    1 add
  } forall
  pop
  { pos dup UnfreePar }%% find one par
  { Last 1 add } ifelse
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Find the first opening bracket
%% first last -> first last position
/FindFirstBra {
  2 copy /Last exch def /First exch def
  BraVector {
    /pos exch def
    pos First gt pos Last lt and
    { exit } if
  } forall
  pos dup UnfreePar%% finding it is mandatory
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Read the number and push it in the vector
%% first last -> 
/AnalyzeNumber {
  1 index sub 1 add ExpressionString 3 1 roll getinterval cvr /n exch def
  /ExpressionVector ExpressionVector aload length n exch 1 add array astore def
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Read the literal and push it in the vector
%% first last -> 
/AnalyzeLiteral {
  ExpressionString 1 index get dup 41 eq %%close par at the end => function call
  { pop FindFirstPar%%first last parpos
    ExpressionString 3 index dup 3 index exch sub getinterval
    dup (SUM) eq { sumation }
    { dup (IFTE) eq { condition }
      { 1 index 1 add 3 index 1 sub AnalyzeParam
        dup cvn /n exch def TrigoFunc
        /ExpressionVector ExpressionVector aload length
        /tx@addDict cvx /begin cvx n cvx /end cvx 5 -1 roll 4 add array astore def
        %%n cvx exch 1 add array astore def
        pop pop pop } ifelse } ifelse }
  { 93 eq%%close bracket => vector element
    { FindFirstBra%%first last brapos
      ExpressionString 3 index dup 3 index exch sub getinterval cvn /n exch def
      /ExpressionVector ExpressionVector aload length n cvx exch 1 add array astore def
      2 copy 1 add exch 1 sub AnalyzeExpr
      /ExpressionVector ExpressionVector aload length /cvi cvx exch /get cvx exch 2 add array astore def
      pop pop pop
    }
    { 1 index sub 1 add ExpressionString 3 1 roll getinterval cvn /n exch def
     /ExpressionVector ExpressionVector aload length n cvx exch 1 add array astore def } ifelse } ifelse
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% push add in the vector
%% kind -> 
%% if kind>0 then add else sub
/EvalAdd {
  /ExpressionVector ExpressionVector aload length dup 3 add -1 roll
  0 gt { /add } { /sub } ifelse cvx exch 1 add array astore def
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% push mul in the vector
%% -> 
/EvalMul {
  /ExpressionVector ExpressionVector aload length dup 3 add -1 roll
  0 gt { /mul } { /div } ifelse cvx exch 1 add  array astore def
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% push exp in the vector
%% -> 
/EvalPow {
  pop /ExpressionVector ExpressionVector aload length
  /tx@addDict cvx exch /begin cvx exch /EXP cvx exch /end cvx exch 4 add array astore def
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% push neg in the vector
%% -> 
/EvalNeg {
  /ExpressionVector ExpressionVector aload length /neg cvx exch 1 add array astore def
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Lexical Analyzis of the string
%% -> 
/LexStr {
  /freepar 0 def /lastpar 0 def /lastchar 0 def
  0 ExpressionString
  { dup 40 eq 1 index 91 eq or %% open parenthesis
    { /OpParVector OpParVector aload length dup 3 add index exch 1 add array astore def
      /ClParVector ClParVector aload length -1 exch 1 add array astore def
      /lastpar freepar def /freepar freepar 1 add def /NoPar false def} if
    dup 41 eq 1 index 93 eq or %% close parenthesis
    { ClParVector lastpar 3 index put lastpar
      dup 0 eq
      { pop }
      { { 1 sub dup ClParVector exch get -1 eq { /lastpar exch def exit } { dup 0 eq { pop exit} if } ifelse } loop }
      ifelse } if
    dup 42 eq %% * operator
    %%{ /MulVector MulVector aload length dup 3 add index exch 1 add array astore def } if
    { /MulVector 2 index MulVector aload length 1 add array astore def } if
    dup 43 eq %% + operator
    { %%test if it is a real operator and not the unary operator
      lastchar dup  40 ne      %% open parenthesis
           1 index  59 ne and  %% ;
           1 index  42 ne and  %% *
           1 index  43 ne and  %% +
           1 index  44 ne and  %% ,
           1 index  45 ne and  %% -
           1 index  47 ne and  %% /
           1 index   0 ne and  %% first char
           1 index  94 ne and  %% ^%%2004/11/14
              exch 124 ne and  %% |
      %%{/AddVector AddVector aload length dup 3 add index exch 1 add array astore def } if}
      {/AddVector 2 index AddVector aload length 1 add array astore def } if}
    if
    dup 44 eq %% , separator
    { /ComVector ComVector aload length dup 3 add index exch 1 add array astore def }
    if
    dup 45 eq %% - operator
    { %%test if it is a real operator and not the unary operator
      lastchar dup  40 ne      %% open parenthesis
           1 index  59 ne and  %% ;
           1 index  42 ne and  %% *
           1 index  43 ne and  %% +
           1 index  44 ne and  %% ,
           1 index  45 ne and  %% -
           1 index  47 ne and  %% /
           1 index   0 ne and  %% first char
           1 index  94 ne and  %% ^%%2004/11/14
              exch 124 ne and  %% |
      %%{/AddVector AddVector aload length dup 3 add index neg exch 1 add array astore def } if}
      {/AddVector 2 index neg AddVector aload length 1 add array astore def } if}
    if
    dup 47 eq %% / operator
    %%{ /MulVector MulVector aload length dup 3 add index neg exch 1 add array astore def }
    { /MulVector 2 index neg MulVector aload length 1 add array astore def }
    if
    dup 59 eq 1 index 124 eq or%% ; separator |
    { /SemVector SemVector aload length dup 3 add index exch 1 add array astore def }
    if
    dup 91 eq %% open bracket
    { /BraVector BraVector aload length dup 3 add index exch 1 add array astore def }
    if
    dup 94 eq %% ^ operator
    %%{ /PowVector PowVector aload length dup 3 add index exch 1 add array astore def }
    { /PowVector 2 index PowVector aload length 1 add array astore def }%%2004/11/14
    if
    /lastchar exch def 1 add
  } forall
  /AddVectorFree AddVector CreateFree def
  /MulVectorFree MulVector CreateFree def
  /ParVectorFree OpParVector CreateFree def
  /PowVectorFree PowVector CreateFree def
  /ComVectorFree ComVector CreateFree def
  1 sub
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Create Free vector
%% ->
/CreateFree {
  dup length array exch
  { pop true exch } forall astore
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Unfree parenthesis
%% pos ->
/UnfreePar {
  /pos exch def ParVectorFree 0
  OpParVector { pos eq { exit } if 1 add } forall
  false put
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Unfree mul
%% pos ->
/UnfreeMul {
  MulVectorFree 0
  MulVector { pos eq { exit } if 1 add } forall
  false put
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Unfree add
%% pos ->
/UnfreeAdd {
  AddVectorFree 0
  AddVector { pos eq { exit } if 1 add } forall
  false put
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Unfree exp
%% pos ->
/UnfreePow {
  PowVectorFree 0
  PowVector { pos eq { exit } if 1 add } forall
  false put
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Unfree com
%% pos ->
/UnfreeCom {
  ComVectorFree 0
  ComVector { pos eq { exit } if 1 add } forall
  false put
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Convert to radians if trigo function call
%% (name) ->
/TrigoFunc {
  dup (cos) eq 1 index (sin) eq or exch (tan) eq or
  { /ExpressionVector ExpressionVector aload length 3.14159265359 /div cvx 180 /mul cvx 5 -1 roll 4 add
    array astore def
  } if
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% the condition function
%%  ->
/condition {
  %% manage the condition
  1 index 1 add 3 index 1 sub FindFirstCom
  %% find the test char <,>,=,!
  4 index 1 index 1 sub FindTestChar
  4 index 2 index 1 sub AnalyzeExpr 3 1 roll
  1 add 1 index 1 sub AnalyzeExpr exch
  /ExpressionVector ExpressionVector aload length dup 1 add array exch 3 add -1 roll cvx exch astore def
  %% manage the then clause
  MngClause
  %% manage the else clause
  MngClause
  /ExpressionVector ExpressionVector aload length 1 add /ifelse cvx exch array astore def
  mark 8 1 roll cleartomark
} def
/FindTestChar {
  1 exch
  { dup ExpressionString exch get
    dup 60 eq { pop /lt exit } if%%<
    dup 61 eq { pop /eq exit } if%%=
    dup 62 eq { pop /gt exit } if%%>
    pop pop } for
} def
/MngClause {
  3 1 roll FindFirstCom 4 -1 roll 1 add 1 index 1 sub
  /ExpressionVector ExpressionVector exch [] def 3 1 roll AnalyzeExpr
  /ExpressionVector exch aload length 1 add ExpressionVector cvx exch array astore def
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% the sumation function
%%  ->
/sumation {
  /LoopLevel LoopLevel 1 add def
  %% create the accumulator
  /ExpressionVector ExpressionVector aload length 1 add 0 exch array astore def
  %% read the variable name
  1 index 1 add 3 index 1 sub FindFirstCom
  ExpressionString 4 -1 roll 2 index 1 index sub getinterval cvn
  /tempvar exch def
  %% read the initial value
  GetNextNumber
  /ExpressionVector ExpressionVector aload length 1 add temp exch array astore def
  %% read the increment value
  GetNextNumber
  /ExpressionVector ExpressionVector aload length 1 add temp exch array astore def
  %% read the limit value
  GetNextNumber
  /ExpressionVector ExpressionVector aload length 1 add temp exch array astore def
  /LoopContext LoopContext aload length 1 add ExpressionVector exch array astore def
  /ExpressionVector [ tempvar /exch cvx /def cvx ] def
  1 add exch AnalyzeExpr
  %% add each term of the sum
  /ExpressionVector ExpressionVector aload length 1 add /add cvx exch array astore def
  /ExpressionVector LoopContext LoopLevel get aload length 2 add
  ExpressionVector cvx exch /for cvx exch array astore def pop pop pop pop } def
/GetNextNumber {
  exch FindFirstCom ExpressionString 4 -1 roll 1 add 2 index 1 index sub getinterval cvi
  /temp exch def } def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% METHODS FUNC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% MISC FUNC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/RemoveWS {%
  dup length
  0 2 index { 32 ne { 1 add } if } forall
  2 copy ne
  { exch pop string 0 2 index
    { dup 32 ne { 2 index 2 index 3 -1 roll put 1 add } { pop } ifelse } forall
    pop exch pop } { pop pop } ifelse
} def
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% NEW FUNC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Make a discrete sum
%% var n begin end expr ->
/SUM {} def
%% function arcsine in radians
%% x -> theta
/asin {%
  dup abs 1 gt { EQDFasinrangeerror  } if
  dup abs 1 eq
  { PIdiv2 exch -1 eq { neg } if }
  { .1 %% asin(x)
    { dup dup PI div 180 mul sin 3 index sub exch PI div 180 mul cos div
      dup abs 1e-6 lt { sub exit } if sub
    } loop
    exch pop } ifelse
} def
%% function arccosine in radians
%% x -> theta
/acos {%
  dup abs 1 gt { EQDFacosrangeerror  } if
  dup abs 1 eq
  { -1 eq { PI } { 0 } ifelse }
  { 1.5 %% asin(x)
    { dup dup PI div 180 mul cos 3 index sub exch PI div 180 mul sin neg div
      dup abs 1e-6 lt { sub exit } if sub
    } loop
    exch pop } ifelse
} def
%% factorial function
%% n -> n!
/fact { 1 exch 2 exch 1 exch { mul } for } def

%end

%% modified exponential funtion for 0
%% x n -> x^n
/EXP { dup 0 eq { pop pop 1 } { exp } ifelse } def
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/GTriangle {
  gsave
  /mtrx CM def
  /colorA ED /colorB ED /colorC ED % save the colors
  /xA ED /yA ED               % save the origin
  xA yA translate
  rotate               % \psk@gangle
  /yB ED /xB ED /yC ED /xC ED      % save other coordinates
  /ds [                % save data in a array
     0 0 0 colorA aload pop       % fd x y xr xg xb
     0 xB xA sub yB yA sub colorB aload pop
     0 xC xA sub yC yA sub colorC aload pop
%     1 xC xB add yB colorA aload pop  % for use with 4 points ABCD
  ] def
  newpath
  <<
  /ShadingType 4           % single Gouraud
  /ColorSpace [ /DeviceRGB ]
  /DataSource ds
  >>
  shfill
  closepath
  mtrx
  setmatrix grestore} def  
%
%% convertisseur longueur d'onde ->R,G,B       Manuel Luque
%% lambda max=780 nanomètres
%% lambda min=380 nanomètres
%% adaptation de :
%% http://www.physics.sfasu.edu/astro/color.html
%% www.efg2.com/lab
%
/Gamma 0.8 def
/calculateRGB {
  lambda 379 le {/Red 0 def /Green 0 def /Blue 0 def} if
  lambda 781 ge {/Red 0 def /Green 0 def /Blue 0 def} if
  lambda 380 ge {lambda 439 le {
    /R {lambda 440 sub neg 440 380 sub div} def
    /Red R factor mul Gamma exp def
    /G 0 def
    /Green G factor mul Gamma exp def
    /B 1 def
    /Blue B factor mul Gamma exp def} if
  } if
  lambda 440 ge { lambda 489 le {
    /G {lambda 440 sub 490 440 sub div} def
    /Green G factor mul Gamma exp def
    /R 0 def /Red 0 def
    /B 1 def
    /Blue B factor mul Gamma exp def } if
  } if
  lambda 490 ge {lambda 509 le {
    /B {lambda 510 sub neg 510 490 sub div} def
    /Blue B factor mul Gamma exp def
    /R 0 def /Red 0 def
    /G 1 def
    /Green G factor mul Gamma exp def } if
  } if
  lambda 510 ge {lambda 579 le {
    /R {lambda 510 sub 580 510 sub div } def
    /Red R factor mul Gamma exp def
    /Blue 0 def
    /G 1 def
    /Green G factor mul Gamma exp def } if
  } if
  lambda 580 ge {lambda 644 le {
    /G {lambda 645 sub neg 645 580 sub div } def
    /Green G factor mul Gamma exp def
    /Blue 0 def
    /R 1 def
    /Red R factor mul Gamma exp def } if
  } if
  lambda 645 ge { lambda 780 le {
    /Red 1 factor mul Gamma exp def
    /Blue 0 def
    /Green 0 def } if
  } if
} def
%
/factor {
  lambda 380 ge {lambda 419 le { 0.3 0.7 lambda 380 sub mul 420 380 sub div add} if } if
  lambda 420 ge {lambda 700 le { 1 } if } if
  lambda 701 ge {lambda 780 le { 0.3 0.7 780 lambda sub mul 780 700 sub div add} if } if
} def

/wavelengthToRGB { % the wavelength in nm must be on top of the stack
  /lambda exch def
  calculateRGB
} def


/axfill {
    8 dict begin
    /xw exch def /nl exch def
    /C1 exch def /y1 exch def/x1 exch def
    /C0 exch def /y0 exch def/x0 exch def
    <<  /ShadingType 2
        /ColorSpace /DeviceRGB
        /Coords [ x0 y0 x1 y1 ]
        /EmulatorHints [ xw 2 div dup ]
        /Function <<
            /FunctionType 2
            /Domain [0 1]
            /C0 C0
            /C1 C1
            /N      1
        >>
    >> shfill
    end
} bind def

systemdict /shfill known not {

/Emulate_shfill 32 dict def Emulate_shfill begin

/NumberOfLayers 128 def
    
/assert { not { (assert) /typecheck signalerror} if } bind def
/assert /pop load def

% generic interpolation
% takes two n-arrays, returns a hopefully optimized procedure taking one
% argument, and returning a correct blend of the two arrays (hence an
% n-array)
/interpolating_function {
    10 dict begin /a1 exch def /a0 exch def
    a0 length a1 length eq assert
    [ /mark load /exch load
    0 1 a0 length 1 sub { /i exch def /dup load a1 i get a0 i get sub /mul load a0 i get /add load /exch load } for /pop load (]) cvn load ] cvx end
} bind def

% Emulates (rather poorly) a radial or axial fill.
% For radial fills, we _require_ that the inner circle be specified
% first.
% For axial fills, the ``Extend'' behaviour is ignored, and we _require_
% an additional parameters in the dictionary, named EmulatorHints. It's a
% 2-array denoting the left and right extent of the area to paint. These
% are taken as multiples of the vector orthogonal to the direction vector.
/xshfill { begin gsave
    % do some checks.
    Function begin FunctionType 2 eq assert
    Domain 0 get 0 eq Domain 1 get 1 eq and assert end
    ColorSpace setcolorspace
    % we assume ll2 at least, so that dicts can be extended. anyway
    % the syntax we request is ll2 only.
    /mkcol Function begin C0 C1 end interpolating_function bind def
    ShadingType 3 eq {
        /mkcoords
        [ Coords cvx exec 7 3 roll ] [ 5 -3 roll ]
        interpolating_function
        bind def
        /one { newpath mkcoords cvx dup exec 3 -1 roll add exch moveto
        exec 0 360 arc fill } bind def
    } if
    ShadingType 2 eq {
        /dv [ Coords cvx exec exch 4 1 roll exch sub 3 1 roll sub exch
        ] cvx def % normal vector
        /nv [ dv neg exch ] cvx def
        /mkcoords
        [ Coords cvx exec 5 2 roll nv
        exch 4 -1 roll exch EmulatorHints 0 get mul add
        3 1 roll EmulatorHints 0 get mul add ]
        [ 4 -2 roll nv
        exch 4 -1 roll exch EmulatorHints 0 get mul add
        3 1 roll EmulatorHints 0 get mul add ]
        interpolating_function
        % rescale to adapt to our reverse scan behaviour.
        /dv [ dv neg NumberOfLayers div exch neg NumberOfLayers div exch ] cvx def
        /bnv [ nv EmulatorHints cvx exec add mul exch
        EmulatorHints cvx exec add mul exch  ] cvx def
        /nv [ bnv neg exch neg exch  ] cvx def
        bind def
        /one { newpath mkcoords cvx exec moveto
            nv rlineto 
            dv rlineto
            bnv rlineto 
            closepath fill } bind def
    } if
    % The space is traversed backwards, since it is more customary
    % for me at least to put the inner circle first for radial fills.
    % For axial fills, this does not matter afaict.
    1 1 NumberOfLayers div neg 0
    { dup Function /N get exp mkcol cvx exec setcolor one }
    for
    grestore end
} bind def

end
userdict /shfill { Emulate_shfill begin xshfill end } bind put } if

end

% END pst-eqdf.pro
