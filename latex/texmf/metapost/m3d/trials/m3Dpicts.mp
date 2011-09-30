%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 3D extensions for MetaPost by Anthony Phan.
% file: m3Dpicts.mp
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
% This file is under construction and may attempt to mimic
% some Z-buffer or such.
%
% An attempt to allow automatic ordering:
%
% SubPicture refpoint.1;
%  fillArea(n,M1,...,M.n); ...
% endSubPicture;
% .
% .
% .
% SubPicture refpoint.n;
%  fillArea(m, M1,...M.m); ...
% endSubPicture;
%
% % ShipPicturesOut; done in extra_endfig
%
% Every face is stored as a picture and at the end the whole
% is ordered and printed. Shipping is done automatically
% when this counter is reached. At this time, pictures are sorted
% with a buble sort algorithm. It is slow
%
if known mthreeDpicts: endinput; fi
mthreeDpicts := 1;
if unknown mthreeDplain: input m3Dplain; fi

extra_beginfig := extra_beginfig &
";pictcnt_ := 0; picture pict_[]; numeric pictdepth_[];";
extra_endfig := extra_endfig & "ShipPicturesOut;";

path c_;
maxpictcnt := 100;
color M___;

def fillArea(expr vertexCount)(text vertices) = 
  c_ := for $ = vertices: proj $-- endfor cycle;
  if Orientation(c_) >= 0:
    M_ := (for $ = vertices: $+ endfor Origin)/vertexCount; 
    n_ := 0;
    for $ = vertices: M___ := $; exitif true; endfor
    n_ := 0; M__ := Origin;
    for $ = vertices:
      n_ := n_+1;
      if n_>1: M__ := M__+(M___-M_)Vectprod($-M_); fi
      M___ := $;
    endfor
    for $ = vertices:
      M__ := M__+(M___-M_)Vectprod($-M_);
      exitif true;
    endfor
    if Norm M__ > 0:
      pictcnt_ := pictcnt_+1;
      pictdepth_[pictcnt_] := Depth M_;
      M__ := Unitvector(M__/vertexCount);
      pict_[pictcnt_] := nullpicture;
      addto pict_[pictcnt_] contour c_
      withcolor Light(M_,M__,ObjectColor);
      if pictcnt_ = maxpictcnt: ShipPicturesOut; fi
    fi
  fi
enddef;

% polyLine(expr vertexCount)(text vertices)
% polyMarker(expr vertexCount)(text vertices)
% text(expr origin)(expr str)
% polyhedron(expr vertexCount, facetCount)(text vertices)(text facets)
%
% setLineStyle(expr style)
% setLineWidthScaleFactor(expr scalefactor)
% setLineColor(expr colorindex)
%
% setInteriorColor(expr colorindex)
%
% setEdgeFlag(expr flag)
% setEdgeStyle(expr style)
% setEdgeWidthScaleFactor(expr scalefactor)
% setEdgeColor(expr colorindex)
%
% setMarkerStyle(expr style)
% setMarkerWidthScaleFactor(expr scalefactor)
% setMarkerColor(expr colorindex)
%
% setTextFont(expr fontindex)
% setTextColor(expr colorindex)

currentdepth_ := 0;
picture tmppicture;

def SubPicture expr refpoint = 
  begingroup save pictcnt_, currentdepth_, currentpicture, pict_, pictdepth_;
    picture pict_[],currentpicture; pictcnt_ = 0;
    currentdepth_ := Depth refpoint;
    currentpicture := nullpicture;
    message "Subpicture starts";
  enddef;

  def endSubPicture = 
    ShipPicturesOut;
    tmppicture := currentpicture;
    currentdepth__ := currentdepth_;
  endgroup;
% if tmppicture <> nullpicture: % does not exist
  pictcnt_ := pictcnt_+1;
  pict_[pictcnt_] := tmppicture; pictdepth_[pictcnt_] := currentdepth__;
  message "Subpicture stored in pict "&str[pictcnt_];
% fi
enddef;

%vardef ShipPicturesOut = 
% message "Shipping out "&str[pictcnt_]&" picts";
% if pictcnt_ > 1:
%  save tmp_string, SortCriterion;
%    def SortCriterion(expr first, second) = 
%    pictdepth_[first] < pictdepth_[second]
%   enddef;
%  string tmp_string; tmp_string = "";
%  for $ = 1 upto pictcnt_:
%   tmp_string := tmp_string & str[$] if $<pictcnt_: &"," fi;
%  endfor
%  QuickSort(scantokens tmp_string);
%  for $ = scantokens(SortedString):
%   addto currentpicture also pict_[$];
%  endfor;
% elseif pictcnt_ = 1:
%  addto currentpicture also pict_[1];
% else:
% fi
% pictcnt_ := 0;
%enddef;

%
% much slower but use less memory (?)
%

def ShipPicturesOut = 
  begingroup;
    if pictcnt_ > 1:
      message "Shipping out "&str[pictcnt_]&" picts";
      save sortflag, _i_; boolean sortflag;
      _i_ = 1;
      forever:
	sortflag := true;
	for $ = 1 upto pictcnt_-_i_:
	  if pictdepth_[$] < pictdepth_[$+1]:
	    pict_[0] := pict_[$]; pictdepth_[0] := pictdepth_[$];
	    pict_[$] := pict_[$+1]; pictdepth_[$] := pictdepth_[$+1];
	    pict_[$+1] := pict_[0]; pictdepth_[$+1] := pictdepth_[0];
	    sortflag := false;
	  fi
	endfor
	exitif sortflag;
	_i_ := _i_+1;
      endfor
      for $ = 1 upto pictcnt_:
	addto currentpicture also pict_[$];
      endfor;
    elseif pictcnt_ = 1:
      message "Shipping out 1 pict";
      addto currentpicture also pict_[1];
    else:
    fi
    pictcnt_ := 0;
  endgroup;
enddef;

endinput.

%
% Other attempts
%

numeric VertexCount;
color FaceNormal, FaceMiddle;
path FaceContour;

def fillArea text vertices = 
  FaceCountour := for $ = vertices: proj $-- endfor cycle;
  VertexCount := 0 for $ = vertices: +1 endfor;
  if Orientation(FaceContour) >= 0:
    FaceMiddle := (Origin for $ = vertices: +$ endfor)/VertexCount; 
    n_ := 0;
    for $ = vertices: M___ := $; exitif true; endfor
    n_ := 0; M__ := Origin;
    for $ = vertices:
      n_ := n_+1;
      if n_>1: M__ := M__+(M___-M_)Vectprod($-M_); fi
      M___ := $;
    endfor
    for $ = vertices:
      M__ := M__+(M___-M_)Vectprod($-M_);
      exitif true;
    endfor
    if Norm M__ > 0:
      M__ := Unitvector(M__/VertexCount);
      pict_[pictcnt_] := nullpicture;
      addto currentpicture contour FaceContour
      withcolor Light(FaceMiddle,FaceNormal,ObjectColor);
    fi
  fi
enddef;

