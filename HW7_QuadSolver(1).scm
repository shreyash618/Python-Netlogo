;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HW7_QuadSolver) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla
; 09-24-2018
; period 3
; HW #7: Quad Solver


 (define quadSolve
   (lambda (a b c)
     (if (<= 0 (- (expt b 2) (* 4 a c) ))
         
         (/ (- (sqrt (- (expt b 2) (* 4 a c))) b ) (* 2 a))

         "no real roots"
         )
     )
   )

(quadSolve 1 1 4) ; should be "no real roots"
(quadSolve 1 4 4) ; should be -2
