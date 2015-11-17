(define (make-interval a b) (cons a b))

(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y)))))
  (make-interval (min p1 p2 p3 p4)
                 (max p1 p2 p3 p4)))

(define (div-interval x y)
  (define (do-div)
    (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                (/ 1.0 (lower-bound y)))))
  ;; We check for possible 0's in the denominator.
  (if (and (<= (lower-bound y) 0) (>= (upper-bound y) 0))
      (error "The denominator spans 0")
      (do-div)))
      

;; The difference between two intervals can be computed by reasoning that the lowest possible
;; result is obtained when we use the lowest value of the left interval and subtract the highest
;; value of the right interval. Likewise, the highest possibel result can be computed when
;; the highest value of x (upper-bound) is subtracted by the lowest value of y (lower-bound)
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

;; 2.9 - The width of the result of summation is a function of the widths of the argument intervals.
;; for example: we have two intervals: (5.0, 5.5) and (9.1, 14.1). The width is 0.5 and 5 respectively.
;; the sum result is (14.1, 19.6) with a width of 5.5, which is the sum of the width of the two arguments.
;;
;; For the subtraction, we have for example (12.1, 14.1) (5.0, 5.5). The width is 2 and 0.5
;; the subtraction result is (6.6, 9.1) = 2.5 which is the sum of the two widths: 2 and 0.5
;;
;; For multiplication, we have for example (3.0, 5.0) (4.5, 5.5). The width is 2 and 0.5 respectively.
;; the multiplication result is (13.5, 27.5) with a width of 14. We then have another pair of intervals:
;; (5.0, 7.0) (9.5, 10.5). The result is (47.5, 73.5) with a width of 26. A function can't have two possible
;; results for the same input, we can't have W(2, 0.5) = 14 and W(2, 0.5) = 26 simultaneously.
