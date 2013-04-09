X.683 grammar
parameterizedReference
	"Spec:
		ParameterizedReference ::=
			Reference | 
			Reference '{' '}' "
	^ reference, (${ asParser trim, $} asParser trim) optional 