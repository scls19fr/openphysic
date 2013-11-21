from apscheduler.scheduler import Scheduler
from datetime import datetime

import logging
logging.basicConfig()

class MyScheduler():
    def __init__(self):
        self.i = 0
        
    def run(self):
        print "Start scheduler @ {dt}".format(dt=datetime.utcnow())

        # Start the scheduler
        sched = Scheduler(daemonic=False)
        sched.start()
        
        sched.add_cron_job(lambda: self.job_function(), second="*/2")

    # Schedule job_function to be called every two hours
    def job_function(self):
        print "Job {i} {dt}".format(i=self.i, dt=datetime.utcnow())
        self.i += 1

tsk = MyScheduler()
tsk.run()
