(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

;; cons returns a lambda function that in turns receives
;; a function which pases x and y (the arguments of cons) to
;; that function.

;; car receives a cons'd structure, in this implementation a cons'd
;; structure is a function which receives a function. In car we
;; apply the cons'd value (which is a function) and pass a function
;; to it, since we know that this passed function will receive as
;; parameters x and y from the original cons'd values, then we just
;; return the first value as the car implementation.

;; given the above, we can easily implement cdr similarly to car,
;; but instead of passing a function that receives two arguments and
;; return the first one, we will now pass a function that receives
;; two arguments and return the second one:

(define (cdr z)
  (z (lambda (p q) q)))

;; (cdr (cons 2 6))
;; (cdr (lambda (m) (m 2 6)))
;; ((lambda (m) (m 2 6)) (lambda (p q) q))
;; (lambda (2 6) 6)
;; 6

