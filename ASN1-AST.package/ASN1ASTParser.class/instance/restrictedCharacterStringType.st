X.680 grammar
restrictedCharacterStringType
	^ super restrictedCharacterStringType ==> [:node|
		ASN1PrimitiveTypeNode new 
			name: node ]