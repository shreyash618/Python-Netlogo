;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HW#12-LikeADream) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla
; 10-01-2018
; period 3
; HW #12: Like a Dream within a Dream


; This function returns the value of any given factorial
; Input value must be a non-negative integer

(define fact
  (lambda (n)

(cond
  ((= n 0) 1)
  ((> n 0 ) (* n (fact (- n 1))))
  
)))     

(fact 0) ; should be 1
(fact 1) ; should be 1
(fact 2) ; should be 2
(fact 3) ; should be 6
(fact 4) ; should be 24
(fact 5) ; should be 120
(fact 6) ; should be 720
