(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpson-integral f a b n)
  (define (do h)
    (define (next x) (+ x 1))
    (define (yk k) (f (+ a (* k h))))
    (define (term x)
      (cond ((or (= x 0) (= x n)) (yk x))
            ((even? x) (* 2 (yk x)))
            (else (* 4 (yk x)))))

    (* (/ h 3) (sum-iter term 0 next n)))
  (do (/ (- b a) n)))

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))
