% Freely adapted from Escher's drawing 20 
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
 path line[], fish, area[], drawing; 
 color GREEN, WHITE, GREY, RED, BLUE, C[]; 
 WHITE = (1,1,1); 
 GREEN = 0.88WHITE; 
 RED = 0.82WHITE; 
 BLUE = 0.94WHITE; 
 GREY = 0.8WHITE; 
 C[1] = BLUE; 
 C[2] = WHITE; 
 C[3] = RED; 
 C[4] = GREEN; 
 width = 279.4mm; 
 height = 215.9mm; 
 s = 0.044; 
 p1 = (4800,-1200); 
 p2 = (600,-5400); 
 p3 = (4800,-9600); 
 p4 = (9000,-5400); 
 p5 = (6525,-11325); 
 p6 = (6825,-10350); 
 p7 = (7275,-9600); 
 p8 = (7650,-8925); 
 p9 = (8025,-7950); 
 p10 = (8025,-7200); 
 p11 = (7950,-6450); 
 line1 = p1--p2--p3--p4--cycle; 
 line2 = p5..p6..p7..p8..p9..p10..p11; 
 p12 = (8475,-6075); 
 line3 = p11..p12..p4; 
 line4 = reverse line3 rotatedabout (p4,270); 
 p18 = (2250,-3050); 
 p19 = (350,-3150); 
 p20 = (0,-3450); 
 line5 = reverse line2 rotatedabout (p4,270); 
 line6 = p5 rotatedabout (p4,270)..p18..p19..p20..p20-(900,120); 
 p21 = (150,-4325); 
 line7 = p20-(900,120)..p21..p2; 
 p22 = (5700,-10950); 
 p23 = (5325,-10575); 
 p24 = (5025,-10050); 
 line8 = p3..p24..p23..p22..p5; 
 line9 = (reverse line7) rotatedabout (p2,270); 
 line10 = (reverse line6) rotatedabout (p2,270); 
 line11 = reverse (line5 cutbefore (p1--p2)) rotatedabout (p2,270); 
 line12 = (reverse line8) rotatedabout (p3,180); 
 fish = line8--line2--line3--line4--line5--line6--line7-- 
 line9--line10--line11--line12--cycle; 
 p26 = (1875,-3100); 
 p27 = (1500,-3375); 
 p28 = (1425,-3750); 
 line13 = p5 rotatedabout (p4,270)..p18..p26..p27..p28; 
 p29 = (1875,-3900); 
 p30 = (2475,-3825); 
 p31 = (3150,-3600); 
 p32 = (3825,-3525); 
 p33 = (4650,-3525); 
 line14 = (p28..p29..p30..p31..p32..{dir 20}p33) cutafter line5; 
 p34 = (7575,-4830); 
 p35 = (6795,-5010); 
 p36 = (6060,-4830); 
 p37 = (5535,-4575); 
 p38 = (4965,-4140); 
 p39 = (4455,-3840); 
 p40 = (3390,-3480); 
 line15 = (p11 rotatedabout (p4,270)..p34..p35..p36..p37..p38..p39..p40) cutafter line14; 
 p41 = (7425,-5700); 
 p42 = (6465,-4935); 
 line16 = (p11..p41..p42) cutafter line14; 
 p43 = (4440,-8900); 
 p44 = (4230,-8360); 
 p45 = (4065,-7540); 
 p46 = (3975,-6835); 
 p47 = (3885,-6295); 
 p48 = (3675,-5590); 
 p49 = (3360,-4690); 
 p50 = (2060,-3700); 
 line17 = (p3..p43..p44..p45..p46..p47..p48..p49..p50) cutafter line14; 
 p51 = (4710,-9300); 
 p52 = (4740,-8985); 
 p53 = (5025,-8655); 
 p54 = (5370,-8445); 
 p55 = (5640,-8310); 
 p56 = (6060,-8190); 
 p57 = (6450,-8115); 
 p58 = (7215,-8205); 
 p59 = (7545,-8580); 
 p60 = (7620,-8880); 
 p61 = (7605,-9420); 
 line18 = (p51..p52..p53..p54..p55..p56..p57..p58..p59..p60..p61) 
 cutafter line2; 
 p62 = (5085,-9315); 
 p63 = (5025,-9630); 
 p64 = (5160,-9900); 
 p65 = (5445,-10125); 
 p66 = (5820,-10305); 
 p67 = (6120,-10500); 
 p68 = (6375,-10770); 
 p69 = (6465,-10965); 
 p70 = (6595,-11280); 
 line19 = (p62..p63..p64..p65..p66..p67..p68..p69..p70) 
 cutafter line2; 
 p71 = (6390,-9060); 
 p72 = (6510,-8970); 
 p73 = (6765,-8985); 
 p74 = (7110,-9285); 
 p75 = (7230,-9615); 
 p76 = (7260,-10170); 
 line20 = (p71..p72..p73..p74..p75..p76) cutafter line2; 
 p77 = (5100,-8130); 
 p78 = (4890,-7770); 
 p79 = (4785,-7410); 
 p80 = (4800,-7290); 
 p81 = (4845,-7125); 
 p82 = (4950,-6885); 
 p83 = (5205,-6615); 
 p84 = (5385,-6480); 
 p85 = (5475,-6435); 
 p86 = (5550,-6450); 
 p87 = (5625,-6540); 
 p88 = (5730,-6975); 
 p89 = (5760,-7410); 
 p90 = (5715,-7890); 
 line21 = p54..p77..p78..p79.. 
 p80..p81..p82..p83..p84..p85..p86..p87..p88..p89.. 
 p90..p55; 
 ra = 100s; 
 rb = 180s; 
 p91 = (6825,-9855); 
 line22 = ((1,0)..(0,1)..(-1,0)..(0,-1)..(1,0)--cycle) scaled ra; 
 line23 = ((1,0)..(0,1)..(-1,0)..(0,-1)..(1,0)--cycle) scaled rb; 
 lines = 9; 
 xmin = 0; 
 xmax = 1; 
 ymin = 0; 
 ymax = 3; 
 origin := (6.3cm,-0.1cm); 
 xshift = 2s*(p4-p2); 
 yshift = 2s*(p1-p4); 
 pickup pencircle scaled 2pt; 
 for x = xmin upto xmax: 
 for y = ymin upto ymax: 
 if (-3 <x - y) and (x - y <1): 
 offset := origin + x*xshift + y*yshift; 
 for i = 0 upto 3: 
 fill (fish rotatedabout (p4,90i)) scaled s shifted offset 
 withcolor C[i+1]; 
 for j=1 upto lines: 
 draw (line[12+j] rotatedabout (p4,90i)) scaled s shifted offset 
 withcolor 0.9C[i+1]; 
 endfor; 
 draw line23 shifted ((s*(p91 rotatedabout (p4,90i))) + offset) 
 withcolor 0.9C[i+1]; 
 fill line22 shifted ((s*(p91 rotatedabout (p4,90i))) + offset) 
 withcolor 0.9C[i+1]; 
 draw (fish rotatedabout (p4,90i)) scaled s shifted offset 
 withcolor GREY; 
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