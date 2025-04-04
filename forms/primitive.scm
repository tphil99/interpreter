;; ('tag ...) ↦ 'tag ≡ 'self-evaluating 
(define (Forms::Primitive::self-evaluating? 𝘌)
  (cond ((number? 𝘌) true)
        ((string? 𝘌) true)
	;; what about symbol
        (else false)))

;; ('tag ...) ↦ 'tag ≡ 'variable 
(define (Forms::Primitive::variable? 𝘌) (symbol? 𝘌))
