(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items '()))
;; The above function returns a list of squares of the given list, but
;; in reverse order. This is because we are "consing up" the result, where
;; the first results will be the last in the list - when we cons a value, the
;; consed value will be at the beginning of the receiving list, since the iteration
;; ends when we have reached the last item in the list, it becomes the first
;; item in the result set.

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (itemr items '()))

;; The above doesn't work because we are consing a list to an atom, resulting in a
;; pair instead of a list. In order to fix it, we have to call append when adding
;; a new value to the answer, like so:

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer (cons (square (car things)) '())))))
  (iter items '()))
