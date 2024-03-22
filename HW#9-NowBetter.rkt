;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HW#9-NowBetter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla
; 09-25-2018
; period 3
; HW #9: NOW BETTER (edit of Grade Converter using conditionals)

(define gradeConv
  (lambda (g)
     (cond
       ((> g 100) "N/A")
       ((>= g 90) "A")
       ((>= g 80) "B")
       ((>= g 70) "C")
       ((>= g 64) "D")
       ((>= g 0) "F")
       ((< g 0) "N/A")
       )
    )
  )       

(gradeConv -54) ; should be N/A
(gradeConv 3) ; should be F
(gradeConv 69) ; should be D
(gradeConv 73) ; should be C
(gradeConv 88) ; should be B
(gradeConv 100); should be A
(gradeConv 102); should be N/A