X.681 grammar
objectFromObject
	"Spec:
		ObjectFromObject ::= ReferencedObjects '.' FieldName"
	^ referencedObjects, $. asParser, fieldName