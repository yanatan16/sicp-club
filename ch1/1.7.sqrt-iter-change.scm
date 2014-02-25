
; Old sqrt iter
(define (sqrt-iter-old guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter-old (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

; Old good enough?
(define (good-enough?-old guess x)
  (close-enough? (square guess) x 0.001))

; | a - b | < precision
(define (close-enough? a b precision)
  (< (abs (- a b)) precision))

; New good enough?
; Takes two guesses and returns true if
; guess1 is close to guess2 relative to guess1
(define (good-enough?-new guess1 guess2)
  (close-enough? guess1 guess2 (* 0.001 guess1)))

(define (sqrt-iter-new guess last-guess x)
  (if (good-enough? guess last-guess)
      guess
      (sqrt-iter-new (improve guess x)
                     guess
                     x)))

(define (sqrt-new x) (sqrt-iter 1.0 x x))