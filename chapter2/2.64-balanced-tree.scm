(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

;; partial-tree works by recursively splitting the list in two, we have the
;; the sublist left(1..n/2) and right(n/2 + 1..n), this-entry corresponds to
;; the middle element in the original list. Then the algorithm generates a tree
;; for the left and right sublists, and makes them branches of a new tree
;; having this-entry as an entry and having the subtrees as branches.
;;
;; This algorithm divides the problem in two steps and combinates them with cons
;; in constant time, thus the recurrence is defined as T(n) = 2T(n/2) + O(1), then
;; it has a time complexity of Theta(n) by the master theorem.
;;
;; The tree produced by list->tree for '(1 3 5 7 9 11) is
;;
;;          ____5___
;;          1__  __9__
;;            3  7   11