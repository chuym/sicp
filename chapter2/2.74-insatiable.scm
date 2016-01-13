;; The following procedure retrieves the record from a given file.
;; The strategy used to retrieve the record depends on the file's
;; division, which is tagged to a file and can be retrieved using
;; the `division` procedure. An example would be:
;; ('sales '((name . Ana) (salary . 80000)))
(define (get-record file)
  ((get 'get-record (division file)) file))

;; This is analogous to the above function. Each division is
;; responsible of installing its package containing the various
;; procedures to retrieve information.
(define (get-salary file)
  ((get 'get-salary (division file)) file))

;; This searches through all records in files. They must have
;; the get-name procedure defined on its package.
;; This runs on O(n), so not very scalable ! A proper indexing
;; should be in place
(define (find-employee-record name files)
  (cond ((null? files) #f)
        ((= ((get 'get-name (division (car files))) (car files))
            name)
         (get-record (car files)))
        (else (find-employee-record name cdr files))))

;; If Insatiable takes over a new company, they must create the
;; install package for their employees records so they matches
;; the interface expected by the HQs, in this example, they must
;; implement 'get-record, 'get-salary and 'get-name.
