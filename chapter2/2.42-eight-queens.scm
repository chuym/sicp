(load "../lib.scm") ;; commonly used procedures

(define (queens board-size)

  (define (position x y)
    (list x y))
  (define (row position)
    (car position))
  (define (col position)
    (cadr position))

  (define (safe? k positions)
    (define (in-diagonal? a b)
      (and (= 1 (abs (- (col a) (col b))))
           (= 1 (abs (- (row a) (row b))))))

    (let ((position (nth positions k))
          (remainder (collect (- k 1) positions)))
      (or (null? remainder)
          (not
           (any (lambda (placed-queen)
                  (or (= (row position) (row placed-queen))
                      (= (col position) (col placed-queen))
                      (in-diagonal? position placed-queen)))
                remainder)))))

  (define (adjoin-position row k queens)
    (append queens (list (position row k))))

  (define empty-board '())

  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))