X.680 grammar
definitiveNameAndNumberForm
	"Spec: 
		DefinitiveNameAndNumberForm ::= identifier '(' DefinitiveNumberForm ')' "
	"Spec:
		DefinitiveNumberForm	::= number"
	^ (identifier, $( asParser trim,  number, $) asParser trim)
		==> [:nodes| Array with: nodes first with: nodes third]