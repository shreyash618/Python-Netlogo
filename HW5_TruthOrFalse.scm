;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HW5_TruthOrFalse) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla
; 09-17-2018
; period 3
; hw #5 Truth or False?

(define XOR (lambda (a b)
  (and (or a b) (not (and a b))
       )
  )
  )

(define bic (lambda (a b)
            (or (and a b) (and (not a) (not b)))
              )
  )

(define XOR3 (lambda (a b c)
               (or
                (and a (not b) (not c))
                (and b (not a) (not c))
                (and c (not a) (not b))
                )
               )
  )
                                
(XOR #t #t) ; should be false
(XOR #t #f) ; should be true
(XOR #f #t) ; should be true
(XOR #f #f) ; should be false

(bic #t #t) ; should be true
(bic #t #f) ; should be false
(bic #f #t) ; should be false
(bic #f #f) ; should be true

(XOR3 #t #t #t) ; should be false
(XOR3 #t #t #f) ; should be false
(XOR3 #t #f #f) ; should be true
