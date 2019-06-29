; Q1
(define (compose-all funcs)
	(if (null? funcs)
	 (lambda (x) x)
  	 (lambda (x) ((compose-all (cdr funcs)) ((car funcs) x)))
	)
)

; Q2
(define (tail-replicate x n)
  (define (helper res counter)
  	(if (= counter 0)
  		res
  		(helper (cons x res) (- counter 1))
  	)
  )
  (helper () n)
)