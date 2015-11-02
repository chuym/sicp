(define (timed-divisor-test n)
  (define (start-divisor-test start-time)
    (display (smallest-divisor n))
    (report-time (- (runtime) start-time)))

  (define (report-time elapsed-time)
    (display " *** ")
    (display elapsed-time))

  (start-divisor-test (runtime)))

(define (smallest-divisor n)
  (define (find-divisor divisor)
    (if (divides? divisor)
        divisor
        (find-divisor (next-divisor divisor))))

  (define (next-divisor old)
    (if (= old 2) 3 (+ old 2)))
  
  (define (divides? divisor)
    (= (remainder n divisor) 0))

  (find-divisor 2))
