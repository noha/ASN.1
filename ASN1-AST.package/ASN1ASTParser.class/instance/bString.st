X.680 grammar
bString 
	^ super bString ==> [:nodes| 
		ASN1PrimitiveValueNode new
			type: (ASN1PrimitiveNode name: 'BIT STRING'); 
			value: nodes ]