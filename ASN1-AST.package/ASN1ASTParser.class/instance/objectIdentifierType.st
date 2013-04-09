X.680 grammar
objectIdentifierType
	^super objectIdentifierType ==> [:nodes|
		ASN1ObjectIdentifierTypeNode new
			name: nodes ]