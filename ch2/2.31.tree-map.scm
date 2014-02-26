; 2.31 tree-map
; Use the scale-tree method in 2.2.2 as a basis
; and use standard map function
(define (tree-map f tree)
  (map
    (lambda (item)
      (if (list? item)
        (tree-map f item)
        (f item)))
    tree))

; Test with:
;
(tree-map (lambda (x) (+ x 1)) (list (list 1 2 3) (list 1 2) (list 1)))
; => ((2 3 4) (2 3) (2))
