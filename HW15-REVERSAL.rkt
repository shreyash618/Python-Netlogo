;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HW15-REVERSAL) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla
; 10-11-2018
; period 3
; HW #15: Reversal


; This functions will calculate the number of digits in a non-negative number, n
(define numDigits
  (lambda (n)
    (if (< n 10)
        1
        (+ 1 (numDigits (quotient n 10)))
        )
    )
  )

; This function takes positive integer and returns
; the number with its digits in reverse order
(define reverseNum
  (lambda (n)
    (if (< n 10)
        n
        (+ (* (remainder n 10) (expt 10 (- (numDigits n) 1)))
           (reverseNum (quotient n 10)
                       )
           )
        )
    )
  )




     
(reverseNum 4) ; should be 4
(reverseNum 61) ; should be 16
(reverseNum 161) ; should be 161
(reverseNum 1893) ; should be 3981
(reverseNum 75429) ; should be 92457


      