#lang racket

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) x)) 0.001))

(define (square x)
  (* x x))

( define (sqrrt x)
   (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  ( if (good-enough? guess x)
       guess
       (sqrt-iter (improve guess x)
                  x)))

(sqrrt 2) ; very long... (infinite loop?)