(define (timed-prime-test n)
  (define (start-prime-test start-time)
    (if (prime? n)
        (report-prime (- (runtime) start-time))
        false))

  (define (report-prime elapsed-time)
    (newline)
    (display n)
    (display " *** ")
    (display elapsed-time))

  (start-prime-test (runtime)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (square x) (* x x))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (prime? n)
  (define (fast-prime? times)
    (cond ((= times 0) true)
          ((fermat-test n) (fast-prime? (- times 1)))
          (else false)))
  (fast-prime? 100))

(define (search-for-primes n)
  (define (find-some-primes n r)
    (cond ((= r 0) 0)
          ((timed-prime-test n) (find-some-primes (+ n 1) (- r 1)))
          (else (find-some-primes (+ n 1) r))))

  (find-some-primes (+ n 1) 3))
