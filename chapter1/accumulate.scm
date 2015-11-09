(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate-rec combiner null-value term (next a) next b))))

(define (cube x) (* x x x))

(define (simpson-integral f a b n)
  (define (do h)
    (define (next x) (+ x 1))
    (define (yk k) (f (+ a (* k h))))
    (define (term x)
      (cond ((or (= x 0) (= x n)) (yk x))
            ((even? x) (* 2 (yk x)))
            (else (* 4 (yk x)))))

    (* (/ h 3) (accumulate-rec + 0 term 0 next n)))
  (do (/ (- b a) n)))

(define (pi-approx n)
  (define (term n)
    (cond ((= n 1) (/ 2 3))
          ((even? n) (/ (+ 2 n) (+ 2 (- n 1))))
          (else (/ (+ 2 (- n 1)) (+ 2 n)))))
  (define (next x) (+ x 1))
  (* 4.0 (accumulate-rec * 1 term 1 next n)))
