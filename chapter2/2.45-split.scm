(define (split left right)
  (define (f painter n)
    (if (= n 0)
        painter
        (let ((smaller (f (painter (- n 1)))))
          (left painter (right smaller smaller)))))
  f)