(define (pascal row)
  (define (reduce-row row)
    (if (or (null? row) (null? (cdr row)))
        row
        (cons
         (+ (car row) (car (cdr row)))
         (reduce-row (cdr row)))))

  (cond ((= row 1) '(1))
        ((= row 2) '(1 1))
        (else (cons 1 (reduce-row (pascal (- row 1)))))))
               
