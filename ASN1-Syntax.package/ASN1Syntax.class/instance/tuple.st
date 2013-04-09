X.680 grammar
tuple
	"spec:
		Tuple ::= '{' TableColumns ',' TableRow '}' "
	"spec: TableColumn ::= number"
	"spec: TableRow ::= number"
	^ ${ asParser trim, number, $, asParser trim, number, $} asParser trim