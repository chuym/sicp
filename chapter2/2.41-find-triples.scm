(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))
  
(define (triples-with-sum n s)
  (define (enumerate a b)
    (define (iter n result)
      (if (> a n)
          result
          (iter (- n 1) (cons n result))))
    (iter b '()))

  (define (make-triples k)

    (flatmap (lambda (i)
               (map (lambda (j)
                      (list k i j))
                    (enumerate 1 (- i 1))))
             (enumerate 1 (- k 1))))
  (filter (lambda (triple) (= s (fold + 0 triple))) (flatmap make-triples (enumerate 3 n))))