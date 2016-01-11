(load "2.67-sample-message.scm")

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (encode-symbol symbol tree)
  (define (encode-leaf tree)
    (let ((left (left-branch tree))
          (right (right-branch tree)))
      (cond ((and (leaf? left) (eq? symbol (symbol-leaf left))) '(0))
            ((and (leaf? right) (eq? symbol (symbol-leaf right))) '(1))
            ((and (not (leaf? left)) (element-of-set? symbol (symbols left)))
             (cons 0 (encode-leaf left)))
            ((and (not (leaf? right)) (element-of-set? symbol (symbols right)))
             (cons 1 (encode-leaf right))))))

  (if (and (not (leaf? tree)) (element-of-set? symbol (symbols tree)))
      (encode-leaf tree)
      (error "symbol not found in tree -- ENCODE-SYMBOL" symbol)))
        
(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))
              