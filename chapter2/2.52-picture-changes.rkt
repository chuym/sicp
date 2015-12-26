(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))
(load "2.45-split.scm")
(load "2.50-flip-rotate.rkt")

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(define (corner-split-alt painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside painter up))
              (bottom-right (below painter right))
              (corner (corner-split-alt painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))


(define (flipped-pairs painter)
  (let ((combine4 (square-of-four identity flip-vert
                                  identity flip-vert)))
    (combine4 painter)))

(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-horiz identity
                                  rotate180 flip-vert)))
    (combine4 (corner-split painter n))))

(define (square-limit-inside painter n)
  (let ((combine4 (square-of-four identity flip-horiz
                                  flip-vert rotate180)))
    (combine4 (corner-split painter n))))

(define smiley-wave
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
    (make-segment ;; Left Shoulder
     (make-vect 0.304 0.646)
     (make-vect 0.403 0.646)) 

    (make-segment ;; Smile
     (make-vect 0.442 0.789)
     (make-vect 0.489 0.712))
    (make-segment ;; Smile
     (make-vect 0.489 0.712)
     (make-vect 0.536 0.789))

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