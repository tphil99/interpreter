;; Forms::Cond::p = ('tag ...) ↦ 'tag ≡ 'cond 
;; Forms::Cond::cond-if = ('cond ((p1 c1) (p2 c2))) ↦ (if p1 c2 (if p2 c2)) ?check this

(define (Forms::Cond::p 𝘌) (tagged-list? 𝘌 'cond))
(define (Forms::Cond::cond->if 𝘌) (Forms::Cond::expand-clauses (Forms::Cond::_cond-clauses 𝘌)))

(define (Forms::Cond::_cond-clauses 𝘌) (cdr 𝘌))
(define (Forms::Cond::_cond-else-clause? clause) (eq? (Forms::Cond::_cond-predicate clause) 'else))
(define (Forms::Cond::_cond-predicate clause) (car clause))
(define (Forms::Cond::_cond-actions clause) (cdr clause))

(define (Forms::Cond::_make-if predicate consequent alternative) (list 'if predicate consequent alternative))

(define (Forms::Cond::_expand-clauses clauses)
  (if (null? clauses)
      'false     ; no else clause
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (if (Forms::Cond::_cond-else-clause? first)
            (if (null? rest)
                (sequence->exp (Forms::Cond::_cond-actions first))
                (error "ELSE clause isn't last: COND->IF" clauses))
            (Forms::Cond::_make-if (Forms::Cond::_cond-predicate first)
		     (sequence->exp (Forms::Cond::_cond-actions first))
                     (Forms::Cond::_expand-clauses rest))))))
