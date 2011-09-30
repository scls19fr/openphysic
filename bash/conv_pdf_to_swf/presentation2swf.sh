#!//usr/bin/env sh

### BEGIN INFO
# Short-Description: Convert a presentation to a browsable .swf
# Required-packages :
#  unoconv
#   (convert pps/ppt or odp to pdf)  
#   http://dag.wieers.com/home-made/unoconv/
#  swftools
#   (convert pdf to swf)
#   http://www.swftools.org/
#   http://www.swftools.org/pdf2swf_usage.html
#   http://www.quiss.org/swftools/pdf2swf_usage.html
# Required-files :
#  preloader.swf
# Description:
#   Convert a presentation to a browsable .swf
#   The presentation file is converted to a .pdf file
#   The .pdf file is converted to a .swf file
#   The .swf is combined with a template .swf file
#   Size of the resulting file is modified.
# Author: Sebastien Celles <s.celles@gmail.com>
### END INFO

DESC="Convert a presentation to a browsable .swf"
SCRIPTNAME=`basename $0`

usage()
{
	echo $DESC >&2
	echo "Usage: $SCRIPTNAME -i inputfile [-t template.swf] [-o output.swf] [-l loading.swf]" >&2 # ToDo getopts
        echo " inputfile can be a .pps/.ppt MS Powerpoint file or a .odt OpenOffice Impress file" >&2
 	exit 3
}

msg()
{
  echo ""
  echo "****** $1 ******"
}

cmd() # show the command and execute it
{
  echo " > $1"
  eval $1
  if [ "$?" != "0" ]; then
    echo " !!!! Error - script $SCRIPTNAME stopped !!!!"
    exit 1 # stop the script in case of error
  fi
}

#function namename()
#{
#  local name=${1##*/}
#  local name0="${name%.*}"
#  echo "${name0:-$name}"
#}

#function ext()
#{
#  local name=${1##*/}
#  local name0="${name%.*}"
#  local ext=${name0:+${name#$name0}}
#  echo "${ext:-.}"
#}


toLower() {
  echo $1 | tr "[:upper:]" "[:lower:]" 
} 

toUpper() {
  echo $1 | tr "[:lower:]" "[:upper:]" 
} 

# ToDo : tester le nb de paramètres / erreur de syntaxe ? -> usage

input=""
template=""
output=""
loading=""

#input=$1
#template=$2
#output=$3

temp="temp.swf"
temp2="temp2.swf"
#temp3="temp3.swf"

while [ $# -gt 0 ]
do
  case $1 in
  -i|--input)
    input=$2
    shift
    ;;
  -o|--output)
    output=$2
    shift
    ;;
  -t|--template)
    template=$2
    shift
    ;;
  -l|--loading)
    loading=$2
    shift
    ;;
  -h|--help)
    usage
    shift
    ;;
  --)
    shift
    break
    ;;
  -*)
    echo "$SCRIPTNAME: l'option $1 est incorrecte" >&2
    usage
    ;;
  *)
    break
    ;;
  esac
  shift
done

echo "Running: $SCRIPTNAME --input $input --output $output --template $template --loading $loading"
echo ""

if [ -n "$input" ]; then

# get input extension (.ppt .odt ... ?) and convert it to lower case

inputext="${input##*.}" #"ppt"
inputext="`toLower $inputext`"

if [ $inputext != "pdf" ]; then
  msg "Convert the .$inputext presentation to a .pdf file"
#exit 1
  #cmd "ooffice" # ooffice must be running before running unoconv
  cmd "unoconv -f pdf $input"
fi

  msg "Converting $input document to `basename $input .$inputext`.pdf"
  #cmd "pdf2swf -b `basename $input .odp`.pdf $temp" # TO FIX : get file extension of $input
  cmd "pdf2swf -b `basename $input .$inputext`.pdf $temp" # TO FIX : get file extension of $input
#exit 1
  msg "Linking a viewer"
  cmd "swfcombine -o $temp2 $template viewport=$temp"

  if [ -n "$loading" ]; then
    msg "Linking a Preloader"
    #preloader="PreLoader.swf" # preloader
    preloader="/usr/share/swftools/swfs/PreLoaderTemplate.swf"
    #loading="loading.swf" loading animation
    #swfcombine -o $temp2 $preloader loader=$loading movie=$temp2
    cmd "swfcombine -o $temp2 $preloader -x 3000 -y 3000 loader=$loading movie=$temp2"
  #cp $temp2 $temp3
  fi

  msg "Correcting the size and framerate"
  cmd "swfcombine --dummy `swfdump -XY temp.swf` $temp2 -o $output"

  #msg "Embedding the SWF into a html page"
  #echo "Copy/paste it in your HTML code"
  #cmd "swfdump --html $output"


  msg "Remove temporary files"
  cmd "rm -f $temp $temp2 $temp3"

else
  usage
fi

