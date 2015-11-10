(define (cont-frac n d k)
  (define (iter i result)
    (if (< i 1)
        (+ (d 0) result)
        (iter (- i 1)
              (+ (d (- i 1)) (/ (n i) result)))))
  (iter (- k 1) (/ (n k) (d k))))

(define (euler-expansion k)
  (cont-frac (lambda (x) 1.0)
             (lambda (x)
               (if (= 0 (remainder (+ x 1) 3))
                   (* 2 (/ (+ x 1) 3))
                   1.0))
             k))