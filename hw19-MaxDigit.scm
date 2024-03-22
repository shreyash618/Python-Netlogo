;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname hw19-MaxDigit) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla
; 10-23-18
; period 3
; HW #19 - Max Digit

; QA: fib is faster than fibNaive, because it uses less function calls to obtain
; its output. Instead, it processes input quickly because the call stack is not
; growing, its simply being replaced with the outputs of previous calls.

; The wrapper function, maxDigit, calls helper function, helper, to give the
; biggest digit in a given number, n.

(define maxDigit
  (lambda (n)
    (helper n n n)
     )
    )


; For the following function, num means number, orig means original number,
; and left is the remainder from each num/10

(define helper
  (lambda (num orig left)
    (if (and (< num 10) (< orig 10))
        (max (max num orig) left)
        (helper (quotient num 10) left (remainder num 10))
        )
    )
  )

(maxDigit 34) ; should be 4
(maxDigit 96) ; should be 9
(maxDigit 231) ; should be 3
(maxDigit 8093) ; should be 9
(maxDigit 29849602342) ; should be 9
(maxDigit 3333) ; should be 3
(maxDigit 937) ; should be 9
