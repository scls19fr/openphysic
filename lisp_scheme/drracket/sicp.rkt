#lang planet neil/sicp
; http://racket-lang.org/
; http://www.neilvandyke.org/racket-sicp/

; Structure and Interpretation of Computer Programs
; http://mitpress.mit.edu/sicp/

(display "1.1 The Elements of Programming\n")

(display "1.1.1 Expressions\n")
486
(+ 137 349)
(- 1000 334)
(* 5 99)
(/ 10 5)
(/ 10 3)
(+ 2.7 10)
(+ 21 35 12 7)
(* 25 4 12)
(+ (* 3 5) (- 10 6))

(display "1.1.2 Naming and the Environment\n")
(define size 2)
(* 5 size)
(define pi 3.14159)
(* 2 pi)
(define radius 10)
(* pi (* radius radius))
(define circumference (* 2 pi radius))
circumference

(display "1.1.3 Evaluating Combinations\n")
(* (+ 2 (* 4 6))
   (+ 3 5 7))

(display "1.1.4 Compound Procedures\n")
(define (square x) (* x x))
(square 21)
(square (+ 2 5))
(square (square 3))
(define(sum-of-squares x y)
  (+ (square x) (square y)))
(sum-of-squares 3 4)

