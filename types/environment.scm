;; (𝙵 . ε) ↦ ε
(define (Structures::Environment:::enclosure ε) (cdr ε))  
;; (𝙵 . ε) ↦ 𝙵
(define (Structures::Environment:::frame ε) (car ε)) 	

(define Structures::Environment:::empty '())

;; 𝙵 ε ↦ (𝙵 . ε)
(define (Structures::Environment::extend 𝙵 ε) (cons 𝙵 ε)) 

;; p ε ↦ a
(define (Structures::Environment::lookup p ε) 
  (if (eq? ε Structures::Environment:::empty) (error "Unbound variable: " p)
      (let* ((𝙵 (Structures::Environment:::frame ε))
	     (𝒜 (Structures::Frame::lookup 𝙵 p)))
	 (if (null? 𝒜)
	    (Structures::Environment::lookup p (Structures::Environment:::enclosure ε))
	    (car 𝒜)))))

;; p a ε ↦ ()
(define (Structures::Environment::set! p a ε)
  (if (or (eq? ε Structures::Environment:::empty)
	  (eq? (Structures::Environment:::enclosure ε) Structures::Environment:::empty))
        (error "Unbound variable: SET!" p)
      (let* ((𝙵 (Structures::Environment:::frame ε))
	     (𝒜 (Structures::Frame::lookup 𝙵 p)))
	 (if (null? 𝒜)
	    (Structures::Environment::set! p a (Structures::Environment:::enclosure ε))
	    (set-car! 𝒜 a)))))

;; p a ε ↦ ()
(define (Structures::Environment::define p a ε) 
  (let* ((𝙵 (Structures::Environment:::frame ε))
	 (𝒜 (Structures::Frame::lookup 𝙵 p)))
    (if (null? 𝒜)
	  (Structures::Frame::add-binding! p a 𝙵)
	  (set-car! 𝒜 a))))

(define Structures::Environment::builtins
  (let* ((alist `((car ,car)
		  (cdr ,cdr)
		  (cons ,cons)
		  (null? ,null?)
		  (* ,*)
		  (+ ,+)
		  (- ,-)
		  (= ,=)
		  (false ,false)
		  (true ,true)
		  (false? ,(lambda (x) (eq? x false)))
		  (true? ,(lambda (x) (not (eq? x false))))))
         (frame (Structures::Frame::make
		    (map car alist)
		    (map (lambda (o) (list 'primitive (cadr o))) alist))))
     (Structures::Environment::extend frame Structures::Environment:::empty)))

;; testing
;; (define F (Structures::Frame::make '(a b c) '(1 2 3)))
;; (define x (Structures::Environment::extend F Structures::Environment::builtins))
;; (define F (Structures::Frame::make '(d e) '(4 5)))
;; (define x (Structures::Environment::extend F x))
;; 
;; (Structures::Environment::lookup 'c x)
;; (Structures::Environment::lookup 'd x)
;; 
;; (Structures::Environment::set! 'e 1 x)
;; (Structures::Environment::define 'd 0 x)
