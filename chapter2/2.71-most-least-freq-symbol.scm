(load "2.69-huffman-algorithm")

;; Tree when n=5

(define alphabet-5-symbols (generate-huffman-tree '((A 1) (B 2) (C 4) (D 8) (E 16))))
(define alphabet-10-symbols (generate-huffman-tree '((A 1) (B 2) (C 4) (D 8) (E 16) (F 32) (G 64) (H 128) (I 256) (J 512))))

;; The most frequent symbol requires 1 bit to be represented for any alphabet
;; The least frequent symbols requires ceil(n/2) bits.