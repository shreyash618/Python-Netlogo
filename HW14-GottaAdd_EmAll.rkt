;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |HW14-GottaAdd'EmAll|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla
; 10-10-2018
; period 3
; HW #14: Gotta Add 'Em All

; This function takes non-negative integer n, and returns
; the sum of the positive odd integers up to and including n
(define sumOdd
  (lambda (n)
    (cond
      ((= n 0) 0)
      ((= n 1) 1)
      ((= (remainder n 2) 1) (+ (sumOdd (- n 2)) n))
      ((= (remainder n 2) 0) (sumOdd (- n 1)))
      )
    )
  )

(sumOdd 0) ; should be 0
(sumOdd 1) ; should be 1
(sumOdd 2) ; should be 1
(sumOdd 3) ; should be 4
(sumOdd 9) ; should be 25
(sumOdd 10) ; should be 25


; This function takes positive integer n and returns the
; sum of n’s odd digits
(define sumOddDigits
  (lambda (n)
    (if (and (< n 10) (= (remainder n 2) 0))
      0
      (if (and (< n 10) (= (remainder n 2) 1))
      n
      (if (> n 10)
      (+ (sumOddDigits (remainder n 10))
         (sumOddDigits (quotient (- n (remainder n 10)) 10)))
      "n must be a non-negative integer"
         )
        )
      )
      )
      )

(sumOddDigits 0) ; should be 0
(sumOddDigits 4) ; should be 0
(sumOddDigits 3) ; should be 3
(sumOddDigits 38) ; should be 3
(sumOddDigits 138) ; should be 4
(sumOddDigits 1984) ; should be 10
(sumOddDigits 492067) ; should be 16

      