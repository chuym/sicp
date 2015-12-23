(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define outline
  (let ((top-left (make-vect 0.0 0.99))
        (top-right (make-vect 0.99 0.99))
        (bot-right (make-vect 0.99 0))
        (bot-left (make-vect 0.0 0)))
    (segments->painter
     (list
      (make-segment bot-left bot-right)
      (make-segment bot-right top-right)
      (make-segment top-right top-left)
      (make-segment top-left bot-left)))))

(define x-painter
  (let ((top-left (make-vect 0.0 0.99))
        (top-right (make-vect 0.99 0.99))
        (bot-right (make-vect 0.99 0))
        (bot-left (make-vect 0.0 0)))
    (segments->painter
     (list
      (make-segment bot-left top-right)
      (make-segment bot-right top-left)))))

(define diamond-painter
  (let ((top-center (make-vect 0.5 0.99))
        (right-center (make-vect 0.99 0.5))
        (bot-center (make-vect 0.5 0))
        (left-center (make-vect 0.0 0.5)))
    (segments->painter
     (list
      (make-segment bot-center left-center)
      (make-segment left-center top-center)
      (make-segment top-center right-center)
      (make-segment right-center bot-center)))))

(define wave
  (segments->painter
   (list
    (make-segment
     (make-vect 0.006 0.840)
     (make-vect 0.155 0.591))
    (make-segment
     (make-vect 0.006 0.635)
     (make-vect 0.155 0.392))
    (make-segment
     (make-vect 0.304 0.646)
     (make-vect 0.155 0.591))
    (make-segment
     (make-vect 0.298 0.591)
     (make-vect 0.155 0.392))
    (make-segment
     (make-vect 0.304 0.646)
     (make-vect 0.403 0.646))
    (make-segment
     (make-vect 0.298 0.591)
     (make-vect 0.354 0.492))
    (make-segment
     (make-vect 0.403 0.646)
     (make-vect 0.348 0.845))
    (make-segment
     (make-vect 0.354 0.492)
     (make-vect 0.249 0.000))
    (make-segment
     (make-vect 0.403 0.000)
     (make-vect 0.502 0.293))
    (make-segment
     (make-vect 0.502 0.293)
     (make-vect 0.602 0.000))
    (make-segment
     (make-vect 0.348 0.845)
     (make-vect 0.403 0.999))
    (make-segment
     (make-vect 0.602 0.999)
     (make-vect 0.652 0.845))
    (make-segment
     (make-vect 0.652 0.845)
     (make-vect 0.602 0.646))
    (make-segment
     (make-vect 0.602 0.646)
     (make-vect 0.751 0.646))
    (make-segment
     (make-vect 0.751 0.646)
     (make-vect 0.999 0.343))
    (make-segment
     (make-vect 0.751 0.000)
     (make-vect 0.597 0.442))
    (make-segment
     (make-vect 0.597 0.442)
     (make-vect 0.999 0.144)))))