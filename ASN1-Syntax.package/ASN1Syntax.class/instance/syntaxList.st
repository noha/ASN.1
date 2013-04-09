X.681 grammar
syntaxList
	"Spec:
		SyntaxList ::= '{' TokenOrGroupSpec empty + '}'"
	^ ${ asParser trim, tokenOrGroupSpec trim plus, $} asParser trim 
		==> #second