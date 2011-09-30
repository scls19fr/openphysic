%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 3D extensions for MetaPost by Anthony Phan.
% file: m3Dchair.mp (suggested by Pr. Jens Schwaiger)
% last modification: january 11, 2006
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TRY IT:
% mpost <thisfile.mp>
% gv <thisfile>.0
% gv <thisfile>.1

input m3Dplain;
input m3Dlib01;

%
% PARAMETERS
%

%ObsZ := 10cm;
Resolution := 0.75mm;
Phong := 7;
Specularity := 1;
Luminosity := 1;
Contrast := 1;
Fog := 2;
FogZ := 0;
FogHalf := 1cm;
n := 15;
%fineplot := true;
LightAtInfinity := false;
LightSource := Origin;
%background := black;
%LightSource := Unitvector(1, 1, 2);
%ProjectionSystem(linear);
ProjectionSystem(planar);
%ProjectionSystem(spherical);
%let Fill = HardFill;

%
% NEW OBJECTS
%

Object chair = 
save corner, radius;
corner = 0.25;
radius = 0.1;
OnDepth;
Refpoint (-0.5, 0, 0);
Action(ObjectColor := green;
  UseObject(cylinder, (-0.5, 0.5-corner, 0), (90, 90, 0), 1, radius, 1-2corner));
%Refpoint (0.5, 0, 0)
%Action(ObjectColor := green;
%UseObject(cylinder, (0.5, 0.5-corner, 0), (90, 90, 0), 1, radius, 1-2corner));
Refpoint (0.5, 0, 1);
Action(ObjectColor := green;
  UseObject(cylinder, (0.5-(1-1/sqrt2)*corner, 0.5-radius, 1-(1-1/sqrt2)*corner), (90, 90, 0), 1, radius, 1-2radius));
Refpoint (-0.5, 0, 1);
Action(ObjectColor := green;
  UseObject(cylinder, (-0.5+(1-1/sqrt2)*corner, 0.5-radius, 1+(1-1/sqrt2)*corner), (90, 90, 0), 1, radius, 1-2radius));
Refpoint (-0.5, 0, 2);
Action(ObjectColor := green;
  UseObject(cylinder, (-0.5, 0.5-corner, 2), (90, 90, 0), 1, radius, 1-2corner));
%
Refpoint (0, 0.5, 0);
Action(ObjectColor := green;
  UseObject(cylinder, (0.5-corner, 0.5, 0), (0, 90, 0), 1, radius, 1-2corner));
Refpoint (0, -0.5, 0);
Action(ObjectColor := green;
  UseObject(cylinder, (0.5-corner, -0.5, 0), (0, 90, 0), 1, radius, 1-2corner));
Refpoint (0, 0.5, 1);
Action(ObjectColor := green;
  UseObject(cylinder, (0.5-corner, 0.5, 1), (0, 90, 0), 1, radius, 1-2corner));
Refpoint (0, -0.5, 1);
Action(ObjectColor := green;
  UseObject(cylinder, (0.5-corner, -0.5, 1), (0, 90, 0), 1, radius, 1-2corner));
%
Refpoint (0.5, -0.5, 0.5);
Action(ObjectColor := green;
  UseObject(cylinder, (0.5, -0.5, corner), (0, 0, 0), 1, radius, 1-2corner));
Refpoint (0.5, 0.5, 0.5);
Action(ObjectColor := green;
  UseObject(cylinder, (0.5, 0.5, corner), (0, 0, 0), 1, radius, 1-2corner));
Refpoint (-0.5, -0.5, 1.5);
Action(ObjectColor := green;
  UseObject(cylinder, (-0.5, -0.5, corner+1), (0, 0, 0), 1, radius, 1-2corner));
Refpoint (-0.5, 0.5, 1.5);
Action(ObjectColor := green;
  UseObject(cylinder, (-0.5, 0.5, corner+1), (0, 0, 0), 1, radius, 1-2corner));
