(define (reverse items)
  (define (iter n reversed)
    (if (< n 0)
        reversed
        (iter (- n 1) (append reversed (cons (list-ref items n) '())))))
  (iter (- (length items) 1) '()))
