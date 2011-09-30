%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 3D extensions for MetaPost by Anthony Phan.
% file: m3Danim.mp
% last modification: january 11, 2006
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TRY IT:
% mpost /usr/texmf-local/metapost/m3d/trials/m3Danim.mp
 %bash animate-script
 %rm -f  /usr/texmf-local/metapost/m3d/trials/m3Danim.1*
 %xanim  /usr/texmf-local/metapost/m3d/trials/m3Danim.gif

input m3Dplain.mp;
input m3Dlib01.mp;

%
% PARAMETERS
%

%ObsZ := 10cm;
Phong := 3;
Specularity := 1;
Luminosity := 1;
Contrast := 1;
Fog := 2;
FogZ := 0;
FogHalf := 1cm;
%fineplot:=true;
LightAtInfinity:=false;
ObjectColor:=0.75white;
%LightSource:=3/3cm*(Ox+Oy+Oz);
LightSource:=5cm*(1,1,1);%Unitvector(1,1,1);
%ProjectionSystem(linear);
ProjectionSystem(planar);
%ProjectionSystem(spherical);

let Fill = SolidWireFill;
ObjectColor := 0.5white;
PenColor := green;
fineplot:=true;
Resolution := 3mm;

%
% FIGURES
%

n=20;

for imageno = 0 upto n-1:
beginfig(100+imageno);
  pickup thin.nib;
  alpha:=imageno/n*360;
 UseObject(plotThreeD, (0, 0, 0), (0, 0, 0), 0.25cm, 
 "4cosd(180/3.14159*(x++y)-alpha)*mexp(-(x++y)*50)", 
 -15, 15, -10, 10);
endfig;
endfor

AnimateQuality:=4;
AnimateDelay:=5;
Animate(5,true);

end.
