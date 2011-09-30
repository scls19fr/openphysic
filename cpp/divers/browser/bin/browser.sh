#! /bin/sh
# /etc/init.d/browser.sh: start / stop browser
#
# Sebastien Celles <s.celles@gmail.com>
# $Id: browser.init.d,v 0.1 2008/08/18 17:15:00 $
#

### BEGIN INIT INFO
# Provides: browser
# Required-Start: 
# Required-Stop: 
# Default-Start:
# Default-Stop:
# Short-Description: Browser for dynamic display
# Description:
#   This app lauch a dynamic display to that show webpages on a big
#   screen. For more information about it check the following site
#   http://www.celles.net/wiki/Browser
### END INIT INFO

usage()
{
	log_success_msg "Usage: `basename $0` {start|stop|restart|reload|force-reload}"
	#log_success_msg "Usage: /etc/init.d/browser {start|stop|restart|reload|force-reload}"
	exit 1
}

PATH=/sbin:/bin:/usr/sbin:/usr/bin
NAME=browser #browser_run_no_close.sh #browser #daemonexecutablename
DAEMON=/home/scls/openphysic/cpp/divers/browser/bin/${NAME} # /usr/sbin/${NAME}
PIDFILE=/var/run/${NAME}.pid
OPTIONS=""
DESC="Browser for dynamic display (${NAME})"
#SCRIPTNAME=/etc/init.d/$NAME

test -x $DAEMON || exit 0

. /lib/lsb/init-functions

case "$1" in
  start)
	#log_warning_msg "Not starting Browser"
	log_begin_msg "Starting ${DESC}..."
	#start-stop-daemon --start --quiet --oknodo --pidfile $PIDFILE --name browser $SSD_ARG -- $CONFIG_FILE >/dev/null 2>&1 || log_end_msg 1
	#start-stop-daemon --start --quiet --oknodo --pidfile $PIDFILE --name browser >/dev/null 2>&1 || log_end_msg 1
        #start-stop-daemon --start --quiet --oknodo ---pidfile $PIDFILE --name browser -- start $OPTIONS
	start-stop-daemon --start --background --make-pidfile --pidfile $PIDFILE --quiet --exec $DAEMON -- start $OPTIONS
	#pidof $NAME > $PIDFILE # use start-stop-daemon with --make-pidfile --pidfile $PIDFILE instead
	log_end_msg $?
  ;;
  stop)
	log_begin_msg "Stopping ${DESC}..."
	#start-stop-daemon --stop  --quiet --oknodo --pidfile $PIDFILE --name browser $SSD_ARG --retry 30 >/dev/null 2>&1
	#start-stop-daemon --stop --oknodo --quiet --exec $DAEMON -- stop
	start-stop-daemon --stop --quiet --exec $DAEMON -- stop
	log_end_msg $? # $?=0
	rm -f $PIDFILE
  ;;
  reload)
	log_warning_msg "Reloading ${DESC} configuration not yet implemented. Restarting daemon."
	$0 restart
	#
	# If the daemon can reload its configuration without
	# restarting (for example, when it is sent a SIGHUP),
	# then implement that here.
	#
	#start-stop-daemon --stop --signal 1 --quiet --pidfile $PIDFILE --name $NAME
	#return 0
	#log_begin_msg "Reloading ${DESC} configuration..."
	#start-stop-daemon --stop --signal USR1 --quiet --pidfile \
	#	$PIDFILE --name gdm $SSD_ARG >/dev/null 2>&1
	#log_end_msg 0
  ;;

  restart|force-reload)
	$0 stop || true
	#sleep 2
	$0 start
  ;;
  *)
	usage
  ;;
esac

exit 0

# Références ayants servies à la création de ce script
#  http://www.debian.org/doc/debian-policy/ch-opersys.html#s-sysvinit
#  /etc/init.d/gdm
#  /etc/init.d/aiccu
#  /etc/init.d/skeleton
#  man start-stop-daemon

