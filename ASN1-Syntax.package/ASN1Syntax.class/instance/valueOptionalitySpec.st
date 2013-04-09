X.681 grammar
valueOptionalitySpec
	"Spec:
		ValueOptionalitySpec ::= OPTIONAL | DEFAULT Value"
	^ 'OPTIONAL' asParser trim / ('DEFAULT' asParser trim, value )