%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 3D extensions for MetaPost by Anthony Phan.
% file: m3Dmanual.mp
% last modification: january 11, 2006
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Licence? Feel-free-to-send-me-a-postcard
%
% Anthony Phan, 
%
% D\'epartement de Math\'ematiques, 
% SP2MI, T\'el\'eport 2, 
% Boulevard Marie et Pierre Curie, 
% BP 30179, 
% F-86962 Futuroscope-Chasseneuil cedex.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

input m3Dplain.mp; % core
% input m3Dsty01.mp; % style file, loaded with m3Dplain.mp
input m3Dlib01.mp; % library of some common mathematical objects

% some style parameters
Resolution := 1mm;
ObsZ:=10cm;
Contrast := 1;
Luminosity:=1;
Specularity:=1;
Phong:=3;
Fog := 1;
FogHalf := 2cm;
FogZ:=0;
LightAtInfinity:=false;
LightSource:=(0,0.5ObsZ,0.5ObsZ);
ProjectionSystem planar;
% this is practical
fignumber = 0;
vardef thisfig = fignumber := fignumber+1; fignumber enddef;

let Fill = TechnoFill;
ShadedTextFlag := true;
TextColor := red;
beginfig(thisfig);
  interim ObsZ := 10cm;
  interim prologues := 1;
  OnDepth;
    Refpoint(1,0,0);
    Action
    (UseObject(rope, Origin, (0, 90, 0), 1cm, 
	"cosd(t*90)", "0", "t", 0.25, -3, 0, true, false));
    Refpoint(-1,0,0);
    Action
    (UseObject(rope, Origin, (0, 90, 0), 1cm, 
	"cosd(t*90)", "0", "t", 0.25, 0, 3, false, true));
    for $ = 0 step 45 until 315:
      Refpoint Dir($+95,0);
      Action
      (UseObject(simpletext, Origin, ($+95, 0, 90), 10pt, "left", "ulft",
	  "Come let me sing into your ear;",
	  "Those dancing days are gone,",
	  "All that silk and satin gear;",
	  "Crouch upon a stone,",
	  "Wrapping that foul body up",
	  "In as foul a rag:",
	  "I carry the sun in a golden cup;",
	  "The moon in a silver bag."));
    endfor
  endOnDepth;
endfig;

let Fill = WireFill;
beginfig(thisfig);
  ObjectColor := (1, 215/255, 0);
  for $ = -2 upto 2:
    UseObject(rope, Origin, (0, -90, 0), 1cm, 
      "cosd(t*360)", "sind(t*360)", "t", 0.25, $-0.5, $, 
      if $ = -2: true else: false fi, false); endfor
  ObjectColor := 0.5white;
  UseObject(cylinder, (-2.5cm, 0, 0), (0, -90, 0), 1cm, 0.4, 5);
  ObjectColor := (1, 215/255, 0);
  for $ = -2 upto 2:
    UseObject(rope, Origin, (0, -90, 0), 1cm, 
      "cosd(t*360)", "sind(t*360)", "t", 0.25, $, $+0.5, 
      if $ = 2: true else: false fi, false); endfor
endfig;

ObjectColor:=0.75white;

let Fill = SolidFill;
beginfig(thisfig);
  UseObject(sierpinski_sponge, Origin, (10,0,0), 2cm, 2);
endfig;

let Fill = SolidWireFill;
beginfig(thisfig);
  UseObject(sierpinski_gasket, Origin, (30,0,0), 2cm, 5);
endfig;

let Fill = SolidFill;
% beginfig(thisfig);
%   ObjectColor := (0.5, 0.5, 0.5);
%   ObjectPath := (1, 1)...(0.5, 0)...(1, -1);
%   Outside; UseSubObject1(torus, (0, 0, 0), Origin, 1cm, 1.25, 0.25);
%   Inside; UseObject(revolution, Origin, Origin, 1cm, ObjectPath);
%   Outside;
%   UseObject(sphere, (0, 0, -1.5cm), Origin, 0.5cm);
%   SpheresLink((0, 0, -1.5cm), (0, 0, 1.5cm), 0.5cm, 0.5cm, 0.25cm);
%   UseObject(sphere, (0, 0, 1.5cm), Origin, 0.5cm);
%   UseObject(revolution, Origin, Origin, 1cm, ObjectPath);
%   UseSubObject2(torus, (0, 0, 0), Origin, 1cm, 1.25, 0.25);
% endfig;

beginfig(thisfig);
  save u; u=3cm;
  ObjectColor := (1, 215/255, 0);
  ObjectPath :=
  (eps, 0.65){right}
  ...{up}(0.45, 1)
  --(0.5, 1){down}
  ...{left}(0.1,0.6)% bowl
  {right}...{down}(0.15,0.55)
  ...{down}(0.075,0.35){down}
  ...{down}(0.075, 0.2)
  ...(0.15,0.15){down}
  ...{left}(0.1,0.1){right}
  ...{right}(0.4,0.05)
  --(0.4,0){left}
  ...{left}(eps,0.05);
  OnDepth;
    % contents
    Refpoint (0,0,0.8u);
    Action (ObjectColor := red;
      UseObject(revolution, (0, 0, 0), Origin, u,
	(eps, ypart point 0.8 of ObjectPath)..point 0.8 of ObjectPath);
      ObjectColor := (1, 215/255, 0););
    % bowl
    Refpoint (0,0,u);
    Action (UseObject(revolution, (0, 0, 0), Origin, u,
	subpath (0.75,3) of ObjectPath););
    % stem
    Refpoint (0,0,0.5u);
    Action (UseObject(revolution, (0, 0, 0), Origin, u,
	subpath (3,8) of ObjectPath));
    % foot
    Refpoint (0,0,0.25u);
    Action (UseObject(revolution, (0, 0, 0), Origin, u,
	subpath (8,11) of ObjectPath));
  endOnDepth;
