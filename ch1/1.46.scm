; 1.46
(define (iterative-improve good-enough? improve)
  (define (iterate guess)
    (if (good-enough? guess) guess (iterate (improve guess))))
  iterate)

; helpers
(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))
(define precision 0.0001)
(define (close? x y) (< (abs (- x y)) precision))

; sqrt in terms of iterative-improve
(define (sqrt x)

  (define (sqrt-good-enough? guess) (close? x (square guess)))
  (define (sqrt-improve guess) (average guess (/ x guess)))

  (define sqrt-iterate (iterative-improve sqrt-good-enough? sqrt-improve))

  (sqrt-iterate 1.0))

; fixed-point in terms of iterative-improve
(define (fixed-point f first-guess)

  (define (fp-good-enough? guess) (close? guess (f guess)))

  ((iterative-improve fp-good-enough? f) first-guess))

; test with (close? (fixed-point cos 1.0) 0.7390823)


(define (fp-sqrt x)
  (define (fp-sqrt-f y) (average y (/ x y)))
  (fixed-point fp-sqrt-f 1.0))
; test with (close? (fp-sqrt 100) 10)