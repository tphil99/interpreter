(define (Eval::eval 𝘌 ε)
  (cond 
   ;; prim
   ((Forms::Primitive::self-evaluating? 𝘌) 𝘌)
   ((Forms::Primitive::variable? 𝘌) (Structures::Environment::lookup 𝘌 ε))
   ;; special
   ((Forms::Quote::p 𝘌)      (Forms::Quote::contents 𝘌))
   ((Forms::Assignment::p 𝘌) (Forms::Assignment::eval! 𝘌 ε))
   ((Forms::Define::p 𝘌)     (Forms::Define::eval 𝘌 ε))
   ((Forms::If::p 𝘌)         (Forms::If::eval 𝘌 ε))
   ((Forms::Lambda::p 𝘌)     (Structures::Closure::make
			        (Forms::Lambda::parameters 𝘌)
				(Forms::Lambda::body 𝘌)
				ε))
   ((Forms::Begin::p 𝘌) (Forms::Begin::eval-sequence (Forms::Begin::actions 𝘌) ε))
   ((Forms::Cond::p 𝘌) (Eval::eval (Cond::cond->if 𝘌) ε))
   ;; combn
   ((Exec::Forms::Combination::p 𝘌) (Exec::Forms::Combination::apply (Eval::eval (Exec::Forms::Combination::operator 𝘌) ε)
					   (Exec::Forms::Combination::list-of-values (Exec::Forms::Combination::operands 𝘌) ε)))
   (else (error "Unknown 𝘌xpression type: EVAL" 𝘌))))
