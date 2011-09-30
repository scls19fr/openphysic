%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 3D extensions for MetaPost by Anthony Phan.
% file: m3Dplain.mp
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
%
% FOREWORD
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This file is the core of the m3D distribution.
% It provides elementary control sequences for drawing
% 3 dimensional objects. Some simple objects are defined
% in this file, but many others can be found in auxiliary
% files named m3DlibXX.mp. Those files may be helpful for
% understanding programming conventions. Samples and
% a documentation text (m3Dmanual) are also provided.
%
% CONTENTS
%
% SECTION 0. Parameters and reserved variables
% SECTION 1. Macros for animation (remembrance of Denis Roegel's macros)
% SECTION 2. Plain.mp's extension for 3D drawing
% SECTION 3. A library of basic objects or control sequences
% (cube, sphere, revolution, Plot3D, SpheresLink, rope)
%

if known mthreeDplain: endinput; fi
message "m3D now!";
message "";
mthreeDplain:=1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SECTION 0. PARAMETERS AND RESERVED VARIABLES
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% User's parameters are initialized in m3Dsty01.mp which is
% input at the end of this file
%
newinternal ObsZ, CurrentScale, Contrast, Luminosity,
Specularity, Phong, Alpha, Resolution, Fog, FogHalf, FogZ;
color Origin, LightSource, Oo, Ox, Oy, Oz, Ox_, Oy_, Oz_, PenColor,
ObjectColor, M_, M__;
% color ObjectAngles; ObjectAngles = (0, 0, 0);
picture AlphaPict;
boolean LightAtInfinity, FinePlotFlag;
path ObjectPath;

% For syntax only
Origin = (0, 0, 0);

% Scale change with respect to every object relative scale.
CurrentScale := 1;

pen thin.nib, rule.nib, thick.nib;

def SetPens(expr $, $$, $$$) =
  thin.nib := pencircle scaled $;
  rule.nib := pencircle scaled $$;
  thick.nib := pencircle scaled $$$;
enddef;

%
% rather practical (see OnDepth)
%

vardef romannumeral primary x =
  save _s_, _x_; string _s_; _s_ := ""; _x_ := x;
  forever: exitif _x_ < 1000; _s_ := _s_&"m"; _x_ := _x_-1000; endfor
  if _x_ >= 900: _s_ := _s_&"cm"; _x_ := _x_-900;
  elseif _x_ >= 500: _s_ := _s_&"d"; _x_ := _x_-500;
  elseif _x_ >= 400: _s_ := _s_&"cd"; _x_ := _x_-400;
  fi
  forever: exitif _x_ < 100; _s_ := _s_&"c"; _x_ := _x_-100; endfor
  if _x_ >= 90: _s_ := _s_&"xc"; _x_ := _x_-90;
  elseif _x_ >= 50: _s_ := _s_&"l"; _x_ := _x_-50;
  elseif _x_ >= 40: _s_ := _s_&"xl"; _x_ := _x_-40;
  fi
  forever: exitif _x_ < 10; _s_ := _s_&"x"; _x_ := _x_-10; endfor
  if _x_ >= 9: _s_ := _s_&"ix"; _x_ := _x_-9;
  elseif _x_ >= 5: _s_ := _s_&"v"; _x_ := _x_-5;
  elseif _x_ >= 4: _s_ := _s_&"iv"; _x_ := _x_-4;
  fi
  forever: exitif _x_ < 1; _s_ := _s_&"i"; _x_ := _x_-1; endfor
  _s_
enddef;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SECTION 1. Macros for animation
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% remembrance of 3D macros (Denis Roegel)
%
% Unix oriented, uses ``sed'' and ``convert'' (ImageMagick)

string AnimateScript; numeric xmin_, ymin_, xmax_, ymax_;

extra_endfig := extra_endfig &"; compute_bbox;";

def compute_bbox = 
  if known xmin_:
    xmin_ := min(xmin_, xpart(llcorner(currentpicture)));
    ymin_ := min(ymin_, ypart(llcorner(currentpicture)));
    xmax_ := max(xmax_, xpart(urcorner(currentpicture)));
    ymax_ := max(ymax_, ypart(urcorner(currentpicture)));
  else:
    xmin_ = xpart(llcorner(currentpicture));
    ymin_ = ypart(llcorner(currentpicture));
    xmax_ = xpart(urcorner(currentpicture));
    ymax_ = ypart(urcorner(currentpicture));
  fi;
enddef;

vardef Animate(expr border, transparency)= 
  save s; string s;
  write "#! /bin/bash" to AnimateScript;
  write "" to AnimateScript;
  write ("/bin/rm -f " & jobname & ".log") to AnimateScript;
  write ("echo Resizing " & jobname & " figures, ...") to AnimateScript;
  write ("for epsfig in `ls " & jobname & ".*| grep '" & jobname
      & ".[0-9]'`;do") to AnimateScript;
    if false: "endfor" fi % indentation hack for meta-mode.el
  write ("sed " & ditto
    & "s/%%BoundingBox:.*$/%%BoundingBox: "
    & decimal ceiling (xmin_-border)& " "
    & decimal ceiling (ymin_-border)& " "
    & decimal floor(xmax_+border) & " "
    & decimal floor (ymax_+2border)
    & "/1"
    & ditto
    & " $epsfig > $epsfig.eps") to AnimateScript;
  write "done" to AnimateScript;
  write ("echo merging " & jobname & " figures, ...") to AnimateScript;
  write ("convert -density " & decimal round(72*AnimateQuality) & " "
    & "-geometry " & decimal round(100/AnimateQuality) & "% "
    & "-loop " & decimal round AnimateLoop & " "
    & "-delay " & decimal AnimateDelay & " "
    if color transparency:
      & "-transparent rgbi:"
      & decimal(redpart transparency) & "/"
      & decimal(greenpart transparency) & "/"
      & decimal(bluepart transparency) & " "
    elseif boolean transparency:
      if transparency:
	& "-transparent rgbi:"
	& decimal(redpart background) & "/"
	& decimal(greenpart background) & "/"
	& decimal(bluepart background) & " "
      fi
    fi
    & jobname & ".*.eps "
    & jobname & ".gif") to AnimateScript;
  write ("/bin/rm -f " & jobname & ".*.eps") to AnimateScript;
  write ("echo Done with " & jobname & ".gif.") to AnimateScript;
  write EOF to AnimateScript;
  numeric xmin_, ymin_, xmax_, ymax_;
enddef;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SECTION 2. Plain.mp's extension for 3D drawing
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%
% SUBSECTION 2.0. Projection system
%

% These control sequences should allow to switch between
% usual plain MetaPost mode and m3Dplain's one. When working
% with other input files, one may have to customize these
% control sequences.

def threeDmode =
  save M, m, clearxy;
  % ``M'' plays a similar role to ``z'' in plain MetaPost.
  % One must notice that ``z'' has here the same role as
  % ``x'' and ``y''.
  vardef M@# = (x@#, y@#, z@#) enddef;
  % quite practical but beware not to use ``m''
  % simultaneously as this macro and, say, as an
  % integer parameter.
  vardef m@# = proj(M@#) enddef;
  def clearxy = save x, y, z enddef;
  clearxy;
%  tertiarydef  a -- b= if color a: proj(a) else: a fi
%    {curl 1}..{curl 1} if color b: proj(b) else: b fi enddef;
%  tertiarydef a --- b = if color a: proj(a) else: a fi
%    .. tension infinity .. if color b: proj(b) else: b fi enddef;
%  tertiarydef a ... b = if color a: proj(a) else: a fi
%    .. tension atleast 1 .. if color b: proj(b) else: b fi enddef;
enddef;

def twoDmode =
  save M, m;
  vardef z@# = (x@#, y@#) enddef;
  def clearxy = save x, y enddef;
  clearxy;
%  def -- = {curl 1}..{curl 1} enddef;
%  def --- = .. tension infinity .. enddef;
%  def ... = .. tension atleast 1 .. enddef;
enddef;

let Xpart = redpart;
let Ypart = greenpart;
let Zpart = bluepart;

vardef SetM@# expr $ = x@#:=Xpart($); y@#:=Ypart($); z@#:=Zpart($) enddef;

% quite practical
% def unpair expr p = xpart p, ypart p enddef;

% translate relative coordinates to screen coordinates
vardef GCoord primary p=
  (CurrentScale*(Xpart p*Ox+Ypart p*Oy+Zpart p*Oz)+Oo)
enddef;

% translate relative direction to screen direction
vardef GDir primary p= (Xpart p*Ox+Ypart p*Oy+Zpart p*Oz)
enddef;

% Depth with respect to the screen
vardef Depth primary p = -Zpart(GCoord p) enddef;

% Various projection systems: linear, planar, spherical.
def ProjectionSystem suffix name =
  scantokens("ProjectionSystem_"&str name);
enddef;

def ProjectionSystem_linear =
  vardef proj primary p =
    (Xpart(GCoord p), Ypart(GCoord p))
  enddef;
enddef;

def ProjectionSystem_planar =
  vardef proj primary p =
    ObsZ/(ObsZ-Zpart(GCoord p))
    *(Xpart(GCoord p), Ypart(GCoord p))
  enddef;
enddef;

def ProjectionSystem_spherical =
  vardef proj primary p =
    abs(ObsZ)/Norm(GCoord p-(0, 0, ObsZ))
    *(Xpart GCoord p, Ypart GCoord p)
  enddef;
enddef;

ProjectionSystem(linear);

%
% SUBSECTION 2.1. Vector calculus
%

primarydef u Dotprod v =
  (Xpart u * Xpart v + Ypart u * Ypart v + Zpart u * Zpart v)
enddef;

primarydef u Vectprod v =
  (Ypart u * Zpart v - Zpart u * Ypart v,
    Zpart u * Xpart v - Xpart u * Zpart v,
    Xpart u * Ypart v - Ypart u * Xpart v)
enddef;

def Mixtprod(expr u, v, w) =
  (Xpart u)*((Ypart v)*(Zpart w)-(Zpart v)*(Ypart w))
  -(Ypart u)*((Xpart v)*(Zpart w)-(Zpart v)*(Xpart w))
  +(Zpart u)*((Xpart v)*(Ypart w)-(Ypart v)*(Xpart w))
enddef;

% The following seems to be the best solution for
% computing a vector's norm. Direct computations
% with squares and square roots would frequently
% lead to overflow errors.

vardef Norm primary z =
  abs (abs(Xpart z, Ypart z), Zpart z)
enddef;

vardef Unitvector primary z = z/Norm z enddef;

% it seems to work
vardef Projection(expr u, v, w, d, p) =
  save x_, y_, z_;
  Mixtprod((x_, y_, z_)-u, v-u, w-u) = 0;
  (x_, y_, z_)-p = whatever*d;
  (x_, y_, z_)
enddef;

% not tested
def Reflection(expr u, v, w, d, p) =
  2*Projection(u, v, w, d, p)-p
enddef;

%
% SUBSECTION 2.2. Rotations and frames
%
% Notes (October 6, 2001):
% In order to allow unscaled material (text)
% within objects, coordinates vectors are no
% longer scaled. That means that one should
% not use them directly in most cases. The
% internal variable CurrentScale does the
% scaling via ``m'' and ``proj'' control
% sequences.

def Xrotate(expr $, $$, $$$) =
  cphi*ctheta*$ + cphi*stheta*$$ + sphi*$$$
enddef;

def Yrotate(expr $, $$, $$$) =
  -(cpsi*stheta+spsi*sphi*ctheta)*$
  +(cpsi*ctheta-spsi*sphi*stheta)*$$
  +spsi*cphi*$$$
enddef;

def Zrotate(expr $, $$, $$$) =
  (spsi*stheta-cpsi*sphi*ctheta)*$
  -(spsi*ctheta+cpsi*sphi*stheta)*$$
  +cpsi*cphi*$$$
enddef;

def Rotate(expr $, $$, $$$) =
  (Xrotate($, $$, $$$), Yrotate($, $$, $$$), Zrotate($, $$, $$$))
enddef;

% The text `t' is any non empty argument. Its reason to be
% lies in the tricky `Object' behavior.

def Euler(expr theta, phi, psi, ObjectUnit) =
  Euler_(theta,phi,psi,ObjectUnit,whatever);
enddef;

def Euler_(expr theta, phi, psi, ObjectUnit)(text t) =
  Ox_ := Ox; Oy_ := Oy; Oz_ := Oz;
  save Ox, Oy, Oz, ctheta, stheta, cphi, sphi, cpsi, spsi;
  color Ox, Oy, Oz;
  ctheta = cosd theta; stheta = sind theta;
  cphi = cosd phi; sphi = sind phi;
  cpsi = cosd psi; spsi = sind psi;
  interim CurrentScale := ObjectUnit*CurrentScale;
  Ox = Xrotate(Ox_, Oy_, Oz_);
  Oy = Yrotate(Ox_, Oy_, Oz_);
  Oz = Zrotate(Ox_, Oy_, Oz_);
enddef;

vardef Angle(expr p) =
  if (Xpart p++Ypart p) < eps: 0, 90 else:
    angle(Xpart p, Ypart p), angle(Xpart p++Ypart p, Zpart p)
  fi
enddef;

def Dir(expr a, b) =
  (cosd(a)*cosd(b), sind(a)*cosd(b), sind(b))
enddef;

%
% SUBSECTION 2.3. Sorting objects with respect to their depth
%

% Usually, one may just sort points in space.

def SortCriterion(expr $, $$) =
  Depth $ < Depth $$
enddef;

% Then arguments of QuickSort is just a list of points 

vardef QuickSort(expr pivot)(text remainder) =
  save MaxList, MinList, MaxCard, MinCard; MaxCard = MinCard = 0;
  for $ = remainder:
    if SortCriterion(pivot, $):
      if MaxCard > 0: expandafter def expandafter MaxList expandafter =
	  MaxList, $ enddef; else: def MaxList = $ enddef; fi
      MaxCard := MaxCard+1;
    else:
      if MinCard > 0: expandafter def expandafter MinList expandafter =
	  MinList, $ enddef; else: def MinList = $ enddef; fi
      MinCard := MinCard+1;
    fi
  endfor
  if MaxCard > 1: QuickSort(MaxList); let MaxList = SortedList; fi
  if MinCard > 1: QuickSort(MinList); let MinList = SortedList; fi
  if MaxCard > 0: expandafter def expandafter SortedList expandafter =
      MaxList, pivot enddef;
  else: def SortedList = pivot enddef; fi
  if MinCard > 0: expandafter def expandafter SortedList expandafter =
      SortedList, enddef;
    expandafter expandafter expandafter def
      expandafter expandafter expandafter SortedList
      expandafter expandafter expandafter =
      expandafter SortedList MinList enddef; fi
enddef;

% Syntax:
%
% OnDepth;
% Refpoint <triple>;
% Action <text>;
% ...
% endOnDepth;
%
% <text> may be surrounded by begingroup ... endgroup.

% FORGET IT!
%def SaveOnDepth =
%    save OnDepth;
%    def OnDepth = begingroup save endOnDepth;
%	def endOnDepth = endgroup enddef;
%    enddef;
%enddef;

def OnDepth =
    begingroup
      save Action_, Action_counter, _x_, _y_, _z_;
      Action_counter = 0;
    enddef;

    def Refpoint expr p =
      Action_counter := Action_counter+1;
      _x_[Action_counter] = Xpart p;
      _y_[Action_counter] = Ypart p;
      _z_[Action_counter] = Zpart p;
    enddef;

    def Action(text t) =
      scantokens("vardef Action_." & romannumeral Action_counter & "=")
	t; quote enddef;
    enddef;

    def endOnDepth =
    if Action_counter > 1:
      save SortCriterion, SortedList;
      def SortCriterion(expr $, $$) =
	Depth (_x_[$], _y_[$], _z_[$])
	< Depth (_x_[$$], _y_[$$], _z_[$$])
      enddef;
      QuickSort(1, 2 upto Action_counter);
      for $ = SortedList:
	scantokens("Action_." & romannumeral $);
      endfor
    elseif Action_counter = 1: Action_.i; fi
  endgroup;
enddef;

%
% SUBSECTION 2.4. Object oriented macros
%

% About the use of ``quote'' in the next macro,
% see METAFONTbook, p. 166 and p. 277.
% Groups around object's replacement text
% is ensured by the ``UseObject'' macro.
%
% Objects can have parameters just as normal definitions.
% Since they are accessible thru the control sequence
% UseObject(ObjectName, ObjectOrigin, ObjectAngles, ObjectScale...),
% ObjectScale... is a text parameter t. The parameter ObjectScale
% itself is passed to the Object via `INACCESSIBLE' symbolic token.

def Object suffix ObjectName =
    expandafter quote def
      scantokens("Object_"&str ObjectName)(expr INACCESSIBLE)
    enddef;

    let endObject = enddef;

def SubObject expr $ =
  if (SubObjectNumber = $) or (SubObjectNumber = 0)
  enddef;

  let endSubObject = fi;

% Beware of the ObjectUnit parameter.
% Metric units should be used only at
% the top level (multiple scaling).
%
% Syntax:
% UseObject(<ObjectName>, <ObjectOrigin>, <ObjectAngles>, <ObjectUnit>
%     [, <ObjectParameters>])
% text t = <ObjectUnit>[, ObjectParameters]
% It may look like a tricky thing. Well...

def UseObject(suffix ObjectName)
  (expr ObjectOrigin, ObjectAngles)(text t) =
  Oo := Oo+CurrentScale*(Xpart ObjectOrigin*Ox+Ypart ObjectOrigin*Oy
    +Zpart ObjectOrigin*Oz);
  begingroup
    Euler_(Xpart ObjectAngles, Ypart ObjectAngles, Zpart ObjectAngles, t, 0);
    save SubObjectNumber; clearxy;
    if known SubObjectNumber_: SubObjectNumber = SubObjectNumber_;
      save SubObjectNumber_; else: SubObjectNumber := 0; fi
    scantokens("Object_"&str ObjectName)(t);
  endgroup;
  Oo := Oo-CurrentScale*(Xpart ObjectOrigin*Ox+Ypart ObjectOrigin*Oy
    +Zpart ObjectOrigin*Oz);
enddef;

vardef UseSubObject@#(suffix ObjectName)
  (expr ObjectOrigin, ObjectAngles)(text t) =
  save SubObjectNumber_; SubObjectNumber_ := scantokens(str @#);
  UseObject(ObjectName, ObjectOrigin, ObjectAngles, t)
enddef;

%
% SUBSECTION 2.5. Drawing commands
%

def Outside = let Orientation = turningnumber; Outside_ := 1 enddef;
def Inside = def Orientation = -turningnumber enddef; Outside_ := -1 enddef;

Outside;

vardef Light(expr p, d, c) =
  M_ := if LightAtInfinity: Unitvector LightSource
  else: Unitvector (LightSource-GCoord p)
  fi;
  if Fog > 0:
    (mexp(-256max(0,
	  (if Fog < 2: FogZ+Depth p
	    else: Norm((0, 0, ObsZ)-GCoord p)+FogZ-ObsZ fi)
	  /FogHalf)))[background,
  fi
  Luminosity*(0.5*(1+(Outside_*GDir d Dotprod M_))
    [1-Contrast, 1])*c
  if Specularity > 0:
    +Specularity*((max(0, (2(M_ Dotprod GDir d)
	    *GDir d-M_)
	  Dotprod Unitvector((0, 0, ObsZ)-GCoord p)))**Phong)*background
  fi
  if Fog>0: ] fi
enddef;

def SolidFill(expr c, p, n) =
  if Orientation(c) >= 0:
    fill c withcolor Light(p, n, ObjectColor)
  fi
enddef;

def TechnoFill(expr c, p, n) =
  addto currentpicture doublepath c withpen
  if Orientation(c) >= 0: rule.nib
  else: thin.nib dashed evenly fi
  withcolor PenColor
enddef;

def WireFill(expr c, p, n) =
  if Orientation(c) >= 0:
    unfill c;
    addto currentpicture doublepath c
    withpen rule.nib withcolor PenColor
  fi
enddef;

def WireDraw(expr c, p, n) =
  if Orientation(c) >= 0:
    addto currentpicture doublepath c
    withpen rule.nib withcolor PenColor
  fi
enddef;

def SolidWireFill(expr c, p, n) =
  if Orientation(c) >= 0:
    fill c withcolor Light(p, n, ObjectColor);
    addto currentpicture doublepath c
    withpen currentpen withcolor Light(p, n, PenColor)
  fi
enddef;

% too heavy to work properly.

def AlphaFill(expr c, p, n)=
  AlphaPict := nullpicture;
  if Orientation c >= 0:
    AlphaPicture(currentpicture, c, Light(p, n, ObjectColor));
  else:
    AlphaPicture(currentpicture, c, Light(p, -n, ObjectColor)); 
  fi
  addto currentpicture also AlphaPict;
enddef;

vardef AlphaPicture(expr p, c, Color) =
  save p_, xmax_, xmin_, ymax_, ymin_; picture p_;
  p_ = nullpicture;
  (xmin_, ymin_) = llcorner c; (xmax_, ymax_) = urcorner c;
  addto p_ contour c withcolor Alpha[background, Color];
  for p__ within p:
    numeric xmin__, xmax__, ymin__, ymax__;
    (xmin__, ymin__) = llcorner p__; (xmax__, ymax__) = urcorner p__;
    if (xmax__ <= xmin_) or (xmin__ >= xmax_):
    else:
      if (ymax__ <= ymin_) or (ymin__ >= ymax_):
      else:
	if (not clipped p__) and (not bounded p__):
	  addto p_ also p__ withcolor
	  Alpha[(redpart p__, greenpart p__, bluepart p__), Color];
	else:
	  begingroup save AlphaPict;
	    picture AlphaPict; AlphaPict = nullpicture;
	    AlphaPicture(p__, pathpart p__, Color);
	    addto p_ also AlphaPict;
	  endgroup;
	fi
      fi
    fi
  endfor
  clip p_ to c;
  addto AlphaPict also p_;
enddef;

let Fill = SolidFill;

%
% Attempt to write directly the eps file 
% Beware: the %%BoundingBox: values are delayed at the end of the file.
% One could edit the output to put this line at the second place
% in the file.
%

def DirectSetup =
  save xmax_, xmin_, ymax_, ymin_, cp, flag, Fill, filename;
  let Fill=DirectFill; string filename; boolean flag; flag=false;
  vardef cp(expr c, t) =
    if flag:
      xmax_:=max(xpart point t of c, xmax_);
      xmin_:=min(xpart point t of c, xmin_);
      ymax_:=max(ypart point t of c, ymax_);
      ymin_:=min(ypart point t of c, ymin_);
    else:
      xmax_:=xmin_:=xpart point t of c;
      ymax_:=ymin_:=ypart point t of c;
      flag:=true;
    fi
    decimal xpart point t of c & " " & decimal ypart point t of c
  enddef;
enddef;

def DirectEPS expr file =
  begingroup
    DirectSetup; filename=file;
    write "%!PS-Adobe-3.0 EPSF-3.0" to filename;
    write "%%BoundingBox: (atend)" to filename;
    write "%%Creator: m3D" to filename;
    write ("%%CreationDate: "
      & decimal year & ":" & decimal month & ":"
      & decimal day & ":" & decimal time) to filename;
    write "%%Pages: 1" to filename;
    write "%%EndProlog" to filename;
    write "%%Page: 1 1" to filename;
    write "/f {closepath fill} bind def" to filename;
      write "/l {lineto} bind def" to filename;
	write "/m {moveto} bind def" to filename;
	  write "/RG {setrgbcolor newpath} bind def" to filename;
	    write "/G {setgray newpath} bind def" to filename;
	      if false: "enddef enddef enddef enddef enddef" fi
  enddef;

  def endDirectEPS =
%    write "showpage" to filename;
    write "%%Trailer" to filename;
    write ("%%BoundingBox: "
      & decimal floor xmin_ & " "
      & decimal floor ymin_ & " "
      & decimal ceiling xmax_ & " "
      & decimal ceiling ymax_) to filename;
    write "%%EOF" to filename;
    write EOF to filename;
  endgroup;
enddef;

def DirectFill(expr c, p, n) = 
  if Orientation(c) >= 0:
    M_:=Light(p, n, ObjectColor);
    write (
      if (Xpart M_=Ypart M_) and (Ypart M_=Zpart M_):
	decimal (Xpart M_) & " G "
      else:
	decimal (Xpart M_)
	&" "& decimal (Ypart M_)
	&" "& decimal (Zpart M_)
	& " RG "
      fi
      & cp(c,0) & " m "
      for $=1 upto length c-1:
	& cp(c, $) & " l "
      endfor
      & "f") to filename;
  fi
enddef;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SECTION 3. A library of basic objects
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% SUBSECTION 3.1. Cube
%
% parameters: none
%
% sub-objects: none
%

Object cube =
  M1 = (-0.5, -0.5, -0.5); M2 = (0.5, -0.5, -0.5);
  M3 = (0.5, 0.5, -0.5); M4 = (-0.5, 0.5, -0.5);
  M5 = (-0.5, -0.5, 0.5); M6 = (0.5, -0.5, 0.5);
  M7 = (0.5, 0.5, 0.5); M8 = (-0.5, 0.5, 0.5);
  OnDepth;
    Refpoint 0.5[M1, M3];
    Action (Fill(m1--m4--m3--m2--cycle, 0.5[M1, M3], (0, 0, -1)));
    Refpoint 0.5[M5, M7];
    Action (Fill(m5--m6--m7--m8--cycle, 0.5[M5, M7], (0, 0, 1)));
    Refpoint 0.5[M1, M6];
    Action (Fill(m1--m2--m6--m5--cycle, 0.5[M1, M6], (0, -1, 0)));
    Refpoint 0.5[M3, M8];
    Action (Fill(m3--m4--m8--m7--cycle, 0.5[M3, M8], (0, 1, 0)));
    Refpoint 0.5[M2, M7];
    Action (Fill(m2--m3--m7--m6--cycle, 0.5[M2, M7], (1, 0, 0)));
    Refpoint 0.5[M1, M8];
    Action (Fill(m1--m5--m8--m4--cycle, 0.5[M1, M8], (-1, 0, 0)));
  endOnDepth;
endObject;

%
% SUBSECTION 3.2. Sphere
%
% parameters: none
%
% sub-objects: 1 (lower part), 2 (upper part)

def MetaSphere(expr rx, ry, rz, tmin, tmax, pmin, pmax) =
  save na, nb, t_, t__, p_, p__;
  p_ = max(-90+eps, min(pmin, pmax));
  p__ = min(90-eps, max(pmin, pmax));
  t_ = min(tmin, tmax);
  t__ = max(tmin, tmax);
  na=ceiling(3.14159*((p__-p_)/180)
    *sqrt(rx*ry)*rz*(CurrentScale/Resolution));
  nb=ceiling(3.14159*((t__-t_)/180)
    *rx*ry*(CurrentScale/Resolution));
  for $ = 0 upto na-1:
    phi :=($/na)[p_, p__]; % for special effects
    x := cosd phi;
    y := cosd((($+1)/na)[p_, p__]);
    z5 := sind((($+.5)/na)[p_, p__])/rz/rz;
    z0 := cosd((($+.5)/na)[p_, p__]);
    x2 := rx*x*cosd t_; y2 := ry*x*sind t_;
    x3 := rx*y; y3 := 0;
    z1 := z2 := rz*sind phi;
    z3 := z4 := rz*sind((($+1)/na)[p_, p__]);
    for @ = 1 upto nb:
      theta := (@/nb)[t_, t__]; % for special effects
      x1 := x2; y1 := y2; x4 := x3; y4 := y3;
      z := cosd theta; x2 := rx*x*z; x3 := rx*y*z;
      z := sind theta; y2 := ry*x*z; y3 := ry*y*z;
      x5 := rz*z0*cosd(((@+.5)/nb)[t_, t__])/rx/rx;
      y5 := rz*z0*sind(((@+.5)/nb)[t_, t__])/ry/ry;
      Fill (m1--m2--m3--m4--cycle, (M1+M2+M3+M4)/4,
	Unitvector(x5, y5, z5));
    endfor endfor
enddef;

Object sphere =
  MetaSphere(1,1,1,0,360,-90,90);
endObject;

%
% SUBSECTION 3.2. Revolution (now!)
%
% parameter: planar path p
%
% sub-objects: none
%
% description: the solid of revolution as we
% say in a frenchy english is obtained by drawing
% around the axis z'Oz a planar path p(t) = (x(t), z(t))
% x(t) should remain >= eps. By the way, it is not
% supposed to work with very complex designs. One
% should then decompose such path...

Object revolution(expr p) =
  save a, na, nz;
  %
  % maximum distance to the axis
  %
  z = length p; x = 0;
  for $=0 upto 4*z:
  % mean distance x := x*($/($+1))+xpart(point $/4*z of p)/($+1);
    x := max(x, xpart(point $/4*z of p));
  endfor
  %
  % how half many steps for revolution
  %
  na = ceiling(3.14159*(CurrentScale/Resolution)*x);
  %
  % looking for the deepest angle
  %
  a := 0; x := Depth(1, 0, 0);
  for $ = 1 upto 2na:
    x' := Depth(cosd($/na*180), sind($/na*180), 0);
    if x' > x: x := x'; a := $; fi
  endfor
  %
  % Let's go
  %
  for n = 0 upto na-1:
    for t = 0 upto length p-1:
      x := xpart(point t of p); z := ypart(point t of p);
      nz := ceiling((arclength subpath (t, t+1) of p)*(CurrentScale/Resolution));
      for k = 1 upto nz:
	x' := xpart(point t+k/nz of p); z' := ypart(point t+k/nz of p);
        %
	Fill(proj(x*cosd((n+a)/na*180), x*sind((n+a)/na*180), z)
	  --proj(x'*cosd((n+a)/na*180), x'*sind((n+a)/na*180), z')
	  --proj(x'*cosd((n+a+1)/na*180),
	    x'*sind((n+a+1)/na*180), z')
	  --proj(x*cosd((n+a+1)/na*180),
	    x*sind((n+a+1)/na*180), z)
	  --cycle,
	  (0.5(x+x')*cosd((n+a+0.5)/na*180),
	    0.5(x+x')*sind((n+a+0.5)/na*180), 0.5(z+z')),
	  Unitvector((z-z')*cosd((n+a+0.5)/na*180),
	    (z-z')*sind((n+a+0.5)/na*180), x'-x)
	  );
        %
	Fill(proj(x*cosd((-n+a)/na*180), x*sind((-n+a)/na*180), z)
	  --proj(x*cosd((-n+a-1)/na*180),
	    x*sind((-n+a-1)/na*180), z)
	  --proj(x'*cosd((-n+a-1)/na*180),
	    x'*sind((-n+a-1)/na*180), z')
	  --proj(x'*cosd((-n+a)/na*180), x'*sind((-n+a)/na*180), z')
	  --cycle,
	  (0.5(x+x')*cosd((-n+a-0.5)/na*180),
	    0.5(x+x')*sind((-n+a-0.5)/na*180), 0.5(z+z')),
	  Unitvector((z-z')*cosd((-n+a-0.5)/na*180),
	    (z-z')*sind((-n+a-0.5)/na*180), x'-x)
	  );
	x := x'; z := z';
      endfor
    endfor
  endfor
endObject;

%
% SUBSECTION 3.3. cylinderlike
%
% parameter: planar path p, numerical height
%
% sub-objects: border, top, bottom
%
% description: this object is some kind of cylinder
% with height h (Oz-axis) and a basis which is a
% planar (xOy-plane) path p

Object cylinderlike(expr p, h) =
  save n, nz, tmppath; path tmppath;
  nz = ceiling(h*(CurrentScale/Resolution));
  SubObject1:
  OnDepth;
    for t = 0 upto length p-1:
      Refpoint (xpart point t of p, ypart point t of p, 0);
      Action (x := xpart point t of p; y := ypart point t of p;
	n := ceiling((arclength subpath (t, t+1) of p)*(CurrentScale/Resolution));
	for k = 1 upto n:
	  x' := xpart point t+k/n of p; y' := ypart point t+k/n of p;
        %
	  for $ = 1 upto nz:
	    Fill(proj(x,y,($-1)/nz*h)--proj(x',y',($-1)/nz*h)
	      --proj(x',y',$/nz*h)--proj(x,y,$/nz*h)--cycle,
	      (0.5(x+x'), 0.5(y+y'),($-0.5)/nz*h), Unitvector(y'-y,x-x',0));
	  endfor
	  x := x'; y := y';
	endfor);
    endfor
  endOnDepth;
  endSubObject;
  SubObject2:
  tmppath:=proj(xpart point 0 of p, ypart point 0 of p, h);
  x:=0; y:=0;
  for t = 0 upto length p-1:
    x:=x+xpart point t of p; y:=y+ypart point t of p;
    n := ceiling((arclength subpath (t, t+1) of p)*(CurrentScale/Resolution));
    tmppath := tmppath for k = 1 upto n:
      --proj(xpart point t+k/n of p, ypart point t+k/n of p, h) endfor;
  endfor
  x:=x/length p; y:=y/length p;
  tmppath := tmppath--cycle;
  Fill(tmppath, (x,y,h), (0,0,1));
  endSubObject;
  SubObject3:
  tmppath:=proj(xpart point 0 of p, ypart point 0 of p, 0);
  x:=0; y:=0;
  for t = 0 upto length p-1:
    x:=x+xpart point t of p; y:=y+ypart point t of p;
    n := ceiling((arclength subpath (t, t+1) of p)*(CurrentScale/Resolution));
    tmppath := tmppath for k = 1 upto n:
      --proj(xpart point t+k/n of p, ypart point t+k/n of p, 0) endfor;
  endfor
  x:=x/length p; y:=y/length p;
  tmppath := reverse tmppath--cycle;
  Fill(tmppath, (x,y,0), (0,0,-1));
  endSubObject;
endObject;

%
% SUBSECTION 3.3. z = f(x, y)
%
% Example:
%
% beginfig(1);
%  Euler(0,0,0,0.15cm);
%  Frame(-20 step 2 until 20)(-20 step 2 until 20)(-1,-0.5,0,0.5,1);
%  Plot3D("cosd(abs(x, y)/3.1416*180)", -20, 20, -20, 20);
%  endFrame;
% endfig;

def FrameTick(expr s, point, direction) =
  begingroup save p, z; picture p; pair z[];
    if picture s:  p=s
    else: p = s infont defaultfont scaled defaultscale
    fi;
    z1 := proj(point);
    z2 := proj(point+labeloffset/CurrentScale*Unitvector(direction));
    z3 := 0.5(llcorner p+urcorner p);
    z4 := (bbox p) intersectionpoint
    (z3..z3+abs(urcorner p-llcorner p)*unitvector(z1-z2));
    draw z1..z2; draw p shifted (z2-z4);
  endgroup;
enddef;

def FrameMark expr p =
  draw proj p..proj(Xpart p, Ypart p, FrameZmin) dashed evenly;
  draw proj p..proj(Xpart p, FrameYmin, Zpart p) dashed evenly;
  draw proj p..proj(FrameXmin, Ypart p, Zpart p) dashed evenly;
enddef;

def Frame(text xlist)(text ylist)(text zlist) =
  begingroup save FrameXmin, FrameXmax, FrameYmin,
    FrameYmax, FrameZmin, FrameZmax, t;
    FrameXmin = infinity; FrameXmax = -infinity;
    for $ = xlist:
      if $ < FrameXmin: FrameXmin := $; fi
      if $ > FrameXmax: FrameXmax := $; fi
    endfor
    if Depth(FrameXmin, 0, 0) < Depth(FrameXmax, 0, 0):
      t:=FrameXmax; FrameXmax:=FrameXmin; FrameXmin:=t; fi
    FrameYmin = infinity; FrameYmax = -infinity;
    for $ = ylist:
      if $ < FrameYmin: FrameYmin := $; fi
      if $ > FrameYmax: FrameYmax := $; fi
    endfor
    if Depth(0, FrameYmin, 0) < Depth(0, FrameYmax, 0):
      t:=FrameYmax; FrameYmax:=FrameYmin; FrameYmin:=t;
    fi
    FrameZmin = infinity; FrameZmax = -infinity;
    for $ = zlist:
      if $ < FrameZmin: FrameZmin := $; fi
      if $ > FrameZmax: FrameZmax := $; fi
    endfor
    if Depth(0, 0, FrameZmin) < Depth(0, 0, FrameZmax):
      t:=FrameZmax; FrameZmax:=FrameZmin; FrameZmin:=t;
    fi
    draw proj(FrameXmin, FrameYmin, FrameZmax)
    --proj(FrameXmax, FrameYmin, FrameZmax)
    --proj(FrameXmax, FrameYmin, FrameZmin)
    --proj(FrameXmax, FrameYmax, FrameZmin)
    --proj(FrameXmin, FrameYmax, FrameZmin)
    --proj(FrameXmin, FrameYmax, FrameZmax)--cycle;
    draw proj(FrameXmin, FrameYmin, FrameZmin)
    ..proj(FrameXmax, FrameYmin, FrameZmin);
    draw proj(FrameXmin, FrameYmin, FrameZmin)
    ..proj(FrameXmin, FrameYmax, FrameZmin);
    draw proj(FrameXmin, FrameYmin, FrameZmin)
    ..proj(FrameXmin, FrameYmin, FrameZmax);
    for $ = xlist:
      if ($ <> FrameXmin) and ($ <> FrameXmax):
	draw proj($, FrameYmin, FrameZmin)
	..proj($, FrameYmax, FrameZmin) dashed evenly;
	draw proj($, FrameYmin, FrameZmin)
	..proj($, FrameYmin, FrameZmax) dashed evenly;
      fi
      FrameTick(decimal $, ($, FrameYmax, FrameZmin),
	(0, FrameYmax-FrameYmin, 0));
    endfor
    for $ = ylist:
      if ($ <> FrameYmin) and ($ <> FrameYmax):
	draw proj(FrameXmin, $, FrameZmin)
	..proj(FrameXmax, $, FrameZmin) dashed evenly;
	draw proj(FrameXmin, $, FrameZmin)
	..proj(FrameXmin, $, FrameZmax) dashed evenly;
      fi
      FrameTick(decimal $, (FrameXmax, $, FrameZmin),
	(FrameXmax-FrameXmin, 0, 0));
    endfor
    for $ = zlist:
      if ($ <> FrameZmin) and ($ <> FrameZmax):
	draw proj(FrameXmin, FrameYmin, $)
	..proj(FrameXmax, FrameYmin, $) dashed evenly;
	draw proj(FrameXmin, FrameYmin, $)
	..proj(FrameXmin, FrameYmax, $) dashed evenly;
      fi
      FrameTick(decimal $, (FrameXmax, FrameYmin, $),
	(0, FrameYmin-FrameYmax, 0));
    endfor
enddef;

def endFrame = endgroup enddef;

def Plot suffix @# = if (str @# = "3D") or (str @# = "3d"):
    PlotThreeD else: fi
enddef;

def PlotThreeDFill(suffix $, $$, $$$) =
  M_ := (M$+M$$+M$$$)/3;% average point
  M__ := (M$$-M$)Vectprod(M$$$-M$);% normal vector
  if Norm(M__) > eps: p_ := m$--m$$--m$$$--cycle;
    if Orientation p_ >0: Fill(p_, M_, Unitvector M__);
    else: Fill(p_, M_, -Unitvector M__); fi
  fi
enddef;

vardef PlotThreeD(expr formula, xmin, xmax, ymin, ymax) =
  clearxy; save a, f, nx, ny, p_; a = 0; path p_;
  scantokens("vardef f(expr x, y) ="& formula &" enddef;");
  M5 = (xmin, ymin, 0);
  M6 = (xmin, ymax, 0);
  M7 = (xmax, ymin, 0);
  M8 = (xmax, ymax, 0);
  OnDepth;
    Refpoint M5; Action (M[incr a] = M5);
    Refpoint M6; Action (M[incr a] = M6);
    Refpoint M7; Action (M[incr a] = M7);
    Refpoint M8; Action (M[incr a] = M8);
  endOnDepth;
  p_ := m1--m2--m4--m3--cycle;
  if Orientation p_ < 0: x5 := x2; y5 := y2; z5 := z2;
    x2 := x3; y2 := y3; z2 := z3; x3 := x5; y3 := y5; z3 := z5; fi
  nx = ceiling((abs(x3-x1)+abs(y3-y1))*(CurrentScale/Resolution));
  ny = ceiling((abs(x2-x1)+abs(y2-y1))*(CurrentScale/Resolution));
  for i = 1 upto nx:
    for j = 1 upto ny:
      x5 := ((i-1)/nx)
      [((j-1)/ny)[x1, x2], ((j-1)/ny)[x3, x4]];
      x6 := ((i-1)/nx)
      [(j/ny)[x1, x2], (j/ny)[x3, x4]];
      x7 := (i/nx)
      [((j-1)/ny)[x1, x2], ((j-1)/ny)[x3, x4]];
      x8 := (i/nx)
      [(j/ny)[x1, x2], (j/ny)[x3, x4]];
      y5 := ((i-1)/nx)
      [((j-1)/ny)[y1, y2], ((j-1)/ny)[y3, y4]];
      y6 := ((i-1)/nx)
      [(j/ny)[y1, y2], (j/ny)[y3, y4]];
      y7 := (i/nx)
      [((j-1)/ny)[y1, y2], ((j-1)/ny)[y3, y4]];
      y8 := (i/nx)
      [(j/ny)[y1, y2], (j/ny)[y3, y4]];
      z5 := f(x5, y5); z6 := f(x6, y6); z7 := f(x7, y7); z8 := f(x8, y8);
      if FinePlotFlag:
	x0 := (x5+x8)/2; y0 := (y5+y8)/2; z0 := f(x0, y0);
	PlotThreeDFill(0, 5, 6);
	PlotThreeDFill(0, 6, 8);
	PlotThreeDFill(0, 8, 7);
	PlotThreeDFill(0, 7, 5);
      else:
	M_:=(M5+M6+M7+M8)/4;% average point
        % some almost normal vector: a way to compute
        % such a vector would have been an average over
        % the four normal vectors associated to the average
        % point and every consecutive edges; the properties
        % of the vector product allow to replace the average
        % point by any other one; here we have taken the Origin.
	M__ := Unitvector((M5 Vectprod M6 )+(M6 Vectprod M8)
	  +(M8 Vectprod M7)+(M7 Vectprod M5));
	if Orientation(m5--m6--m8--m7--cycle)>=0:
	  Fill(m5--m6--m8--m7--cycle, M_, M__)
	else: Fill(m7--m8--m6--m5--cycle, M_, -M__) fi;
      fi
    endfor
  endfor
enddef;

%
% SUBSECTION 3.4. SpheresLinks for (say) chemistry
%
% parameters: center of the first sphere (three coordinates),
% center of the second sphere (three coordinates),
% radius of the first sphere (real parameter),
% radius of the second sphere (real parameter),
% radius of the cylindrical link (real parameter).
%
% Beware! It is not an object which means that one
% has to use it within an object or with care to
% global coordinates.
%
% If one of the spheres' radius is less than the radius
% of the link, the corresponding extremity will be the
% center of that sphere.

vardef SpheresLink(expr fcenter, scenter, fradius, sradius, radius) =
  clearxy; save MM_, MM__; color MM_, MM__;
  save na, nh; na=4ceiling(1.5708radius*(CurrentScale/Resolution));
  if Norm((scenter-fcenter) Vectprod (1, 0, 0)) <eps:
    M1 = Unitvector((scenter-fcenter) Vectprod (0, 1, 0));
  else:
    M1 = Unitvector((scenter-fcenter) Vectprod (1, 0, 0));
  fi
  M2 = Unitvector((scenter-fcenter) Vectprod M1);
  M3 = fcenter if fradius > radius:
    +(fradius+-+radius)*Unitvector(scenter-fcenter) fi;
  M4 = scenter if sradius > radius:
    +(sradius+-+radius)*Unitvector(fcenter-scenter) fi;
  MM_ := radius*M1;
  nh=ceiling(Norm(M3-M4)*(CurrentScale/Resolution));
  for @ = 1 upto nh:
    for $ = 1 upto na:
      MM__ := radius*(cosd($/na*360)*M1+sind($/na*360)*M2);
      Fill(proj(((@-1)/nh)[M3, M4]+MM_)
	--proj(((@-1)/nh)[M3, M4]+MM__)--proj((@/nh)[M3, M4]+MM__)
	--proj((@/nh)[M3, M4]+MM_)--cycle,
	((@-0.5)/nh)[M3, M4]+0.5[MM_, MM__],
	cosd(($-0.5)/na*360)*M1+sind(($-0.5)/na*360)*M2);
      MM_ := MM__;
    endfor
  endfor
enddef;

%
% SUBSECTION 3.5. Rope
%
% parameters: x(t), y(t), z(t), r, tmin, tmax, fillstart, fillend
%
% formulae must be given as string with "t" as symbolic variable,
% r, tmin, tmax are numerical parameters whose meanings are obvious,
% fillstart and fillend are boolean whose meaning are also obvious.

Object rope(expr xformula, yformula, zformula, r, tmin, tmax,
    fillstart, fillend) =
  save h, fx, fy, fz, na, nh, dh;
  dh=if tmin > tmax: - fi tolerance;
  scantokens("vardef fx(expr t) ="& xformula &" enddef;");
  scantokens("vardef fy(expr t) ="& yformula &" enddef;");
  scantokens("vardef fz(expr t) ="& zformula &" enddef;");
  %
  % measure the total length or the arc
  %
  h = 0; M_ := (fx(tmin), fy(tmin), fz(tmin));
  nh := 100;
  for $=1 upto nh:
    M__ := (fx(($/nh)[tmin, tmax]), fy(($/nh)[tmin, tmax]),
      fz(($/nh)[tmin, tmax]));
    h := h+Norm(M_-M__);
    M_ := M__;
  endfor
  %
  % steps parameters
  %
  na=4ceiling(1.570796r*(CurrentScale/Resolution));
  nh := ceiling(h*(CurrentScale/Resolution));
  %
  % initial frame
  %
  x1 := fx(tmin); y1 := fy(tmin); z1 := fz(tmin);
  x'1 := fx(tmin+dh); y'1 := fy(tmin+dh); z'1 := fz(tmin+dh);
  x''1 := (fx(tmin+2dh)+x1-2x'1)/tolerance;
  y''1 := (fy(tmin+2dh)+y1-2y'1)/tolerance;
  z''1 := (fz(tmin+2dh)+z1-2z'1)/tolerance;
  SetM'1(Unitvector(M'1-M1));
  SetM''1(M''1-(M''1 Dotprod M'1)*M'1);
  if M''1=Origin: message "inflexion at time "&decimal(tmin);
    %
    % try to find a non vanishing normal acceleration
    %
    h := tmin+dh;
    forever:
      x''1 := (fx(h+2dh)+fx(h)-2fx(h+dh))/tolerance;
      y''1 := (fy(h+2dh)+fy(h)-2fy(h+dh))/tolerance;
      z''1 := (fz(h+2dh)+fz(h)-2fz(h+dh))/tolerance;
      SetM''1(M''1-(M''1 Dotprod M'1)*M'1);
      h := h+dh;
      exitif (M''1 <> Origin);
    endfor
  fi
  M_ := Unitvector(M''1);
  M__ := M'1 Vectprod M_;
  SetM2(M_); SetM3(M__);
  %
  % fill or not the beginning of the rope
  %
  if fillstart:
    Fill(for @ = na-1 downto 0:
	proj(M1+r*(cosd(@/na*360)*M2+sind(@/na*360)*M3))-- endfor cycle,
      M1, -M'1);
  fi
  %
  % draw the rope
  %
  for $ = 1 upto nh:
    x4 := fx(($/nh)[tmin, tmax]);
    y4 := fy(($/nh)[tmin, tmax]);
    z4 := fz(($/nh)[tmin, tmax]);
    x'4 := fx(($/nh)[tmin, tmax]+dh);
    y'4 := fy(($/nh)[tmin, tmax]+dh);
    z'4 := fz(($/nh)[tmin, tmax]+dh);
    x''4 := (fx(($/nh)[tmin, tmax]+2dh)+x4-2x'4)/tolerance;
    y''4 := (fy(($/nh)[tmin, tmax]+2dh)+y4-2y'4)/tolerance;
    z''4 := (fz(($/nh)[tmin, tmax]+2dh)+z4-2z'4)/tolerance;
    SetM'4(Unitvector(M'4-M4));
    SetM''4(M''4-(M''4 Dotprod M'4)*M'4);
    %
    % try to find a non vanishing normal acceleration
    %
    if M''4=Origin: message "inflexion at time "&decimal(($/nh)[tmin, tmax]);
      M_ := Unitvector(M2-(M2 Dotprod M'4)*M'4); 
    else:
      M_ := Unitvector(M''4);
    fi
    M__ := M'4 Vectprod M_;
    SetM5(M_); SetM6(M__); SetM7(M1+r*M2); SetM10(M4+r*M5);
    if M2 Dotprod M5 < 0: SetM2(-M2); SetM3(-M3);
      SetM7(M1+r*M2); SetM10(M4+r*M5);fi
    for @=1 upto na:
      SetM8(M1+r*(cosd(@/na*360)*M2+sind(@/na*360)*M3));
      SetM9(M4+r*(cosd(@/na*360)*M5+sind(@/na*360)*M6));
      Fill(m7--m8--m9--m10--cycle, 0.5(M7+M9),
	Unitvector(0.5(cosd((@-.5)/na*360)*(M2+M5)
	    +sind((@-.5)/na*360)*(M3+M6))));
      SetM7(M8); SetM10(M9);
    endfor
    SetM1(M4); SetM2(M5); SetM3(M6);
  endfor
  %
  % fill or not the end of the rope
  %
  if fillend:
    Fill(for @ = 0 upto na-1:
	proj(M1+r*(cosd(@/na*360)*M2+sind(@/na*360)*M3))-- endfor cycle,
      M1, M'4);
  fi
endObject;

%
% SUBSECTION 3.6. simpletext
%
% parameters: TextAlign is a string whose possible values
% are "right", "left", "center", "justify"; BoxAlign is a string whose
% possible values are the usual "top", "urt", ... and others
% like "center" (syntax only).

% When using simpletext, one should set prologues:= 1 or 2;

string mthreeDfont;
color TextColor;
boolean ShadedTextFlag;

Object simpletext(expr TextAlign, BoxAlign)(text stringlist) =
  save p_, p__, i, j, t_, w, h, d, spacecnt, normalspace;
  picture p_, p__;
  p_ := " " infont mthreeDfont;
  normalspace = xpart urcorner p_; i = 0; w = 0; h = 0;
  %
  % Measuring text: width w[i], height h[i], depth d[i],
  % number of spaces spacecnt[i] of every line [i]; also
  % total width w, total height h.
  %
  for $ = stringlist:
    i := i+1;
    p_ := $ infont mthreeDfont;
    w[i] = xpart(urcorner p_-llcorner p_); if w[i] > w: w := w[i]; fi
    h[i] = ypart urcorner p_; d[i] = ypart llcorner p_; spacecnt[i]=0;
    h := if i > 1: h+max(h[i]+d[i-1], baselineskip) else: h[i] fi;
    for @ = 1 upto length $:
      if substring (@-1, @) of $ = " ": spacecnt[i] := spacecnt[i]+1; fi
    endfor
  endfor
  h := h+d[i];% it may be interesting not to take the last depth into account
  %
  % Justification may be not applied when one cannot stretch spaces
  % enough in order to reach the maximum width (parameter TextStretchFactor).
  % It is done by setting the measured width w[i] of such a line [i] to the
  % maximum width w.
  %
  if TextAlign = "justify":
    i := 0;
    for $ = stringlist:
      i := i+1;
      if (w[i]+spacecnt[i]*TextStretchFactor*normalspace < w):
	w[i] := w;
      fi
    endfor
  fi
  %
  % Printing it
  %
  y = if (BoxAlign = "top") or (BoxAlign = "urt") or (BoxAlign = "ulft"): 0
  elseif (BoxAlign = "bot") or (BoxAlign = "lrt") or (BoxAlign = "llft"): h
  else: 0.5h fi;
  i := 0;
  for $ = stringlist:
    i := i+1;
    y := y-if i > 1: max(h[i]+d[i-1], baselineskip) else: h[i] fi;
    j := 0; x' := x'' := 0;
    x := if TextAlign = "right": w-w[i] elseif TextAlign="center":
      0.5(w-w[i]) else: 0 fi
    - if (BoxAlign = "left") or (BoxAlign = "ulft") or (BoxAlign = "llft"): 0
    elseif (BoxAlign = "right") or (BoxAlign = "urt") or (BoxAlign = "lrt"): w
    else: 0.5w fi;
    for @ = 1 upto length $:
      if (TextAlign = "justify") and (substring (@-1, @) of $ = " "):
	j := @;
	x := x+x'+x''+normalspace+(w-w[i])/spacecnt[i];
      else:
	p_ := substring (j, @) of $ infont mthreeDfont;
	p__ := substring (@-1, @) of $ infont mthreeDfont;
	x'' := xpart urcorner p__;
	x' := xpart urcorner p_-x'';
	y' := max(ypart ulcorner p__,eps);
	transform t_;
	(0, 0) transformed t_ = proj((x+x', y, 0)/mthreeDfontsize);
	(x'', 0) transformed t_ = proj((x+x'+x'', y, 0)/mthreeDfontsize);
	(0, y') transformed t_ = proj((x+x', y+y', 0)/mthreeDfontsize);
	draw p__ transformed t_ withcolor
	if ShadedTextFlag:
	  Light((x+x'+0.5x'', y+0.5y', 0)/mthreeDfontsize,
	    if Depth (0, 0, 1) > 0: - fi (0,0,1), TextColor)
	else: TextColor fi;
      fi
    endfor
  endfor
endObject;

%
% SUBSECTION 3.7. curvedtext
%
% parameters: M_t, D_t, message are strings, t_min, t_max
% are numerics. $\{M_t:t\in[t_{\rm min},t_{\rm max}]\}$
% is the curve in 3D spaceon which the text ``message'' will be written.
% $\{D_t:t\in[t_{\rm min},t_{\rm max}]\}$ corresponds to the vertical frame
% in 3D space.

Object curvedtext(expr M_t, D_t, t_min, t_max, sentence) =
  picture p_, p__;
  p_ := " " infont mthreeDfont scaled (1/CurrentScale) scaled CurrentScale;
  (x.max, ymax) = urcorner p_; 
  (x.min, ymin) = llcorner p_; 
endObject;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% END
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

input m3Dsty01.mp;

threeDmode;

endinput.
