X.680 grammar
restrictedCharacterStringType
	^ super restrictedCharacterStringType ==> [:node|
		ASN1PrimitiveNode new 
			name: node ]