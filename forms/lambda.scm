;; Forms::Lambda::make       = 𝒫 𝔅 ↦ (lambda 𝒫 𝔅)
;; Forms::Lambda::p   = ('tag ...)                ↦ 'tag ≡ 'lambda
;; Forms::Lambda::parameters = (lambda 𝒫 𝔅) ↦ 𝒫
;; Forms::Lambda::body       = (lambda 𝒫 𝔅) ↦ 𝔅

(define (Forms::Lambda::make 𝒫 𝔅) (cons 'lambda (cons 𝒫 𝔅)))
(define (Forms::Lambda::p 𝘌) (tagged-list? 𝘌 'lambda))      
(define (Forms::Lambda::parameters 𝘌) (cadr 𝘌))      
(define (Forms::Lambda::body 𝘌) (cddr 𝘌))
