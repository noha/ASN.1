X.681 grammar
valueSetOptionalitySpec 
	"Spec:
		ValueSetOptionalitySpec ::= OPTIONAL | DEFAULT ValueSet"
	^ 'OPTIONAL' asParser  / ('DEFAULT' asParser, valueSet) 