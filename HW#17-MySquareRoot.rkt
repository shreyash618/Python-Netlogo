;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HW#17-MySquareRoot) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla
; 10-17-2018
; Period 3
; HW #17: My Square Root

; This function takes non-negative integer n, and returns an approximation
; of its square root accurate to the nearest thousandth.

(define epsilon 0.0001)

(define newguess
  (lambda (n oldguess)
         (/ (+ (/ n oldguess) oldguess) 2)
         )
  )

(define isGoodEnuf?
  (lambda (a b)
    (< (abs (- a b)) epsilon)
    )
  )

(define mySqrt
  (lambda (n g)
    (if (= n (* g g))
        g
        (if (isGoodEnuf? n (* g g))
            g
            (mySqrt n (newguess n g))
            )
        )
    )
  )

; Test Cases

(isGoodEnuf? 2 2.000001); should be true
(isGoodEnuf? 4 5); should be false
(isGoodEnuf? 0 0); should be true

(mySqrt 16 4) ; should be 4
(mySqrt 16 1) ; should be close to 4
(mySqrt 9 2.5); should be close to 3
(mySqrt 10 3); should be close to 3.162277
(mySqrt 0 1); should be close to 0



