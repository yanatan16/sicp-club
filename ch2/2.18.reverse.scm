; 2.18 Reverse lists

; Recursive uses append to attach the item at our level (car list) onto the end of the list
; This is inefficient because
; A) iteration can be used, which we know is more efficient
; B) iteration uses cons (O(1)) instead of append (O(n))
(define (reverse-recur lst)
  (if (< (length lst) 2)
    lst
    (append (reverse-recur (cdr lst)) (list (car lst)))))

; Iteration is nicer because we simply cons our current value to the beginning of the list
; and pass that list down as our accumulator/state
(define (reverse-iter lst)

  ; implementation with accumulator `revd`
  (define (reverse-iter-impl orig revd)
    (if (= (length orig) 0)
      revd
      (reverse-iter-impl (cdr orig) (cons (car orig) revd))))

  ; Call our defined function with an empty accumulator
  (reverse-iter-impl lst (list)))

; Test with
;
(reverse-recur (list 1 2 3))
; => (3 2 1)

(reverse-iter (list 1 2 3))
; => (3 2 1)