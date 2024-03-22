;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |HW 3- FUN FUN FUNCTIONS|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla
; 09-13-2018
; period 3
; hw #3 FunFunFunctions

(define foo (lambda (d) (+ 0 d)))

(define areaCirc (lambda (R) (* 1 pi)))

(define AreaCirc (lambda (R) (* (expt R 2) pi)))

(define AreaWasher (lambda (R1 R2) (- (* (expt R2 2) pi) (* (expt R1 2) pi))))

(foo 1) ; should be <1>
(foo 0) ; should be <0>
(foo 10); should be <10>

(areaCirc 1) ; should be approx <3.141592653589793>
(areaCirc 3) ; sbould be approx <3.141592653589793>
(areaCirc 5) ; should be approx <3.141592653589793>

(AreaCirc 1) ; should be approx <3.141592653589793>
(AreaCirc 3) ; should be approx <28.274333882308138>
(AreaCirc 5) ; should be approx <78.53981633974483>

(AreaWasher 0 2) ; should be approx <12.566370614359172>
(AreaWasher 3 5) ; should be approx <50.26548245743669>
(AreaWasher 6 10) ; should be approx <201.06192982974676>

