% Freely adapted from Escher's drawing 128 
% From: Doris Schattschneider 
% M.C. Escher 
% Visions of Symmetry 
% W.H. Freeman and Company 
% New York 
% ISBN: 0-7167-2126-0 
 
input mp-tool; 
beginfig(1);
 pickup pencircle scaled 1; 
 pair p[], xshift, yshift, origin, offset; 
 path line[], bird, drawing; 
 color WHITE, GREY, C[]; 
 WHITE = (1,1,1); 
 GREY = 0.82WHITE; 
 C[1] = WHITE; 
 C[2] = GREY; 
 width = 279.4mm; 
 height = 215.9mm; 
 s = 0.95cm; 
 z1 = (0,0); 
 z2 = (8,0); 
 z3 = (8,8); 
 z4 = (0,8); 
 z5 = (1,-1); 
 z6 = (2,-4); 
 z7 = (2,-6.5); 
 line1 = z1..z5..z6..z7; 
 z8 = (4,-6); 
 z9 = (5,-6.5); 
 line2 = z7..z8..z9; 
 z10 = (4.95,-6); 
 z11 = (3.5,-5); 
 line3 = z9..z10..z11; 
 z12 = (3,-3.5); 
 z13 = (4,-2); 
 z14 = (6,-1.5); 
 z15 = (7,-1); 
 line4 = z11..z12..z13..z14..z15..{dir 70}z2; 
 z16 = (8,2); 
 z17 = (6,3.75); 
 z18 = (5,4.0); 
 z19 = (6,4.5); 
 z20 = (7,5.5); 
 line5 = z2{dir 70}..z16..z17..controls z18 and z18..z19..z20..z3; 
 line6 = reverse line4 shifted (z3-z2); 
 line7 = reverse line3 shifted (z3-z2); 
 line8 = reverse line2 shifted (z3-z2); 
 line9 = reverse line1 shifted (z3-z2); 
 line10 = reverse line5 shifted (z4-z3); 
 bird = line1--line2--line3--line4--line5-- 
 line6--line7--line8--line9--line10--cycle; 
 z21 = (4,-6); 
 z22 = (3.5,-5.3); 
 z23 = (2.8,-5.1); 
 line11 = z21..z22..z23; 
 z24 = 0.5[z6,z12]; 
 z25 = (3,-1.5); 
 line12 = z23..z24..z25; 
 line13 = (z5..z13-(0,0.02)..z14-(0,0.02)..z15-(0,0.02)) cutbefore line12 cutafter line4; 
 z26 = (3,-1); 
 z27 = (5,-1); 
 z28 = (6,-0.5); 
 z29 = (6.5,0); 
 z30 = (6,1); 
 z31 = (5.3,0.7); 
 line14 = z1..z26..z27..z28..z29..z30..z31; 
 z32 = (3,1); 
 z33 = (4,0.5); 
 z34 = (5,0); 
 line15 = z1{dir 350}..{dir 30}z32; 
 line16 = (point 0.5 of line14){dir 0}..{dir 50}z33; 
 line17 = z26{dir 0}..{dir 30}z34; 
 z35 = (0.5,0.9); 
 z36 = (0,3.5); 
 z37 = (-1.5,4.5); 
 line18 = z35..z36..z37; 
 z38 = (1,0.9); 
 z39 = (1,3); 
 z40 = (0,5); 
 z41 = (-0.5,5.4); 
 line19 = z38..z39..z40..z41; 
 z42 = (1.5,1.8); 
 z43 = (1,5); 
 z44 = (0,6.5); 
 line20 = z42..z43..z44; 
 line21 = (z1..z38..line2 shifted (z3-z2+(0,0.02))) cutafter 
 (line1 shifted (z3-z2)); 
 z45 = (6,5); 
 z46 = (5.5,6); 
 line22 = z45{dir 90}..z46; 
 z47 = (7,6.25); 
 z48 = (5,5.5); 
 line23 = (z3..z47..(point 0.5 of line22)..z48) cutafter line22; 
 z49 = (4,4.5); 
 z50 = (4,5); 
 z51 = (5,5.5); 
 z52 = (5.4,5.6); 
 line24 = z49--z50..{dir 0}z51..z52; 
 z53 = (5,5); 
 line25 = z50..z53..z51; 
 lines = 15; 
 xmin = 0; 
 xmax = 4; 
 ymin = 0; 
 ymax = 4; 
 origin := (-1cm,-1cm); 
 xshift = s*(z2-z1); 
 yshift = s*(z4-z1); 
 pickup pencircle scaled 3pt; 
 c := 1; 
 for y = ymin upto ymax: 
 c := 1 + (y mod 2); 
 for x = xmin upto xmax: 
 offset := origin + x*xshift + y*yshift; 
 fill bird scaled s shifted offset withcolor C[c]; 
 draw bird scaled s shifted offset withcolor GREY; 
 for i = 11 upto 10+lines: 
 draw line[i] scaled s shifted offset withcolor C[3-c]; 
 endfor; 
 c := 1 + (c mod 2); 
 endfor; 
 endfor; 
 pickup pencircle scaled 1; 
 draw(0,0)--(width,0)--(width,height)--(0,height)--cycle withcolor (0,0,0); 
 drawing = unitsquare xscaled width yscaled height; 
 clip currentpicture to drawing; 
 draw drawing; 
endfig;
end