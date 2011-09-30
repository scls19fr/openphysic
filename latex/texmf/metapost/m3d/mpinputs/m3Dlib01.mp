%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 3D extensions for MetaPost by Anthony Phan.
% file: m3Dlib01.mp (basic mathematical objects)
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

if unknown mthreeDplain: input m3Dplain; fi
message "m3Dlib01: basic mathematical objects.";
message"";

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SECTION 1. Polyhedrons
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% Icosahedron
%
% parameters: none
%
% sub-objects: none
%
% From Marcel Berger, G\'eom\'etrie, Vol. 3

def triface_(suffix $, $$, $$$) =
  Fill(m$--m$$--m$$$--cycle, (M$+M$$+M$$$)/3, Unitvector(M$+M$$+M$$$));
enddef;

Object icosahedron =
save a; a = (sqrt(5)+1)/2;
UseObject(icosahedronB, Origin, (0, angle(a, 1), 0), 1/(1++a));
endObject;

Object icosahedronB =
save tau, tmp; tau = (sqrt(5)+1)/2;
M1 = (0, tau, 1); M2 = (0, -tau, 1); M3 = (0, tau, -1);
M4 = (0, -tau, -1); M5 = (1, 0, tau); M6 = (-1, 0, tau);
M7 = (1, 0, -tau); M8 = (-1, 0, -tau); M9 = (tau, 1, 0);
M10 = (-tau, 1, 0); M11 = (tau, -1, 0); M12 = (-tau, -1, 0);
triface_(1, 9, 3); triface_(1, 5, 9); triface_(1, 6, 5); triface_(1, 10, 6);
triface_(1, 3, 10); triface_(3, 9, 7); triface_(9, 11, 7); triface_(9, 5, 11);
triface_(5, 2, 11); triface_(5, 6, 2); triface_(6, 12, 2); triface_(6, 10, 12);
triface_(10, 8, 12); triface_(10, 3, 8); triface_(3, 7, 8); triface_(4, 11, 2);
triface_(4, 2, 12); triface_(4, 12, 8); triface_(4, 8, 7); triface_(4, 7, 11);
endObject;

%
% Dodecahedron
%
% parameters: none
%
% sub-objects: none
%
% From Marcel Berger, G\'eom\'etrie, Vol. 3
% constructed as the dual of the Icosahedron

def penface_(suffix $, $$, $$$, $$$$, $$$$$) =
  Fill(m$--m$$--m$$$--m$$$$--m$$$$$--cycle,
    (M$+M$$+M$$$+M$$$$+M$$$$$)/5, Unitvector(M$+M$$+M$$$+M$$$$+M$$$$$))
enddef;

Object dodecahedron =
save a; a = (sqrt(5)+1)/2;
UseObject(dodecahedronB, Origin, (0, angle(a, 1), 0),
  1/length((2a+1)/3, a/3));
endObject;

Object dodecahedronB =
save tau; tau = (sqrt(5)+1)/2;
M'1 = (0, tau, 1); M'2 = (0, -tau, 1); M'3 = (0, tau, -1);
M'4 = (0, -tau, -1); M'5 = (1, 0, tau); M'6 = (-1, 0, tau);
M'7 = (1, 0, -tau); M'8 = (-1, 0, -tau); M'9 = (tau, 1, 0);
M'10 = (-tau, 1, 0); M'11 = (tau, -1, 0); M'12 = (-tau, -1, 0);
M1 = 1/3(M'1+M'9+M'3); M2 = 1/3(M'1+M'5+M'9);
M3 = 1/3(M'1+M'6+M'5); M4 = 1/3(M'1+M'10+M'6);
M5 = 1/3(M'1+M'3+M'10); M6 = 1/3(M'3+M'9+M'7);
M7 = 1/3(M'9+M'11+M'7); M8 = 1/3(M'9+M'5+M'11);
M9 = 1/3(M'5+M'2+M'11); M10 = 1/3(M'5+M'6+M'2);
M11 = 1/3(M'6+M'12+M'2); M12 = 1/3(M'6+M'10+M'12);
M13 = 1/3(M'10+M'8+M'12); M14 = 1/3(M'10+M'3+M'8);
M15 = 1/3(M'3+M'7+M'8); M16 = 1/3(M'4+M'11+M'2);
M17 = 1/3(M'4+M'2+M'12); M18 = 1/3(M'4+M'12+M'8);
M19 = 1/3(M'4+M'8+M'7); M20 = 1/3(M'4+M'7+M'11);
penface_(5, 4, 3, 2, 1);
penface_(1, 2, 8, 7, 6);
penface_(2, 3, 10, 9, 8);
penface_(3, 4, 12, 11, 10);
penface_(4, 5, 14, 13, 12);
penface_(5, 1, 6, 15, 14);
penface_(16, 17, 18, 19, 20);
penface_(16, 20, 7, 8, 9);
penface_(9, 10, 11, 17, 16);
penface_(11, 12, 13, 18, 17);
penface_(6, 7, 20, 19, 15);
penface_(13, 14, 15, 19, 18);
endObject;

