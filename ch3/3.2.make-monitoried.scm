; Exercise 3.2
; (make-monitored f) ;f is of 1 parameter
; returns a function which acts the same as f except
; when called with a symbol 'how-many-calls will return how many times f was called.

(define (make-monitored f)
  (let ((cnt 0))
    (lambda (x)
      (if (equal? x 'how-many-calls)
          cnt
          (begin (set! cnt (+ cnt 1))
                 (f x))))))

; TEST
(define (square x) (* x x))
(define mon-square (make-monitored square))

(mon-square 5)
; => 25
(mon-square 1)
; => 1
(mon-square 'how-many-calls)
; => 2
(mon-square 'how-many-calls);
; => 2

; This naive fibonacci number calculator
; also returns the number of times it called itself
(define (naive-fib-callcnt n)
  (define mon-naive-fib
    (make-monitored
      (lambda (n)
        (if (< n 3) 1 (+ (mon-naive-fib (- n 1)) (mon-naive-fib (- n 2)))))))
  (define ret (mon-naive-fib n))
  (define cnt (mon-naive-fib 'how-many-calls))
  (cons ret cnt))

(naive-fib-callcnt 3)
; => (2 . 3)
(naive-fib-callcnt 6)
; => (8 . 15)
(naive-fib-callcnt 9)
; => (34 . 67) ; and this is what we call exponential growth