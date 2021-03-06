;; Show how to generalize apply-generic to handle coercion in the general case of multiple arguments.
;; One strategy is to attempt to coerce all the arguments to the type of the first argument, then to
;; the type of the second argument, and so on. Give an example of a situation where this strategy
;; (and likewise the two-argument version given above) is not sufficiently general. (Hint: Consider
;; the case where there are some suitable mixed-type operations present in the table that will not be
;; tried.)
(load "/home/xdc/study/sicp/chapter2/2.81-coercion.scm")

(define (identity x) x)
(define (apply-generic . args)

  (define (inner op . args)
    (let ((type-tags (map type-tag args)))
      (let ((proc (get op type-tags)))
        (if proc
            (apply proc (map contents args))
            (if (coercion-possible? type-tags)
                (let ((coercions (get-coercions type-tags)))
                  (if coercions
                      (apply inner (cons op (map (lambda (coercion value)
                                                   (coercion value))
                                                 coercions
                                                 args)))
                      (error "No method for these types" (list op type-tags))))
                (error "No method for these types" (list op type-tags)))))))



  ;; Types can be coerced as long as there are types to coerce and there is at least one type to coerce
  (define (coercion-possible? types)
    (not (or
          (null? types)
          (every (lambda (type) (equal? type (car types))) types))))

  (define (get-coercions types)
    ;; Retrieves the coercion functions for each of the provided types, using (car base-types) as the base type
    ;; if a coercion function for all requested types from (car base-types) is not found, then try with the next
    ;; item in base-types until the list is exhausted.
    ;;
    ;; The first parameter is an ordered list of coercion functions.
    ;; The second parameter is a list of the remaining types in need of a coercion function
    ;; The third parameter is the list of base types we can use to attempt coercion
    (define (iter coercions to-coerce base-types)
      (cond ((null? to-coerce) coercions)
            ((null? base-types) (error "No method for these types" (list (types))))
            (else
             (let ((type (car to-coerce))
                   (base-type (car base-types)))
               (cond ((equal? type base-type)
                      (iter (append coercions (list identity))
                            (cdr to-coerce)
                            base-types))
                     ((get-coercion type base-type)
                      (iter (append coercions (list (get-coercion type base-type)))
                            (cdr to-coerce)
                            base-types))
                     (else (iter '() types (cdr base-types))))))))
    (iter '() types types))
                     
  (apply inner args))

;; The disadvantage of this approach is that it attempts a full type coercion. It discards the possibility
;; of a mixed type operation.