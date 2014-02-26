; Given
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

; Exercise 2.4 - Define cdr
(define (cdr z)
  (z (lambda (p q) q)))

;; We have defined pairs as closures. Your mind should be going crazy right now.
; Test:
;
(define tlist (cons 1 (cons 2 (cons 3 '()))))
; =>
;
(car tlist)
; => 1
;
(car (cdr tlist))
; => 2
;
(cdr (cdr (cdr tlist)))
; => ()
;