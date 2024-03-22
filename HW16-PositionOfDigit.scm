;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HW16-PositionOfDigit) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla
; 10-16-2018
; period 3
; HW #16: Position of Digit

; This function takes a positive integer (num) and a digit value (digit)
; to return the position of the first occurrence of digit in num. The digit MUST be a
; part of the given num.

(define posOfDigit
  (lambda (num digit)
    (if (= (remainder num 10) digit)
        0
        (

         + 1 (posOfDigit (quotient num 10) digit))
        )
    )
  )

(posOfDigit 4 4) ; should be 0
(posOfDigit 123 2) ; should be 1
(posOfDigit 75429 5) ; should be 3
(posOfDigit 666 6) ; should be 0
