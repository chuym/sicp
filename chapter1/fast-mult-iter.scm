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
  (define (fast-mult-iter a b n)
    (cond ((= 0 b) n)
          ((even? b) (fast-mult-iter (double a) (halve b) n))
          (else (fast-mult-iter a (- b 1) (+ a n)))))
  (fast-mult-iter a b 0))
