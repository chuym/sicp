(define (for-each proc items)
  (let ((r (map proc items)))
    #t))
