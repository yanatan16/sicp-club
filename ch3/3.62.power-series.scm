; 3.62
; Working with Power Series (or Taylor Sums if you prefer)

; integrate-series
; Integrate a power series by integrating each term
; 1 + x + x^2 ... becomes c + x + 1/2x^2 + 1/3x^3
(define (integrate-series series)
  (div-streams series integers))
(define (integrate-series-constant constant series)
  (cons-stream constant (integrate-series series)))

; Givens
(define (add-streams . args)
  (cons-stream (apply + (map stream-car args))
               (apply add-streams (map stream-cdr args))))
(define (div-streams numer-stream denom-stream)
  (cons-stream (/ (stream-car numer-stream) (stream-car denom-stream))
               (div-streams (stream-cdr numer-stream) (stream-cdr denom-stream))))
(define ones (cons-stream 1 ones))
(define integers (cons-stream 1 (add-streams ones integers)))
(define (take stream n)
  (if (> n 0)
      (cons (stream-car stream) (take (stream-cdr stream) (- n 1)))
      '()))



; Part b
; Implicit power series using integrate-series
(define exp-series
  (cons-stream 1 (integrate-series exp-series)))

(define cos-series
  (cons-stream
    1 ;cos(0) = 1
    (integrate-series (stream-map - sin-series)))) ; integral of -sin is cos
(define sin-series
  (cons-stream
    0 ;sin(0) = 0
    (integrate-series cos-series))) ; integral of cos is sin

; Testing
(define ones-series ones)
(define incr-series integers)

(equal? (take (integrate-series-constant 1 ones-series) 5)
        (list 1 1 (/ 1 2) (/ 1 3) (/ 1 4)))
(equal? (take (integrate-series-constant 1 incr-series) 5)
        (take ones-series 5))

(equal? (take exp-series 5)
        (list 1 1 (/ 1 2) (/ 1 6) (/ 1 24)))
(equal? (take cos-series 5)
        (list 1 0 (- (/ 1 2)) 0 (/ 1 24)))
(equal? (take sin-series 5)
        (list 0 1 0 (- (/ 1 6)) 0))