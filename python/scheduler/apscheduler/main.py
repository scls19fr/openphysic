from apscheduler.scheduler import Scheduler
from datetime import datetime
import time

import logging
logging.basicConfig()

class MyScheduler():
    i = 0

    def __init__(self):
        pass
      
    def run(self):
        print "Start scheduler @ {dt}".format(dt=datetime.utcnow())

        # Start the scheduler
        sched = Scheduler(daemonic=False)
        sched.start()
        
        sched.add_cron_job(lambda: self.job_function(), second="*/2", max_instances=6)

    # Schedule job_function to be called every two hours
    def job_function(self):
        i = self.i
        print "START Job {i:03d} @ {dt}".format(i=self.i, dt=datetime.utcnow())
        self.i += 1
        
        #time.sleep(10)
        
        print "  END Job {i:03d} @ {dt}".format(i=i, dt=datetime.utcnow())
        
tsk = MyScheduler()
tsk.run()
