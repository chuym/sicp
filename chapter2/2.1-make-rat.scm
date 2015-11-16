(define (make-rat n d)
  (cond ((and (< n 0) (< d 0)) (cons (abs n) (abs d)))
        ((< d 0) (cons (- n) (abs d)))
        (else (cons n d))))
