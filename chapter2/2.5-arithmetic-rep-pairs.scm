;; We can represent non-negative pairs of numbers in such a way that
;; 2^a3^b

(define (pow base n)
  (if (= n 0)
      1
      (* base (pow base (- n 1)))))

(define (cons x y)
  (* (pow 2 x) (pow 3 y)))

(define (car z)
  (define (iter v n)
    (if (= 1 (remainder v 2))
        n
        (iter (/ v 2) (+ n 1))))
  (iter z 0))

(define (cdr z)
  (define (iter v n)
    (if (= 1 (remainder v 3))
        n
        (iter (/ v 3) (+ n 1))))
  (iter z 0))
