;; 𝒫 𝒜 ↦ (𝒫.𝒜)
(define (Structures::Frame::make 𝒫 𝒜)
  (let ((L𝒫 (length 𝒫))
        (L𝒜 (length 𝒜)))
    (if (= L𝒫 L𝒜) (cons 𝒫 𝒜)
      (if (< L𝒫 L𝒜) (error "Too many args" 𝒫 𝒜)
	  (error "Too few args" 𝒫 𝒜)))))

;; p a (𝒫.𝒜) ↦ ((p.𝒫) . (a.𝒜))
(define (Structures::Frame::add-binding! p a 𝙵)
  (let ((𝒫 (car 𝙵)) (𝒜 (cdr 𝙵)))
  (set-car! 𝙵 (cons p 𝒫))
  (set-cdr! 𝙵 (cons a 𝒜))))

;; (𝒫.𝒜) pi ↦ 𝒜[i:]
(define (Structures::Frame::lookup 𝙵 p)
  (define (scan 𝒫 𝒜 p)
    (if (or (null? 𝒜) (eq? (car 𝒫) p)) 𝒜
        (scan (cdr 𝒫) (cdr 𝒜) p)))
  (scan (Structures::Frame:::variables 𝙵) (Structures::Frame:::values 𝙵) p))

(define (Structures::Frame:::variables 𝙵) (car 𝙵)) ;; (𝒫.𝒜) ↦ 𝒫
(define (Structures::Frame:::values 𝙵) (cdr 𝙵))	 ;; (𝒫.𝒜) ↦ 𝒜

;;; test
;; (define x (Structures::Frame::make '(a b c) '(1 2 3)))
;; (Structures::Frame::lookup x 'a)
;; (Structures::Frame::lookup x 'c)
;; (Structures::Frame::lookup x 'd)
;; (Structures::Frame::add-binding! 'd 4 x)
