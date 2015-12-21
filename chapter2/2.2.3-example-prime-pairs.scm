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
          ((charmicael-test n) (fast-prime? (- times 1)))
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

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (enumerate-interval a b)
  (define (iter n result)
    (if (> a n)
        result
        (iter (- n 1) (cons n result))))
  (iter b '()))

(define (prime-sum-pairs n)

  (define (make-pairs)
    (flatmap
     (lambda (i)
       (map (lambda (j) (list i j))
            (enumerate-interval 1 (- i 1))))
     (enumerate-interval 1 n)))

  (define (as-triple pair)
    (append pair (list (+ (car pair) (cadr pair)))))

  (define (prime-sum? pair)
    (prime? (+ (car pair) (cadr pair))))
  
  (map as-triple
       (filter prime-sum? (make-pairs))))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))

(define (permutations s)
  (if (null? s)
      (list '())
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))