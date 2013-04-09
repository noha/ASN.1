X.680 grammar
alternativeTypeList
	"Spec:
		AlternativeTypeList ::= 
			NamedType |
			AlternativeTypeList ',' NamedType"
	^ (namedType separatedBy: $, asParser trim) withoutSeparators 