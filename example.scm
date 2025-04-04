;; here is some example code to run in the interpreter

(define (square x) (* x x))
(square 15.0)

(define (sqrt x)
  (define (abs x) (if (< x 0) (- x) x))
  (define (try z)
    (if (< (abs (- (square z) x)) .01)
	z
	(try (/ (+ (/ x z) z) 2))))
  (try 1))

(define (hypot a b)
  (sqrt (+ (square a) (square b))))

(hypot 3.0 4.0)
