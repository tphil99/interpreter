(let ((files '("setup.scm"
	       "driver.scm"
	       "eval.scm"
	       "forms/assignment.scm"
	       "forms/begin.scm"
	       "forms/combination.scm"
	       "forms/cond.scm"
	       "forms/define.scm"
	       "forms/if.scm"
	       "forms/lambda.scm"
	       "forms/primitive.scm"
	       "forms/quote.scm"
	       "types/closure.scm"
	       "types/frame.scm"
	       "types/primitive.scm"
	       "types/environment.scm")))
  (map load files))

(driver::loop)
