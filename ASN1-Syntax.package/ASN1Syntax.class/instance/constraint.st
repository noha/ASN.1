X.680 grammar
constraint
	"Spec:
		Constraint ::= '(' ConstraintSpec ExceptionSpec ')' "
	"Spec:
		ConstraintSpec ::=	
			SubtypeConstraint |
			GeneralConstraint"
	"Spec:
		SubtypeConstraint ::= ElementSetSpecs"
	^ $( asParser trim,
		(generalConstraint / elementSetSpecs) ,
		exceptionSpec, 
		$) asParser trim ==> [:nodes|  Array with: nodes second with: nodes third ]