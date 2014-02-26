; 2.79 Install equ? in the generic operations package
; 2.80 Install =zero? in the generic operations package
; Theres so much code that we don't have yet to run this stuff so no testing here.

; *** apply-generic ***
(define (equ? x y) (apply-generic 'equ? x y))
(define (=zero? x) (apply-generic '=zero? x))

; Scheme Number

  ; *** Regular scheme number ***
  (put 'equ? '(scheme-number scheme-number)
    (lambda (x y) (= x y)))
  (put '=zero? 'scheme-number
    (lambda (x) (= x 0)))
  ; *** ***

; Rationals

  ; *** Rational Internals ***
  (define (eq-rat? x y)
    (and (= (numer x) (numer y)) (= (denom x) (denom y))))
  (define (=zero-rat? x)
    (= (numer x) 0))
  ; *** ***

  ; *** Rational exposed ***
  (put 'equ? '(rational rational) eq-rat?)
  (put '=zero? 'rational =zero-rat?)
  ; *** ***
