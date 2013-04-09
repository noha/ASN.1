X.680 grammar
booleanValue
	^ super booleanValue ==> [:nodes|
		ASN1PrimitiveValueNode new 
			type: (ASN1PrimitiveNode name: 'BOOLEAN'); 
			value: nodes ]