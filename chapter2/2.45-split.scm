(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define (split left right)
  (define (f painter n)
    (if (= n 0)
        painter
        (let ((smaller (f painter (- n 1))))
          (left painter (right smaller smaller)))))
  f)

(define right-split (split beside below))
(define up-split (split below beside))