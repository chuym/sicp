(define (last-pair items)
  (cond ((null? items) nil)
        ((null? (cdr items)) (cons (car items) '()))
        (else (last-pair (cdr items)))))
