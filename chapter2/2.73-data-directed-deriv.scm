(load "deriv.scm")
(load "2.56-expontentation.scm")

(define operations-table '((+ ())
                           (- ())))

        
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

(define (install-deriv-package)
  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
              (deriv (augend exp) var)))

  (define (deriv-prod exp var)
    (make-sum
     (make-product (multiplier exp)
                   (deriv (multiplicand exp) var))
     (make-product (deriv (multiplier exp) ar)
                   (multiplicand exp))))

  (define (deriv-exp exp var) 
    (make-product
     (make-product (exponent exp)
                   (make-exponent (base exp) (- (expontent exp) 1)))
     (deriv (base exp) var)))

  (put '+ '(deriv) deriv-sum)
  (put '- '(deriv) deriv-sum))
  (put '** '(deriv) deriv-sum))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) 0)
        (else ((get 'deriv (operator exp)) (operands exp)
               (var)))))

;; Numbers and variables can't be assimilated in the data-directed dispatch because
;; it's untagged datum.
;;
;; If procedures were indexed like (get (operator exp) 'deriv), then the install
;; package procedures would need to change so the put operations places the procedures
;; where the deriv procedure expects.