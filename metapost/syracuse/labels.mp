lFOURIER := 1;

string lSTRING[];
lSTRING[0] = "alpha";
lSTRING[1] = "beta";
lSTRING[2] = "gamma";
lSTRING[3] = "delta";
lSNB = 3;

vardef scanchaine_label(expr s) =
    save d,m,f,c,l,flag,i; string d,m,f,c;
    d := ""; m := ""; f := "";
    l = length(s); flag := 0;
    for i:=0 upto l:
	c := substring (i,i+1) of s;
	if c = "'":
	    f := f & c; flag := 2;
	elseif c = "_":
	    flag := 1;
	else:
	    if flag = 0: 
		d := d & c
	    else:
		m := m & c
	    fi;
	fi	
    endfor;
    for i:=0 upto lSNB:
	if d = lSTRING[i]: d := "\" & d fi
    endfor;
    d := d & "_{" & m & "}" & f;
    d
enddef;

vardef lTEX primary s =
  write "verbatimtex" to "mptextmp.mp";
  write "%&latex" to "mptextmp.mp";
  write "\documentclass{article}" to "mptextmp.mp";
  if lFOURIER=1: write "\usepackage{fourier}" to "mptextmp.mp" fi;
  write "\begin{document}" to "mptextmp.mp";
  write "etex" to "mptextmp.mp";
  write "btex $"& scanchaine_label(s) &"$ etex" to "mptextmp.mp";
  write EOF to "mptextmp.mp";
  scantokens "input mptextmp"
enddef;

vardef TEX primary s =
  write "verbatimtex" to "mptextmp.mp";
  write "%&latex" to "mptextmp.mp";
  write "\documentclass{article}" to "mptextmp.mp";
  write "\usepackage[frenchb]{babel}" to "mptextmp.mp";
  if lFOURIER=1: write "\usepackage{fourier}" to "mptextmp.mp" fi;
  write "\usepackage{amsmath}" to "mptextmp.mp";
  write "\everymath{\displaystyle}" to "mptextmp.mp";
  write "\begin{document}" to "mptextmp.mp";
  write "etex" to "mptextmp.mp";
  write "btex "& s &" etex" to "mptextmp.mp";
  write EOF to "mptextmp.mp";
  scantokens "input mptextmp"
enddef;

endinput    