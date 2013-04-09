X.680 grammar
quadruple
	"spec: Quadruple ::= '{' Group ',' Plane ',' Row ',' Cell '}'"
	"spec: Group ::= number"
	"spec: Plane ::= number"
	"spec: Row ::= number"
	"spec: Cell ::= number"
	^ ${ asParser trim,
		number "Group", $, asParser trim,
		number "Plane", $, asParser trim,
		number, $, asParser trim,
		number "cell", 
		$} asParser trim 