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

    def test_08(self):
        d = DigitPossible(range(0,10))
        d.set(3)
        d.next(); d.next();
        self.assertEqual(d.get(), 5)
        print(d)
        
    def test_10(self):
        password = PasswordNDigits(4)
        #print("Password")
        password.next_value();
        password.next_digit()
        password.next_value(); password.next_value();
        password.next_digit()
        password.previous_value();
        password.next_digit()
        password.previous_value(); password.previous_value();
        #print(password)
        #print(password.get())
        self.assertEqual(password.get(), [1, 2, 9, 8])

    def test_11(self):
        password = PasswordNDigits(4)
        #print("Password")
        lst = [1, 2, 3, 4]
        password.set(lst)
        #print(password)
        print(password.get())
        password.next_value() # digit i is 0 (its value is 1 so next value is 2)
        password.next_digit()
        password.next_value(); password.next_value();
        self.assertEqual(password.get(), [2, 4, 3, 4])

    def test_12(self):
        password = PasswordNDigits(4, False) # disable cascade
        #print("Password")
        lst = [9, 3, 2, 1] # inverse this list to read
        password.set(lst)
        password.next_value()
        print(password)
        self.assertEqual(password.get(), [0, 3, 2, 1])

    def test_13(self):
        password = PasswordNDigits(4, True) # enable cascade
        # test cascade next
        #print("Password")
        lst = [1, 2, 3, 9]
        password.set(lst[::-1])
        password.next_value()
        print(password)
        self.assertEqual(password.get(), [1, 2, 4, 0][::-1])

    def test_14(self):
        password = PasswordNDigits(4, True) # enable cascade
        # test cascade next with 9999
        #print("Password")
        lst = [9, 9, 9, 9]
        password.set(lst[::-1])
        print(password)
        password.next_value()
        print(password)
        self.assertEqual(password.get(), [0, 0, 0, 0][::-1])

    def test_15(self):
        password = PasswordNDigits(4, True) # enable cascade
        # test cascade previous
        #print("Password")
        lst = [1, 2, 3, 0]
        password.set(lst[::-1])
        print(password)
        password.previous_value()
        print(password)
        self.assertEqual(password.get(), [1, 2, 2, 9][::-1])

    def test_16(self):
        password = PasswordNDigits(4, True) # enable cascade
        # test cascade previous with 0000
        lst = [0, 0, 0, 0]
        password.set(lst[::-1])
        print(password)
        password.previous_value()
        print(password)
        self.assertEqual(password.get(), [9, 9, 9, 9][::-1])


def main():
    unittest.main()

if __name__ == '__main__':
    main()