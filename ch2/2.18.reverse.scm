(define (reverse-recur lst)
  (if (< (length lst) 2)
    lst
    (append (reverse-recur (cdr lst)) (list (car lst)))))

(define (reverse-iter lst)
  (define (rreverse rlist racc)
    (if (= (length rlist) 0)
      racc
      (rreverse (cdr rlist) (cons (car rlist) racc))))
  (rreverse lst (list)))