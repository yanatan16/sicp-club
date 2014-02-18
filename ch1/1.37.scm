; 1.37 continued fractions
; Approximate golden ratio using (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) k)
; Accurate to 4 places at about 15 iterations
(define (cont-frac n d k)
  (define (helper i)
    (if (= k i)
      (d i)
      (/ (n i)
        (+ (d i) (helper (+ i 1))))))
  (helper 1))

; Part b - iterative cont-frac
(define (cont-frac-iter n d k)
  (define (helper a i)
    (if (= i 0)
      a
      (helper (/ (n i) (+ (d i) a)) (- i 1))))
  (helper 0 k))
