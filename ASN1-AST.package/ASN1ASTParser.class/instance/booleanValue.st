X.680 grammar
booleanValue
	^ super booleanValue ==> [:nodes|
		ASN1BooleanValueNode new 
			type: (ASN1BooleanTypeNode new); 
			value: nodes ]