(define (charmicael-test n)
  (define (try-it a)
    (cond ((= a 0) true)
          ((fermat-test n a) (try-it (- a 1)))
          (else false)))
  (try-it (- n 1)))


(define (fermat-test n a)
  (= (expmod a n n) a))

(define (prime? n)
  (define (fast-prime? times)
    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? (- times 1)))
          (else false)))
  (fast-prime? 100))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square x) (* x x))
