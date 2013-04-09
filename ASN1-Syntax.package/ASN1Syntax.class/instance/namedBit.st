X.680 grammar
namedBit
	"Spec:
		NamedBit ::= 
			identifier '(' number ')' |
			identifier '(' DefinedValue ')'"
	^ (identifier, 
		$( asParser trim, 
		(number / definedValue ), 
		$) asParser trim) ==> [:nodes| Array with: nodes first with: nodes third]