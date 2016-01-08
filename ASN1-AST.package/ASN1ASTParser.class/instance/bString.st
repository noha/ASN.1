X.680 grammar
bString 
	^ super bString ==> [:nodes| 
		ASN1BinaryBitStringValueNode new
			type: (ASN1BitStringTypeNode new); 
			value: nodes ]