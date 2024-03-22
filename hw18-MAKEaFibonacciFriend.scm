;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname hw18-MAKEaFibonacciFriend) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Shreya Shukla
; 10-22-18
; period 3
; HW #18 - Make A Fibonacci Friend


; The following uses defferred delayed recursion to obtain the value of the
; nth term (given non-negative integer n) in the fibonacci sequence

(define fibNaive
 (lambda (n)
   (cond
     ((= n 1) 1)
     ((= n 2) 1)
     (else (+ (fibNaive (- n 1)) (fibNaive (- n 2)))
           )
       )
   )
 )

(fibNaive 3) ; should be 2
(fibNaive 5) ; should be 5
(fibNaive 7) ; should be 13
(fibNaive 8) ; should be 21
(fibNaive 9) ; should be 34

; The following is a iterative function that gets the value of the nth term
; (given non-negative integer n) in the fibonacci sequence

(define fib
  (lambda (n)
    (fib-iter 1 0 n)
    )
  )

(define fib-iter
  (lambda (a b c)
    (if (= c 0)
        b
        (fib-iter  (+ a b) a (- c 1) )
        )
    )
  )
(fib 1) ; should be 1
(fib 2) ; should be 1
(fib 3) ; should be 2
(fib 4) ; should be 3
(fib 5) ; should be 5
(fib 6) ; should be 8
(fib 7) ; should be 13
(fib 8) ; should be 21
(fib 9) ; should be 34
