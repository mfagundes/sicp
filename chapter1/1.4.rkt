#lang racket
;Exercise 1.4. Observe that our model of evaluation
;allows for combinations whose operators are compound
;expressions. Use this observation to describe the
;behavior of the following procedure:
(require test-engine/racket-tests)

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;The procedure sums a with the absolute value of b,
;by checking if b is positive. If so, it uses the primitive
;operator + to evaluate with the operands (a b). Otherwhise
;it uses the operator -.
;If b == 0 it uses the operator -.

(check-expect (a-plus-abs-b 3 2) 5)
(check-expect (a-plus-abs-b 3 -2) 5)
(check-expect (a-plus-abs-b -3 2) -1)
(check-expect (a-plus-abs-b -3 -2) -1)

(test)