;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |CS 17|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla ; Claire Shin
; Team name: Rock n' Roll
; CW/ HW #17- mySqrt
; 10-17-2018
; period 3

; This function takes in 2 inputs, n (a given number) and g (a guess) and
; approximates the square root of n by performing the square root algorithim once

(define approxSqrt1
  (lambda (n g)
         (/ (+ (/ n g) g) 2)
         )
  )



(approxSqrt1 4 2) ; should be 2
(approxSqrt1  4 1) ; should be 2.5
(approxSqrt1 4 5) ; should be 2.9
(approxSqrt1 9 3) ; should be 3
(approxSqrt1 9 1) ; should be 5
(approxSqrt1 9 10) ; should be 5.45
(approxSqrt1 16 4) ; should be 4
(approxSqrt1 16 1) ; should be 8.5
(approxSqrt1 16 15) ; should 8.03333333333...
(approxSqrt1 16 900) ; should be 450.008888888
