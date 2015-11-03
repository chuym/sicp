(define (prime? n)
  (define (try-it a)
    (cond ((= a 0) n)
          ((miller-rabin-test n a) (try-it (- a 1)))
          (else false)))
  (try-it (- n 1)))


(define (miller-rabin-test n a)
  (= (expmod a (- n 1) n) 1))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (square-check (expmod base (/ exp 2) m) m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square-check x n)
  (if (and (not (or (= x 1) (= x (- n 1))))
           (= (remainder (* x x) n) 1))
      0
      (remainder (* x x) n)))
