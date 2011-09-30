#!/bin/bash
#*****************************************************************************
#FILE:               smtpd.sh
#LANGUAGE:           sh
#SYSTEM:             POSIX
#USER-INTERFACE:     NONE
#DESCRIPTION
#    
#    A very SIMPLE mail transfer agent.
#
#    Put in inetd.conf:  
#    smtp stream tcp nowait mail /usr/local/bin/smtpd.sh smtpd.sh
#    
#AUTHORS
#    <PJB> Pascal Bourguignon <pjb@informatimago.com>
#MODIFICATIONS
#    2003-09-04 <PJB> Created.
#BUGS
#LEGAL
#    GPL
#    
#    Copyright Pascal Bourguignon 2003 - 2003
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

mailboxes=/tmp/var/spool/mail
mkdir -p "$mailboxes" >/dev/null 2>&1 || true
echo "220 `hostname` SMTP SIMPLE mail transport agent Version 1.0"

done=0
while [ $done -eq 0 ] ; do
    read command arguments
    command="$(echo "$command" | tr -d '\015')"
    arguments="$(echo "$arguments" | tr -d '\015')"
    case "$command" in
    [hH][eE][lL][oO])  echo "250 Hi $arguments" ;  done=1 ;;
    *)                 echo "503 Bad command"             ;;
    esac
done

s_idle=0 ; s_from=1 ; s_rcpt=2
state=$s_idle
while true ; do
    read command arguments
    command="$(echo "$command" | tr -d '\015')"
    arguments="$(echo "$arguments" | tr -d '\015')"
    case "$command" in
    [Mm][Aa][Ii][Ll])
        if [ 0 -eq $(( $state & $s_from )) ] ; then
            from=$(echo "$arguments" | sed -e 's/^ *[Ff][Rr][Oo][Mm] *: *//')
            state=$(( $state | $s_from ))
            echo "250 OK"
        else
            echo "503 Bad sequence of commands."
        fi
        ;;
    [Rr][Cc][Pp][Tt])
        if [ $s_from -eq $(( $state & ( $s_from | $s_rcpt ) )) ] ; then
            to=$(echo "$arguments" | sed -e 's/^ *[Tt][Oo] *: *//')
            state=$(( $state | $s_rcpt )) 
            echo "250 OK"
        else
            echo "503 Bad sequence of commands."
        fi
        ;;
    [Dd][Aa][Tt][Aa]) 
        if [ $(( $s_from | $s_rcpt )) -eq $(( $state & ( $s_from | $s_rcpt ) )) ] ; then 
            file="${mailboxes}/$(echo "$to" | sed -e 's/^ *< *//' -e 's/ *> *$/\1/' -e 's/@.*//')"
            echo "From $from `date '+%a %b %d %H:%M:%S %Y'`" >> "$file"
            echo "354 Enter mail, end with <CR><LF>.<CR><LF>"
            data=1
            while [ $data -eq 1 ] ; do
                read line 
                line="$(echo "$line" | tr -d '\015')"
                if [ "$line" = "." ] ; then
                    data=0
                    state=$s_idle
                    echo "" >> "$file"
                    echo "250 OK"
                else
                    echo "$line" >> "$file"
                fi
            done
        else
            echo "503 Bad sequence of commands."
        fi
        ;;
    [Nn][Oo][Oo][Pp]) echo "250 OK" ;;
    [Rr][Ss][Ee][Tt]) state=$s_idle ; echo "250 OK" ;;
    [Vv][Rr][Ff][Yy]) echo "252 Cannot VRFY." ;;
    [Qq][Uu][Ii][Tt]) echo "221 Bye" ; exit 0 ;;
    *)                echo "502 Command not implemented." ;;
    esac
done
#### smtpd.sh                         -- 2003-09-04 19:20:50 -- pascal   ####