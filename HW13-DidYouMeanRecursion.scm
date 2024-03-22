;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HW13-DidYouMeanRecursion) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla
; 10-01-2018
; period 3
; HW #13: Did you mean recursion

; This function accomplishes a task similar to that of fact,
; but only includes every 3rd integer in the final product

(define fiction
  (lambda (n)
    (cond
      ((= n 0) 1)
      ((= n 1) 1)
      ((= n 2) 2)
      ((> n 2) (* (fiction (- n 3)) n))
      (else "N must be a non-negative integer")
      )
    )
  )  

(fiction 0) ; should be 1
(fiction 1) ; should be 1
(fiction 2) ; should be 2
(fiction 3) ; should be 3
(fiction 4) ; should be 4
(fiction 5) ; should be 10
(fiction 6) ; should be 18
(fiction 7) ; should be 28
(fiction 8) ; should be 80
(fiction -1) ; should be "N must be a non-negative integer"

; This function will give the sum of all numbers from p to zero
; p must be a non-negative integer
(define SumPto0
  (lambda (p)
    (cond
      ((= p 0) 0)
      (else (+ (SumPto0 (- p 1)) p))
      )
    )
  )
(SumPto0 0) ; should be 0
(SumPto0 1) ; should be 1
(SumPto0 4) ; should be 10

; This function will give the sum of number from p to q, inclusove of p and q
; p and q must be non-negative integers
(define sumPtoQ
  (lambda (p q)
    (+ (- (SumPto0 p) (SumPto0 q)) q)
    )
  )

(sumPtoQ 0 0) ; should be 0
(sumPtoQ 0 3) ; should be 6
(sumPtoQ 2 3) ; should be 5
(sumPtoQ 3 3) ; should be 3

; This functions will calculate the number of digits in a non-negative number, n
(define numDigits
  (lambda (n)
    (if (< n 10)
        1
        (+ 1 (numDigits (/ n 10)))
        )
    )
  )

(numDigits 4) ; should be 1
(numDigits 168) ; should be 3
(numDigits 2341235087) ; should be 10

