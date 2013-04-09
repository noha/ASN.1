X.681 grammar
typeOptionalitySpec
	"Spec:
		TypeOptionalitySpec ::= OPTIONAL | DEFAULT Type"
	^ 'OPTIONAL' asParser trim / ('DEFAULT' asParser trim, type)