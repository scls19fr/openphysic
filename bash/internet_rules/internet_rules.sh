#!/bin/sh
#  ---------------------------------------
# | disable or enable internet connection |
# | S. CELLES                             |
#  ---------------------------------------


room=$2
if [ "$room" = "" ]; then room="32"; fi


time=$3
if [ "$time" = "" ]; then time="60"; fi


if_lan=eth0
if_ext=ppp0

case "$1" in

   start)
      #iptables -N bloque_ip

      #iptables -A FORWARD -i $if_lan -o $if_ext -j bloque_ip 
      #iptables -I FORWARD -i $if_lan -o $if_ext -j bloque_ip

      for ip in `cat internet_rules_room_$room.dat`
      do
         if [ $time != 0 ]; then
            echo "start internet connection for $ip for $time minutes"
         else
            echo "start internet connection for $ip"
         fi 
         #iptables -D bloque_ip -s $ip -j REJECT --reject-with net-unreach 
         iptables -D FORWARD -i $if_lan -o $if_ext -s $ip -j REJECT --reject-with net-unreach
      done
 
      if [ $time != 0 ]; then
         sleep "$time"m

         $0 stop $room 
      fi
      ;;	

    stop)
       for ip in `cat internet_rules_room_$room.dat`
       do
          echo "stop internet connection for $ip"
          #iptables -I bloque_ip -s $ip -j REJECT --reject-with net-unreach 
          # -A
          iptables -I FORWARD -i $if_lan -o $if_ext -s $ip -j REJECT --reject-with net-unreach 
       done
       ;;

    restart)
       $0 stop $room $time
       sleep 1
       $0 start $room $time
       ;;

    *) 
       echo "Usage: $0 start|stop|restart [room] [time]" >&2
       exit 1
       ;;

esac


exit 0

