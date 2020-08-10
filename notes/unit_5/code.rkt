#lang racket
(provide (all-defined-out))

; sum all numbers in the list
(define (sum xs)
  (if (null? xs)
      0
      (+ (car xs) (sum (cdr xs)))))

; append
(define (my-append xs ys)
  (if (null? xs)
      ys
      (cons (car xs) (my-append (cdr xs)))))

; map
(define (my-map f xs)
  (if (null? xs)
      null
      (cons (f (car xs)) (my-map f (cdr xs)))))

; factorial
(define (fact n)
  (if (= n 0)
      1
      (* n (fact (- n 1)))))

; kinda switch expression
(define (sum3 xs)
  (cond [(null? xs) 0]
        [(number? (car xs)) (+ (car xs) (sum3 (cdr xs)))]
        [#t (+ (sum3 (car xs)) (sum3 (cdr xs)))]))

; maximum element in a list
(define (max-of-list xs)
  (cond [(null? xs) (error "error")]
        [(null? (cdr xs)) (car xs)]
        [#t (let ([tlans (max-of-list (cdr xs))])
              (if (> tlans (car xs))
                  tlans
                  (car xs)))]))

; stream of 1 1 1 1 1 1
(define ones (lambda () (cons 1 ones)))

; stream of 1 2 3 4 5 ie natural numbers
(define (f x) (cons x (lambda () (f (+ x 1)))))
(define nats (lambda () (f 1)))

; stream of power of 2
(define (g x) (cons x (lambda () (g (* x 2)))))
(define pow-two (lambda () (g 1)))

; fibonacci
(define (fib x)
  (if (or (= x 1) (= x 2))
      1
      (+ (fib (- x 1))
         (fib (- x 2)))))