(define (make-from-mag-ang x y)

  (define real-part (* x (cos y)))
  (define imag-part (* x (sin y)))

  (define (dispatch op)
    (cond ((eq? op 'real-part) real-part)
          ((eq? op 'imag-part) imag-part)
          ((eq? op 'magnitude) x)
          ((eq? op 'angle) y)
          (else (error "Unknown op -- MAKE-FROM-MAG-ANG" op)))))