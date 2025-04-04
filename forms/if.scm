;; Forms::If::p     = ('tag ...)    ↦ 'tag ≡ 'if 
;; Forms::If::eval = ('if p c a) ε ↦ if p then c else a

(define (Forms::If::p 𝘌) (tagged-list? 𝘌 'if))

(define (Forms::If::eval 𝘌 ε)
  (let ((P (Forms::If::_if-predicate 𝘌))
	(C (Forms::If::_if-consequent 𝘌))
	(A (Forms::If::_if-alternative 𝘌)))
  (if (Eval::eval P ε)
      (Eval::eval C ε)
      (Eval::eval A ε))))

(define (Forms::If::_if-predicate 𝘌) (cadr 𝘌))
(define (Forms::If::_if-consequent 𝘌) (caddr 𝘌))
(define (Forms::If::_if-alternative 𝘌) (if (not (null? (cdddr 𝘌))) (cadddr 𝘌) 'false))
