;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HW4_Formulaic) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla
; 09-16-2018
; period 3
; hw #4 FunFunFunctions

(define CartDist
  (lambda (X1 Y1 X2 Y2)
    (sqrt (+ (expt (- X1 X2) 2) (expt (- Y1 Y2) 2))
          )
    )
  )

(define ArithMean3
  (lambda (a b c)(/ (+ a b c) 3)
    )
  )

(define MAX2
  (lambda (a b)
    (/ (+ a b (abs (- a b))) 2 )
    )
  )

(CartDist 0 0 0 0) ; should be <0>
(CartDist 4 4 4 4) ; should be <0>
(CartDist 0 0 3 4) ; should be <5>

(ArithMean3 0 0 0) ; should be <0>
(ArithMean3 1 2 3) ; should be <2>
(ArithMean3 5 -10 20) ; should be <5>

(MAX2 4 4) ; should be <4>
(MAX2 4 7) ; should be <7>
(MAX2 9 8) ; should be <9>


