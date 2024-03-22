;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname HW#10-Calendar) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla
; 09-25-2018
; period 3
; HW #10: Calendar


; This function determines if a year is a leap year,
; by returning true or false value.

(define isLeapYr?
  (lambda (year)
     (if (= (remainder year 4) 0)
         (if (= (remainder year 100) 0)
             (if (= (remainder year 400) 0)
                 #T
                 #F
                 )
             #T)
         #F
         )
    )
  )

(isLeapYr? 2000) ; should be true
(isLeapYr? 2004) ; should be true
(isLeapYr? 2008) ; should be true
(isLeapYr? 2009) ; should be false
(isLeapYr? 2100) ; should be false
(isLeapYr? 2104) ; should be true
(isLeapYr? 2200) ; should be false
(isLeapYr? 2300) ; should be false
(isLeapYr? 2400) ; should be true


; This functions takes numeric inputs and returns the number of days
; in the month specified.


(define daysInMonth
  (lambda (month year)
    (if (or (= month 1) (= month 3) (= month 5) (= month 7) (= month 8) (= month 10)
            (= month 12))
           "31 days"
           (if ( or (= month 4) (= month 6) (= month 9) (= month 11))
               "30 days"
               (if (and (= month 2) (isLeapYr? year))
                   "29 days"
                   "28 days")
               )
           )
    )
  )

(daysInMonth 1 2010) ; should be 31
(daysInMonth 2 2011) ; should be 28
(daysInMonth 2 2000) ; should be 29
(daysInMonth 4 2011) ; should be 30
