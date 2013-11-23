#!/usr/bin/env python

class DigitPossible:
    def __init__(self, lst_digit_possible, i=None, flag_circular=True):
        self.lst_digit_possible = lst_digit_possible
        self.flag_circular = flag_circular
        
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

    def previous(self):
        self._i -= 1
        if self._i < 0:
            if self.flag_circular:
                self.__goto_stop()
            else:
                self._i = 0
            
    def __goto_stop(self):
        self._i = len(self.lst_digit_possible) - 1

    def __goto_start(self):
        self._i = 0

