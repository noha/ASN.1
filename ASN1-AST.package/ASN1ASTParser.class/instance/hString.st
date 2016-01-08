X.681 grammar
hString
	^ super hString ==> [:nodes|
		ASN1HexBitStringValueNode new
			type: (ASN1BitStringTypeNode new);
			value: nodes ]