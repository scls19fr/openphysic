<?php
if (!extension_loaded('gtk')) { 
    dl('php_gtk.' . PHP_SHLIB_SUFFIX); 
}

$arXPMs['ok'] = array(
    "32 32 7 1",
    "   c None",
    ".  c #005F00", "+  c #008A00", "@  c #00BB00", 
    "#  c #00E000", "$  c #00F709", "%  c #4BE24A",
    "                                ",
    "                                ",
    "                                ",
    "                                ",
    "                              @@",
    "                            +@++",
    "+@                        +@+@+ ",
    "+++                     @+@++.  ",
    "+@++                  ++@%++.   ",
    " +%++               +++%%@+     ",
    " +%@++            +++%%%++      ",
    " +@##++         +++%$$%++       ",
    "  +$$%++      +++@$$$$++        ",
    "  +#$$@+.   +++@$$$$%++         ",
    "  +@$$$#+.+.+@$$$$$#+.          ",
    "  .+$$$$@+.@#$$$$$@+.           ",
    "   +##$$$####$$$$++.            ",
    "   .@$#####$$###@..             ",
    "   .+##########+..              ",
    "    .#########+..               ",
    "    .@##@#@#@..                 ",
    "    .+@##@#@+.                  ",
    "    ..#@@#@..                   ",
    "     .@@@@..                    ",
    "     .+@+..                     ",
    "     .++..                      ",
    "      ...                       ",
    "      ..                        ",
    "                                ",
    "                                ",
    "                                ",
    "                                "
);

$arXPMs['inbox'] = array(
    "16 16 6 1",
    "   c None"   , ".  c #028800", "+  c #995700",
    "@  c #82E61D", "#  c #FFBE58", "$  c #FCEF8E",
    "                ",
    "      ....      ",
    "     .$$$$.     ",
    "     .@@@@.     ",
    "     .@@@@.     ",
    "    ..@@@@..    ",
    "   .@@@@@@@@.   ",
    "    .@@@@@@.    ",
    "     .@.@@.     ",
    "      ..@.      ",
    "+++    ..    +++",
    "+$$+        +$$+",
    "+$$++++++++++$$+",
    "+$#$$$$$$$$$$$#+",
    "+$#############+",
    "++++++++++++++++"
);

$window =& new GtkWindow();
$window->set_title('pixmaps');
$window->set_default_size(200, 100);
$window->connect_object('destroy', array('gtk', 'main_quit'));
$window->realize();

$clTransparentTest =& new GdkColor('#000000');

$arPxTest = gdk::pixmap_create_from_xpm_d($window->window, $clTransparentTest, $arXPMs['ok']);

$btnTest  =& new GtkButton();
$pxmTest  =& new GtkPixmap($arPxTest[0], $arPxTest[1]);
$lblTest  =& new GtkLabel('Button with icon');
$hboxTest =& new GtkHBox();
$hboxTest->pack_start($pxmTest);
$hboxTest->pack_end($lblTest);
$btnTest->add($hboxTest);

// hovering the button changes the image
// to a highlighted version of itself
function changePixmap( $btnTest, $strAction, &$pixmap)
{
    $hbox = $btnTest->child;
    $arChildren = $hbox->children();
    $hbox->remove($arChildren[0]);
    $hbox->pack_start($pixmap);
    $pixmap->show();

    // underline the label
    $lblTest = $arChildren[1];
    $strPattern = '';
    if ($strAction == 'enter') {
        $strPattern = '________________';
    }

    $lblTest->set_pattern($strPattern);
}

// generate a highlighted picture from the original
$arXPMs['high'] = $arXPMs['ok'];
$arData = explode(' ', $arXPMs['high'][0]);
$nColors = $arData[2];

// change all colors | we know the first color is transparent
for ($nA = 2; $nA < $nColors + 1; $nA++) {
    $arData = explode(' #', $arXPMs['high'][$nA]);
    // the following code is taken from PEAR::Image_Color
    $degree = 40;
    $color[] = hexdec(substr($arData[1], 0, 2));
    $color[] = hexdec(substr($arData[1], 2, 2));
    $color[] = hexdec(substr($arData[1], 4, 2));
    for ($x = 0; $x < 3; $x++) {
        if (($color[$x] + $degree) < 256) {
            if (($color1[$x] + $degree) > -1) {
                $color[$x] += $degree;
            } else {
                $color[$x] = 0;
            }
        } else {
            $color[$x] = 255;
        }
    }
    $arData[1] = sprintf('%02X%02X%02X', $color[0], $color[1], $color[2]);
    $arXPMs['high'][$nA] = implode(' #', $arData);
}

$arPxTestH = gdk::pixmap_create_from_xpm_d($window->window, null, $arXPMs['high']);
$pxmTestHigh =& new GtkPixmap($arPxTestH[0], $arPxTestH[1]);

$btnTest->connect('enter', 'changePixmap', 'enter', $pxmTestHigh);
$btnTest->connect('leave', 'changePixmap', 'leave', $pxmTest);

$alBtn =& new GtkAlignment(0.5, 0.5, 0, 0);
$alBtn->add($btnTest);

list($pxWindow, $maskWindow) = gdk::pixmap_create_from_xpm_d($window->window, null, $arXPMs['inbox']);
$gdkwindow = $window->window;
$gdkwindow->set_icon($gdkwindow, $pxWindow, $maskWindow);

$window->add($alBtn);
$window->show_all();

gtk::main();

?>