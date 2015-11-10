(define (cont-frac-rec n d k)
  (if (< k 2)
      (n k)
      (+ (d (- k 1)) (/ (n k) (cont-frac n d (- k 1))))))

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (< i 1)
        result
        (iter (- i 1)
              (+ (d (- i 1)) (/ (n i) result)))))
  (iter (- k 1) (n k)))
  

(define (approx-golden-ratio k)
  (cont-frac-iter (lambda (i) 1.0)
                  (lambda (i) 1.0)
                  k))
