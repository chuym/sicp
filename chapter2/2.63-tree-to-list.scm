(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right) (list entry left right))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))


;; Both procedures produce the same result for every tree.
;; tree->list-1 produces a recursive process, assuming the tree
;; is balanced, in each step the problem divided in 2 subproblems
;; of n/2 size, thus running in Theta(nlgn) time.

;; tree->list-2 produces an iterative process, and similarl than
;; tree->list-1, it divides the problem in 2 subproblems with each step
;; of n/2 size, the difference is that in tree->list-2, we are using cons
;; to construct the list instead append, then the complexity for
;; tree->list-2 is Theta(n)