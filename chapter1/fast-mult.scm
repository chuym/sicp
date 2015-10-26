(define (even? x)
  (= 0 (bitwise-and x 1)))

(define (double x) (+ x x))

(define (halve x)
  (define (halve-iter x n)
    (if (= x 0)
        n
        (halve-iter (- x 2) (+ n 1))))
  (halve-iter x 0))

(define (fast-mult a b)
  (cond ((= 0 b) 0)
        ((= 1 b) a)
        ((even? b) (fast-mult (double a) (halve b)))
        (else (+ a (fast-mult a (- b 1))))))
        
