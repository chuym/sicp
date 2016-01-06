(load "deriv.scm")

(define (sum? e)
  (and (pair? e) (eq? (cadr e) '+)))

(define (addend e)
  (car e))

(define (augend e)
  (caddr e))

(define (make-sum a b)
  (cond ((=number? a 0) b)
        ((=number? b 0) a)
        ((and (number? a) (number? b)) (+ a b))
        (else (list a '+ b))))

(define (product? e)
  (and (pair? e) (eq? (cadr e) '*)))

(define (multiplier e)
  (car e))

(define (multiplicand e)
  (caddr e))

(define (make-product a b)
  (cond ((or (=number? a 0) (=number? b 0)) 0)
        ((=number? a 1) b)
        ((=number? b 1) a)
        ((and (number? a) (number? b)) (* a b))
        (else (list a '* b))))