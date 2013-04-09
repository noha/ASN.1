X.681 grammar
optionalGroup
	"Spec:
		OptionalGroup ::= '[' TokenOrGroupSpec empty + ']' "
	^ ($[ asParser trim, tokenOrGroupSpec trim plus, $] asParser trim) ==> #second