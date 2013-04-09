X.680 grammar
valueFromObject
	"Spec:
		ValueFromObject ::= ReferencedObjects '.' FieldName"
	^ referencedObjects, $. asParser, fieldName 
		==> [:nodes| Array with: nodes first with: nodes third. ]