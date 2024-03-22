;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HW#8_GradeConverter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla
; 09-25-2018
; period 3
; HW #8: Grade Converter

(define gradeConv
  (lambda (g)
    (if (>= g 0)
        (if (>= g 65)
            (if (>= g 70)
                (if (>= g 80)
                    (if (>= g 90)
                        (if (<= g 100)
                            "A"
                            "N/A"
                            )
                        "B")
                    "C")
                 "D")
             "F")
                      
        "N/A")
))

(gradeConv -54) ; should be N/A
(gradeConv 3) ; should be F
(gradeConv 69) ; should be D
(gradeConv 73) ; should be C
(gradeConv 88) ; should be B
(gradeConv 100); should be A
(gradeConv 102); should be N/A