#lang racket
;Exercise 1.1. Below is a sequence of expressions.
;What is the result printed by the interpreter in response
;to each expression? Assume that the sequence is to be
;evaluated in the order in which it is presented.
(require test-engine/racket-tests)

10
;10

(check-expect (+ 5 3 4) 12)

(check-expect (- 9 1) 8)

(check-expect (/ 6 2) 3)

(check-expect (+ (* 2 4) (- 4 6)) 6)

(define a 3)
(define b (+ a 1))

(check-expect (+ a b (* a b)) 19)

(check-expect (= a b) #f)

(check-expect 
(if (and (> b a) (< b (* a b)))
    b
    a)
4)

(check-expect 
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
16)

(check-expect 
(+ 2 (if (> b a) b a))
6)

(check-expect 
(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))
16)

(test)