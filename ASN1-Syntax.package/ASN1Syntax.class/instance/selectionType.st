X.680 grammar
selectionType
	"Spec:
		SelectionType ::= identifier '<' Type"
	^ identifier, $< asParser trim, type