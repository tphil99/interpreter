;; ('tag ...) ↦ 'tag ≡ 'quote
(define (Forms::Quote::p exp)
  (tagged-list? exp 'quote)) 
;; ('quote ⟨text⟩) ↦ ⟨text⟩
(define (Forms::Quote::contents 𝘌)
  (cadr 𝘌))
