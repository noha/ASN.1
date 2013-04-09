X.681 grammar
withSyntaxSpec
	"Spec:
		WithSyntaxSpec ::= WITH SYNTAX SyntaxList"
	^ 'WITH SYNTAX' asParser trim, syntaxList ==> #second