X.680 grammar
bString 
	^ super bString ==> [:nodes| 
		ASN1PrimitiveValueNode new
			type: (ASN1PrimitiveTypeNode name: 'BIT STRING'); 
			value: nodes ]