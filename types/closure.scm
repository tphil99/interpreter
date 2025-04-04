;; 𝒫 𝔅 ε ↦ ('proc 𝒫 𝔅 ε)
(define (Structures::Closure::make 𝒫 𝔅 ε)
  (list 'procedure 𝒫 𝔅 ε))	

;; (tag 𝒫 𝔅 ε) ↦ tag ≡ 'proc
(define (Structures::Closure::p 𝔓)
  (tagged-list? 𝔓 'procedure)) 	

;; ('proc 𝒫 𝔅 ε) ↦ 𝒫
(define (Structures::Closure::parameters 𝔓)
  (cadr 𝔓))		

;; ('proc 𝒫 𝔅 ε) ↦ 𝔅
(define (Structures::Closure::body 𝔓)
  (caddr 𝔓))			

;; ('proc 𝒫 𝔅 ε) ↦ ε
(define (Structures::Closure::environment 𝔓)
  (cadddr 𝔓))
