; 3.78
; solve-2nd
; Solve a second order linear differential equation
(define (solve-2nd a b dt y0 dy0)
  (define y (integral (delay dy) y0 dt))
  (define dy (integral (delay ddy) dy0 dt))
  (define ddy (add-streams (scale-stream y a) (scale-stream dy b)))
  ddy)

;; Givens
(define (integral delayed-integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (let ((integrand (force delayed-integrand)))
                   (add-streams (scale-stream integrand dt)
                                int))))
  int)
(define (take stream n)
  (if (> n 0)
      (cons (stream-car stream) (take (stream-cdr stream) (- n 1)))
      '()))
(define (scale-stream stream factor)
  (stream-map (lambda (x) (* x factor)) stream))
(define (add-streams . args)
  (cons-stream (apply + (map stream-car args))
               (apply add-streams (map stream-cdr args))))

;; Testing
(solve-2nd 1 0 0.01 1 1)