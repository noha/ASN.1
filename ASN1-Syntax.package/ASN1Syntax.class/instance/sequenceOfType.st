X.680 grammar
sequenceOfType
	"spec:
		SequenceOfType ::= SEQUENCE OF Type | SEQUENCE OF NamedType"
	^ 'SEQUENCE' asParser trim, 'OF' asParser trim, (type / namedType) ==> #third