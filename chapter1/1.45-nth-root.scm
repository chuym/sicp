(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (< n 2)
      f
      (compose f (repeated f (- n 1)))))

(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2)))

(define (pow base n)
  (if (= n 0)
      1
      (* base (pow base (- n 1)))))

(define (nth-root x n)
  (fixed-point ((repeated average-damp (+ (quotient n 8) 2))
                (lambda (y)
                  (/ x (pow y (- n 1)))))
               1.0))
