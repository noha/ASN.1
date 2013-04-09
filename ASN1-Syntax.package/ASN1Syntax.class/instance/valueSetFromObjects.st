X.681 grammar
valueSetFromObjects
	"Spec:
		ValueSetFromObjects ::= ReferencedObjects '.' FieldName"
	^ referencedObjects, $. asParser,  fieldName