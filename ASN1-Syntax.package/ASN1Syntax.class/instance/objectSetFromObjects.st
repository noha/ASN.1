X.681 grammar
objectSetFromObjects
	"Spec:
		ObjectSetFromObjects ::= ReferencedObjects '.' FieldName"
	^ referencedObjects, $. asParser, fieldName