mpgraph:=1; input mp-tool; 
prologues:=2; 
beginfig(1);
 pair p[], xshift, yshift, origin, offset; 
 path line[], fish[], drawing; 
 color PURPLE, GREEN, GREY; 
 PURPLE = (0.875,0.875,0.95); 
 GREEN = (0.85,0.925,0.85); 
 GREY = 0.8(1,1,1); 
 width = 279.4mm; 
 height = 215.9mm; 
 s := 0.2cm; 
 % 
 
 p64 = ( 6.1,24.0); 
 p63 = ( 4.0,18.5); 
 p1 = (19.5,-1.3); 
 p2 = (22.2, 6.5); 
 p3 = (22.3,10.2); 
 line1 = p1..p2..p3; 
 
 p4 = (20.0,11.5); 
 p5 = (18.0,13.0); 
 p6 = (15.6,16.8); 
 p7 = (15.8,19.0); 
 p8 = (16.8,21.75); 
 p9 = (18.0,23.5); 
 p10 = (20.6,27.0); 
 p11 = (21.8,30.0); 
 p12 = (22.0,33.0); 
 p13 = (21.9,35.0); 
 p14 = (21.0,37.0); 
 p15 = (19.5,38.3); 
 p16 = (17.0,38.7); 
 p17 = (15.0,37.9); 
 p18 = (13.5,36.8); 
 p19 = (11.9,35.0); 
 p20 = ( 9.9,32.0); 
 p21 = ( 8.5,28.0); 
 p22 = ( 8.5,26.0); 
 p23 = ( 8.8,23.5); 
 p24 = ( 9.3,21.0); 
 p25 = (10.2,18.8); 
 p26 = (11.5,16.5); 
 p27 = (13.0,14.0); 
 p28 = (14.4,11.1); 
 p29 = (15.0, 9.0); 
 p30 = (15.2, 6.8); 
 line2 = p3 for i := 4 upto 29: ..p[i] endfor.. 
 (p22 reflectedabout(p1,p15))+p63-p15; 
 
 
 p31 = (p64 reflectedabout(p1,p15))+p63-p15; 
 line3 = (p22 reflectedabout(p1,p15))+p63-p15.. 
 p31..p1; 
 
 p32 = (17.0, 8.0); 
 p33 = (16.0,10.3); 
 p34 = (20.5, 2.5); 
 p35 = (19.6, 6.5); 
 p36 = (17.2,10.8); 
 p37 = (20.2, 9.2); 
 p38 = (18.0,11.8); 
 line4 = p31..p32..p33; 
 line5 = p2..p37..p38; 
 line6 = p28..p33..p36..p38..p5; 
 
 p39 = (16.9,15.7); 
 p40 = (17.0,17.4); 
 p41 = (18.2,18.9); 
 p42 = (20.2,19.1); 
 p43 = (22.3,17.5); 
 line7 = p5..p39..p40..p41..p42..p43; 
 
 p44 = (22.0,20.0); 
 p45 = (21.0,22.0); 
 p46 = (20.0,24.0); 
 line8 = p43..p44..p45..p46..p10; 
 
 p47 = (16.1,16.2); 
 p48 = (16.2,18.1); 
 p49 = (17.4,20.0); 
 p50 = (19.4,20.8); 
 p51 = (18.6,21.9); 
 line9 = p39..p47..p6; 
 line10 = p40..p48..p7; 
 line11 = p41..p49..p8; 
 line12 = p42..p50..p51..p9; 
 
 p52 = (15.0,14.0); 
 p53 = (13.6,17.0); 
 p54 = (13.0,20.0); 
 p55 = (13.0,23.0); 
 p56 = (13.6,26.0); 
 p57 = (15.0,29.1); 
 p58 = (17.2,32.8); 
 line13 = p1..p35..p36 for i := 52 upto 58: ..p[i] endfor; 
 
 p59 = (p19 reflectedabout(p15,p1)) + p63-p15; 
 p60 = (p18 reflectedabout(p15,p1)) + p63-p15; 
 p61 = (p17 reflectedabout(p15,p1)) + p63-p15; 
 p62 = (p16 reflectedabout(p15,p1)) + p63-p15; 
 
 line14 = p22..p64..p63; 
 
 p65 = ( 7.0,21.6); 
 p66 = ( 8.5,20.0); 
 p67 = ( 9.8,18.1); 
 line15 = p62..p65..p23; 
 line16 = p61..p66..p24; 
 line17 = p60..p67..p25; 
 line18 = p59..{dir 70}p26; 
 
 p70 = (14.8,34.8); 
 p71 = (16.0,36.0); 
 p72 = (18.0,37.2); 
 p73 = (19.1,37.3); 
 p74 = (20.1,36.1); 
 p75 = (20.5,34.0); 
 p76 = (20.3,32.2); 
 line19 = p70..p71..p72..p73..p74..p75..p76; 
 
 line20 = ((subpath(12,19) of line2)--line14) 
 reflectedabout(p1,p15) 
 shifted (p63-p15); 
 
 fish1 = line1-- 
 subpath(0,2) of line2-- 
 line7-- 
 line8-- 
 subpath(7,19) of line2-- 
 line14-- 
 line20-- 
 cycle; 
 
 origin = (0.0cm,5cm); 
 line21 = line13..(18.5,35.5)..p73; 
 p80 = (13.7,32.4); 
 p81 = (15.0,33.0); 
 p82 = (16.0,35.0); 
 p83 = (15.9,36.8); 
 p84 = (14.1,36.1); 
 p85 = (13.3,35.1); 
 p86 = (12.9,33.5); 
 
 line22 = (((p80..p81..p82..p83..p84..p85..p86..cycle) 
 shifted (-p70)) scaled 0.9) shifted p70; 
 line23 = ((line22 shifted -p70) rotated 15) shifted 1.01p76; 
 line24 = ((line22 shifted (-p70)) scaled 0.4) shifted 
 0.35[p70,p83]; 
 line25 = ((line24 shifted -p70) rotated 15) shifted 1.01p76; 
 fish2 := fish1 reflectedabout (p1,p15) shifted (p63-p15); 
 
 lines := 19; 
 for y := -1 upto 1: 
 pickup pencircle scaled 1.7pt; 
 offset := origin + s*y*(p15-p1); 
 
 fill fish1 scaled s shifted offset withcolor PURPLE; 
 fill fish2 scaled s shifted offset withcolor GREEN; 
 
 
 draw fish1 scaled s shifted offset withcolor GREY; 
 draw fish2 scaled s shifted offset withcolor GREY; 
 
 pickup pencircle scaled 1.7pt; 
 for i := 1 upto lines: 
 draw line[i] scaled s shifted offset withcolor GREY; 
 endfor; 
 for i := 1 upto lines-1: 
 if (i=13): 
 draw (line21 reflectedabout (p1,p15) shifted (p63-p15)) 
 scaled s shifted offset withcolor GREY; 
 for q := 22, 23: 
 fill (line[q] reflectedabout (p1,p15) shifted (p63-p15)) 
 scaled s shifted offset withcolor (1,1,1); 
 draw (line[q] reflectedabout (p1,p15) shifted (p63-p15)) 
 scaled s shifted offset withcolor GREY; 
 endfor; 
 for q := 24,25: 
 fill (line[q] reflectedabout (p1,p15) shifted (p63-p15)) 
 scaled s shifted offset withcolor GREY; 
 endfor; 
 else: 
 draw (line[i] reflectedabout (p1,p15) shifted (p63-p15)) 
 scaled s shifted offset withcolor GREY; 
 fi; 
 endfor; 
 endfor; 
 
endfig;
end