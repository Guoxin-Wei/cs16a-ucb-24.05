(define (ascending? s) 'YOUR-CODE-HERE
    (if (or (null? s) (equal? (length s) 1))
            #t
            (and (<= (car s) (car (cdr s))) (ascending? (cdr s)))
    )
)

(define (my-filter pred s) 'YOUR-CODE-HERE
    (if (null? s)
        '()
        (if (pred (car s))
            (cons (car s) (my-filter pred (cdr s)))
            (my-filter pred (cdr s))
        )
    )
)

(define (interleave lst1 lst2) 'YOUR-CODE-HERE
    (
     if(null? lst1)
        lst2
        (cons (car lst1) (interleave lst2 (cdr lst1) ) )  
    )
)

(define (no-repeats s) 'YOUR-CODE-HERE
    (if (null? s)
        '()
        (
        if(= (length s) 1)
            s
            (cons (car s)  (no-repeats (my-filter (lambda (x) (not (= (car s) x))) (cdr s) ) ) )
        )
    )
)
