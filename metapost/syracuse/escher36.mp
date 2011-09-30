% Freely adapted from Escher's drawing 36 
% From: Doris Schattschneider 
% M.C. Escher 
% Visions of Symmetry 
% W.H. Freeman and Company 
% New York 
% ISBN: 0-7167-2126-0 
 
mpgraph:=1; input mp-tool; 
prologues:=2; 
beginfig(1);
 pickup pencircle scaled 1; 
 pair p[], xshift, yshift, offset; 
 path l[], r[], snake[], drawing, brow[], eye[], black[]; 
 color GREY, WHITE; 
 GREY = 0.8WHITE; 
 WHITE = (1,1,1); 
 width = 279.4mm; 
 height = 215.9mm; 
 s := 0.057; 
 % 
 p1 = (9060,9000-3075); 
 p2 = (4545,9000-3075); 
 p3 = (4545,9000-7612); 
 p4 = (9060,9000-7612); 
 p5 = (6280,9000-4800); 
 p6 = (5760,9000-4725); 
 p7 = (5085,9000-4515); 
 p8 = (4530,9000-3975); 
 p9 = (4140,9000-3405); 
 p10 = (3660,9000-2790); 
 p11 = (3255,9000-2445); 
 p12 = (2715,9000-2235); 
 p13 = (2265,9000-2160); 
 p14 = (1665,9000-2145); 
 p15 = (1185,9000-2115); 
 p16 = (945,9000-2100); 
 p17 = (840,9000-2205); 
 p18 = (840,9000-2310); 
 p19 = (930,9000-2385); 
 p20 = (1080,9000-2535); 
 p21 = (1395,9000-2790); 
 p22 = (1935,9000-3180); 
 p23 = (2460,9000-3735); 
 p24 = (2700,9000-4200); 
 p25 = (2835,9000-4680); 
 p26 = (2775,9000-5085); 
 p27 = (2655,9000-5385); 
 p28 = (2490,9000-5595); 
 p29 = (2295,9000-5715); 
 p30 = (2070,9000-5820); 
 p31 = (1755,9000-5880); 
 %p32 = (4530,9000-7605); 
 p33 = (4200,9000-7920); 
 p34 = (3900,9000-8145); 
 p35 = (3600,9000-8460); 
 p36 = (3405,9000-8820); 
 p37 = (3345,9000-9195); 
 p38 = (3405,9000-9435); 
 p39 = (3525,9000-9660); 
 p40 = (3780,9000-9810); 
 p41 = (4125,9000-9915); 
 p42 = (4590,9000-9870); 
 p43 = (5265,9000-9720); 
 p44 = (5700,9000-9615); 
 p45 = (6330,9000-9450); 
 p46 = (6825,9000-9360); 
 %p47 = (7320,9000-9300); 
 p48 = (7320,9000-9300); 
 p49 = (7680,9000-9195); 
 p50 = (8070,9000-9015); 
 p51 = (8325,9000-8835); 
 p52 = (8520,9000-8610); 
 p53 = (8715,9000-8340); 
 p54 = (8865,9000-8025); 
 p55 = (9000,9000-7800); 
 p56 = (9045,9000-7605); 
 p57 = p31 rotatedabout (p3,180); 
 p58 = p57 rotatedabout (p4,180); 
 p59 = p5 rotatedabout (p1,180); 
 p60 = (1575,9000-2580); 
 p61 = (1725,9000-2300); 
 p62 = (2175,9000-2300); 
 p63 = (2605,9000-2750); 
 l1 = p1--p2--p3--p4--cycle; 
 l2 = p5..p6..p7..p8..p9.. 
 p10..p11..p12..p13..p14.. 
 p15..p16..p17..p18..p19.. 
 p20..p21..p22..p23..p24.. 
 p25..p26..p27..p28..p29.. 
 p30..p31; 
 r2 = ((l2 shifted (-p31)) yscaled (-1)) shifted p5; 
 l3 = p3.. 
 p33..p34..p35..p36..p37..p38..p39.. 
 p40..p41..p42..p43..p44..p45..p46.. 
 p57; 
 r3 = (p57.. 
 p46..p45..p44..p43..p42..p41..p40.. 
 p39..p38..p37..p36..p35..p34..p33.. 
 p3) rotatedabout (p3,180); 
 l4 = p57.. 
 p49..p50..p51..p52..p53..p54..p55.. 
 % p56 
 p4; 
 r4 = ((p55..p54..p53..p52..p51..p50..p49.. 
 % p47 
 p57) rotatedabout (p4,180))..p58; 
 xshift = s*(p58-p31); 
 yshift = 2s*(p1-p4); 
 brow1 := p60..p61..p62..p63; 
 eye1 := (0.2[p60,p63]--0.2[p60,p63]+(0,infinity)) intersectionpoint brow1.. 
 0.5[p60,p63].. 
 (0.6[p60,p63]--0.6[p60,p63]+(0,infinity)) intersectionpoint brow1; 
 black1 := (0.3[p60,p63]-(0,infinity)--0.3[p60,p63]+(0,infinity)) 
 intersectionpoint eye1.. 
 (0.4[p60,p63]-(0,infinity)--0.4[p60,p63]+(0,infinity)) 
 intersectionpoint eye1.. 
 (0.5[p60,p63]-(0,infinity)--0.5[p60,p63]+(0,infinity)) 
 intersectionpoint eye1-- 
 ((0.5[p60,p63]-(0,infinity)--0.5[p60,p63]+(0,infinity)) 
 intersectionpoint eye1){dir 60}.. 
 {dir 120}(0.5[p60,p63]-(0,infinity)--0.5[p60,p63]+(0,infinity)) 
 intersectionpoint brow1-- 
 (0.5[p60,p63]-(0,infinity)--0.5[p60,p63]+(0,infinity)) 
 intersectionpoint brow1.. 
 (0.4[p60,p63]-(0,infinity)--0.4[p60,p63]+(0,infinity)) 
 intersectionpoint brow1.. 
 (0.3[p60,p63]-(0,infinity)--0.3[p60,p63]+(0,infinity)) 
 intersectionpoint brow1-- 
 (0.3[p60,p63]-(0,infinity)--0.3[p60,p63]+(0,infinity)) 
 intersectionpoint brow1{dir 240}..{dir 300}cycle; 
 snake1 := ((l2--r3--l3--l4--r4--r2--cycle) shifted -p31) scaled s; 
 brow1 := (brow1 shifted -p31) scaled s; 
 eye1 := (eye1 shifted -p31) scaled s; 
 black1 := (black1 shifted -p31) scaled s; 
 snake2 := snake1 yscaled -1 shifted (s*(p5-p31)); 
 eye2 := eye1 yscaled -1 shifted (s*(p5-p31)); 
 brow2 := brow1 yscaled -1 shifted (s*(p5-p31)); 
 black2 := black1 yscaled -1 shifted (s*(p5-p31)); 
 snake3 := snake1 xscaled -1 shifted (s*(p59-p31)); 
 eye3 := eye1 xscaled -1 shifted (s*(p59-p31)); 
 brow3 := brow1 xscaled -1 shifted (s*(p59-p31)); 
 black3 := black1 xscaled -1 shifted (s*(p59-p31)); 
 snake4 := snake2 xscaled -1 shifted (s*(p59-p31)); 
 eye4 := eye2 xscaled -1 shifted (s*(p59-p31)); 
 brow4 := brow2 xscaled -1 shifted (s*(p59-p31)); 
 black4 := black2 xscaled -1 shifted (s*(p59-p31)); 
 pickup pencircle scaled 2pt; 
 for x=-1 upto 2: 
 for y=-1 upto 1: 
 offset := x * xshift + y * yshift + s*(650mm,250mm); 
 fill snake2 shifted offset withcolor WHITE; 
 fill snake1 shifted offset withcolor GREY; 
 fill snake4 shifted offset withcolor WHITE; 
 fill snake3 shifted offset withcolor GREY; 
 draw brow1 shifted offset withcolor 0.85GREY; 
 draw eye1 shifted offset withcolor 0.85GREY; 
 fill black1 shifted offset withcolor 0.85GREY; 
 draw brow3 shifted offset withcolor 0.85GREY; 
 draw eye3 shifted offset withcolor 0.85GREY; 
 fill black3 shifted offset withcolor 0.85GREY; 
 draw brow2 shifted offset withcolor 0.90GREY; 
 draw eye2 shifted offset withcolor 0.90GREY; 
 fill black2 shifted offset withcolor 0.90GREY; 
 draw brow4 shifted offset withcolor 0.90GREY; 
 draw eye4 shifted offset withcolor 0.90GREY; 
 fill black4 shifted offset withcolor 0.90GREY; 
 endfor; 
 endfor; 
 pickup pencircle scaled 1; 
 draw(0,0)--(width,0)--(width,height)--(0,height)--cycle withcolor (0,0,0); 
 drawing = unitsquare xscaled width yscaled height; 
 clip currentpicture to drawing; 
 draw drawing; 
endfig;
end