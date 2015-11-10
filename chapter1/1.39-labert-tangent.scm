(define (cont-frac n d k)
  (define (iter i result)
    (if (< i 1)
        (+ (d 0) result)
        (iter (- i 1)
              (+ (d (- i 1)) (/ (n i) result)))))
  (iter (- k 1) (/ (n k) (d k))))

(define (tan-cf x k)
  (cont-frac (lambda (i) (if (= i 1) (* x) (* x x -1)))
             (lambda (i) (if (> i 0) (+ 1 (* 2 (- i 1))) 0))
             k))