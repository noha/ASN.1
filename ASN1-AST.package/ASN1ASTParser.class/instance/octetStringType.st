X.680 grammar
octetStringType
	^ super octetStringType ==> [:node|
		 ASN1PrimitiveNode new
			name: node ]