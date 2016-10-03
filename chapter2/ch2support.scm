;;; CODE FROM OTHER CHAPTERS OF STRUCTURE AND INTERPRETATION OF
;;;  COMPUTER PROGRAMS NEEDED BY CHAPTER 2

(define (atom? x)
  (and (not (null? x))
       (not (pair? x))))

(define (every fun elems)
  (cond ((atom? elems) (error "Expected a list not an atom" elems))
        ((null? elems) #t)
        ((not (fun (car elems))) #f)
        (else (every fun (cdr elems)))))

;;;from chapter 1
(define (square x) (* x x))

;;;from section 1.2.5, for Section 2.1.1
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;;;from section 1.2.2, for Section 2.2.3
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

;;; ***not in book, but needed for code before quote is introduced*** 
(define nil '())
(define false #f)

;;;-----------
;;;from section 3.3.3 for section 2.4.3
;;; to support operation/type table for data-directed dispatch

(define (assoc key records)
  (cond ((null? records) false)
        ((equal? key (caar records)) (car records))
        (else (assoc key (cdr records)))))

(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (cdr record)
                  false))
            false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable
                            (cons (cons key-2 value)
                                  (cdr subtable)))))
            (set-cdr! local-table
                      (cons (list key-1
                                  (cons key-2 value))
                            (cdr local-table)))))
      'ok)    
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

(define operation-table (make-table))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))

(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum -- TYPE-TAG" datum)))

(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Bad tagged datum -- CONTENTS" datum)))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (error
            "No method for these types -- APPLY-GENERIC"
            (list op type-tags))))))

(define (attach-tag type-tag contents)
  (cons type-tag contents))

;;;-----------