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
        
        sched.add_cron_job(self.job_function, second="*/2", max_instances=6)
        #sched.add_cron_job(lambda: self.job_function(parameters), second="*/2", max_instances=6)
        
        # second="*/2" = la tache est lancee toutes les 2 secondes (en commencant a 0)
        
        # max_instances=6 car
        # job_function dure un peu plus de 10 secondes (si sleep est activee)
        # et est appelee toutes les 2 secondes (a cause de */2)
        # ceil((10 + epsilon) / 2) = 6

    # Schedule job_function to be called periodically
    def job_function(self):
        i = self.i
        # on recupere i localement pour eviter d'avoir
        # une valeur modifiee par un autre thread
        
        print "START Job {i:03d} @ {dt}".format(i=self.i, dt=datetime.utcnow())
        self.i += 1
        
        #time.sleep(10)
        
        print "  END Job {i:03d} @ {dt}".format(i=i, dt=datetime.utcnow())
        
tsk = MyScheduler()
tsk.run()
