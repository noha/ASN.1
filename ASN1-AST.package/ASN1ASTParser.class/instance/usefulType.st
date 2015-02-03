X.680 grammar
usefulType
	^ super usefulType ==> [:nodes|
		ASN1PrimitiveTypeNode new
			name: nodes]