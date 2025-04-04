;; ('tag ...) ↦ 'tag ≡ 'define 
(define (Forms::Define::p 𝘌) (tagged-list? 𝘌 'define))  

;; ('define p a) ε ↦ () 
(define (Forms::Define::eval 𝘌 ε)
  (Structures::Environment::define
   (Forms::Define::variable 𝘌)
   (Eval::eval (Forms::Define::value 𝘌) ε)
   ε)
  'ok)

;; ('define p a) ↦ p 
(define (Forms::Define::variable 𝘌) (if (symbol? (cadr 𝘌)) (cadr 𝘌) (caadr 𝘌)))  

;; ('define p a) ↦ a 
(define (Forms::Define::value 𝘌)                       
  (if (symbol? (cadr 𝘌)) (caddr 𝘌)
      (Forms::Lambda::make (cdadr 𝘌) (cddr 𝘌))))
