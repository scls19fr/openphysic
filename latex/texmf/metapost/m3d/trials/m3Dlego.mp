%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 3D extensions for MetaPost by Anthony Phan.
% file: m3Dlego.mp
% last modification: january 11, 2006
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% TRY IT:
% mpost <thisfile.mp>
% bash animate-script
% rm -f <thisfile>.1*
% xanim <thisfile>.gif

input m3Dplain;

n = 40; % how many images

%
% Parameters
%

lego_unit := 0.8; % official (if CurrentScale = 1cm)
lego_height := 1.2lego_unit; % official
lego_plate_height := 0.4lego_unit; % official
lego_thickness := 1/6lego_unit;
lego_eps := 1/20lego_unit;
lego_overshot := lego_plate_height-lego_thickness;%0.2133lego_unit;
lego_diam := lego_unit-2lego_thickness;
lego_Diam := (sqrt 2)*lego_unit-lego_diam;

%
% Definitions
%

Object lego_brick(expr nx, ny, hz) = 
  M1 = (0, 0, 0);
  M2 = (nx*lego_unit, 0, 0);
  M3 = (nx*lego_unit, ny*lego_unit, 0);
  M4 = (0, ny*lego_unit, 0);
  M5 = (0, 0, hz*lego_height);
  M6 = (nx*lego_unit, 0, hz*lego_height);
  M7 = (nx*lego_unit, ny*lego_unit, hz*lego_height);
  M8 = (0, ny*lego_unit, hz*lego_height);
%
  OnDepth;
    SubObject1:
    Refpoint 0.5[M5,M7]+(0, 0, 0.5lego_overshot);
    Action(lego_tetons(1, nx, 1, ny, hz));
    endSubObject;
%
    SubObject2:
    Refpoint 0.5[M1, M6];
    Action(lego_face(M1, (nx*lego_unit, 0, 0), (0, 0, hz*lego_height)));
    Refpoint 0.5[M2, M7];
    Action(lego_face(M2, (0, ny*lego_unit, 0), (0, 0, hz*lego_height)));
    Refpoint 0.5[M3, M8];
    Action(lego_face(M3, (-nx*lego_unit, 0, 0), (0, 0, hz*lego_height)));
    Refpoint 0.5[M4, M5];
    Action(lego_face(M4, (0, -ny*lego_unit, 0), (0, 0, hz*lego_height)));
    Refpoint 0.5[M5, M7];
    Action(lego_face(M5, (nx*lego_unit, 0, 0), (0, ny*lego_unit, 0)));
    endSubObject;
%
    SubObject3:
    if Orientation(m1--m4--m3--m2--cycle) > 0:
      message "Drawing inside";
      Refpoint 0.5[M1, M3]+(0, 0, 0.5hz*lego_height);
      Action(lego_inside(nx, ny, hz);
	Fill(m1--m4--m3--m2--m1--
	  proj(M1+(lego_thickness, lego_thickness, 0))--
	  proj(M2+(-lego_thickness, lego_thickness, 0))--
	  proj(M3-(lego_thickness, lego_thickness, 0))--
	  proj(M4+(lego_thickness, -lego_thickness, 0))--
	  proj(M1+(lego_thickness, lego_thickness, 0))--cycle, 
	  0.5[M1, M3], (0, 0, -1))); 
    fi
    endSubObject;
  endOnDepth;
endObject;

def lego_face(expr basepoint, u, v) =
  if Orientation(proj(basepoint)--proj(basepoint+u)
      --proj(basepoint+u+v)--proj(basepoint+v)--cycle) > 0:
    begingroup save nx, ny;
      nx = ceiling(Norm u*(CurrentScale/Resolution));
      ny = ceiling(Norm v*(CurrentScale/Resolution));
      M__ := Unitvector(u Vectprod v);
      for $ = 1 upto nx:
	for $$ = 1 upto ny:
	  Fill(proj(basepoint+(($-1)/nx)*u+(($$-1)/ny)*v)
	    --proj(basepoint+($/nx)*u+(($$-1)/ny)*v)
	    --proj(basepoint+($/nx)*u+($$/ny)*v)
	    --proj(basepoint+(($-1)/nx)*u+($$/ny)*v)--cycle, 
	    basepoint+(($-.5)/nx)*u+(($$-.5)/ny)*v, 
	    M__);
	endfor
      endfor
    endgroup;
  fi
