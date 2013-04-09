X.680 grammar
identifierList 
	"Spec: 
		IdentifierList ::= 
			identifier |
			IdentifierList ',' identifier"
	^ (identifier separatedBy: $, asParser trim) withoutSeparators 