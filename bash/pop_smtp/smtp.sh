#!/bin/bash
#*****************************************************************************
#FILE:               smtp.sh
#LANGUAGE:           sh
#SYSTEM:             POSIX
#USER-INTERFACE:     NONE
#DESCRIPTION
#    
#    Implements a naive SMTP client.
#    
#AUTHORS
#    <PJB> Pascal Bourguignon <pjb@informatimago.com>
#MODIFICATIONS
#    2004-03-01 <PJB> Created.
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
smtp_server=localhost
local_name=localhost
if [ "$1" = "--log" ] ; then shift ; trace=echo ; else trace=true ; fi
from="$1" ; shift # the rest of arguments are envelop recipients
log=/dev/tty
message=/tmp/message.$$
trap "rm $message" 0
cat>$message
(
    read line 0<&3 ; $trace "$line">$log
    case "$line" in 2*) ;; *) echo "QUIT" 1>&3 ; exit 0 ;; esac
    echo "HELO $local_name" 1>&3
    read line 0<&3 ; $trace "$line">$log
    case "$line" in 2*) ;; *) echo "QUIT" 1>&3 ; exit 0 ;; esac
    echo "MAIL FROM: <${from}>" 1>&3
    read line 0<&3 ; $trace "$line">$log
    case "$line" in 2*) ;; *) echo "QUIT" 1>&3 ; exit 0 ;; esac
    ok=0
    for recipient ; do
        echo "RCPT TO: <${recipient}>" 1>&3
        read line 0<&3 ; $trace "$line">$log
        case "$line" in 
        2*) ok=1 ;; 
        *) echo "Cannot send to ${recipient}">$log ;; 
        esac
    done
    if [ $ok -ne 0 ] ; then
        echo "DATA" 1>&3
        read line 0<&3 ; $trace "$line">$log
        case "$line" in 3*) ;; *) echo "QUIT" ; exit 0 ;; esac
        while read line ; do
            case "$line" in
            .*) echo ".$line" 1>&3 ;;
            *)  echo "$line"  1>&3 ;;
            esac
        done < $message
        echo "." 1>&3
        read line 0<&3 ; $trace "$line">$log
        case "$line" in 
        2*) [ "$trace" != ":" ] && echo "Message sent">$log ;;
        *) echo "Could not send the emssage.">$log ;; 
        esac
    fi
    echo "QUIT" 1>&3
) 3<>/dev/tcp/$smtp_server/25
exit 0
#### smtp.sh                          --                     --          ####