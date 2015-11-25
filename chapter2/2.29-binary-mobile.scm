(define (make-mobile left right)
  ;; (list left right))
  (cons left right))

(define (make-branch length structure)
  ;; (list length structure))
  (cons length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  ;; (car (cdr mobile)))
  (cdr mobile)) ;; We leave car when using cons for constructing branches/mobiles

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  ;; (car (cdr branch)))
  (cdr branch)) ;; We leave car when using cons for constructing branches/mobiles

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))
  
(define (branch-weight branch)
  (if (pair? (branch-structure branch))
      (total-weight (branch-structure branch))
      (branch-structure branch)))

(define (torque branch)
  (* (branch-length branch)
     (branch-weight branch)))

(define (submobiles-balanced? branch)
  (if (pair? (branch-structure branch))
      (balanced? (branch-structure branch))
      #t))

(define (balanced? mobile)
  (and (= (torque (left-branch mobile))
          (torque (right-branch mobile)))
       (and (submobiles-balanced? (left-branch mobile))
            (submobiles-balanced? (right-branch mobile)))))

(define branch1 (make-branch 50 120))
(define branch2 (make-branch 50 150))
(define mobile-small (make-mobile branch1 branch2))
(define mobile-small-1 (make-mobile branch2 branch1))
(define branch-with-mobile (make-branch 20 mobile-small))
(define branch-with-mobile1 (make-branch 20 mobile-small-1))
(define bigmobile (make-mobile branch-with-mobile branch-with-mobile1))

(define balanced-mobile (make-mobile branch1 branch1))
