(define (sqrt-iter guess x oldguess)
  (if (or (is-good-enough? guess x) (< (abs (- oldguess guess)r 0.0000000000000000001))
      guess
      (sqrt-iter (improve guess x)
                x guess)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (is-good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (sqrt x)
  (sqrt-iter 1.0 x 2.0))
