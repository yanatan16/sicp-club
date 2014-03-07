; Exercise 3.16
; Given a bad `count-pairs`, give lists that totally f-up it

; Given
(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))
(define nil '())

; Make (count-pairs x) return 3 using only 3 pairs
; We use `cons` to explicitly ensure only 3 pairs
(define cp3 (cons 1 (cons 2 (cons 3 nil))))
(count-pairs cp3)
; => 3

; Now 4
(define pair (cons 3 nil))
(define cp4 (cons 1 (cons pair pair)))
(count-pairs cp4)
; => 4

; Now 7
(define p3 (cons 3 nil))
(define p2 (cons p3 p3))
(define cp7 (cons p2 p2))
(count-pairs cp7)
; => 7

; Now never return
(define cpinf (cons 1 (cons 2 (cons 3 nil))))
(set-cdr! (cdr (cdr cpinf)) cpinf) ; infinite loop
(count-pairs cpinf) ; commented out for safety
; => ;Aborting!: maximum recursion depth exceeded

; Exercise 3.17
; Fix count-pairs so it works.
; Keep a list of visited pairs so we don't recount
(define (count-pairs-new val)

  ; check to see if a pair has already been counted before counting
  (define (check-count x)
    (cond ((not (pair? x)) 0) ; not a pair
          ((counted? x) 0) ; already counted
          (else
             (begin (record-count x) ; record that we are counting it
                    (actual-count x))))) ; actually count it

  ; actually count a pair
  (define (actual-count p)
    (+ (check-count (car p))
       (check-count (cdr p))
       1))

  ; Now we create the counted? and record-count methods using simple lists
  (define counted-pairs (list nil)) ; we use nil as a placeholder to make sure we dont have a nil list
  (define (record-count p)
    (append! counted-pairs (list p)))
  (define (counted? p)
    (not (false? (member p counted-pairs))))

  ; And now we count pairs
  (check-count val))

; TEST
(count-pairs-new cp3)
; => 3
(count-pairs-new cp4)
; => 3
(count-pairs-new cp7)
; => 3
(count-pairs-new cpinf)
; => 3