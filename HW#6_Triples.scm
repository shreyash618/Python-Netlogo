;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HW#6_Triples) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla, Sandy Tan
; 09-24-2018
; period 3
; HW #6 Triples

(define isPythTriple?
  (lambda (S1 S2 S3)
    (and (> S1 0) (> S2 0) (> S3 0)
    (or (=(expt S1 2) (+ (expt S2 2) (expt S3 2)))
        (=(expt S2 2) (+ (expt S1 2) (expt S3 2)))
        (=(expt S3 2) (+ (expt S2 2) (expt S1 2)))
        )
    )
    )
  )

(isPythTriple? 3 4 5) ; should be true
(isPythTriple? 3 4 6) ; should be false
(isPythTriple? 65 72 97) ; should be true
(isPythTriple? -3 -4 -5) ; should be false
(isPythTriple? 0 5 5) ; should be false
(isPythTriple? 13 12 5) ; should be true


(define HarMean3
  (lambda (a b c)
    (/ 3 (+ (/ 1 a) (/ 1 b) (/ 1 c)))
    )
  )

(HarMean3 5 5 5) ; should be 5
(HarMean3 3 6 18) ; should be 5.4
(HarMean3 5 -10 20) ; should be 20

