# gui.tcl
  global x y z dist

  set x 10
  set y 10
  set z 10
  set dist " "

  toplevel .w
  scale .w.scx -from 0 -to 200 -length 200 -resolution 1 -label "X" \
               -orient horiz -bd 1 -showvalue true -variable x \
               -command ComputeDistance
  scale .w.scy -from 0 -to 200 -length 200 -resolution 1 -label "Y" \
               -orient horiz -bd 1 -showvalue true -variable y \
               -command ComputeDistance
  scale .w.scz -from 0 -to 200 -length 200 -resolution 1 -label "Z" \
               -orient horiz -bd 1 -showvalue true -variable z \
               -command ComputeDistance

  label .w.lt -text Distance
  label .w.ldist -textvariable dist -bg lightblue
  eval pack [winfo children .w]

  proc ComputeDistance {w} {
    global x y z dist
    #ScilabEval "dist = distance($x,$y,$z);TK_SetVar('dist',string(dist));"
    ScilabEval "dist = distance($x,$y,$z);TCL_SetVar('dist',string(dist));"
  }