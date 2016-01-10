;; The element-of-set? procedure is identical for the non-repeated
;; set. Both run on Theta(n) time.
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

;; Adjoin set runs in O(1) time. That is because, we allow duplicates,
;; we don't need to check if x is an element of set.
(define (adjoin-set x set)
  (cons x set))

;; Union set is also faster. We use the built-in procedure to append
;; lists.
(define (union-set set1 set2)
  (append set1 set2))

;; Intersection set here will be the same, we need to make sure that
;; (car set1) is in set2 before appending to the resulting list.
(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))
  
;; Sets with duplicates are useful when we want to represent phenomena
;; where duplicated events may occur, i.e. flipping a coin, names of people.
;; Also it is useful when we want to optimize writing and duplicated data is a
;; non issue and space is a non-issue as well. We see that writes are much faster
;; at O(1) for both adjoin-set and union-set for duplicated sets, whereas
;; it's Theta(n) and Theta(n^2) for non-dupes one.