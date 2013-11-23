#!/usr/bin/env python

import unittest

from digit_selector import *


def callback_on_overflow_start():
    print("Overflow start detected")

def callback_on_overflow_stop():
    print("Overflow stop detected")
            
class DisabledTests(object):
    def test_01(self):
        pass

class OrderbookTests(unittest.TestCase):
    def setUp(self):
        #note, setUp is run before each test.
        pass

    def test_00(self):
        d = DigitPossible(range(0,10))
        d.next()
        d.next()
        print(d)
        self.assertEqual(d._i, 2)

    def test_01(self):
        d = DigitPossible(range(0,10))
        d.next(); d.next(); d.next(); d.next(); d.next();
        d.next(); d.next(); d.next(); d.next(); d.next();
        d.next();
        print(d)
        self.assertEqual(d._i, 1)

    def test_02(self):
        d = DigitPossible(range(0,10))
        d.previous(); d.previous();
        print(d)
        self.assertEqual(d._i, 8)

    def test_03(self):
        d = DigitPossible(range(0,10), 0, False)
        d.previous(); d.previous();
        print(d)
        self.assertEqual(d._i, 0)

    def test_04(self):
        d = DigitPossible(range(0,10), 9, False)
        d.next()
        print(d)
        self.assertEqual(d._i, 9)

    def test_05(self):
        d = DigitPossible(range(0,10), 9, True, callback_on_overflow_start, callback_on_overflow_stop)
        d.next()
        print(d)
        self.assertEqual(d._i, 0)

    def test_06(self):
        d = DigitPossible(range(0,10), 0, True, callback_on_overflow_start, callback_on_overflow_stop)
        d.previous()
        print(d)
        self.assertEqual(d._i, 9)

    def test_07(self):
        d = DigitPossible(range(0,10))
        d.next();
        print(d)
        self.assertEqual(d.get(), 1)
        
    def test_10(self):
        password = PasswordNDigits(4)
        print("Password")
        password.next_value();
        password.next_digit()
        password.next_value(); password.next_value();
        password.next_digit()
        password.previous_value();
        password.next_digit()
        password.previous_value(); password.previous_value();
        print(password)
        print(password.get())
        self.assertEqual(password.get(), [1, 2, 9, 8])
        
    """ToDo:
    version password avec "cascade" du débordement
         0 0 0[9] + next_value     ->  0 0 1[0]
         0 0 1[0] + previous_value ->  0 0 0[9]
         9 9 9[9] + next_value     ->  0 0 0[0]
         0 0 0[0] + previous_value ->  9 9 9[9]
         
    generation [1, 2, 2.5, 5, 10, 25, 50...]
    digit -2 (0.01) à 3 (1000)
    """

def main():
    unittest.main()

if __name__ == '__main__':
    main()