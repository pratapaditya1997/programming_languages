#lang racket

(require "code.rkt")
(require rackunit)

(define a 2)
(define ones (lambda () (cons 1 ones)))

(define tests
  (test-suite
   "tests for homework 4 - week 5"

   ;sequence test
   (check-equal? (sequence 0 5 1) (list 0 1 2 3 4 5) "sequence test")

   ;string-append-map test
   (check-equal? (string-append-map
                  (list "dan" "dog" "curry" "dog2") ".jpg")
                  '("dan.jpg" "dog.jpg" "curry.jpg" "dog2.jpg")
                  "string-append-map test")

   ;list-nth-mod test
   (check-equal? (list-nth-mod (list 0 1 2 3 4) 2) 2
                 "list-nth-mod-test")

   ; stream-for-n-steps test
   (check-equal? (stream-for-n-steps (lambda () (cons 1 ones)) 1) (list 1)
                 "stream-for-n-steps")

   ; funny-number-stream test
   (check-equal? (stream-for-n-steps funny-number-stream 16)
                 (list 1 2 3 4 -5 6 7 8 9 -10 11 12 13 14 -15 16)
                 "funny-number-stream")

   ; dan-then-dog test
   (check-equal? (stream-for-n-steps dan-then-dog 1)
                 (list "dan.jpg")
                 "dan-then-dog test")

   ; stream-add-zero test

   ; cycle-lists test

   ; vector-assoc test

   ; while-less test
   (check-equal? (while-less 7 do (begin (set! a (+ a 1)) a)) #t
                 "while-less test")
   ))

(require rackunit/text-ui)
(run-tests tests)