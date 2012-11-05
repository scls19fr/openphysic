#lang planet neil/sicp

; Introduction à la programmation fonctionnelle par Scheme
; Jean-Jacques Girardot
; http://kiwi.emse.fr/LANG/
; version octobre 1993

(display "3.5 Structures de Controles\n")

(display "Suite de Fibonacci\n")
(define (fib n)
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (else (+ (fib (- n 1)) (fib (- n 2))))))

(fib 0)
(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 7)
(fib 8)

;(display "Fonction d'Ackerman\n")

(display "3.8 Un exemple complet\n")
; Introduction aux systèmes experts