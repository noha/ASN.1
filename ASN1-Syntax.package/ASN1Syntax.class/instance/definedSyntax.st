X.681 grammar
definedSyntax
	"Spec:
		DefinedSyntax ::= '{' DefinedSyntaxToken empty * '}' "
	^ ${ asParser asn1Token,
		definedSyntaxToken plus,
		$} asParser asn1Token 