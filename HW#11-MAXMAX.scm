;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HW#11-MAXMAX) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla
; 10-01-2018
; period 3
; HW #11: Max Max


; This function returns the greater of two numeric inputs
(define MAX2
  (lambda (a b)
    (cond
      ((> a b) a)
      ((< a b) b)
      ((= a b) a)
      )
    )
  )

; This function returns the greater of three numeric inputs
(define MAX3
  (lambda (a b c)
    (MAX2 (MAX2 a b) c)
    )
  )

; This function returns the greater of four numeric inputs
(define MAX4
  (lambda (a b c d)
    (MAX2 (MAX3 a b c) d)
    )
  )

; This function returns the greater of five numeric inputs
(define MAX5
  (lambda (a b c d e)
    (MAX2 (MAX4 a b c d) e)
    )
  )



(MAX2 0 0) ; should be 0
(MAX2 3 2) ; should be 3
(MAX2 4 5) ; should be 5

(MAX3 1 1 1) ; should be 1
(MAX3 3 2 1) ; should be 3
(MAX3 7 8 9) ; should be 9

(MAX4 2 2 2 2) ; should be 2
(MAX4 2 3 4 6) ; should be 6
(MAX4 7 6 8 3) ; should be 8

(MAX5 2 2 2 2 2) ; should be 2
(MAX5 2 3 4 6 3) ; should be 6
(MAX5 7 6 8 3 3) ; should be 8


