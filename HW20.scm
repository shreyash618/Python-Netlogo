;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname HW20) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla
; 10-24-2018
; period 3
; HW 20: Iterate Again

; This function takes non-negative integer n, and returns the sum of the positive
; odd integers up to and including n. It utilizes two helper functions, Odd-helper
; and Even-helper, for odd and even values of n , respectively.
(define SumOdd
  (lambda (n)
    (if (odd? n)
    (Odd-helper 0 1 n)
    (Even-helper 0 0 n)
    )
  )
  )

(define Odd-helper
  (lambda (a b c)
    (if (= b c)  ; 1 = 1 
        (+ a b) 
        (Odd-helper (+ a b) (+ b 2) c)
        )
    )
  )

(define Even-helper
  (lambda (a b c)  
    (if (= b c) ; 0= 0
        (+ a b) ; 0
        (Even-helper (- (+ a b) 1) (+ b 2) c)
        )
    )
  )

"Test Cases SumOdd"
(SumOdd 1) ; should be 1
(SumOdd 3) ; should be 4
(SumOdd 9) ; should be 25
(SumOdd 0) ; should be 0
(SumOdd 2) ; should be 1
(SumOdd 10) ; should be 25

; This function uses helper function POD-helper to give the position of the
; first occurrence of a given digit in a given number (num). The digit MUST
; be a part of the given num.

(define posOfDigit
  (lambda (num dig)
    (POD-helper (quotient num 10) dig 0 (remainder num 10))
    )
  )



(define POD-helper
   (lambda (num dig pos rem)
     (if (= rem dig)
        pos 
        (POD-helper (quotient num 10) dig (+ pos 1) (remainder num 10))
        )
     )
  )

"Test Cases posOfDigit"
(posOfDigit 300 3) ; should be 2
(posOfDigit 4 4) ; should be 0
(posOfDigit 666 6) ; should be 0
(posOfDigit 123 2) ; should be 1
(posOfDigit 75429 5) ; should be 3











