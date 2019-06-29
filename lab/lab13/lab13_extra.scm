; Q4
(define (rle s)
  (define (counter next pre count)
  	(cond ((null? next) (cons-stream (list pre count) nil))
  		  ((= pre (car next)) (counter (cdr-stream next) pre (+ count 1)))
  		  (else (cons-stream (list pre count) (counter (cdr-stream next) (car next) 1)))
  	)
  )
  (if (null? s)
  	nil
  	(counter (cdr-stream s) (car s) 1))
)

; Q4 testing functions
(define (list-to-stream lst)
    (if (null? lst) nil
                    (cons-stream (car lst) (list-to-stream (cdr lst))))
)

(define (stream-to-list s)
    (if (null? s) nil
                 (cons (car s) (stream-to-list (cdr-stream s))))
)

; Q5
(define (insert n s)
  (define (helper n s pre)
  	(cond ((null? s) (append pre (list n)))
  		  ((<= n (car s)) (append (append pre (list n)) s))
  		  (else (helper n (cdr s) (append pre (list (car s)))))
  	)
  )
  (helper n s ())
)

; Q6
(define (deep-map fn s)
	(cond ((null? s) nil)
		  ((list? (car s)) (cons (deep-map fn (car s)) (deep-map fn (cdr s))))
		  (else (cons (fn (car s)) (deep-map fn (cdr s))))
	)
)

; Q7
; Feel free to use these helper procedures in your solution
(define (map fn s)
  (if (null? s) nil
      (cons (fn (car s))
            (map fn (cdr s)))))

(define (filter fn s)
  (cond ((null? s) nil)
        ((fn (car s)) (cons (car s)
                            (filter fn (cdr s))))
        (else (filter fn (cdr s)))))

; Implementing and using these helper procedures is optional. You are allowed
; to delete them.

(define (count name s)
	(cond ((null? s) 0)
		  ((eq? (car s) name) (+ 1 (count name (cdr s))))
		  (else (count name (cdr s)))
	)
)

(define (tally names)
	(if (null? names)
		nil
		(cons (cons (car names) (count (car names) names))
		(tally (filter (lambda (x) (not (eq? x (car names)))) (cdr names))))
	)
)