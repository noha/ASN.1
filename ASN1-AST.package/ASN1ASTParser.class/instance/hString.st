X.681 grammar
hString
	^ super hString ==> [:nodes|
		ASN1PrimitiveValueNode new
			type: (ASN1PrimitiveTypeNode name: 'hstring');
			value: nodes ]