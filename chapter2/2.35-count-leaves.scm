(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (fringe tree)
  (cond ((null? tree) '())
        ((list? tree) (append (fringe (car tree)) (fringe (cdr tree))))
        (else (cons tree '()))))

(define (count-leaves t)
  (accumulate (lambda (x y) (+ 1 y))
              0
              (map (lambda (x) x) (fringe t))))