X.681 grammar
definedSyntaxToken
	"Spec:
		DefinedSyntaxToken ::= Literal | Setting"
	^ (literal / setting) trim 