(load "2.68-encode-message.scm")
(load "2.69-huffman-algorithm.scm")

(define rock-alphabet '((A 2) (BOOM 1) (GET 2) (JOB 2) (NA 16) (SHA 3) (YIP 9) (WAH 1)))

(define song '((GET A JOB)
               (SHA NA NA NA NA NA NA NA NA NA)
               (GET A JOB)
               (SHA NA NA NA NA NA NA NA NA NA)
               (WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP)
               (SHA BOOM)))

(define rock-tree (generate-huffman-tree rock-alphabet))

(define (encode-rock-song)
  (map (lambda (v) (encode v rock-tree)) song))

;; The encoded song is:
;; ((0 0 0 0 0 0 0 1 0 0 0 0 0 1) (0 0 0 1 1 1 1 1 1 1 1 1 1) (0 0 0 0 0 0 0 1 0 0 0 0 0 1) (0 0 0 1 1 1 1 1 1 1 1 1 1) (0 0 1 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1) (0 0 0 1 0 0 1 1 0))
;; The bits needed to encode this song are 86 bits
;; If we were using fixed-length, we would need log 8 bits per symbol to encode, that is 3 bits per character.
;; Since we have 38 symbols on our song, we need 114 bits to encode it for with fixed-length encoding.