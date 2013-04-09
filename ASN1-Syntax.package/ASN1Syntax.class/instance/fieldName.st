X.681 grammar
fieldName
	"Spec:
		FieldName ::= PrimitiveFieldName '.' +"
	^ (primitiveFieldName separatedBy: $. asParser) withoutSeparators 