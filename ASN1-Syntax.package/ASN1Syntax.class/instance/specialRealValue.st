X.680 grammar
specialRealValue
	"Spec:
		SpecialRealValue ::=
			PLUS-INFINITY | 
			MINUS-INFINITY | 
			NOT-A-NUMBER"
	^ 'PLUS-INFINITY' asParser trim /
		'MINUS-INFINITY' asParser trim /
		'NOT-A-NUMBER' asParser trim