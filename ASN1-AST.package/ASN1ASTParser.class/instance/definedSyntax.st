X.681 grammar
definedSyntax
	^ super definedSyntax ==> [:node|
		ASN1DefinedSyntaxObjectNode new
			syntax: node second ] 