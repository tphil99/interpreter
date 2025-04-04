;; ('tag ..) ↦ 'tag ≡ 'primitive
(define (Primitive::p obj)
  (tagged-list? obj 'primitive)) 

;; ('primitive <fun>) ↦ <fun>
(define (Primitive:::implementation obj)
  (cadr obj)) 	

;; ('primitive <fun>) 𝒜 ↦ (apply <fun> 𝒜)
(define (Primitive::apply proc 𝒜)
  (apply (Primitive:::implementation proc) 𝒜))
