; exercise 1.17
; extended to return a list of steps went through
(define (iter-expt b n)
  (if (= n 0)
    (list (list 1 0 b 0))
    (iter-expt-helper b 1 b (- n 1) (list))))
(define (iter-expt-helper a m b n acc)

  (define (next a2 m2 b2 n2)
    (iter-expt-helper a2 m2 b2 n2 (cons (list a m b n) acc)))

  (cond ((= n 0) (cons (list a m b n) acc))
        ((> n m) (next (square a) (* m 2) b (- n m)))
        (else (next (* a b) (+ m 1) b (- n 1)))))