#lang racket
(require test-engine/racket-tests)
;Exercise 1.3. Define a procedure
;that takes three numbers as
;arguments and returns the sum of
;the squares of the two larger numbers.

(define (sumOfTwoLarger x y)(+ (* x x)(* y y)))

(define (f a b c)
  (cond ((and (< c a)(< c b)) (sumOfTwoLarger a b))
        ((and (< b a)(< b c)) (sumOfTwoLarger a c))
        ((and (< a b)(< a c)) (sumOfTwoLarger b c))
  )
)

(check-expect (f 2 3 4) 25)
(check-expect (f 4 2 3) 25)
(check-expect (f 3 4 2) 25)
(check-expect (f 3 2 4) 25)
(check-expect (f 2 4 3) 25)
(check-expect (f 4 3 2) 25)

(test)