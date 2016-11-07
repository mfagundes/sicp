#lang racket
;Exercise 1.6. Alyssa P. Hacker doesn’t see why if needs
;to be provided as a special form. ‘‘Why can’t I just define
;it as an ordinary procedure in terms of cond?’’ she asks.
;Alyssa’s friend Eva Lu Ator claims this can indeed be done,
;and she defines a new version of if:

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause) (else else-clause))
)

(define (square x)(* x x))

(define (good-enough? guess x)
  (if (< (abs (- x (square guess))) 0.001)
      #t
      #f
      )
)

(define (improve guess x)
  (average guess (/ x guess))
)
           
(define (average x y)
  (/ (+ x y) 2)
 )

(define (square-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (square-iter (improve guess x) x)
      )
  )

(define (sqrt-newton x)
  (square-iter 1 x)
)

(sqrt-newton 9)

#|
As new-if is a function, Lisp needs to evaluate
all arguments before executing.
The arguments are the predicate, then-clause and else-clause.
As else-clause is a recursion, it enters an infinite loop
(square-iter (improve guess x))
|#