X.681 grammar
externalObjectClassReference
	"Spec:
		ExternalObjectClassReference ::= modulereference '.' objectclassreference"
	^  moduleReference, $. asParser,  objectClassReference  