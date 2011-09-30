% Freely adapted from Escher's drawing 73 
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
 pair p[], xshift, yshift, origin, offset; 
 path line[], fish, drawing; 
 color WHITE, GREY, C[]; 
 WHITE = (1,1,1); 
 GREY = 0.85(1.0,1.0,1.0); 
 width = 279.4mm; 
 height = 215.9mm; 
 s := 0.055; 
 p1 = (4905,9000-2925); 
 p2 = (1215,9000-4890); 
 p3 = (4890,9000-8985); 
 p4 = (4770,9000-4155); 
 p5 = (4380,9000-5130); 
 p6 = (3840,9000-5040); 
 p7 = (2940,9000-4590); 
 p8 = (2025,9000-4515); 
 p9 = (1935,9000-5295); 
 p10 = (2445,9000-5925); 
 p11 = (2835,9000-6780); 
 p12 = (3225,9000-7425); 
 p13 = (2160,9000-8115); 
 p14 = (1455,9000-9240); 
 p15 = (3225,9000-9750); 
 p16 = (3210,9000-9735); 
 line1 = (p1..p4..p5) shifted -p1; 
 line2 = (p5..p6..p7..p8..p2) shifted -p1; 
 line3 = (p2..p9..p10..p11..p12) shifted -p1; 
 line4 = (p12..p13..p14) shifted -p1; 
 line5 = (p14..p15..p3) shifted -p1; 
 line6 = (p5..p4..p1) shifted -p1; 
 line7 = (p2..p8..p7..p6..p5) shifted -p1; 
 line8 = (p12..p11..p10..p9..p2) shifted -p1; 
 line9 = (p14..p13..p12) shifted -p1; 
 line10 = (p3 ..p15..p14) shifted -p1; 
 fish = line1--line2--line3--line4--line5-- 
 line7 shifted (p3 - p2)-- 
 line6 shifted (p3 - p2)-- 
 line10 shifted (p1 - p2)-- 
 line9 shifted (p1 - p2)-- 
 line8 shifted (p1 - p2)--cycle; 
 p17 = (2880,9000-9750); 
 p18 = (2370,9000-9720); 
 p19 = (2055,9000-9585); 
 p20 = (1605,9000-9360); 
 p22 = (2355,9000-9540); 
 p23 = (2700,9000-9490); 
 p24 = (2820,9000-9540); 
 p25 = (2910,9000-9225); 
 p26 = (3075,9000-8880); 
 p27 = (3300,9000-8640); 
 p28 = (3420,9000-8400); 
 p29 = (3420,9000-8175); 
 p30 = (3375,9000-8025); 
 p31 = (3450,9000-8340); 
 p32 = (3420,9000-8820); 
 p33 = (3300,9000-9225); 
 p34 = (3000,9000-9645); 
 p35 = (1935,9000-9270); 
 p36 = (2385,9000-9225); 
 p37 = (2775,9000-9060); 
 p38 = (3030,9000-8895); 
 p39 = (3000,9000-9105); 
 p40 = (2865,9000-9300); 
 p41 = (2820,9000-9585); 
 p42 = (2820,9000-9570); 
 p43 = (3885,9000-5205); 
 p44 = (4005,9000-5565); 
 p45 = (3990,9000-5880); 
 p46 = (3045,9000-4725); 
 p47 = (3405,9000-5580); 
 p48 = (3555,9000-6270); 
 p49 = (3795,9000-7035); 
 p50 = (2115,9000-4605); 
 p51 = (2595,9000-5190); 
 p52 = (3015,9000-6015); 
 p53 = (3300,9000-6720); 
 p54 = (3510,9000-7230); 
 p55 = (4185,9000-5490); 
 p56 = (3855,9000-6360); 
 p57 = (3765,9000-7320); 
 p58 = (3825,9000-7620); 
 p59 = (4200,9000-7670); 
 p60 = (4455,9000-7670); 
 p61 = (4770,9000-7750); 
 p62 = (5040,9000-7890); 
 p63 = (5040,9000-7605); 
 p64 = (4080,9000-7350); 
 p65 = (4170,9000-6705); 
 p66 = (4350,9000-6120); 
 p67 = (4665,9000-5505); 
 p68 = (5130,9000-4725); 
 p69 = (5625,9000-3660); 
 p70 = (4440,9000-7320); 
 p71 = (4515,9000-6825); 
 p72 = (4875,9000-6060); 
 p73 = (5430,9000-5220); 
 p74 = (6120,9000-4320); 
 p75 = (4740,9000-7605); 
 p76 = (4845,9000-7005); 
 p77 = (5205,9000-6240); 
 p78 = (5850,9000-5460); 
 p79 = (6405,9000-5040); 
 p80 = (6945,9000-7935); 
 p81 = (7215,9000-8100); 
 p82 = (7440,9000-8340); 
 p83 = (7065,9000-8595); 
 p84 = (6705,9000-8650); 
 p85 = (7890,9000-8085); 
 p86 = (8355,9000-7905); 
 p87 = (7800,9000-8445); 
 p88 = (8235,9000-8430); 
 p89 = (7575,9000-8835); 
 p90 = (8055,9000-8880); 
 p91 = (3210,9000-7680); 
 p92 = (3285,9000-7650); 
 p93 = (3375,9000-7635); 
 p94 = (3540,9000-7710); 
 p95 = (3825,9000-7995); 
 p96 = (3990,9000-8370); 
 p97 = (3990,9000-8790); 
 p98 = (3885,9000-9150); 
 p99 = (3765,9000-9345); 
 p100 = (2775,9000-8325); 
 line11 = (p17..p18..p19..p20..p14) shifted -p1; 
 line12 = (p19..p22..p23) shifted -p1; 
 line13 = (p17..p24..p25..p26..p27..p28..p29..p30) shifted -p1; 
 line14 = (p30..p31..p32..p33..p34..p17) shifted -p1; 
 line15 = (p14..p35..p36..p37..p38-- 
 p38..p25..p24..p17-- 
 p17..p18..p19..p20..p14-- 
 cycle) shifted -p1; 
 line16 = (p43..p44..p45) shifted -p1; 
 line17 = (p46..p47..p48..p49) shifted -p1; 
 line18 = (p50..p51..p52..p53..p54) shifted -p1; 
 line19 = (p1..p4..p5..p55..p45..p56..p49..p57..p58) shifted -p1; 
 line20 = (p12..(p54-(0,110))..p57) shifted -p1; 
 line21 = (p58..p59..p60..p61..p62) shifted - p1; 
 line22 = (p62..p63..p14+p1 - p2) shifted -p1; 
 line23 = (p59..p64..p65..p66..p67..p68..p69) shifted -p1; 
 line24 = (p60..p70..p71..p72..p73..p74) shifted -p1; 
 line25 = (p61..p75..p76..p77..p78..p79) shifted -p1; 
 line26 = (p80..p81..p82) shifted -p1; 
 line27 = (p82..p83..p84) shifted -p1; 
 line28 = (p81..p85..p86) shifted -p1; 
 line29 = (p82..p87..p88) shifted -p1; 
 line30 = (p83..p89..p90) shifted -p1; 
 line31 = (p91..p92..p93..p94..p95..p96..p97..p98..p99) shifted -p1; 
 line32 = (p100+(300,0).. 
 p100+(0,-300).. 
 p100-(300,0).. 
 p100+(300,0)-- 
 cycle) shifted -p1; 
 line33 = (p100+200*(0.5,0.87)-- 
 p100-- 
 p100+(200,0).. 
 p100+(0,-200).. 
 p100-(200,0).. 
 p100+200*(0.5,0.87)-- 
 cycle) shifted -p1; 
 origin = (10cm,10cm); 
 xshift = (p1 + p3 - 2p2) scaled s; 
 yshift = (p1 - p2) scaled s; 
 C[1] = WHITE; 
 C[2] = GREY; 
 c := 1; 
 xmin = -2; 
 xmax = 2; 
 ymin = -2; 
 ymax = 5; 
 for y=ymin upto ymax: 
 for x=xmin upto xmax: 
 offset := origin + x*xshift + y*yshift; 
 fill fish scaled s shifted offset withcolor C[c]; 
 fill line15 scaled s shifted offset withcolor C[3-c]; 
 fill line33 scaled s shifted offset withcolor C[3-c]; 
 endfor; 
 c := 3 - c; 
 endfor; 
 c := 1; 
 pickup pencircle scaled 2pt; 
 for y=ymin upto ymax: 
 for x=xmin upto xmax: 
 offset := origin + x*xshift + y*yshift; 
 draw line11 scaled s shifted offset withcolor C[c]; 
 draw line12 scaled s shifted offset withcolor C[c]; 
 for i=13 upto 14: 
 draw line[i] scaled s shifted offset withcolor C[3-c]; 
 endfor; 
 for i=16 upto 32: 
 draw line[i] scaled s shifted offset withcolor C[3-c]; 
 endfor; 
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