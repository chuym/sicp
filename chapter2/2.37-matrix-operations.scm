(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (accumulate cons '() (map car seqs)))
            (accumulate-n op init (accumulate cons '() (map cdr seqs))))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x)
           (map
            (lambda (y) (dot-product x y))
            cols))
         m)))

(define matrix_a '((5 3 6) (2 1 9) (8 5 4)))

(define matrix_b '(( 8 1 2) (5 4 2) (9 8 2)))

(define vector_a '(1 3 2))