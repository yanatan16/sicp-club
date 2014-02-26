; Now 2.37
; Fill in matrix operations

; Given
(define (dot-product v w)
  (accumulate + 0 (map * v w)))

; Fill-in
(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))

; From exercise 2.36
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

; My interpreter doesn't define these two
(define nil '())
(define accumulate fold-right)

;; Testing
;
(define m1 (list (list 1 2 3) (list 4 5 6))) ;3x2
(define v1 (list 1 4 9)) ;3x1
(define m2 (list (list 9 8) (list 7 6) (list 5 4))) ; 2x3

(dot-product v1 v1)
; => 98

(matrix-*-vector m1 v1)
; => (36 78)

(transpose m2)
; => ((9 7 5) (8 6 4))

(matrix-*-matrix m1 m2)
; => ((38 32) (101 86))