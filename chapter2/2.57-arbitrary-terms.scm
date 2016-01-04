(load "deriv.scm")

(define (augend e)
  (if (null? (cdddr e))
      (caddr e)
      (cons '+ (cddr e))))
  
(define (multiplicand e)
  (if (null? (cdddr e))
      (caddr e)
      (cons '* (cddr e))))
  