(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (enumerate-interval a b)
  (define (iter n result)
    (if (> a n)
        result
        (iter (- n 1) (cons n result))))
  (iter b '()))

(define (nth l n)
  (define (iter k remainder)
    (if (= k 1)
        (car remainder)
        (iter (- k 1) (cdr remainder))))
  (if (> n (length l))
      (error "out of bounds")
      (iter n l)))

(define (collect n l)
  (define (iter k remainder result)
    (if (= k 0)
        result
        (iter (- k 1) (cdr remainder) (append result (list (car remainder))))))

  (if (> n (length l))
      l
      (iter n l '())))