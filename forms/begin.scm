;; Forms::Begin::actions = ('begin e1 .. en) ↦ (e1 .. en)
;; Forms::Begin::p        = ('tag e1 .. en)   ↦ 'tag ≡ 'begin
;; Forms::Begin::sequence->exp = (e1 .. en)        ↦ (begin e1 .. en); (e1) ↦ e1
;; Forms::Begin::eval-sequence = (e1 .. en) ↦ e1; ..; en

(define (Forms::Begin::actions 𝘌) (cdr 𝘌))            
(define (Forms::Begin::p 𝘌) (tagged-list? 𝘌 'begin))   
(define (Forms::Begin::eval-sequence 𝘌s ε)  
  (cond ((Forms::Begin:::last-exp? 𝘌s) (Eval::eval (Forms::Begin:::first-exp 𝘌s) ε))
        (else (Eval::eval (Forms::Begin:::first-exp 𝘌s) ε)
	      (Forms::Begin::eval-sequence (Forms::Begin:::rest-exps 𝘌s) ε))))

(define (Forms::Begin::sequence->exp 𝘌s)
  (cond ((null? 𝘌s) 𝘌s)
        ((Forms::Begin:::last-exp? 𝘌s) (Forms::Begin:::first-exp 𝘌s))  
        (else (cons 'begin 𝘌s))))

(define (Forms::Begin:::first-exp seq) (car seq))            ;; (e_1 .. e_n) ↦ e_1               
(define (Forms::Begin:::rest-exps seq) (cdr seq))            ;; (e_1 .. e_n) ↦ (e_2 .. e_n)
(define (Forms::Begin:::last-exp? seq) (null? (cdr seq)))    ;; (e_1) ↦ #t
