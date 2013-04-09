X.680 grammar
typeConstraints
	"Spec:
		TypeConstraints ::= 
			NamedConstraint |
			NamedConstraint ',' TypeConstraints"
	^ (namedConstraint separatedBy: $, asParser trim) withoutSeparators 