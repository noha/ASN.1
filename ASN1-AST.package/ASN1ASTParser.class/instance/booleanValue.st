X.680 grammar
booleanValue
	^ super booleanValue ==> [:nodes|
		ASN1PrimitiveValueNode new 
			type: (ASN1PrimitiveTypeNode name: 'BOOLEAN'); 
			value: nodes ]