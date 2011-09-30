#!/usr/bin/perl
open STDOUT, "> index.html";
print <<BEGIN_OF_HTML;
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <head>
      <title>index</title>
   </head>
   <body>
      <h1>index</h1>
         <ul>
BEGIN_OF_HTML

while(<*>)
{
    print <<MIDDLE_OF_HTML;
            <li><a href=\"$_\">$_</a></li>
MIDDLE_OF_HTML
}

print <<END_OF_HTML;
         </ul>
   </body>
</html>
END_OF_HTML