%
Refpoint (0, 0, 1);
Action(ObjectColor := (215/255, 1, 0);
  UseObject(cylinder, (0.5-corner, 0, 1), (0, 90, 0), 1, radius, 1-2corner));
Refpoint (-0.5, 0, 1.5);
Action(ObjectColor := (215/255, 1, 0);
  UseObject(cylinder, (-0.5, 0, 1+corner), (0, 0, 0), 1, radius, 1-2corner));
%
% corners
%
Refpoint (-0.5, -0.5, 0);
Action(ObjectColor := green;
  UseObject(corner, (-0.5+corner, -0.5+corner, 0), (90, 180, 0), 1, corner, radius));
Refpoint (-0.5, 0.5, 0);
Action(ObjectColor := green;
  UseObject(corner, (-0.5+corner, 0.5-corner, 0), (90, 0, 0), 1, corner, radius));
%
Refpoint (0.5, -0.5, 0);
Action(ObjectColor := green;
  UseObject(corner, (0.5-corner, -0.5, corner), (-90, -90, 0), 1, corner, radius));
Refpoint (0.5, 0.5, 0);
Action(ObjectColor := green;
  UseObject(corner, (0.5-corner, 0.5, corner), (-90, -90, 0), 1, corner, radius));
%
Refpoint (0.5, -0.5, 1);
Action(ObjectColor := green;
  UseObject(corner, (0.5-corner, -0.5, 1-corner), (-90, 90, 0), 1, corner, radius));
Refpoint (0.5, 0.5, 1);
Action(ObjectColor := green;
  UseObject(corner, (0.5-corner, 0.5, 1-corner), (-90, 90, 0), 1, corner, radius));
%
Refpoint (-0.5, -0.5, 1);
Action(ObjectColor := green;
  UseObject(corner, (-0.5+corner, -0.5, 1+corner), (90, -90, 0), 1, corner, radius));
Refpoint (-0.5, 0.5, 1);
Action(ObjectColor := green;
  UseObject(corner, (-0.5+corner, 0.5, 1+corner), (90, -90, 0), 1, corner, radius));
%
Refpoint (-0.5, -0.5, 2);
Action(ObjectColor := green;
  UseObject(corner, (-0.5, -0.5+corner, 2-corner), (180, 90, 0), 1, corner, radius));
Refpoint (-0.5, 0.5, 2);
Action(ObjectColor := green;
  UseObject(corner, (-0.5, 0.5-corner, 2-corner), (0, 90, 0), 1, corner, radius));

endOnDepth;
endObject;

Object corner (expr corner, radius) = 
save na, nb, r, s, t; r = radius/corner;
na = ceiling(1.570796(corner+radius)*(CurrentScale/Resolution));
nb = ceiling(3.14159radius*(CurrentScale/Resolution));
for $ = 0 upto na-1:
  x0 := corner*cosd(($)/na*90); x1 := corner*cosd(($+1)/na*90);
  y0 := corner*sind(($)/na*90); y1 := corner*sind(($+1)/na*90);
  for @ = 0 upto 2nb-1:
    t := 1+r*cosd(@/nb*180);
    x2 := t*x0; y2 := t*y0;
    x3 := t*x1; y3 := t*y1;
    z2 := z3 := radius*sind(@/nb*180);
    t := 1+r*cosd((@+1)/nb*180);
    x5 := t*x0; y5 := t*y0;
    x4 := t*x1; y4 := t*y1;
    z4 := z5 := radius*sind((@+1)/nb*180);
    x6 := cosd((@+.5)/nb*180)*cosd(($+.5)/na*90);
    y6 := cosd((@+.5)/nb*180)*sind(($+.5)/na*90);
    z6 := sind((@+.5)/nb*180);
    Fill(m2--m3--m4--m5--cycle, (M2+M3+M4+M5)/4, M6);
  endfor endfor
endObject;

%
% FIGURES
%

DirectEPS "m3Dchair.0";
UseObject(chair, Origin, Origin, 3cm);
endDirectEPS;

beginfig(1);
  UseObject(chair, Origin, Origin, 3cm);
endfig;

end.
