(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1.0))

(define (product-rec term a next b)
  (if (> a b)
      1.0
      (* (term a) (product-rec term (next a) next b))))

(define (pi-approx n)
  (define (term n)
    (cond ((= n 1) (/ 2 3))
          ((even? n) (/ (+ 2 n) (+ 2 (- n 1))))
          (else (/ (+ 2 (- n 1)) (+ 2 n)))))
  (define (next x) (+ x 1))
  (* 4.0 (product term 1 next n)))
