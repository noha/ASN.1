X.681 grammar
typeFieldSpec
	^ super typeFieldSpec ==> [:nodes| | node |
		node := ASN1FieldSpecNode new
			name: (nodes first declaration: true).
		nodes second ifNotNil: [
			node addModifier: ASN1ModifierOptionalNode new ].
		node ]