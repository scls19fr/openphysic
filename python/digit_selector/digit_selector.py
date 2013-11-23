#!/usr/bin/env python

class DigitPossible:
    def __init__(self, lst_digit_possible, i=None, flag_circular=True,
            on_overflow_start=None, on_overflow_stop=None):
        
        self.lst_digit_possible = lst_digit_possible
        self.flag_circular = flag_circular
        
        self.on_overflow_start = on_overflow_start
        self.on_overflow_stop = on_overflow_stop
        
        if i is None:
            self._i = 0
        else:
            self._i = i
    
    def __repr__(self):
        return('lst_digit_possible='
            + str(self.lst_digit_possible)
            + ' ' + 'i=' + str(self._i))
        
    def next(self):
        self._i += 1
        if self._i > len(self.lst_digit_possible) - 1:
            if self.flag_circular:
                self.__goto_start()
            else:
                self._i = len(self.lst_digit_possible) - 1
            if self.on_overflow_stop is not None:
                self.on_overflow_stop()

    def previous(self):
        self._i -= 1
        if self._i < 0:
            if self.flag_circular:
                self.__goto_stop()
            else:
                self._i = 0
            if self.on_overflow_start is not None:
                self.on_overflow_start()
            
    def __goto_stop(self):
        self._i = len(self.lst_digit_possible) - 1

    def __goto_start(self):
        self._i = 0

