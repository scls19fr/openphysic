%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 3D extensions for MetaPost by Anthony Phan.
% file: m3Dviviani.mp
% last modification: january 11, 2006
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Fenetre de Viviani (Viviani's window)
%

input m3Dplain.mp;
input m3Dpicts.mp;

message "It may take a little time...";

%
% SUBSECTION ?.?. Implicit functions
%

% functions f, g must be known

Object ImplicitCurve(expr InitialPoint, dh, ds)=
save i, gradf, gradg, tangent, inittangent;
color gradf, gradg, tangent, inittangent;
M=InitialPoint; i=0;
gradf := ((f(x+dh, y, z), f(x, y+dh, z), f(x, y, z+dh))
  -f(x, y, z)*(1, 1, 1))/dh;
gradg := ((g(x+dh, y, z), g(x, y+dh, z), g(x, y, z+dh))
  -g(x, y, z)*(1, 1, 1))/dh;
inittangent:= Unitvector(gradf Vectprod gradg);
forever:
  gradf := ((f(x+dh, y, z), f(x, y+dh, z), f(x, y, z+dh))
    -f(x, y, z)*(1, 1, 1))/dh;
  gradg := ((g(x+dh, y, z), g(x, y+dh, z), g(x, y, z+dh))
    -g(x, y, z)*(1, 1, 1))/dh;
  tangent:= Unitvector(gradf Vectprod gradg);
  x' := Xpart(M+tangent*ds);
  y' := Ypart(M+tangent*ds);
  z' := Zpart(M+tangent*ds);
  gradf := ((f(x'+dh, y', z'), f(x', y'+dh, z'), f(x', y', z'+dh))
    -f(x', y', z')*(1, 1, 1))/dh;
  gradg := ((g(x'+dh, y', z'), g(x', y'+dh, z'), g(x', y', z'+dh))
    -g(x', y', z')*(1, 1, 1))/dh;
  tangent:= Unitvector(gradf Vectprod gradg);
  x'' := 0.5(Xpart(M'+tangent*ds)+x);
  y'' := 0.5(Ypart(M'+tangent*ds)+y);
  z'' := 0.5(Zpart(M'+tangent*ds)+z);
  draw proj M..proj M'';
  x:=x''; y:=y''; z:=z'';
  i:=i+1;
  exitif (i>1000)
  or (Norm(M-InitialPoint)>10)
  or ((Norm(M-InitialPoint)<1.5ds) and (abs(tangent Dotprod inittangent)<0.1));
endfor
endObject;

%
% OBJECTS
%

vardef fsphere primary M =
  Norm M-1
enddef;

vardef fcylinder primary M =
  ((Xpart M-0.5)++Ypart M)-.5
enddef;

Object sphere =
save na; na=ceiling(1.5708*(CurrentScale/Resolution));
for $ = if SubObjectNumber = 1: 0 upto na-1
  elseif SubObjectNumber = 2: na upto 2na-1
  else: 0 upto 2na-1 fi:
  phi :=($/(2na))[-90+eps,90-eps]; % for special effects
  x := cosd(($/(2na))[-90+eps,90-eps]);
  y := cosd((($+1)/(2na))[-90+eps,90-eps]);
  x2 := x; y2 := 0; x3 := y; y3 := 0; 
  z1 := z2 := sind(($/(2na))[-90+eps,90-eps]);
  z3 := z4 := sind((($+1)/(2na))[-90+eps,90-eps]);
  for $$ = 0 upto 4na:
    theta := $$/(4na)*360; % for special effects
    x1 := x2; y1 := y2; x4 := x3; y4 := y3;
    z := cosd theta; x2 := x*z; x3 := y*z;
    z := sind theta; y2 := x*z; y3 := y*z;
    _i_:=0;
    for i = 1 upto 4: _f_[i] := fcylinder M[i];
      if _f_[i] < 0: _i_:=_i_+1; fi endfor
    if _i_ = 0:
      fillArea(4,M1,M2,M3,M4);
    elseif _i_ < 4:
      _i_:=0;
      for i = 1 upto 4:
	if _f_[i] > 0:
	  _i_:=_i_+1; SetM'[_i_](M[i]);
	else:
	  for @ = if i = 1: 4 else: i-1 fi, if i = 4: 1 else: i+1 fi:
	    if _f_[@] > 0:
	      _i_:=_i_+1; SetM'[_i_]((-_f_[i]/(_f_[@]-_f_[i]))[M[i],M[@]]);
	    fi
	  endfor
	fi
      endfor
      if _i_ > 2: fillArea(_i_, M'[1] for @= 2 upto _i_:, M'[@] endfor);
%      elseif _i_ = 4: fillArea(4, M'[1], M'[2], M'[3], M'[4]);
%      elseif _i_ = 5: fillArea(5, M'[1], M'[2], M'[3], M'[4], M'[5]);
      fi
    fi
  endfor endfor
endObject;

Object SphereCylinder(expr cyl_length)=
SubObject1: UseObject(sphere, Origin, Origin, 1); endSubObject;
save da, dh; da=180/ceiling(0.5*3.14159(CurrentScale/Resolution));
dh=0.5cyl_length/ceiling(0.5cyl_length*(CurrentScale/Resolution));
SubObject2:
for @=dh step dh until 0.5cyl_length:
  x1:=x4:=1; y1:=y4:=0;
  for $=da step da until 360+eps:
    x2:=x3:=0.5cosd($)+0.5; y2:=y3:=0.5sind($);
    x:=sqrt(1-(x1**2)-(y1**2)); z1:=max(@-dh,x); z4:=max(@,x);
    x:=sqrt(1-(x2**2)-(y2**2)); z2:=max(@-dh,x); z3:=max(@,x);
    SetM'1(x1,y1,-z1);
    SetM'2(x2,y2,-z2);
    SetM'3(x3,y3,-z3);
    SetM'4(x4,y4,-z4);
    if (z1<@) or (z2<@):
      fillArea(4,M1,M2,M3,M4);
      z1:=z4:=-z1; z2:=z3:=-z2;
      fillArea(4,M'4,M'3,M'2,M'1);
    fi
    x1:=x4:=x2; y1:=y4:=y2;
  endfor
endfor
endSubObject;
SubObject3:
x1:=x2:=1; y1:=y2:=0; z1:=0; z2:=z3=-0.5cyl_length;
for $=da step da until 360+eps:
  x3:=x4:=0.5cosd($)+0.5; y3:=y4:=0.5sind($);
  z4:=-sqrt(1-(x4**2)-(y4**2));
  fillArea(4,M1,M2,M3,M4);
  x1:=x2:=x3; y1:=y2:=y3; z1:=z4;
endfor
endSubObject;
endObject;

%
% PARAMETERS
%

maxpictcnt:=2000;
Resolution:=2mm;
Phong:=3;
Specularity:=1;
Luminosity:=1;
Contrast:=1;
Fog:=2;
FogZ:=0;
FogHalf:=1cm;
n:=15;
ProjectionSystem(planar);
LightAtInfinity:=false;
LightSource:=5cm*(1,1,1);%Unitvector(1,1,1);

%
% FIGURE
%

beginfig(1);
  vardef f(expr x, y, z)= Norm(x, y, z)-1 enddef;
  vardef g(expr x, y, z)= (x-0.5)++y-0.5 enddef;
  Inside;
  ObjectColor:=0.5[white,blue];%(215/255,1,0);
  UseSubObject2(SphereCylinder, Origin, Origin, 2cm, 4);
  %ShipPicturesOut;
  Inside;
  ObjectColor:=(1,0,0);
  UseSubObject1(SphereCylinder, Origin, (0,0,0), 2cm, 4);
  Outside;
  ObjectColor:=red;%(1,215/255,0);
  UseSubObject1(SphereCylinder, Origin, (0,0,0), 2cm, 4);
%  ObjectColor:=blue;%(215/255,1,0);
%  UseSubObject2(SphereCylinder, Origin, Origin, 2cm, 4);
%  ShipPicturesOut;
%  UseObject(ImplicitCurve, Origin, (0, 0, 0), 2cm, (0, 0, 1), 0.001, 0.05);
endfig;

end.
