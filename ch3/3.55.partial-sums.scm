; 3.55
; Define partial-sums
; such that (partial-sums integers) gives 1, 3, 6, 10, 15
(define (partial-sums stream)
  (let ((first (stream-car stream)))
    (cons-stream
      first
      (stream-map (lambda (x) (+ x first)) (partial-sums (stream-cdr stream))))))

(define (partial-sums-implicit stream)
  (define sum-stream
    (cons-stream
      (stream-car stream)
      (add-streams sum-stream (stream-cdr stream))))
  sum-stream)

; Givens
(define (add-streams . args)
  (cons-stream (apply + (map stream-car args))
               (apply add-streams (map stream-cdr args))))
(define ones (cons-stream 1 ones))
(define integers (cons-stream 1 (add-streams ones integers)))
(define (take stream n)
  (if (> n 0)
      (cons (stream-car stream) (take (stream-cdr stream) (- n 1)))
      '()))

; Testing
(equal?
  (take (partial-sums integers) 5)
  '(1 3 6 10 15))
(equal?
  (take (partial-sums-implicit integers) 5)
  '(1 3 6 10 15))