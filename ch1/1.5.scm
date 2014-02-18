; Exercise 1.5

; Applicative Order vs Normal Order Evaluation
; Will they always produce the same results?
No

; If not, what conditions can you place in order to guarentee they do?
No infinite loops. No side effects.

; In ex1.5
(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

(test 0 (p))

; Normal order will expand all operands, and will go in an infinite loop expanding (p)
; Applicative order (lazy) will never expand (p) because (= x 0) is true, thus y is never expanded to (p)


