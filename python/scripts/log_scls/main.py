#!/usr/bin/env python
# -*- coding: utf-8 -*-

from log import *

myLog = log(log.verbosity.max,"log.csv")
REP="TOTO"
myLog.write(log.level.message, 'création du répertoire "%(REP)s"' % {"REP": REP})
myLog.show()
myLog.close()
