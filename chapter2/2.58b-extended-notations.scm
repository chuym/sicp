(load "deriv.scm")

(define (expression? e)
  (or (sum? e) (product? e)))

(define (sum? e)
  (and (pair? e) (> (length e) 1) (eq? (cadr e) '+)))

(define (addend e)
  (car e))

(define (augend e)
  (if (pair? (caddr e))
      (caddr e)
      (let ((a (cddr e)))
        (if (expression? a) a (car a)))))

(define (make-sum a b)
  (cond ((=number? a 0) b)
        ((=number? b 0) a)
        ((and (number? a) (number? b)) (+ a b))
        (else (list a '+ b))))

(define (product? e)
  (and (pair? e) (> (length e) 1) (eq? (cadr e) '*)))

(define (multiplier e)
  (car e))

(define (multiplicand e)
  (if (pair? (caddr e))
      (caddr e)
      (let ((a (cddr e)))
        (if (expression? a) a (car a)))))

(define (make-product a b)
  (cond ((or (=number? a 0) (=number? b 0)) 0)
        ((=number? a 1) b)
        ((=number? b 1) a)
        ((and (number? a) (number? b)) (* a b))
        (else (list a '* b))))