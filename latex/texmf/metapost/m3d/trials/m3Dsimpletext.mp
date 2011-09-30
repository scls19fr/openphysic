%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 3D extensions for MetaPost by Anthony Phan.
% file: m3Dsimpletext.mp
% last modification: january 11, 2006
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% mpost <thisfile.mp>
% bash animate-script
% rm -f <thisfile>.1*
% xanim <thisfile>.gif
input m3Dplain;

n=50;
ProjectionSystem(planar);

for $ = 0 upto n-1:
  beginfig(100+$);
    UseObject(simpletext, Origin, ($/n*360,0,90), 20pt, "justify", "center",
      "I love to spin like this!",
      "But it gives me headache...");
  endfig;
endfor;

Animate(2,false);

end.
