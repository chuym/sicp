(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (if (filter a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

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
(define (miller-rabin-test n a)
  (= (expmod a (- n 1) n) 1))

(define (prime? n)
  (define (fast-prime? times)
    (cond ((= times 0) true)
          ((miller-rabin-test n (+ 1 (random (- n 1)))) (fast-prime? (- times 1)))
          (else false)))
  (fast-prime? 100))

(define (square x) (* x x))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (sum-square-primes-between a b)
  (define (term x)
    (if (prime? x) (square x) 0))
  (define (next x) (+ 1 x))
  (filtered-accumulate + 0 term a next b >))

(define (relative-primes-product n)
  (define (term x)
    (if (= (gcd n x) 1) x 1))
  (define (next x) (+ 1 x))
  (filtered-accumulate * 1 term 1 next (- n 1) >))
