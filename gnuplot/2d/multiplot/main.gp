set multiplot;                          # get into multiplot mode
set size 1,0.5;  
set origin 0.0,0.5;   plot sin(x); 
set origin 0.0,0.0;   plot cos(x)
unset multiplot     
