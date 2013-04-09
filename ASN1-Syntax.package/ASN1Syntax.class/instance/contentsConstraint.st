X.682 grammar
contentsConstraint
	"Spec:
		ContentsConstraint ::= CONTAINING Type
		| ENCODED BY Value
		| CONTAINING Type ENCODED BY Value"
	^ ('CONTAINING' asParser trim, type, 'ENCODED BY' asParser trim, value)
		/ ('CONTAINING' asParser trim, type)
		/ ('ENCODED BY' asParser trim, value)
