(define (smallest-divisor n)
  (define (find-divisor divisor)
    (if (divides? divisor)
        divisor
        (find-divisor (+ divisor 1))))
  (define (divides? divisor)
    (= (remainder n divisor) 0))

  (find-divisor 2))
