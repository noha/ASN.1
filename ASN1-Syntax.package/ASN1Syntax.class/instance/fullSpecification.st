X.680 grammar
fullSpecification
	"Spec:
		FullSpecification	::= '{' TypeConstraints '}' "
	^ (${ asParser trim, 
		typeConstraints, 
		$} asParser trim) ==> #second