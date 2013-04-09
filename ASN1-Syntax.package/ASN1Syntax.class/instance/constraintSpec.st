X.680 grammar
constraintSpec
	"Spec:
		ConstraintSpec ::=	
			SubtypeConstraint |
			GeneralConstraint"
	"Spec:
		SubtypeConstraint ::= ElementSetSpecs"
	^ generalConstraint / elementSetSpecs 