import logging
log = logging.getLogger("MyModule")

def doIt():
    log.debug("doin' stuff")
    #do stuff...but suppose an error occurs?
    raise TypeError, "bogus type error for testing"