%
% Octahedron
%
% parameters: none
%
% sub-objects: none

Object octahedron =
Fill(proj(1, 0, 0)--proj(0, 1, 0)--proj(0, 0, 1)--cycle,
  (1, 1, 1)/3, (1, 1, 1)/sqrt3);
Fill(proj(0, 1, 0)--proj(-1, 0, 0)--proj(0, 0, 1)--cycle,
  (-1, 1, 1)/3, (-1, 1, 1)/sqrt3);
Fill(proj(-1, 0, 0)--proj(0, -1, 0)--proj(0, 0, 1)--cycle,
  (-1, -1, 1)/3, (-1, -1, 1)/sqrt3);
Fill(proj(0, -1, 0)--proj(1, 0, 0)--proj(0, 0, 1)--cycle,
  (1, -1, 1)/3, (1, -1, 1)/sqrt3);
Fill(proj(1, 0, 0)--proj(0, 0, -1)--proj(0, 1, 0)--cycle,
  (1, 1, -1)/3, (1, 1, -1)/sqrt3);
Fill(proj(0, 1, 0)--proj(0, 0, -1)--proj(-1, 0, 0)--cycle,
  (-1, 1, -1)/3, (-1, 1, -1)/sqrt3);
Fill(proj(-1, 0, 0)--proj(0, 0, -1)--proj(0, -1, 0)--cycle,
  (-1, -1, -1)/3, (-1, -1, -1)/sqrt3);
Fill(proj(0, -1, 0)--proj(0, 0, -1)--proj(1, 0, 0)--cycle,
  (1, -1, -1)/3, (1, -1, -1)/sqrt3);
endObject;

%
% Tetrahedron
%
% parameters: none
%
% sub-objects: none

