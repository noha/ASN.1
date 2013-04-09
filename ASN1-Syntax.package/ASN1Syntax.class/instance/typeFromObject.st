X.680 grammar
typeFromObject
	"SPec:
		TypeFromObject ::= ReferencedObjects '.' FieldName"
	^ referencedObjects, $. asParser, fieldName 