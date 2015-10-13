(define (fib-rec n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-rec (- n 1)) (fib-rec (- n 2))))))

(define (fib-iter n)
  (define (iter a b counter)
    (if (= counter 0)
        b
        (iter (+ a b) a (- counter 1))))
  (iter 1 0 n))
