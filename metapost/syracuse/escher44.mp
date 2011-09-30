% Freely adapted from Escher's drawing 44 
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
 color BROWN, WHITE, C[]; 
 BROWN = 0.80(1.0,1.0,0.875); 
 WHITE = 0.85(1.0,1.0,0.915); 
 width = 279.4mm; 
 height = 215.9mm; 
 s = 0.042; 
 % 
 p1 = (11655,9000-6390); 
 p2 = (11385,9000-5850); 
 p3 = (11055,9000-5355); 
 p4 = (10635,9000-4860); 
 p5 = (10215,9000-4470); 
 p6 = (9750,9000-4155); 
 p7 = (9285,9000-3885); 
 line1 = (p1..p2..p3..p4..p5..p6..p7) shifted -p1; 
 line7 = (p7..p6..p5..p4..p3..p2..p1) shifted -p1; 
 p8 = (8415,9000-4995); 
 p9 = (7215,9000-5640); 
 line2 = (p7..p8..p9) shifted -p1; 
 line8 = (p9..p8..p7) shifted -p1; 
 p10 = (6885,9000-4845); 
 p11 = (6795,9000-3945); 
 p12 = (6990,9000-3360); 
 p13 = (7155,9000-3060); 
 p14 = (7290,9000-2850); 
 line3 = (p9..p10..p11..p12..p13..p14) shifted -p1; 
 line9 = (p14..p13..p12..p11..p10..p9) shifted -p1; 
 p15 = (6870,9000-2610); 
 p16 = (6465,9000-2490); 
 p17 = (6030,9000-2400); 
 p18 = (5535,9000-2415); 
 p19 = (5010,9000-2490); 
 p20 = (4600,9000-2650); 
 line4 = (p14..p15..p16..p17..p18..p19..p20) shifted -p1; 
 line10 = (p20..p19..p18..p17..p16..p15..p14) shifted -p1; 
 p21 = (5220,9000-3090); 
 p22 = (5745,9000-4095); 
 p23 = (5880,9000-5280); 
 p24 = (5805,9000-6210); 
 line5 = (p20..p21..p22..p23..p24) shifted -p1; 
 p25 = (5295,9000-6420); 
 p26 = (4755,9000-6650); 
 line6 = (p24..p25..p26) shifted -p1; 
 line12 = ((p26..p25..p24) rotatedabout (p26,180)) shifted -p1; 
 line11 = ((p24..p23..p22..p21..p20) rotatedabout (p26,180)) shifted -p1; 
 bird = line1--line2--line3--line4--line5--line6-- 
 line12--line11-- 
 (line10--line9--line8--line7) rotatedabout ((0,0),60)-- 
 cycle; 
 p27 = (11865,9000-5130); 
 p28 = (12255,9000-3870); 
 line13 = (p2..p27..p28) shifted -p1 rotatedabout ((0,0),60); 
 p29 = (11400,9000-4740); 
 p30 = (11730,9000-3705); 
 line14 = (p3..p29..p30) shifted -p1 rotatedabout ((0,0),60); 
 p31 = (10920,9000-4365); 
 p32 = (11220,9000-3540); 
 line15 = (p4..p31..p32) shifted -p1 rotatedabout ((0,0),60); 
 p33 = (10425,9000-4110); 
 p34 = (10740,9000-3330); 
 line16 = (p5..p33..p34) shifted -p1 rotatedabout ((0,0),60); 
 p35 = (10005,9000-3825); 
 p36 = (10290,9000-3135); 
 line17 = (p6..p35..p36) shifted -p1 rotatedabout ((0,0),60); 
 p37 = (9495,9000-3585); 
 p38 = (9795,9000-2940); 
 line18 = (p7..p37..p38) shifted -p1 rotatedabout ((0,0),60); 
 p39 = (7635,9000-2370); 
 p40 = (8190,9000-1890); 
 line19 = (p14..p39..p40) shifted -p1 rotatedabout ((0,0),60); 
 p41 = (7200,9000-2175); 
 p42 = (7890,9000-1635); 
 line20 = (p15..p41..p42) shifted -p1 rotatedabout ((0,0),60); 
 p43 = (6810,9000-1995); 
 p44 = (7590,9000-1320); 
 line21 = (p16..p43..p44) shifted -p1 rotatedabout ((0,0),60); 
 p45 = (6360,9000-1815); 
 p46 = (7215,9000-1095); 
 line22 = (p17..p45..p46) shifted -p1 rotatedabout ((0,0),60); 
 p47 = (5925,9000-1725); 
 p48 = (6765,9000-855); 
 line23 = (p18..p47..p48) shifted -p1 rotatedabout ((0,0),60); 
 p49 = (5310,9000-1710); 
 p50 = (6315,9000-615); 
 line24 = (p19..p49..p50) shifted -p1 rotatedabout ((0,0),60); 
 p51 = (6930,9000-2910); 
 p52 = (6690,9000-2835); 
 line25 = (p13..p51..p52) shifted -p1; 
 p53 = (6855,9000-3270); 
 p54 = (6720,9000-3240); 
 line26 = (p12..p53..p54) shifted -p1; 
 p55 = p20+(350,-50); 
 p56 = p20+(800,-250); 
 p57 = p20+(800,-250)-p1; 
 p58 = p20+(1300,-300)-p1; 
 line27 = (p20..p55..p56) shifted -p1; 
 line28 = line5 intersectionpoint (p57-(2500,6500)--p57).. 
 p57.. 
 line4 intersectionpoint (p57--p57+(100,7000)); 
 ; 
 ra = 100; 
 rb = 180; 
 line29 = (ra,0)..(0,ra)..(-ra,0)..cycle; 
 line30 = (rb,0)..(0,rb)..(-rb,0)..cycle; 
 lines = 16; 
 C[1] = BROWN; 
 C[2] = WHITE; 
 origin = (-1cm,3cm); 
 xshift = s*((p20 rotatedabout (p1,240)) -p20); 
 yshift = s*((p20 rotatedabout (p1 rotatedabout (p20,60),240)) - p20); 
 c := 1; 
 xmin = 0; 
 xmax = 1; 
 ymin = 0; 
 ymax = 1; 
 for y=ymin upto ymax: 
 for x=xmin upto xmax: 
 offset := origin + x*xshift + y*yshift; 
 if (xpart(offset) <= width + 6000*s) and 
 (-1cm <= xpart(offset)) and 
 (ypart(offset) <= height + 6000*s) and 
 (0 <= ypart(offset)): 
 for da=0 upto 5: 
 ang := da*60; 
 pickup pencircle scaled 2pt; 
 fill (bird rotatedabout ((0,0),ang)) scaled s shifted offset withcolor C[c]; 
 draw (bird rotatedabout ((0,0),ang)) scaled s shifted offset withcolor 0.90*C[1]; 
 for i = 1 upto lines: 
 draw (line[12+i] rotatedabout ((0,0),ang)) scaled s shifted offset withcolor 0.90*C[c]; 
 endfor; 
 fill line29 scaled s shifted (offset+s*(p58 rotatedabout ((0,0),ang))) withcolor 0.90*C[c]; 
 pickup pencircle scaled 1pt; 
 draw line30 scaled s shifted (offset+s*(p58 rotatedabout ((0,0),ang))) withcolor 0.90*C[c]; 
 c := 3 - c; 
 endfor; 
 fi; 
 endfor; 
 endfor; 
 % draw line1 scaled 0.05; 
 pickup pencircle scaled 1; 
 draw(0,0)--(width,0)--(width,height)--(0,height)--cycle withcolor WHITE; 
 drawing = unitsquare xscaled width yscaled height; 
 clip currentpicture to drawing; 
 draw drawing; 
endfig;
end