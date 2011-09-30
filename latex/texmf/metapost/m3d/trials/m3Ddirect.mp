%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 3D extensions for MetaPost by Anthony Phan.
% file: m3Ddirect.mp
% last modification: january 11, 2006
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Here we try the
%
% DirectPostScript filename;
% ...
% endDirectPostScript;
%
% procedure. It works only with Fill commands and should produce
% a correct EPS file which would be about the half size of what
% would habe been produced by MetaPost. The Fill commands are directly
% translated and written in an external file (filename). This is
% of course faster than MetaPost translation. 
%
% TRY IT:
% mpost <thisfile.mp>
% gv m3Ddirect.eps

input m3Dplain.mp;
input m3Dlib01.mp;

message "It may take a little time...";

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
LightAtInfinity:=false;
ObjectColor:=0.75white;
%LightSource:=3/3cm*(Ox+Oy+Oz);
LightSource:=5cm*(1,1,1);%Unitvector(1,1,1);
%ProjectionSystem(linear);
ProjectionSystem(planar);
%ProjectionSystem(spherical);

%
% DIRECT OUTPUT
%

DirectEPS "m3Ddirect.eps";
UseObject(sierpinski_sponge,Origin,(0,0,0),4cm,3);
endDirectEPS;

end.
