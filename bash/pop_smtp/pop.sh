#!/bin/bash
#*****************************************************************************
#FILE:               pop.sh
#LANGUAGE:           sh
#SYSTEM:             POSIX
#USER-INTERFACE:     NONE
#DESCRIPTION
#    
#    A simple POP-3 client.
#    
#AUTHORS
#    <PJB> Pascal Bourguignon <pjb@informatimago.com>
#MODIFICATIONS
#    2004-01-17 <PJB> Created.
#BUGS
#LEGAL
#    GPL
#    
#    Copyright Pascal Bourguignon 2004 - 2004
#    
#    This program is free software; you can redistribute it and/or
#    modify it under the terms of the GNU General Public License
#    as published by the Free Software Foundation; either version
#    2 of the License, or (at your option) any later version.
#    
#    This program is distributed in the hope that it will be
#    useful, but WITHOUT ANY WARRANTY; without even the implied
#    warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
#    PURPOSE.  See the GNU General Public License for more details.
#    
#    You should have received a copy of the GNU General Public
#    License along with this program; if not, write to the Free
#    Software Foundation, Inc., 59 Temple Place, Suite 330,
#    Boston, MA 02111-1307 USA
#*****************************************************************************

POP_SERVER=pop.afaa.asso.fr
POP_USER=pascal
POP_PASS=pari-fle
SPOOL=/tmp
delete=0  # set to 1 to delete messages from mailbox after transfer.
trace=0

function get_ok () {
    read code one two three rest 0<&3
    case "$code" in
    +OK) true ;;
    *)   echo "Error, got: $code $one $two $three $rest" >&2 ;;# ; exit 1 ;;
    esac
    if [ $trace -ne 0 ] ; then echo "GOT $code" >&2; fi
}


function get_line () {
    read line 0<&3
    echo "$line" | tr -d '\015'
}


if [ $trace -ne 0 ] ; then echo "Opening session with $POP_SERVER." >&2 ; fi
3<> /dev/tcp/$POP_SERVER/110
get_ok
echo "USER $POP_USER" 1>&3
get_ok
echo "PASS $POP_PASS" 1>&3
get_ok
if [ $trace -ne 0 ] ; then echo "LOGIN complete." >&2 ; fi
if [ "$three" -eq 0 ] ; then
    echo "No message in mailbox." >&2
    exit 1
fi

echo "LIST" 1>&3
get_ok
mcount=0
reading=1
while [ $reading -ne 0 ] ; do
    read index size 0<&3
    index=$(echo "$index" | tr -d '\015')
    if [ $trace -ne 0 ] ; then echo "$index $size" >&2 ; fi
    case "$index" in
    .) reading=0  ;;
    *) message[$mcount]=$index ; mcount=$(($mcount + 1)) ;;
    esac
done
if [ $trace -ne 0 ] ; then echo "GOT message list: $mcount messages." >&2 ; fi

mindex=0
while [ $mindex -lt $mcount ] ; do
    if [ $trace -ne 0 ] ; then echo "Reading message ${message[$mindex]}" >&2 ; fi
    echo "RETR ${message[$mindex]}"  1>&3
    get_ok
    file="$SPOOL/message-$$-${message[$mindex]}"
    reading=1
    while [ $reading -ne 0 ] ; do
        read line 0<&3
        line="$(echo "$line" | tr -d '\015')"
        case "$line" in
        .) reading=0  ;;
        *) echo "$line" >> "$file" ; if [ $trace -ne 0 ] ; then echo -n . >&2 ; fi ;;
        esac
    done
    if [ $trace -ne 0 ] ; then echo '' >&2 ; fi
    mindex=$(($mindex + 1))
    if [ $delete -ne 0 ] ; then
        if [ $trace -ne 0 ] ; then echo "Deleting message ${message[$mindex]}" >&2 ; fi
        echo "DELE ${message[$mindex]}"  1>&3
        get_ok
    fi
done

if [ $trace -ne 0 ] ; then echo "Closing session with $POP_SERVER." >&2 ; fi
echo QUIT 1>&3
read line 0<&3

echo $SPOOL/message-$$-*
exit 0
#### pop.sh                           -- 2004-01-17 01:36:39 -- pascal   ####