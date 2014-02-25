(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

; Exercise 2.4
(define (cdr z)
  (z (lambda (p q) q)))