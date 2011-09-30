%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 3D extensions for MetaPost by Anthony Phan.
% file: m3Dsty01.mp
% last modification: january 11, 2006
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Visual settings
%

% At this level, coordinates refer to the screen
% (or the piece of paper): x, y are the usual planar
% coordinates and z is orthogonal to them and has
% for direction the observer.
% ObsZ is distance of the observer to the ``Origin''
% say to the screen or the piece of paper
ObsZ := 10cm;
% Oo is the origin of the current object with respect
% to the screen coordinates.
Oo := (0, 0, 0);
% initial frame with respect to the screen coordinates
Ox := (-sqrt(1/2), -sqrt(1/6), sqrt(1/3));
Oy := (sqrt(1/2), -sqrt(1/6), sqrt(1/3));
Oz := (0, sqrt(2/3), sqrt(1/3));
% The light source can be at infinity or not.
LightAtInfinity := true;
% vector to THE light source
LightSource := (0, 1, 1);

%
% Texture parameters
%
% Usual contrast parameter
Contrast := 0.75;
% Usual luminosity parameter
Luminosity := 1;
% Usual specularity parameter (maximum fraction
% of incident light which can be reflected)
Specularity := 0.75;
% Phong is a diffusion exponent for relected light.
Phong := 3;
% Alpha is the transparency parameter.
Alpha := 0.5;
% See the object ``sphere'' for a use of this parameter.
Resolution := 2mm;
% Fog is applied if and only if Fog > 0.
Fog := 1;
% FogHalf is like half-life in exponential decay.
FogHalf := 5cm;
% FogZ is the z-coordinate (relative to the screen)
% below which fog can be applied (see below).
FogZ := 0;

%
% Text settings
%
prologues:=0;
mthreeDfont := "rphvb";% look in ../texmf/dvips/config/psfonts.map
mthreeDfontsize := 10pt;
baselineskip := 12pt;
TextStretchFactor:=2;
textwidth := 0;
TextColor := black;
ShadedTextFlag:=false;

%
% Animation settings
%
AnimateScript:="animate-script";
AnimateDelay:=5;% time between every images
AnimateQuality:=2;% 1, 2, ...
AnimateLoop:=0;% Netscape gif parameter

%
% Other settings
%
ObjectColor := 0.75white;
PenColor := black;
SetPens(0.2pt, 0.4pt, 0.8pt);
% parameter of the object ``plotThreeD''
FinePlotFlag := false;

ProjectionSystem(planar); % linear, spherical

let Fill = SolidFill; % WireFill, WireDraw, WireSolidFill, TechnoFill

endinput.




