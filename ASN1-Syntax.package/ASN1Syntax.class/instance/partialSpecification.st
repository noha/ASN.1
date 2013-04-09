X.680 grammar
partialSpecification
	"Spec:
		PartialSpecification ::= '{' '...' ',' TypeConstraints '}' "
	^ ${ asParser trim, '...' asParser trim, $, asParser trim, typeConstraints, $} asParser trim