Object tetrahedron =
M1 = (0, 0, 1); z2 = z3 = z4 = -1/3; x2 = 2sqrt(2)/3;
y2 = 0; y3 = -y4 = x2*sqrt(3)/2; x3 = x4 = -x2/2;
triface_(1, 2, 3); triface_(1, 3, 4);
triface_(1, 4, 2); triface_(2, 4, 3);
endObject;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SECTION 2. Common mathematical objects
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% Cylinder (axis: z'Oz)
%
% parameters: radius, height
%
% sub-objects: 1 (side part), 2 (bottom part), 3 (top part)

Object cylinder(expr r, h) =
save na, nh;
na = 4ceiling(1.570796r*(CurrentScale/Resolution));
SubObject1:
nh = ceiling(h*(CurrentScale/Resolution));
for @ = 1 upto nh:
  for $ = 1 upto na:
    Fill(proj(r*cosd(($-1)/na*360), r*sind(($-1)/na*360), (@-1)/nh*h)
      --proj(r*cosd($/na*360), r*sind($/na*360), (@-1)/nh*h)
      --proj(r*cosd($/na*360), r*sind($/na*360), @/nh*h)
      --proj(r*cosd(($-1)/na*360), r*sind(($-1)/na*360), @/nh*h)
      --cycle,
      (r*cosd(($-.5)/na*360), r*sind(($-.5)/na*360), (@-.5)/nh*h),
      (cosd(($-.5)/na*360), sind(($-.5)/na*360), 0));
  endfor
endfor
endSubObject;
SubObject2:
Fill(for $ = na downto 1:
    proj(r*cosd($/na*360), r*sind($/na*360), 0)-- endfor cycle,
  (0, 0, 0), (0, 0, -1));
endSubObject;
SubObject3:
Fill(for $ = 1 upto na:
    proj(r*cosd($/na*360), r*sind($/na*360), h)-- endfor cycle,
  (0, 0, h), (0, 0, 1));
endSubObject;
endObject;

%
% Cone (axis: z'Oz)
%
% parameters: radius, height
%
% sub-objects: 1 (side part), 2 (bottom part)

Object cone(expr radius, h) =
save na, nh, r;
na = 4ceiling(1.570796radius*(CurrentScale/Resolution));
SubObject1:
nh = ceiling(h*(CurrentScale/Resolution));
r := radius;
for @ = 1 upto nh:
  r' := radius*(1-@/nh);
  for $ = 1 upto na:
    Fill(proj(r*cosd(($-1)/na*360), r*sind(($-1)/na*360), (@-1)/nh*h)
      --proj(r*cosd($/na*360), r*sind($/na*360), (@-1)/nh*h)
      --proj(r'*cosd($/na*360), r'*sind($/na*360), @/nh*h)
      --proj(r'*cosd(($-1)/na*360), r'*sind(($-1)/na*360), @/nh*h)
      --cycle,
      (0.5(r+r')*cosd(($-.5)/na*360), 0.5(r+r')*sind(($-.5)/na*360),
	(@-.5)/nh*h),
      Unitvector(cosd(($-.5)/na*360), sind(($-.5)/na*360), h/radius));
  endfor
  r := r';
endfor
endSubObject;
SubObject 2:
Fill(for $ = na downto 1:
    proj(radius*cosd($/na*360), radius*sind($/na*360), 0)-- endfor cycle,
  (0, 0, 0), (0, 0, -1));
endSubObject;
endObject;

%
% Ellipsoid
%
% parameters: rx, ry, rz
%

Object ellipsoid(expr rx, ry, rz) =
MetaSphere(rx, ry, rz, 0, 360, -90, 90);
endObject;

%
% Torus (axis: z'Oz)
%
% parameters: primary radius, secondary radius
%
% sub-objects: 1 (rear part), 2 (front part)

Object torus(expr PRadius, SRadius) =
save a, na, nb, r, s, t; r = SRadius/PRadius;
na = ceiling(1.570796(PRadius+SRadius)*(CurrentScale/Resolution));
nb = ceiling(3.14159SRadius*(CurrentScale/Resolution));
%
% looking for the deepest angle
%
a := 0; x := Depth(1, 0, 0);
for $ = 1 upto 4na:
  x' := Depth(cosd($/na*90), sind($/na*90), 0);
  if x' > x: x := x'; a := $; fi
endfor
%
% Let's go
%
for $ = if SubObjectNumber = 0: 0 upto 2na-1
  elseif SubObjectNumber = 1: 0 upto na-1
  else: na upto 2na-1 fi:
  x0 := PRadius*cosd(($+a)/na*90); x1 := PRadius*cosd(($+a+1)/na*90);
  y0 := PRadius*sind(($+a)/na*90); y1 := PRadius*sind(($+a+1)/na*90);
  x'0 := PRadius*cosd((-$+a)/na*90); x'1 := PRadius*cosd((-$+a-1)/na*90);
  y'0 := PRadius*sind((-$+a)/na*90); y'1 := PRadius*sind((-$+a-1)/na*90);
  for @ = 0 upto 2nb-1:
    t := 1+r*cosd(@/nb*180);
    x2 := t*x0; y2 := t*y0; x'2 := t*x'0; y'2 := t*y'0;
    x3 := t*x1; y3 := t*y1; x'3 := t*x'1; y'3 := t*y'1;
    z2 := z3 := z'2 := z'3 := SRadius*sind(@/nb*180);
    t := 1+r*cosd((@+1)/nb*180);
    x5 := t*x0; y5 := t*y0; x'5 := t*x'0; y'5 := t*y'0;
    x4 := t*x1; y4 := t*y1; x'4 := t*x'1; y'4 := t*y'1;
    z4 := z5 := z'4 := z'5 := SRadius*sind((@+1)/nb*180);
    x6 := cosd((@+.5)/nb*180)*cosd(($+a+.5)/na*90);
    y6 := cosd((@+.5)/nb*180)*sind(($+a+.5)/na*90);
    z6 := sind((@+.5)/nb*180);
    x'6 := cosd((@+.5)/nb*180)*cosd((-$+a-.5)/na*90);
    y'6 := cosd((@+.5)/nb*180)*sind((-$+a-.5)/na*90);
    z'6 := sind((@+.5)/nb*180);
    Fill(m2--m3--m4--m5--cycle, (M2+M3+M4+M5)/4, M6);
    Fill(m'5--m'4--m'3--m'2--cycle, (M'2+M'3+M'4+M'5)/4, M'6);
  endfor endfor
endObject;

%
% Klein bottle (in progress)
%
% parameters: none
%
% sub-objects: 1 (to be defined), 2 (to be defined)

Object klein_bottle =
save da, db, r, ct, st, cp, sp, a_min, s, t;
da = 180/ceiling(12*3.14159(CurrentScale/Resolution));
db = 180/ceiling(4*3.14159(CurrentScale/Resolution));
a_min = 0; t = Depth(0, 0, 0); z := 0;
for $ = 0 step da until 360-da:
  x := cosd $; y := sind $; s := Depth M;
  if s > t: t := s; a_min := $; fi
endfor
for psi = 0 step da until 180-0.5da:
  for @ = 0 step db until 360 -0.5db:
    for $ = a_min+psi, a_min-da-psi:
 % theta := psi;
      ct := cosd $; st := sind $;
      cp := cosd @; sp := sind @;
      r := 4(1-0.5ct);
      ct' := cosd($+da); st' := sind($+da);
      cp' := cosd(@+db); sp' := sind(@+db);
      r' := 4(1-0.5ct'); z1 := r*sp; z2 := r'*sp; z3 := r'*sp'; z4 := r*sp';
      if st >= 0:
	x1 := 6(1+st)*ct+r*ct*cp; y1 := 16st+r*st*cp;
	x4 := 6(1+st)*ct+r*ct*cp'; y4 := 16st+r*st*cp';
      else:
	x1 := 6(1+st)*ct-r*cp; y1 := 16st;
	x4 := 6(1+st)*ct-r*cp'; y4 := 16st;
      fi
      if st'>= 0:
	x2 := 6(1+st')*ct'+r'*ct'*cp; y2 := 16st'+r'*st'*cp;
	x3 := 6(1+st')*ct'+r'*ct'*cp'; y3 := 16st'+r'*st'*cp';
      else:
	x2 := 6(1+st')*ct'-r'*cp; y2 := 16st';
	x3 := 6(1+st')*ct'-r'*cp'; y3 := 16st';
      fi
      ObjectNormalVector := Unitvector((M2-M1) Vectprod (M4-M1));
      Fill(m1--m2--m3--m4--cycle, (M1+M2+M3+M4)/4, ObjectNormalVector);
    endfor
  endfor endfor
endObject;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SECTION 3. Fractals (Sierpinski-Menger stuff)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% to be improved
% maximum is recursion_level := 2;

Object sierpinski_sponge(expr level) =
save a, recurse, dx, dx_, dy, dy_, dz, dz_;
boolean dx, dx_, dy, dy_, dz, dz_;
a := 0;
M1 = (-1, -1, -1); M2 = (0, -1, -1); M3 = (1, -1, -1); M4 = (1, 0, -1);
M5 = (1, 1, -1); M6 = (0, 1, -1); M7 = (-1, 1, -1); M8 = (-1, 0, -1);
M9 = (-1, -1, 0); M10 = (1, -1, 0); M11 = (1, 1, 0); M12 = (-1, 1, 0);
M13 = (-1, -1, 1); M14 = (0, -1, 1); M15 = (1, -1, 1); M16 = (1, 0, 1);
M17 = (1, 1, 1); M18 = (0, 1, 1); M19 = (-1, 1, 1); M20 = (-1, 0, 1);
save SortedList;
QuickSort(M1, M2, M3, M4, M5, M6, M7, M8, M9, M10,
  M11, M12, M13, M14, M15, M16, M17, M18, M19, M20);
def recurse(expr p, u, l)(text Mlist) =
  if l < level:
    for $ = SortedList:
      recurse(p+u*$/3, u/3, l+1)(9*(Xpart$+1)+3*(Ypart$+1)+Zpart$+1, Mlist);
    endfor
  else:
    a := 0; dx := dx_ := dy := dy_ := dz := dz_ := false;
    for $ = Mlist:
      x := floor($/9); y := floor($/3-3x); z := floor($-9x-3y);
      if a < level:
 	if (x = 1) or (y = 1) or (z = 1):
	  if (z = 0) and (not dz) and
	    (((x = 1) and ((y = 0) or (y = 2)))
	      or ((y = 1) and ((x = 0) or (x = 2)))):
	    Fill(proj(p+.5u*(-1, -1, 1))--proj(p+.5u*(1, -1, 1))
	      --proj(p+.5u*(1, 1, 1))--proj(p+.5u*(-1, 1, 1))--cycle,
	      p+.5u*(0, 0, 1), (0, 0, 1)); dz := true;
	  fi
	  if (z = 2) and (not dz_) and
	    (((x = 1) and ((y = 0) or (y = 2)))
	      or ((y = 1) and ((x = 0) or (x = 2)))):
	    Fill(proj(p+.5u*(-1, -1, -1))--proj(p+.5u*(-1, 1, -1))
	      --proj(p+.5u*(1, 1, -1))--proj(p+.5u*(1, -1, -1))--cycle,
	      p+.5u*(0, 0, -1), (0, 0, -1)); dz_ := true;
	  fi
	  if (x = 0) and (not dx) and
	    (((z = 1) and ((y = 0) or (y = 2)))
	      or ((y = 1) and ((z = 0) or (z = 2)))):
	    Fill(proj(p+.5u*(1, -1, -1))--proj(p+.5u*(1, 1, -1))
	      --proj(p+.5u*(1, 1, 1))--proj(p+.5u*(1, -1, 1))--cycle,
	      p+.5u*(1, 0, 0), (1, 0, 0)); dx := true;
	  fi
	  if (x = 2) and (not dx_) and
	    (((z = 1) and ((y = 0) or (y = 2)))
	      or ((y = 1) and ((z = 0) or (z = 2)))):
	    Fill(proj(p+.5u*(-1, -1, -1))--proj(p+.5u*(-1, -1, 1))
	      --proj(p+.5u*(-1, 1, 1))--proj(p+.5u*(-1, 1, -1))--cycle,
	      p+.5u*(-1, 0, 0), (-1, 0, 0)); dx_ := true;
	  fi
	  if (y = 0) and (not dy) and
	    (((z = 1) and ((x = 0) or (x = 2)))
	      or ((x = 1) and ((z = 0) or (z = 2)))):
	    Fill(proj(p+.5u*(1, 1, -1))--proj(p+.5u*(-1, 1, -1))
	      --proj(p+.5u*(-1, 1, 1))--proj(p+.5u*(1, 1, 1))--cycle,
	      p+.5u*(0, 1, 0), (0, 1, 0)); dy := true;
	  fi
	  if (y = 2) and (not dy_) and
	    (((z = 1) and ((x = 0) or (x = 2)))
	      or ((x = 1) and ((z = 0) or (z = 2)))):
	    Fill(proj(p+.5u*(-1, -1, -1))--proj(p+.5u*(1, -1, -1))
	      --proj(p+.5u*(1, -1, 1))--proj(p+.5u*(-1, -1, 1))--cycle,
	      p+.5u*(0, -1, 0), (0, -1, 0)); dy_ := true;
	  fi
 	fi
      fi
      a := a+1;
    endfor
    if (Zpart p > .5-u) and (not dz):
      Fill(proj(p+.5u*(-1, -1, 1))--proj(p+.5u*(1, -1, 1))
	--proj(p+.5u*(1, 1, 1))--proj(p+.5u*(-1, 1, 1))--cycle,
	p+.5u*(0, 0, 1), (0, 0, 1));
    fi
    if (Zpart p < -.5+u) and (not dz_):
      Fill(proj(p+.5u*(-1, -1, -1))--proj(p+.5u*(-1, 1, -1))
	--proj(p+.5u*(1, 1, -1))--proj(p+.5u*(1, -1, -1))--cycle,
	p+.5u*(0, 0, -1), (0, 0, -1));
    fi
    if (Xpart p > .5-u) and (not dx):
      Fill(proj(p+.5u*(1, -1, -1))--proj(p+.5u*(1, 1, -1))
	--proj(p+.5u*(1, 1, 1))--proj(p+.5u*(1, -1, 1))--cycle,
	p+.5u*(1, 0, 0), (1, 0, 0));
    fi
    if (Xpart p < -.5+u) and (not dx_):
      Fill(proj(p+.5u*(-1, -1, -1))--proj(p+.5u*(-1, -1, 1))
	--proj(p+.5u*(-1, 1, 1))--proj(p+.5u*(-1, 1, -1))--cycle,
	p+.5u*(-1, 0, 0), (-1, 0, 0));
    fi
    if (Ypart p > .5-u) and (not dy):
      Fill(proj(p+.5u*(1, 1, -1))--proj(p+.5u*(-1, 1, -1))
	--proj(p+.5u*(-1, 1, 1))--proj(p+.5u*(1, 1, 1))--cycle,
	p+.5u*(0, 1, 0), (0, 1, 0));
    fi
    if (Ypart p < -.5+u) and (not dy_):
      Fill(proj(p+.5u*(-1, -1, -1))--proj(p+.5u*(1, -1, -1))
	--proj(p+.5u*(1, -1, 1))--proj(p+.5u*(-1, -1, 1))--cycle,
	p+.5u*(0, -1, 0), (0, -1, 0));
    fi
  fi
enddef;
recurse((0, 0, 0), 1, 0)(0);
endObject;

% to be improved
% maximum is recursion_level := 5;

Object sierpinski_gasket(expr level) =
save SortedList;
M1 = (0, 0, 1);
M2 = 1/3*(sqrt 8, 0, -1);
M3 = 1/3*((sqrt 8)*cosd 120, (sqrt 8)*sind 120, -1);
M4 = 1/3*((sqrt 8)*cosd 240, (sqrt 8)*sind 240, -1);
QuickSort(M1, M2, M3, M4);
save recurse;
def recurse(expr p, u, l) =
  if l < level:
    for $ = SortedList:
      recurse(p+u*$, u/2, l+1);
    endfor
  else:
    for $ = SortedList:
      Fill(proj(p+u*($+M1))--proj(p+u*($+M2))--proj(p+u*($+M3))--cycle,
	p+u*($-M4), -Unitvector M4);
      Fill(proj(p+u*($+M1))--proj(p+u*($+M3))--proj(p+u*($+M4))--cycle,
	p+u*($-M2), -Unitvector M2);
      Fill(proj(p+u*($+M1))--proj(p+u*($+M4))--proj(p+u*($+M2))--cycle,
	p+u*($-M3), -Unitvector M3);
      Fill(proj(p+u*($+M4))--proj(p+u*($+M3))--proj(p+u*($+M2))--cycle,
	p+u*($-M1), -Unitvector M1);
    endfor
  fi
enddef;
recurse(Origin, 0.5, 1);
endObject;

endinput.

%
% Cube
%
% parameters: none
%
% sub-objects: none

Object cube =
Fill(proj(1, -1, 1)--proj(1, 1, 1)--proj(-1, 1, 1)--proj(-1, -1, 1)--cycle,
  (0, 0, 1), (0, 0, 1));
Fill(proj(1, -1, 1)--proj(1, -1, -1)--proj(1, 1, -1)--proj(1, 1, 1)--cycle,
  (1, 0, 0), (1, 0, 0));
Fill(proj(1, 1, 1)--proj(1, 1, -1)--proj(-1, 1, -1)--proj(-1, 1, 1)--cycle,
  (0, 1, 0), (0, 1, 0));
Fill(proj(-1, 1, 1)--proj(-1, 1, -1)--proj(-1, -1, -1)--proj(-1, -1, 1)--cycle,
  (-1, 0, 0), (-1, 0, 0));
Fill(proj(1, -1, 1)--proj(-1, -1, 1)--proj(-1, -1, -1)--proj(1, -1, -1)--cycle,
  (0, -1, 0), (0, -1, 0));
Fill(proj(1, 1, -1)--proj(1, -1, -1)--proj(-1, -1, -1)--proj(-1, 1, -1)--cycle,
  (0, 0, -1), (0, 0, -1));
endObject;

Object sierpinski_sponge(expr level) =
save SortedList;
M1 = (-1, -1, -1); M2 = (0, -1, -1); M3 = (1, -1, -1); M4 = (1, 0, -1);
M5 = (1, 1, -1); M6 = (0, 1, -1); M7 = (-1, 1, -1); M8 = (-1, 0, -1);
M9 = (-1, -1, 0); M10 = (1, -1, 0); M11 = (1, 1, 0); M12 = (-1, 1, 0);
M13 = (-1, -1, 1); M14 = (0, -1, 1); M15 = (1, -1, 1); M16 = (1, 0, 1);
M17 = (1, 1, 1); M18 = (0, 1, 1); M19 = (-1, 1, 1); M20 = (-1, 0, 1);
QuickSort(M1, M2, M3, M4, M5, M6, M7, M8, M9, M10, %
  M11, M12, M13, M14, M15, M16, M17, M18, M19, M20);
save recurse;
def recurse(expr p, u, l) =
  if l < level:
    for $ = SortedList:
      recurse(p+u*$, u/3, l+1);
    endfor
  else:
    for $ = SortedList:
      Fill(proj(p+u*($+.5(1, -1, -1)))--proj(p+u*($+.5(1, 1, -1)))
	--proj(p+u*($+.5(1, 1, 1)))--proj(p+u*($+.5(1, -1, 1)))--cycle,
	p+u*($+.5(1, 0, 0)), (1, 0, 0));
      Fill(proj(p+u*($+.5(1, 1, -1)))--proj(p+u*($+.5(-1, 1, -1)))
	--proj(p+u*($+.5(-1, 1, 1)))--proj(p+u*($+.5(1, 1, 1)))--cycle,
	p+u*($+.5(0, 1, 0)), (0, 1, 0));
      Fill(proj(p+u*($+.5(-1, 1, -1)))--proj(p+u*($+.5(-1, -1, -1)))
	--proj(p+u*($+.5(-1, -1, 1)))--proj(p+u*($+.5(-1, 1, 1)))--cycle,
	p+u*($+.5(-1, 0, 0)), (-1, 0, 0));
      Fill(proj(p+u*($+.5(-1, -1, -1)))--proj(p+u*($+.5(1, -1, -1)))
	--proj(p+u*($+.5(1, -1, 1)))--proj(p+u*($+.5(-1, -1, 1)))--cycle,
	p+u*($+.5(0, -1, 0)), (0, -1, 0));
      Fill(proj(p+u*($+.5(1, -1, 1)))--proj(p+u*($+.5(1, 1, 1)))
	--proj(p+u*($+.5(-1, 1, 1)))--proj(p+u*($+.5(-1, -1, 1)))--cycle,
	p+u*($+.5(0, 0, 1)), (0, 0, 1));
      Fill(proj(p+u*($+.5(1, -1, -1)))--proj(p+u*($+.5(-1, -1, -1)))
	--proj(p+u*($+.5(-1, 1, -1)))--proj(p+u*($+.5(1, 1, -1)))--cycle,
	p+u*($+.5(0, 0, -1)), (0, 0, -1));
    endfor
  fi
enddef;
recurse(Origin, 1/3, 1);
endObject;
