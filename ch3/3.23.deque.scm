; Exerces 3.23 deques

; A deque is represented using a doubly-linked list

; Here is a doubly-linked list. Each element is represented as two pairs
; A pair of the value and a pointer to a pair of previous and next pointers
; Note that doubly-linked lists are unprintable and should be converted to lists before printing

;; Doubly-linked list
(define (dl-make-item x prev next)
  (cons x (cons prev next)))
(define (dl-prev item)
  (car (cdr item)))
(define (dl-next item)
  (cdr (cdr item)))
(define (dl-element item)
  (car item))
(define dl-empty? null?)

;; Doubly-linked list assignment operators
(define (dl-set-prev! item prev)
  (set-car! (cdr item) prev))
(define (dl-set-next! item next)
  (set-cdr! (cdr item) next))

; A deque is like a queue, but uses the doubly-linked list instead of a basic list
(define (make-deque) (cons '() '()))
(define (deque-front dq) (car dq))
(define (deque-back dq) (cdr dq))
(define (deque-empty? dq) (dl-empty? (deque-front dq)))
(define (deque-set-front! dq front) (set-car! dq front))
(define (deque-set-back! dq back) (set-cdr! dq back))

; Real operations
; Inserts create the item and insert it into a nil or not-nil deque
; Make sure to return 'ok becaues doubly linked lists are unprintable
(define (deque-insert-front! dq el)
  (let ((item (dl-make-item el nil (deque-front dq))))
    (cond ((deque-empty? dq)
            (begin (deque-set-front! dq item)
                   (deque-set-back! dq item)
                   'ok))
          (else
            (begin (dl-set-prev! (deque-front dq) item)
                   (deque-set-front! dq item)
                   'ok)))))

(define (deque-insert-back! dq el)
  (let ((item (dl-make-item el (deque-back dq) nil)))
    (cond ((deque-empty? dq)
            (make-deque1 item))
          (else
            (begin (dl-set-next! (deque-back dq) item)
                   (deque-set-back! dq item)
                   'ok)))))

;; Peeking is easy. We check for errors just in case
(define (deque-peek-front dq)
  (if (deque-empty? dq)
      (error "cannot peek at empty deque")
      (dl-element (deque-front dq))))

(define (deque-peek-back dq)
  (if (deque-empty? dq)
      (error "cannot peek at empty deque")
      (dl-element (deque-back dq))))

;; Deletion must check to see if there is 0 1 or >1 elements and do different things
(define (deque-delete-front! dq)
  (if (deque-empty? dq)
      (error "cannot delete from empty deque")
      (let ((new-front (dl-next (deque-front dq))))
        (if (dl-empty? new-front)
            (begin (deque-set-front! dq nil)
                   (deque-set-back! dq nil)
                   'ok)
            (begin (dl-set-prev! new-front nil)
                   (deque-set-front! dq new-front)
                   'ok)))))

(define (deque-delete-back! dq)
  (if (deque-empty? dq)
      (error "cannot delete from empty deque")
      (let ((new-back (dl-prev (deque-back dq))))
        (if (dl-empty? new-back)
            (begin (deque-set-front! dq nil)
                   (deque-set-back! dq nil)
                   'ok)
            (begin (dl-set-next! new-back nil)
                   (deque-set-back! dq new-back)
                   'ok)))))

;; A helper for deque-to-list. fold-lefts are just as easy
(define (deque-fold-right f start dq)
  (define (helper acc dl)
    (if (dl-empty? dl)
        acc
        (helper (f (dl-element dl) acc) (dl-prev dl))))
  (helper start (deque-back dq)))

;; We use this procedure to print deques
;; A simple iterative fold-right cons accumulation on the doubly-linked list
(define (deque-to-list dq) (deque-fold-right cons '() dq))

;; Givens
(define nil '())

;; Testing
; Test helper
(define (assert name val exp)
  (display name)
  (if (equal? val exp)
      (list 'pass name)
      (list 'FAIL name val exp)))

;; Run tests
(define d1 (make-deque))
(deque-insert-front! d1 1)
(deque-insert-front! d1 2)
(deque-insert-back! d1 3)
(assert 'peek (deque-peek-front d1) 2)
(assert 'list (deque-to-list d1) (list 2 1 3))
(deque-delete-back! d1)
(assert 'peekback (deque-peek-back d1) 1)