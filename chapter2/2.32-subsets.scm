(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(define testcase '(1 2 3))

(subsets testcase)
;; (() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
;; This works because with each iteration of the recursion, we are constructing
;; new sets with the head items along with all the subsets of the remainder of the
;; set.
