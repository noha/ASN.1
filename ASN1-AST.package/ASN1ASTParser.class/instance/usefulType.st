X.680 grammar
usefulType
	^ super usefulType ==> [:nodes|
		ASN1PrimitiveNode new
			name: nodes]