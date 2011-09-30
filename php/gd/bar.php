<html>
<head>
<meta http-equiv="Content-Language" content="en-us">
<title>Simple Bar Graph .. by viji patil</title>
</head>
<body>
<?php
   
        // read the post data
        $data = array('100','200','300','400','500','350','270');
        $x_fld = array('Sun','Mon','Tue','Wen','Thu','Fir','Sat');
        $max = 0;
        for ($i=0;$i<7;$i++){
          if ($data[$i] > $max)$max=$data[$i];  // find the largest data
        }
        $im = imagecreate(320,255); // width , height px

        $white = imagecolorallocate($im,255,255,255); // allocate some color from RGB components remeber Physics
        $black = imagecolorallocate($im,0,0,0);   //
        $red = imagecolorallocate($im,255,0,0);   //
        $green = imagecolorallocate($im,0,255,0); //
        $blue = imagecolorallocate($im,0,0,255);  //
        //
        // create background box
        //imagerectangle($im, 1, 1, 319, 239, $black);
        //draw X, Y Co-Ordinate
        imageline($im, 10, 5, 10, 230, $blue );
        imageline($im, 10, 230, 300, 230, $blue );
        //Print X, Y
        imagestring($im,3,15,5,"Students",$black);
        imagestring($im,3,280,240,"Days",$black);
        imagestring($im,5,100,50,"Simple Graph",$red);
         imagestring($im,5,125,75,"by Vijit",$green);

        // what next draw the bars
        $x = 15;    // bar x1 position
        $y = 230;    // bar $y1 position
        $x_width = 20;  // width of bars
        $y_ht = 0; // height of bars, will be calculated later
        // get into some meat now, cheese for vegetarians;
        for ($i=0;$i<7;$i++){
          $y_ht = ($data[$i]/$max)* 100;    // no validation so check if $max = 0 later;
          imagerectangle($im,$x,$y,$x+$x_width,($y-$y_ht),$red);
          imagestring( $im,2,$x-1,$y+1,$x_fld[$i],$black);
          imagestring( $im,2,$x-1,$y+10,$data[$i],$black);
          $x += ($x_width+20);   // 20 is diff between two bars;
         
        }
        imagejpeg( $im, "graph.jpeg", 90);
        imagedestroy($im);
        echo "<img src='graph.jpeg'><p></p>";
 
?>
</body>
</html>
