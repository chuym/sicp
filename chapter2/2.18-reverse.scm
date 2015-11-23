(define (reverse items)
  (define (iter things result)
    (if (null? things)
        result
        (iter (cdr things) (cons (car things) result))))
  (iter items '()))