endfig;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Molecule (C6 ???)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Object molecule = 
  M1 = (0, 0, 1); M2 = (1, 0, 0); M3 = (0, 1, 0);
  M4 = (-1, 0, 0); M5 = (0, -1, 0); M6 = (0, 0, -1);
  srad := 0.25; lrad := 0.1;
  OnDepth;
    Refpoint M1;
    Action(ObjectColor := red; UseObject(sphere, M1, Origin, srad));
    Refpoint M2;
    Action(ObjectColor := red; UseObject(sphere, M2, Origin, srad));
    Refpoint M3;
    Action(ObjectColor := red; UseObject(sphere, M3, Origin, srad));
    Refpoint M4;
    Action(ObjectColor := red; UseObject(sphere, M4, Origin, srad));
    Refpoint M5;
    Action(ObjectColor := red; UseObject(sphere, M5, Origin, srad));
    Refpoint M6;
    Action(ObjectColor := red; UseObject(sphere, M6, Origin, srad));
%
    Refpoint 0.5[M1, M2];
    Action(ObjectColor := 0.375white; SpheresLink(M1, M2, srad, srad, lrad));
    Refpoint 0.5[M1, M3];
    Action(ObjectColor := 0.375white; SpheresLink(M1, M3, srad, srad, lrad));
    Refpoint 0.5[M1, M4];
    Action(ObjectColor := 0.375white; SpheresLink(M1, M4, srad, srad, lrad));
    Refpoint 0.5[M1, M5];
    Action(ObjectColor := 0.375white; SpheresLink(M1, M5, srad, srad, lrad));
%
    Refpoint 0.5[M6, M2];
    Action(ObjectColor := 0.375white; SpheresLink(M6, M2, srad, srad, lrad));
    Refpoint 0.5[M6, M3];
    Action(ObjectColor := 0.375white; SpheresLink(M6, M3, srad, srad, lrad));
    Refpoint 0.5[M6, M4];
    Action(ObjectColor := 0.375white; SpheresLink(M6, M4, srad, srad, lrad));
    Refpoint 0.5[M6, M5];
    Action(ObjectColor := 0.375white; SpheresLink(M6, M5, srad, srad, lrad));
%
    Refpoint 0.5[M2, M3];
    Action(ObjectColor := 0.375white; SpheresLink(M2, M3, srad, srad, lrad));
    Refpoint 0.5[M3, M4];
    Action(ObjectColor := 0.375white; SpheresLink(M3, M4, srad, srad, lrad));
    Refpoint 0.5[M4, M5];
    Action(ObjectColor := 0.375white; SpheresLink(M4, M5, srad, srad, lrad));
    Refpoint 0.5[M5, M2];
    Action(ObjectColor := 0.375white; SpheresLink(M5, M2, srad, srad, lrad));
  endOnDepth;
endObject;

let Fill = SolidFill;
beginfig(thisfig);
  UseObject(molecule, Origin, Origin, 2cm);
endfig;

%Resolution := 2mm;

let Fill = SolidWireFill;
ObjectColor := 0.5white;
PenColor := green;
%FinePlotFlag:=true;

beginfig(thisfig);
  pickup thin.nib;
  Euler(0,0,0,0.25cm);
  Frame(-15 step 5 until 15)(-10 step 5 until 10)(-4 step 2 until 6);
  Plot3D("4cosd(180/3.14159*(x++y))*mexp(-(x++y)*50)", -15, 15, -10, 10);
  FrameMark (0,0,4);
  endFrame;
endfig;

let Fill = SolidFill;
ObjectColor := (1, 215/255, 0);
beginfig(thisfig);
  UseObject(cylinderlike,(0,0,0),(0,0,0),1cm,
    for i= 0 upto 4: 2dir(i/5*360)--dir((i+0.5)/5*360)-- endfor cycle, 1);
endfig;

beginfig(thisfig);
  Euler(0,0,0,0.5cm);
  save h, dh, r; h=4; dh = 1; r=0.75;
  Frame(-4 step 2 until 4)(-4 step 2 until 4)(-4 step 2 until 4);
  Inside;
  % hyperboloide à une nappe
  ObjectColor := (0, 215/255, 1);
  UseObject(revolution,Origin,Origin,1,
    (r*sqrt(h*h+1), h){-r*h/sqrt(h*h+1),-1}
    for y = h-dh step -dh until -h-eps:
      ...(r*sqrt(y*y+1), y){-r*y/sqrt(y*y+1), -1} endfor);
  % cone
  ObjectColor := (215/255, 1, 0);
  UseObject(revolution,Origin,Origin,1, (r*h, h)--(eps, 0)--(r*h,-h));
  % hyperboloide à deux nappes
  ObjectColor := (1, 215/255, 0);
  for $ = "Inside", "Outside":
    scantokens $;
    UseObject(revolution,Origin,Origin,1,
      reverse((eps, 1){right} for y = 1+dh step dh until h+eps:
	  ...(r*sqrt(y*y-1), y){r, sqrt(y*y-1)/y} endfor));
  endfor
  UseObject(revolution,Origin,Origin,1,
    (eps, -1){right} for y = 1+dh step dh until h+eps:
      ...(r*sqrt(y*y-1), -y){r, -sqrt(y*y-1)/y} endfor);
  endFrame;
endfig;

end.
