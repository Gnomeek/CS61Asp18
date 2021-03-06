(define (find s predicate)
  (cond ((equal? s nil) #f)
  		(else 
  			(if (equal? #t (predicate (car s)))
  					(car s)
  					(find (cdr-stream s) predicate)))
  )
)

(define (scale-stream s k)
  (if (equal? s nil)
  		nil
  		(cons-stream (* k (car s)) 
  			(scale-stream (cdr-stream s) k))
  )
)

(define (has-cycle s)
;Floyd Cycle Detection Algorithm
  (define (FCDA s cur)
  	(cond ((or (equal? nil (cdr-stream cur)) (equal? nil cur)) #f)
  		  ((eq? s cur) #t)
  		  (else (FCDA (cdr-stream s) 
  		  					(cdr-stream (cdr-stream cur))))
  	)
  )

  (FCDA s (cdr-stream s))
)
(define (has-cycle-constant s)
  (define (FCDA s cur)
  	(cond ((or (equal? nil (cdr-stream cur)) (equal? nil cur)) #f)
  		  ((eq? s cur) #t)
  		  (else (FCDA (cdr-stream s) 
  		  					(cdr-stream (cdr-stream cur))))
  	)
  )

  (FCDA s (cdr-stream s))
)
