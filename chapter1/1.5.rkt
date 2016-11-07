#lang racket
;Exercise 1.5. Ben Bitdiddle has invented a
;test to determine whether the interpreter
;he is faced with is using applicative-order
;evaluation or normal-order evaluation.
;He defines the following two procedures:

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y)
)

;Then he evaluates the expression
(test 0 (p))

;What behavior will Ben observe with an interpreter
;that uses applicative-order evaluation?
;What behavior will he observe with an interpreter
;that uses normal-order evaluation? Explain your answer.
;(Assume that the evaluation rule for the special form
;if is the same whether the interpreter is using normal
;or applicative order: The predicate expression is
;evaluated first, and the result determines whether to
;evaluate the consequent or the alternative expression.)

;Applicative order

(if (= 0 0) 0 (p)); returns 0 and p is not evaluated

;Normal order

(if (= 0 0) 0 (p)) ;evaluates p

 (if (= 0 0) 0 ((p))) ;evaluates p

  (if (= 0 0) 0 (((p)))) ;evaluates p (...)

;infinite recursion, as all expressions are evaluated first

;Conclusion: if the interpreter uses Applicative Order
;returns 0. If uses Normal Order, enters an infinite loop.
