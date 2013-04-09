X.681 grammar
fixedTypeValueFieldSpec
	self flag: #incomplete.
	^ super fixedTypeValueFieldSpec ==> [:nodes| | node |
		node := ASN1FieldSpecNode new 
			name: (nodes first declaration: true);
			type: nodes second.
		nodes third ifNotNil: [
			node addModifier: ASN1ModifierUniqueNode new ].
		nodes fourth ifNotNil: [
			node addModifier: nodes fourth ].
		node]