enddef;

def lego_tetons(expr nx, nxx, ny, nyy , hz) = 
  OnDepth;
    clearxy;
    for $ = nx-1 upto nxx-1:
      for $$ = ny-1 upto nyy-1:
	M[$*(nyy-ny+1)+$$]
	= (($+nx-0.5)*lego_unit, ($$+ny-0.5)*lego_unit, hz*lego_height);
	Refpoint M[$*(nyy-ny+1)+$$];
	Action(lego_cyl(M[$*(nyy-ny+1)+$$], 
	    lego_diam, lego_overshot, true, true, false));
      endfor
    endfor
  endOnDepth;
enddef;

def lego_inside(expr nx, ny, hz) = 
  OnDepth;
    clearxy;
    M1 = (lego_thickness, lego_thickness, 0);
    M2 = (nx*lego_unit-lego_thickness, lego_thickness, 0);
    M3 = (nx*lego_unit-lego_thickness, ny*lego_unit-lego_thickness, 0);
    M4 = (lego_thickness, ny*lego_unit-lego_thickness, 0);
    M5 = (lego_thickness, lego_thickness, hz*lego_height-lego_thickness);
    M6 = (nx*lego_unit-lego_thickness, lego_thickness, 
      hz*lego_height-lego_thickness);
    M7 = (nx*lego_unit-lego_thickness, ny*lego_unit-lego_thickness, 
      hz*lego_height-lego_thickness);
    M8 = (lego_thickness, ny*lego_unit-lego_thickness, 
      hz*lego_height-lego_thickness);
    Fill(m5--m8--m7--m6--cycle, 0.5[M5, M7], (0, 0, -1));
    Refpoint 0.5[M1, M6];
    Action(Fill(m1--m5--m6--m2--cycle, 0.5[M1, M6], (0, 1, 0)));
    Refpoint 0.5[M2, M7];
    Action(Fill(m2--m6--m7--m3--cycle, 0.5[M2, M7], (-1, 0, 0)));
    Refpoint 0.5[M3, M8];
    Action(Fill(m3--m7--m8--m4--cycle, 0.5[M3, M8], (0, -1, 0)));
    Refpoint 0.5[M4, M5];
    Action(Fill(m4--m8--m5--m1--cycle, 0.5[M4, M5], (1, 0, 0)));
    Refpoint 0.5[M1, M3]+(0, 0, 0.5hz*lego_height);
    Action(lego_inside_(nx, ny, hz));
  endOnDepth;
enddef;

def lego_inside_(expr nx, ny, hz) = 
  OnDepth;
    if (nx > 1) and (ny>1):
      for $ = 0 upto nx-2:
	for $$ = 0 upto ny-2:
	  M[$*ny+$$+9] = (($+1)*lego_unit, ($$+1)*lego_unit, 0);
	  Refpoint M[$*ny+$$+9];
	  Action(
	    lego_cyl(M[$*ny+$$+9], lego_diam, hz*lego_height-lego_thickness, 
	      false, false, false);
	    lego_path:= lego_cyl_bot_path;
	    lego_cyl(M[$*ny+$$+9], lego_Diam, hz*lego_height-lego_thickness, 
	      true, false, false);
	    Fill(reverse lego_cyl_bot_path--lego_path--cycle, M[$*ny+$$+9], 
	      (0, 0, -1))
	    );
	endfor
      endfor
    else:
      if (nx > 1) and (ny = 1):
	for $ = 0 upto nx-2:
	  M[$+9] = (($+1)*lego_unit, .5lego_unit, 0);
	  Refpoint M[$+9];
	  Action(lego_cyl(M[$+9], 2lego_thickness, 
	      hz*lego_height-lego_thickness, true, false, true));
	endfor
      fi
      if (nx = 1) and (ny > 1):
	for $ = 0 upto ny-2:
	  M[$+9] = (.5lego_unit, ($+1)*lego_unit, 0);
	  Refpoint M[$+9];
	  Action(lego_cyl(M[$+9], 2lego_thickness, 
	      hz*lego_height-lego_thickness, true, false, true));
	endfor
      fi
    fi
  endOnDepth;
enddef;

path lego_path, lego_cyl_bot_path, lego_cyl_top_path;

