#lang racket

; recursion
(define (pow x y)
  (if (= y 0)
      1
      (* x (pow x (- y 1)))))

; cond example
(define (sum xs)
  (cond [(null? xs) 0]
        [(number? xs) xs]
        [(list? xs) (+ (car xs) (sum (cdr xs)))]
        [#t 0]))

; let* example
(define (silly-double x)
  (let* ([x (+ x 3)]
         [y (+ x 2)])
    (+ x y -8)))

; letrec example
(define (triple x)
  (letrec ([y (+ x 2)]
           [f (lambda (z) (+ z y w x))]
           [w (+ x 7)])
    (f -9)))

(define (my-delay f)
  (mcons #f f))

; defining macro
(define-syntax my-delay-macro
  (syntax-rules ()
    [(my-delay-macro e) (mcons #f (lambda () e))]))

;in begin, all expr are evaluated in order and their results are discarded
; except the last one whose result is returned
(define (my-force th)
  (if (mcar th)
      (mcdr th)
      (begin (set-mcar! th #t)
             (set-mcdr! th ((mcdr th)))
             (mcdr th))))

; multiplying using thunking
; this is bad because we are evaluating thunk on every function call
(define (my-mult x y-thunk)
  (cond [(= x 0) 0]
        [(= x 1) (y-thunk)]
        [#t (+ (y-thunk) (my-mult (- x 1) y-thunk))]))

(define fifty (my-mult 5 (lambda () 10)))

; optimising above method using promise
; this stores the result on the first time function call
; later calls do not execute the expression again, just returns the previous result
(define (my-multi x y-promise)
  (cond [(= x 0) 0]
        [(= x 1) (my-force y-promise)]
        [#t (+ (my-force y-promise) (my-multi (- x 1) y-promise))]))

(define sixty (my-multi 6 (my-delay (lambda () 10))))

; creating streams
(define pow-two
  (letrec ([f (lambda (x) (cons x (lambda () (f (* x 2)))))])
    (lambda () (f 2))))

; stream maker higher order function
(define (stream-maker fn arg)
  (letrec ([f (lambda (x)
                (cons x (lambda () (f (fn x arg)))))])
    (lambda () (f arg))))

; fiibonacci with memoization
(define fibo
  (letrec ([memo null]
           [f (lambda (x)
                (let ([ans (assoc x memo)])
                  (if ans
                      (cdr ans)
                      (let ([new-ans (if (or (= x 1) (= x 2))
                                         1
                                         (+ (f (- x 1))
                                            (f (- x 2))))])
                        (begin
                          (set! memo (cons (cons x new-ans) memo))
                          new-ans)))))])
    f))

(define-syntax for
  (syntax-rules (to do)
    [(for lo to hi do body)
     (let ([l lo]
           [h hi])
       (letrec ([loop (lambda (it)
                        (if (> it h)
                            #t
                            (begin body (loop (+ it 1)))))])
         (loop 1)))]))