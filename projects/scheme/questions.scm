(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement.

(define (cons-all first rests)
	(if (equal? rests nil)
		(list first)
		(map (lambda (x) (append (list first) x)) rests)) 
  )

(define (zip pairs)
  (cond ((equal? pairs nil) (cons nil nil))
  		((equal? (car pairs) nil) nil)
  		(else (append (list (map car pairs)) (zip (map cdr pairs)))))
  )

;; Problem 17
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 17
  (define (index n s)
    (if (equal? s nil)
        nil
        (cons 
              (cons n (cons (car s) nil)) 
              (index (+ n 1) (cdr s))))
  )
  (index 0 s)
  )
  ; END PROBLEM 17

;; Problem 18
;; List all ways to make change for TOTAL with DENOMS
(define (list-change total denoms)
  ; BEGIN PROBLEM 18
  (cond ((or (< total 0) (equal? nil denoms)) nil)
  		((= total 0) (cons nil nil))
  		((< total (car denoms)) (list-change total (cdr denoms))) 
  		(else (append (cons-all (car denoms) (list-change (- total (car denoms)) denoms))
  					  (list-change total (cdr denoms))))
  )
)
  ; END PROBLEM 18

;; Problem 19
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((quoted? expr)
         ; BEGIN PROBLEM 19
         expr
         ; END PROBLEM 19
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           (append (list form params) (map let-to-lambda body))
           ; END PROBLEM 19
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM 19
           (cons (append (list 'lambda (car (zip values))) 
           	(map let-to-lambda body)) 
            (map let-to-lambda (cadr (zip values))))
           ; END PROBLEM 19
           ))
        (else
         ; BEGIN PROBLEM 19
        (map let-to-lambda expr)
         ; END PROBLEM 19
         )))
