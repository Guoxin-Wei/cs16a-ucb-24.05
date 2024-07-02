(define (over-or-under num1 num2) 
  (cond
    ((< num1 num2) -1)
    ((= num1 num2) 0)
    (else 1)
  )
)

(define (make-adder num) 
  (define (a inc) (+ inc num))
  a
)

(define (composed f g) 
  (define (h x) (f (g x)))
  h
)

(define (repeat f n) 
  (if (= n 0)
    (lambda (x) x)
    (composed f (repeat f (- n 1)))
  )
)

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b) 
  (if (< a b)
      (gcd b a)
      (if (zero? b)
        a
        (gcd b (modulo a b))
      )
  )
)

(define (lcm a b)
  (/ (* a b) (gcd a b))
)

(define (faster? f g)
  (define (helper f g)
    (let ((start (current-inexact-time)))
      (f)
      (- (current-inexact-time) start))

  )
)
