X.680 grammar
nameAndNumberForm
	"spec:
		NameAndNumberForm ::= identifier '(' NumberForm ')'"
	^ identifier, $( asParser trim, numberForm, $) asParser trim 
		==> [:nodes| Array with: nodes first with: nodes third ]