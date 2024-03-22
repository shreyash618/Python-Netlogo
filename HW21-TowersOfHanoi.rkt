;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname HW21-TowersOfHanoi) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; Shreya Shukla
; 10-25-2018
; period 3
; HW#21: Towers of Hanoi Solver

; Note to myself: General Pattern for Hanoi Recursion

; When I want to move to 2 disks
; MOVE DISK 1 FROM TOWER A TO B
; MOVE DISK 2 FROM TOWER A TO C (DEST.)
; MOVE DISK 1 FROM TOWER B TO C

; MOVING 3 DISKS FROM TOWER A TO C 
; Step1: move top 2 disks from A to B --------> 3 steps
; Step2: move bottom disk from A to C --------> 1 step
; Step3: move the 2 disks from B to C --------> 3 steps

; MOVING 4 DISKS FROM TOWER A TO C
; Step1: move top 3 disks from A to B --------> 7 steps
; Step2: move bottom disk from A to C --------> 1 step
; Step3: move the 3 disks from B to C --------> 7 steps

(define hanoi
  (lambda (n source temp dest)
    (if (= n 1)
        (begin
          (display "Move a disk from ")
          (display source)
          (display " to ")
          (display dest)
          )
    (begin
      (hanoi (- n 1) source dest temp)
      (display "\n")
      (hanoi 1 source temp dest)
      (display "\n")
      (hanoi (- n 1) temp source dest)
      )
    )
    )
  )
" Steps for 2 rings "
(hanoi 2 'A 'B 'C)
; Move a disk from A to B
; Move a disk from A to C
; Move a disk from B to C

(newline)
" Steps for 3 rings "
(hanoi 3 'A 'B 'C)
; Move a disk from A to C
; Move a disk from A to B
; Move a disk from C to B
; Move a disk from A to C
; Move a disk from B to A
; Move a disk from B to C
; Move a disk from A to C

(newline)
" Steps for 4 rings "
(hanoi 4 'A 'B 'C)
; Move a disk from A to B
; Move a disk from A to C
; Move a disk from B to C
; Move a disk from A to B
; Move a disk from C to A
; Move a disk from C to B
; Move a disk from A to B
; Move a disk from A to C
; Move a disk from B to C
; Move a disk from B to A
; Move a disk from C to A
; Move a disk from A to B
; Move a disk from A to C
; Move a disk from B to C

