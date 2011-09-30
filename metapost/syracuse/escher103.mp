mpgraph:=1;
beginfig(1);
 pair p[], xshift, yshift, origin, offset; 
 path line[], fish, drawing; 
 color WHITE, GREY, C[]; 
 C[1] = 0.900(1,1,1); 
 C[3] = 0.95C1; 
 C[2] = 0.90C3; 
 WHITE = C1; 
 GREY = 0.90C1; 
 width = 279.4mm; 
 height = 215.9mm; 
 s = 14cm; 
 z1 = (0,1); 
 z2 = (0,0); 
 z3 = z1 rotated 300; 
 z4 = (z1--0.5[z2,z3]) intersectionpoint (z2--0.5[z1,z3]); 
 line1 = (z1{dir 285}..{dir 315}(z3 yscaled -1)) cutafter ((0,0)--z3); 
 line2 = line1 rotatedabout (z4,120); 
 line3 = line2 rotatedabout (z4,120); 
 z7 = (z4--z4+(0.3,1)) intersectionpoint line3; 
 z5 = z7 rotatedabout (z4,120); 
 z6 = z5 rotatedabout (z4,120); 
 z8 = line1 intersectionpoint line2; 
 z9 = line2 intersectionpoint line3; 
 z10 = line3 intersectionpoint line1; 
 z11 = line1 intersectionpoint (z4--z5+z8-z4); 
 z12 = line2 intersectionpoint (z4--z6+z9-z4); 
 z13 = line3 intersectionpoint (z4--z7+z10-z4); 
 z14 = (z11..z11 rotated 350..z11 rotated 240) intersectionpoint line2; 
 z15 = (0.1,0.27); 
 ra = 0.05; 
 rb = 0.07; 
 line4 = z4{dir 210}..z5-- 
 (line1 cutbefore z5 cutafter z11)-- 
 z11{dir340}..z14-- 
 (reverse line2 cutbefore z14); 
 fish = reverse line4 rotatedabout (z4,240)--line4--z1--cycle; 
 line5 = ((1,0)..(0,1)..(-1,0)..cycle) scaled ra; 
 line6 = ((1,0)..(0,1)..(-1,0)..cycle) scaled rb; 
 line7 = z5--z14 rotatedabout (z4,240); 
 line8 = subpath (0.1,0.9) of line7; 
 xmin = 0; 
 xmax = 2; 
 ymin = 0; 
 ymax = 4; 
 origin := (-40cm,-10cm); 
 xshift = s*(2z3-z1); 
 yshift = s*z3; 
 pickup pencircle scaled 3pt; 
 rot := 0; 
 for y = ymin upto ymax: 
 for x = xmin upto xmax: 
 if (1 <x+y) and (x+y <5): 
 offset := origin + x*xshift + y*yshift; 
 for i = 1 upto 3: 
 for j = 0 upto 1: 
 fill (fish xscaled (-1+2j) rotatedabout (z4,120*(i+rot))) 
 scaled s shifted offset withcolor C[i]; 
 fill ((line6 scaled s) shifted ((s*z15) xscaled (-1+2j))) 
 rotatedabout (s*z4,120*(i+rot)) 
 shifted offset withcolor WHITE; 
 fill ((line5 scaled s) shifted ((s*z15) xscaled (-1+2j))) 
 rotatedabout (s*z4,120*(i+rot)) 
 shifted offset withcolor 0.5*0.9875*(C[i]+C3); 
 draw ((line6 scaled s) shifted ((s*z15) xscaled (-1+2j))) 
 rotatedabout (s*z4,120*(i+rot)) 
 shifted offset withcolor GREY; 
 draw (fish xscaled (-1+2j) rotatedabout (z4,120*(i+rot))) 
 scaled s shifted offset withcolor GREY; 
 draw (line8 xscaled (-1+2j) rotatedabout (z4,120*(i+rot))) 
 scaled s shifted offset withcolor GREY; 
 draw (((z6 rotatedabout (z4,120)){dir 215}..point 0.5 of line8) 
    xscaled (-1+2j) rotatedabout (z4,120*(i+rot))) 
 scaled s shifted offset withcolor GREY; 
 endfor; 
 endfor; 
 fi; 
 endfor; 
 rot := (rot + 2) mod 3; 
 endfor; 
 pickup pencircle scaled 1; 
 draw(0,0)--(width,0)--(width,height)--(0,height)--cycle withcolor WHITE; 
 drawing = unitsquare xscaled width yscaled height; 
 clip currentpicture to drawing; 
 draw drawing;
endfig;
end