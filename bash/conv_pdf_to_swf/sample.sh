#!/usr/bin/env bash

### BEGIN INFO
# Short-Description: Convert a presentation to a browsable .swf
# Required-scripts :
#  presentation2swf.sh
# Required-packages :
#  see presentation2swf.sh
# Description:
#   Convert a presentation to a browsable .swf
#   Test presentation2swf.sh
# Author: Sebastien Celles <s.celles@gmail.com>
### END INFO

msg()
{
  echo ""
  echo "========== $1 =========="
}

cmd() # show the command and execute it
{
  echo " >> $1"
  eval $1
  if [ "$?" != "0" ]; then
    echo " !!!! Error - script $SCRIPTNAME stopped !!!!"
    exit 1 # stop the script in case of error
  fi
}

input="sample.pdf" #pdf #odp #.odp .ppt
output="sample.swf"
template="/usr/local/share/swftools/swfs/default_viewer.swf" # /usr/local/share/swftools/... or /usr/share/swftools/...
loader="/usr/local/share/swftools/swfs/default_loader.swf" #loading.swf

msg "Convert $input presentation to $output browsable .swf Flash file"
#cmd "./presentation2swf.sh -i $input -o $output -t SimpleViewer.swf -l loading.swf"
#cmd "./presentation2swf.sh -i $input -o $output -t $template -l $loader"
cmd "./presentation2swf.sh -i $input -o $output -t $template"

#msg "Convert from .ppt"
#cmd "./presentation2swf.sh -i sample.ppt -o $output -t SimpleViewer.swf -l loading.swf"

msg "Make an HTML file with"
cmd "swfdump --html $output > object.html" # ToDo insert it in html code bellow
html='<html>
  <head>
    <title>index.html</title>
  </head>
  <body>
<!--    <h1>'$output'</h1> -->
'`swfdump --html $output`.'
  </body>
</html>'

url="`pwd`/index.htm" #pwd=print working directory
echo "$html" > $url
cat $url


msg "Show it with default browser"
cmd "xdg-open file://$url"
#cmd "firefox file://$url"


msg "Remove temporary files"
#cmd "rm -f object.html"


