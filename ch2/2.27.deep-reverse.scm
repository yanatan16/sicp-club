; Now 2.27
; Deep reverse reverses a list and all its sublists
(define (deep-reverse x)

  ; Reverse a list using an iterative method
  (define (reverse-iter orig revd)
    (if (= (length orig) 0)
      revd
      (reverse-iter (cdr orig) (cons (ensure-reversed (car orig)) revd))))

  ; Take an arbitrary item and reverse it if its a list
  (define (ensure-reversed item)
    (if (list? item) (reverse-iter item (list)) item))

  (ensure-reversed x))

; Testing:
(deep-reverse 1)
; => 1
;
(deep-reverse (list 1 2 3))
; => (3 2 1)
;
(deep-reverse (list 1 2 (list 1 2 3)))
; => ((3 2 1) 2 1)