def lego_cyl(expr center, diam, height, outside, filltop, fillbot) = 
  da:= 180/ceiling(3.14159*.5diam*(CurrentScale/Resolution));
  if outside:
    for $ = da step da until 360+0.5da:
      Fill(
	proj(center+(.5diam*cosd($-da), .5diam*sind($-da), 0))--
	proj(center+(.5diam*cosd($), .5diam*sind($), 0))--
	proj(center+(.5diam*cosd($), .5diam*sind($), height))--
	proj(center+(.5diam*cosd($-da), .5diam*sind($-da), height))--cycle, 
	center+.5diam*(.5diam*cosd($-0.5da), .5diam*sind($-0.5da), 0.5height), 
	(cosd($-0.5da), sind($-0.5da), 0));
    endfor
  else:
    for $ = da step da until 360+0.5da:
      Fill(
	proj(center+(.5diam*cosd($-da), .5diam*sind($-da), height))--
	proj(center+(.5diam*cosd($), .5diam*sind($), height))--
	proj(center+(.5diam*cosd($), .5diam*sind($), 0))--
	proj(center+(.5diam*cosd($-da), .5diam*sind($-da), 0))--cycle, 
	center+(.5diam*cosd($-0.5da), .5diam*sind($-0.5da), 0.5height), 
	-(cosd($-0.5da), sind($-0.5da), 0));
    endfor
  fi
  lego_cyl_top_path := for $ = da step da until 360+0.5da:
    proj(center+(.5diam*cosd($-da), .5diam*sind($-da), height))--
  endfor cycle;
  lego_cyl_bot_path := for $ = da step da until 360+0.5da:
    proj(center+(.5diam*cosd($-da), .5diam*sind($-da), 0))--
  endfor cycle;
  if filltop: Fill(lego_cyl_top_path, center+(0, 0, height), (0, 0, 1)); fi
  if fillbot: Fill(reverse lego_cyl_bot_path, center, (0, 0, -1)); fi
enddef;

Object pasttrial = 
  OnDepth;
    Refpoint (0, 4lego_unit, lego_height);
    Action(ObjectColor:= red;
      UseSubObject1(lego_brick, (0, 2lego_unit, 0), Origin, 1, 1, 4, 1));
    Refpoint (0.5lego_unit, 3lego_unit, 0.5lego_height);
    Action(ObjectColor:= red;
      UseSubObject2(lego_brick, (0, 0, 0), Origin, 1, 1, 6, 1);
      UseSubObject3(lego_brick, (0, 0, 0), Origin, 1, 1, 6, 1));
  endOnDepth;
endObject;

Object trial =
  UseObject(lego_brick, (-2lego_unit, -lego_unit, -0.5lego_height),
    Origin, 1,4,2,1);
  if Depth (0,-1,0) < 0:
    UseObject(simpletext, (0, -lego_unit, 0), (0,0,90),
      0.5lego_height, "left", "center", "m3D");
  fi
  if Depth (1,0,0) < 0:
    UseObject(simpletext, (2lego_unit, 0, 0), (90,0,90),
      0.5lego_height, "left", "center", "is");
  fi
  if Depth (0,1,0) < 0:
    UseObject(simpletext, (0, lego_unit, 0), (180,0,90),
      0.5lego_height, "left", "center", "still a...");
  fi
  if Depth (-1,0,0) < 0:
    UseObject(simpletext, (-2lego_unit, 0, 0), (270,0,90),
      0.5lego_height, "left", "center", "W.I.P.");
  fi
endObject;

ProjectionSystem(planar);
Fog:= 1;
FogHalf:= 2cm;
FogZ:= 0cm;
LightAtInfinity:= false;
ObsZ := 8cm;
Contrast := 0.75;
Luminosity := 1;
Specularity:= 0.75;
Phong:= 3;
Resolution := 1mm;
LightSource := (4cm, 2cm, 2cm);% screen coordinates
ShadedTextFlag:=false;
prologues:=1;
ObjectColor:=red;
TextColor:=white;

for imageno = 0 upto n-1:
  beginfig(100+imageno);
    "Brique lego";
    UseObject(trial, Origin, (-imageno/n*360, 0, 0), 1cm);
  endfig;
endfor;

AnimateQuality:=4;
AnimateDelay:=5;
Animate(5, true);

end.
