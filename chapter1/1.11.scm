;;; A function is defined as the following
;;; f(n) = n for n < 3
;;; f(n) = f(n-1) + 2f(n - 2) + 3f(n-3) for n >= 3
;;; Write a recursive and iterative procedure for this function

(define (fn-rec n)
  (cond ((< n 3) n)
        (else (+ (fn-rec (- n 1))
                 (* 2 (fn-rec (- n 2)))
                 (* 3 (fn-rec (- n 3)))))))

(define (fn-iter n)
  (define (iter a b c counter)
    (cond ((= counter 0) c)
          ((= counter 1) b)
          ((= counter 2) a)
          (else (iter (+ a (* 2 b) (* 3 c))
                      a
                      b
                      (- counter 1)))))
  (iter 2 1 0 n))
                   
          
