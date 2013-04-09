X.680 grammar
selectionType
	^ super selectionType ==> [:nodes|
		ASN1SelectionTypeNode new
			name: nodes first;
			type: nodes third ]