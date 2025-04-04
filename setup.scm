(define (tagged-list? 𝘌 tag) (if (pair? 𝘌) (eq? (car 𝘌) tag) false))
