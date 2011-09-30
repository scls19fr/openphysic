% Freely adapted from Escher's drawing 127 
% From: Doris Schattschneider 
% M.C. Escher 
% Visions of Symmetry 
% W.H. Freeman and Company 
% New York 
% ISBN: 0-7167-2126-0 
 
input mp-tool; 
beginfig(1);
 path drawing, l[], bird; 
 numeric width, height, ctrx, ctry, i, offx, offy; 
 color C[], black, white; 
 pair offset, p[]; 
 width = 279.4mm; height = 215.9mm; 
 s = 1 cm; 
 C1 = 0.83(1,1,1); C2 = (1,1,1); ctrx := 1; 
 l1 = ( 7, 0)--(11,10); l2 = (7,8)--(9,13); l3 = (1,5)--( 5,15); 
 l4 = (12,10)--( 2,13); l5 = (7,8)--(6,13); l6 = (2,5)--(12, 2); 
 p2 = l3 intersectionpoint l4; p3 = l4 intersectionpoint l5; 
 p4 = l5 intersectionpoint l2; p5 = l2 intersectionpoint l4; 
 p8 = ((11,6)--(10,8)) intersectionpoint l1; 
 p1 = (3,10); p6 = (11,10); p7 = (13,7); p9 = (9,5); p10 = (11,2); 
 bird = p1--p2--p3--p4--p5--p6--p7--p8--p9--p10-- 
 ((p5--p4--p3--p2--p1) shifted (p10-p6))-- 
 ((p9--p8--p7) shifted (p1-p6))--cycle; 
 for x=1 upto 6: 
 ctrx := 3 - ctrx; ctry := ctrx; 
 for y=1 upto 4: 
 white := C[ctry]; black := C[3-ctry]; 
 offset := (-14,-14)+x*(p6-p1)+y*(p4-(7,0)); 
 offx := 0.2; offy := 0.2; i := 0; 
 fill bird scaled s shifted (s*offset) withcolor black; 
 pickup pencircle scaled 3pt; 
 for p = (7,3.95),(7.5,3.45),(8,3),(13,15.95),(13.5,15.5), 
 % different offset for next points 
 (6.5,4.4),(12,16.95),(12.5,16.45) 
 : 
 i := i + 1; if (i = 6) : offy := 2*offy; fi; 
 draw ((point (xpart p) of bird) + (-offx,offy)-- 
 0.5[(point (xpart p) of bird) + 2*(-offx,offy), 
 (point (ypart p) of bird) + 2*(offx,-offy)]) 
 scaled s shifted (s*offset) withcolor white; 
 endfor; 
 draw (0.16[point 8 of bird,point 10 of bird]--0.86[point 8 of bird,point 10 of bird]) 
 scaled s shifted (s*offset) withcolor white; 
 draw (0.5[point 8 of bird,point 10 of bird]--0.8[0.5[point 8 of bird,point 10 of bird],0.5[point 10 of bird,point 9 of bird]]) 
 scaled s shifted (s*offset) withcolor white; 
 draw (0.16[point 12 of bird,point 10 of bird]--0.86[point 12 of bird,point 10 of bird]) 
 scaled s shifted (s*offset) withcolor white; 
 draw (0.5[point 12 of bird,point 10 of bird]--0.8[0.5[point 12 of bird,point 10 of bird],0.5[point 10 of bird,point 11 of bird]]) 
 scaled s shifted (s*offset) withcolor white; 
 draw ((4.2,10.50)--(4.7,8.85)) 
 scaled s shifted (s*offset) withcolor white; 
 draw (0.80[(4.2,10.50),(4.7,8.85)]..0.75[(4.2,10.50),(4.7,8.85)] rotatedabout (0.5[(4.2,10.50),(4.7,8.85)],270)..0.20[(4.2,10.50),(4.7,8.85)]) 
 scaled s shifted (s*offset) withcolor white; 
 fill (0.65[(4.2,10.50),(4.7,8.85)]..0.35[(4.2,10.50),(4.7,8.85)] rotatedabout (0.5[(4.2,10.50),(4.7,8.85)],90)..0.35[(4.2,10.50),(4.7,8.85)]--cycle) 
 scaled s shifted (s*offset) withcolor white; 
 draw ((6.1,9.35)--(5.1,10.85)) 
 scaled s shifted (s*offset) withcolor white; 
 draw (0.80[(6.1,9.35),(5.1,10.85)]..0.75[(6.1,9.35),(5.1,10.85)] rotatedabout (0.5[(6.1,9.35),(5.1,10.85)],270)..0.20[(6.1,9.35),(5.1,10.85)]) 
 scaled s shifted (s*offset) withcolor white; 
 fill (0.65[(6.1,9.35),(5.1,10.85)]..0.35[(6.1,9.35),(5.1,10.85)] rotatedabout (0.5[(6.1,9.35),(5.1,10.85)],90)..0.35[(6.1,9.35),(5.1,10.85)]--cycle) 
 scaled s shifted (s*offset) withcolor white; 
 ctry := 3 - ctry; 
 endfor; 
 endfor; 
 pickup pencircle scaled 1; 
 draw(0,0)--(width,0)--(width,height)--(0,height)--cycle withcolor (0,0,0); 
 drawing = unitsquare xscaled width yscaled height; 
 clip currentpicture to drawing; 
 draw drawing; 
endfig;
end