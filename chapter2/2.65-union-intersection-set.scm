(load "2.63-tree-to-list.scm")
(load "2.64-balanced-tree.scm")

(define (union-set a b)
  (define (union a b)
    (cond ((null? a) b)
          ((null? b) a)
          (else (let ((left (car a))
                      (right (car b)))
                  (cond ((= left right) (cons left (union (cdr a) (cdr b))))
                        ((> right left) (cons left (union (cdr a) b)))
                        (else (cons right (union a (cdr b)))))))))
  (list->tree (union (tree->list-2 a) (tree->list-2 b))))

;; The run time of union-set is Theta(3 * Theta(n)), since union, list->tree and
;; tree->list-2 all run in Theta(n), since the coefficient 3 is insignificant for
;; large n, then the run time is Theta(n)

(define (intersection-set a b)
  (define (intersection a b)
    (cond ((or (null? a) (null? b)) '())
          ((= (car a) (car b)) (append (list (car a)) (intersection (cdr a) (cdr b))))
          ((> (car b) (car a)) (append (list (car a)) (intersection (cdr a) b)))
          (else (append (list (car b)) (intersection a (cdr b))))))

  (list->tree (intersection (tree->list-2 a) (tree->list-2 b))))

;; Similarly than union-set, the running time is Theta(3 * Theta(n)), since
;; intersection, list->tree and tree->list-2 all have running time Theta(n),
;; the intersection-set procedure runs in Theta(n) as well.