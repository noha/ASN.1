X.680 grammar
constraint
	"Spec:
		Constraint ::= '(' ConstraintSpec ExceptionSpec ')' "
	^ $( asParser trim,
		constraintSpec,
		exceptionSpec, 
		$) asParser trim ==> [:nodes|  Array with: nodes second with: nodes third ]