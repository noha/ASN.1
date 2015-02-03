X.680 grammar
octetStringType
	^ super octetStringType ==> [:node|
		 ASN1PrimitiveTypeNode new
			name: node ]