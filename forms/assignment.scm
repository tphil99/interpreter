;; (tag ...) ↦ tag ≡ 'set!
(define (Forms::Assignment::p 𝘌)
  (tagged-list? 𝘌 'set!)) 

;; ('set! p a) ε ↦ ()
(define (Forms::Assignment::eval! 𝘌 ε)
  (set-variable-value!
   (Forms::Assignment::_assignment-variable 𝘌)
   (Eval::eval (Forms::Assignment::_assignment-value 𝘌) ε)
   ε)
  'ok)

;; (set! p a) ↦ p 
(define (Forms::Assignment:::variable 𝘌)
  (cadr 𝘌)) 

;; (set! p a) ↦ a
(define (Forms::Assignment:::value 𝘌)
  (caddr 𝘌))
