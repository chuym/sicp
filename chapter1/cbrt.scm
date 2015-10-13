(define (cbrt-iter guess x oldguess)
  (if (or (is-good-enough? guess x) (< (abs (- oldguess guess)) 0.0000000000000000001))
      guess
      (cbrt-iter (improve guess x)
                x guess)))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (is-good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (cbrt x)
  (cbrt-iter 1.0 x 2.0))
