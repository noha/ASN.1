X.681 grammar
objectClassFieldType
	"Spec:
		ObjectClassFieldType ::= DefinedObjectClass '.' FieldName"
	^ definedObjectClass, $. asParser, fieldName 