X.681 grammar
typeFieldSpec
	"Spec:
		TypeFieldSpec ::= typefieldreference TypeOptionalitySpec?"
	^ (typeFieldReference, typeOptionalitySpec optional)