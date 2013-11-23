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
            + ' ' + 'i=' + str(self._i)
            + ' ' + 'value=' + str(self.get())
        )
        
    def next(self):
        self._i += 1
        if self._i > len(self.lst_digit_possible) - 1:
            if self.flag_circular:
                self.__goto_start()
            else:
                self._i = len(self.lst_digit_possible) - 1
            if callable(self.on_overflow_stop):
                self.on_overflow_stop()

    def previous(self):
        self._i -= 1
        if self._i < 0:
            if self.flag_circular:
                self.__goto_stop()
            else:
                self._i = 0
            if callable(self.on_overflow_start):
                self.on_overflow_start()

    def get(self):
        return(self.lst_digit_possible[self._i])
            
    def __goto_stop(self):
        self._i = len(self.lst_digit_possible) - 1

    def __goto_start(self):
        self._i = 0


class PasswordNDigits():
    def __init__(self, N):
        self.N = N
        rng = range(0, self.N)
        
        self.i = DigitPossible(rng, 0)

        self.d = [DigitPossible(range(0,10), 0) for i in rng]
        
    def next_digit(self):
        self.i.next()

    def previous_digit(self):
        self.i.previous()

    def next_value(self):
        self.d[self.i.get()].next()

    def previous_value(self):
        self.d[self.i.get()].previous()
    
    def __repr__(self):
        #return('digits=' + str(self.d)
        #    + '\n' + 'selected_digit=' + str(self.i.get())
        #)
        s = ''
        for i in range(self.N-1, -1, -1):
            val = str(self.d[i].get())
            if self.i.get() == i:
                s += '[' + val + ']'        
            else:
                s += ' ' + val + ' '
        return(s)
        
    def get(self):
        return(self.d)
        #return(map(self.d.apply, lambda digit: digit.get())
        