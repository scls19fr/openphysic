%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 3D extensions for MetaPost by Anthony Phan.
% file: m3Dpolyhedron.mp (sample file for animation)
% last modification: january 11, 2006
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TRY IT:
% mpost <thisfile.mp>
% bash animate-script
% rm -f <thisfile>.1*
% xanim <thisfile>.gif

input m3Dplain.mp;
input m3Dlib01.mp;

%
% PARAMETERS
%
%ObsZ:=10cm;
Resolution:=0.75mm;
Phong:=3;
Specularity:=1;
Luminosity:=1;
Contrast:=1;
Fog:=2;
FogZ:=0;
FogHalf:=1cm;
n:=50;
%fineplot:=true;
%LightAtInfinity:=false;

%LightSource:=3/3cm*(Ox+Oy+Oz);
LightSource:=Unitvector(0,1,1);
%ProjectionSystem(linear);
ProjectionSystem(planar);
%ProjectionSystem(spherical);

%
% FIGURES
%

for $=0 upto n-1:
  beginfig(100+$);
    ObjectColor:=(0.5(1+cosd($/n*360)))[red, blue];;
    UseObject(icosahedron, (0, 0, 0), ($/n*360, $/n*180, 0), 2cm);
  endfig;
endfor

Animate(5,true);

end.
