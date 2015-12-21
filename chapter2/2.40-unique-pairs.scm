(define (unique-pairs n)
  (define (enumerate a b)
    (define (iter n result)
      (if (> a n)
          result
          (iter (- n 1) (cons n result))))
    (iter b '()))

  (map (lambda (i)
         (map (lambda (j)
                (list i j))
              (enumerate 1 (- i 1))))
       (enumerate 1 n)))