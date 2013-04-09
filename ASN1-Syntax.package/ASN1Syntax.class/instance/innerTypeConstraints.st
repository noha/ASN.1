X.680 grammar
innerTypeConstraints
	"Spec:
		InnerTypeConstraints ::=
			 WITH COMPONENT SingleTypeConstraint |
			WITH COMPONENTS MultipleTypeConstraints"
	"Spec:
		SingleTypeConstraint::= Constraint"
	^ 'WITH COMPONENTS' asParser trim, (multipleTypeConstraint / constraint ) 