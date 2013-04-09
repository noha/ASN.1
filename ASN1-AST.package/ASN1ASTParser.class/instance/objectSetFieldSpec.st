X.681 grammar
objectSetFieldSpec
	^ super objectSetFieldSpec ==> [:nodes | | node |
		node := ASN1FieldSpecNode new 
			name: (nodes first declaration: true);
			type: nodes second.
		nodes third ifNotNil: [
			node addModifier: ASN1ModifierOptionalNode new ].
		node]