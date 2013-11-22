#!/sur/bin/env python

from apscheduler.scheduler import Scheduler
import thread

import argparse

from datetime import datetime, timedelta
import time

import logging
logging.basicConfig()

class MyScheduler():
    i = 0

    def __init__(self):
        print "Start scheduler @ {dt}".format(dt=datetime.utcnow())
        print ""
    
    # Schedule job_function to be called periodically
    def job_function(self, td_loop=None):
        dt_now = datetime.utcnow()
        dt_start = dt_now
        i = self.i
        # on recupere i localement pour eviter d'avoir
        # une valeur modifiee par un autre thread
        
        print "START Job {i:03d} @ {dt}".format(i=i, dt=dt_start)
        self.i += 1
        if td_loop is not None:
            dt_next = dt_start+td_loop
            print "      Job {i:03d} - next job ({i2:03d}) @ {dt_next}".format(i=i, i2=i+1, dt_next=dt_next)
        
        #time.sleep(10)
        
        dt_now = datetime.utcnow()
        print "  END Job {i:03d} @ {dt_now} (was started @ {dt_start})".format(i=i, dt_now=dt_now, dt_start=dt_start)
        print ""
        
if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Use the following parameters')
    #parser.add_argument('--loopMinutes', action="store", help="use this flag to run program in an infinite loop (LOOP parameters is pause in minutes)")
    parser.add_argument('--loopSeconds', action="store", help="use this flag to run program in an infinite loop (LOOP parameters is pause in seconds)")
    parser.add_argument('--run_at_startup', action="store_true", help="use this flag to run program at startup")
    args = parser.parse_args()
    
    tsk = MyScheduler()

    #if args.loopMinutes is None or args.loopMinutes=='':
    if args.loopSeconds is None or args.loopSeconds=='':
        tsk.job_function()
    else:
        seconds = int(args.loopSeconds)
        td_loop = timedelta(seconds=seconds)

        #minutes = int(args.loopMinutes)
        #td_loop = timedelta(minutes=minutes)

        if args.run_at_startup:
            thread.start_new_thread(tsk.job_function, ()) # demarre une fois au debut (si necessaire)
        
        # Start the scheduler
        sched = Scheduler(daemonic=False)
        #sched = Scheduler()
        sched.start()
                
        #sched.add_cron_job(lambda: tsk.job_function(parameters), second="*/2", max_instances=6)
        sched.add_cron_job(lambda: tsk.job_function(td_loop), second="*/%d" % seconds, max_instances=6)
        #sched.add_cron_job(tsk.job_function, second="*/%d" % seconds, max_instances=6)
        #sched.add_cron_job(tsk.job_function, minute="*/%d" % minutes, max_instances=6)

        # second="*/2" = la tache est lancee toutes les 2 secondes (en commencant a 0)
                
        # max_instances=6 car
        # job_function dure un peu plus de 10 secondes (si sleep est activee)
        # et est appelee toutes les 2 secondes (a cause de */2)
        # ceil((10 + epsilon) / 2) = 6
        
        #while True:
        #    pass
