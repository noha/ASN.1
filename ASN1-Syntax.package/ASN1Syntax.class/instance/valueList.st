X.680 grammar
valueList
	"Spec:
		ValueList ::= 
			Value |
			ValueList ',' Value"
	^ (value separatedBy: $, asParser trim) withoutSeparators 