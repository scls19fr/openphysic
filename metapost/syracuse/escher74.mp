% Freely adapted from Escher's drawing 74 
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
 width = 279.4mm; 
 height = 215.9mm; 
 s = 0.059; 
 origin = (15cm,0cm); 
 xshift = (2*(p1 - p24) + (p24 - p13) + (p1 - p24) - (p13 - p24))scaled s; 
 yshift = (p13 - p1) scaled s; 
 C[1] = WHITE; 
 C[2] = GREY; 
 p1 = (7095,9000-4425); 
 p2 = (5295,9000-4170); 
 p3 = (3930,9000-4575); 
 p4 = (3645,9000-5850); 
 p5 = (3570,9000-6290); 
 p6 = (3465,9000-6930); 
 p7 = (3390,9000-7320); 
 p8 = (3255,9000-7695); 
 p9 = (3045,9000-7785); 
 p10 = (3480,9000-5640); 
 p11 = (3330,9000-4875); 
 p12 = (3405,9000-4005); 
 p13 = (3855,9000-2985); 
 p14 = (2340,9000-4395); 
 p15 = (1590,9000-5880); 
 p16 = (1425,9000-6225); 
 p17 = (900,9000-6640); 
 p18 = (405,9000-6755); 
 p19 = (135,9000-6620); 
 p20 = (2505,9000-6435); 
 p21 = (3135,9000-7395); 
 p22 = (2565,9000-7650); 
 p23 = (1860,9000-7530); 
 p24 = (1125,9000-7170); 
 line1 = (p1..p2..p3) shifted -p1; 
 line2 = (p3..0.5[p3,p4]-(100,0)..p4) shifted -p1; 
 line3 = (p4..p10..p11..p12..p13) shifted -p1; 
 line4 = (p13..p14..p15) shifted -p1; 
 line5 = (p15..p20..p21) shifted -p1; 
 line6 = (p21..p22..p23..p24) shifted -p1; 
 line7 = (p3..p2..p1) shifted -p1; 
 line8 = (p4..0.5[p3,p4]-(80,0)..p3) shifted -p1; 
 line9 = (p13..p12..p11..p10..p4) shifted -p1; 
 line10 = (p15..p14..p13) shifted -p1; 
 line11 = (p21..p20..p15) shifted -p1; 
 line12 = (p24..p23..p22..p21) shifted -p1; 
 bird = line1--line2--line3--line4--line5--line6-- 
 line9 shifted (p24 - p13)-- 
 line8 shifted (p24 - p13)-- 
 line7 shifted (p24 - p13)-- 
 line12 shifted (p1 - p13)-- 
 line11 shifted (p1 - p13)-- 
 line10 shifted (p1 - p13)-- 
 cycle; 
 line13 = (p15..p16..p17..p18..p19) shifted -p13; 
 line14 = (p4{dir 280}...p5...p6...p7...p8...p9) shifted -p1; 
 % eye 
 p25 = (1095,9000-7875); 
 % p26 = (1290,9000-7890); 
 p27 = (795,9000-8190); 
 p28 = (1030,9000-8370); 
 p29 = (1430,9000-8325); 
 line15 = (p27..p28..p29) shifted -p1; 
 line16 = (p29..0.5[p29,p3+p24-p13]-(10,0)..p3+p24-p13) shifted -p1; 
 p30 = (3255,9000-4110); 
 p31 = (2700,9000-4620); 
 p32 = (2310,9000-5205); 
 line17 = (p30..p31..p32) shifted -p1; 
 p33 = (3210,9000-4965); 
 p34 = (2865,9000-5280); 
 p35 = (2640,9000-5640); 
 line18 = (p33..p34..p35) shifted -p1; 
 p36 = (3405,9000-5715); 
 p37 = (3135,9000-5880); 
 p38 = (2880,9000-6090); 
 line19 = (p36..p37..p38) shifted -p1; 
 p39 = (3315,9000-6405); 
 p40 = (3150,9000-6450); 
 line20 = (p5..p39..p40) shifted -p1; 
 p41 = (3390,9000-6945); 
 p42 = (3345,9000-6960); 
 line21 = (p6..p41..p42) shifted -p1; 
 line22 = (p21..0.5[p21,p7]+(0,16)..p7) shifted -p1; 
 p43 = (6180,9000-4800); 
 p44 = (5415,9000-4650); 
 p45 = (4650,9000-4770); 
 line23 = (p43..p44..p45) shifted -p1; 
 p46 = (5625,9000-5430); 
 p47 = (5040,9000-5220); 
 p48 = (4485,9000-5235); 
 line24 = (p46..p47..p48) shifted -p1; 
 p49 = (5145,9000-6075); 
 p50 = (4605,9000-5860); 
 p51 = (4260,9000-5845); 
 line25 = (p49..p50..p51) shifted -p1; 
 p52 = (4845,9000-6720); 
 p53 = (4425,9000-6525); 
 p54 = (4020,9000-6465); 
 line26 = (p52..p53..p54) shifted -p1; 
 p55 = (4485,9000-7250); 
 p56 = (4200,9000-7050); 
 p57 = (3915,9000-7000); 
 line27 = (p55..p56..p57) shifted -p1; 
 p58 = (4050,9000-7750); 
 p59 = (3885,9000-7625); 
 p60 = (3645,9000-7560); 
 line28 = (p58..p59..p60) shifted -p1; 
 line29 = ((125,0)..(0,125)..(-125,0)..(0,-125)..(125,0)--cycle) shifted (p25-p1); 
 line30 = ((60,0)..(0,60)..(-60,0)..(0,-60)..(60,0)--cycle) shifted (p25-p1); 
 lines = 17; 
 c := 2; 
 xmin = 0; 
 xmax = 3; 
 ymin = 0; 
 ymax = 10; 
 for y=ymin upto ymax: 
 for x=xmin upto xmax: 
 offset := origin + x*xshift + y*yshift; 
 if (xpart(offset) <= width + 6000*s) and 
 (0 <= xpart(offset)) and 
 (ypart(offset) <= height + 6000*s) and 
 (0 <= ypart(offset)): 
 pickup pencircle scaled 2pt; 
 fill bird scaled s shifted offset withcolor C[c]; 
 for i = 13 upto 28: 
 draw line[i] scaled s shifted offset withcolor C[3-c]; 
 endfor; 
 pickup pencircle scaled 1.5pt; 
 draw line29 scaled s shifted offset withcolor C[3-c]; 
 fill line30 scaled s shifted offset withcolor C[3-c]; 
 fi; 
 endfor; 
 c := 3 - c; 
 endfor; 
 % 
 pickup pencircle scaled 1; 
 draw(0,0)--(width,0)--(width,height)--(0,height)--cycle withcolor (0,0,0); 
 drawing = unitsquare xscaled width yscaled height; 
 clip currentpicture to drawing; 
 draw drawing; 
endfig;
end