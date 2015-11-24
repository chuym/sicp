(define (fringe tree)
  (cond ((null? tree) '())
        ((list? tree) (append (fringe (car tree)) (fringe (cdr tree))))
        (else (cons tree '()))))

(define x '((1 2) (3 4)))
