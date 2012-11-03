#lang planet neil/sicp

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

( define (sqrrt x)
   (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  ( if (good-enough? guess x)
       guess
       (sqrt-iter (improve guess x)
                  x)))

(sqrrt 2)