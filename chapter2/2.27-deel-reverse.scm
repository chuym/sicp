(define (reverse items)
  (define (iter things result)
    (if (null? things)
        result
        (iter (cdr things) (cons (car things) result))))
  (iter items '()))

(define (deep-reverse items)
  (define (iter things result)
    (cond ((null? things) result)
          ((list? (car things)) (iter (cdr things)
                                      (cons (reverse (car things)) result)))
          (else (iter (cdr things) (cons (car things) result)))))
  (iter items '()))

(define x '((1 2) (3 4)))

(reverse x) ;; ((3 4) (1 2))
(deep-reverse x) ;; ((4 3) (2 1))
